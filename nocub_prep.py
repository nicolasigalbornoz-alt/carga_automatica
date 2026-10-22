#!/usr/bin/env python3
"""Prepara la carga de NO_CUBIERTOS.xlsx (bienes escritos en el F7 que la hoja Carga no incluye). Solo lectura.
Por planilla: UM final (inciso 3=176, inciso 4=3, inciso 2 = Listado o col. D del area), duplicados contra lo ya enviado
(cargas/*.ahk) y filas dudosas (precio con >2 decimales, UM desconocida). Escribe nocub_plan.json y CSV por categoria en cargas/nocub/."""
import glob, json, re, sys, warnings
from pathlib import Path
warnings.filterwarnings("ignore")
sys.path.insert(0, str(Path(__file__).resolve().parent))
import validar_um as v
from openpyxl import load_workbook

DIR = Path(__file__).resolve().parent
ROW = v.ROW


def ahk_keys(files):
    out = {}
    for f in files:
        for l in Path(f).read_text(encoding="utf-8-sig").splitlines():
            if l.startswith("Send "):
                m = ROW.match(l[5:])
                if m:
                    out.setdefault((m.group(1), m.group(2)), []).append(m.groups()[2:])
    return out


def main():
    ws = load_workbook(DIR / "NO_CUBIERTOS.xlsx", data_only=True).active
    rows = list(ws.iter_rows(min_row=2, values_only=True))
    plan = {}
    for area, arch, hoja, fila, den, ff, cod, umn, cant, precio, _ in rows:
        nn = area[:2]
        cat = ".".join(arch.split(".")[:2])
        pref = f"{nn}_{cat}"
        carp = next(p for p in (DIR / "formularios").iterdir() if p.is_dir() and p.name.startswith(nn + " -"))
        xlsx = carp / arch
        d = plan.setdefault(pref, dict(xlsx=str(xlsx), filas=[]))
        d.setdefault("_areas", None)
        if d["_areas"] is None:
            d["_areas"] = {c: u for c, u in v.um_areas(str(xlsx)).items()}
            d["_lst"] = v.listado(str(xlsx))
            files = glob.glob(str(DIR / "cargas" / f"{pref}_*.ahk"))
            if pref == "03_01.13":
                files = [str(DIR / "01.13.00.ahk")]
            d["_ahk"] = ahk_keys(files)
        cod = str(cod).strip()
        um = None
        motivo = None
        if cod[0] == "4":
            um = 3
        elif cod[0] == "3":
            um = 176
        elif cod in d["_lst"]:
            um = d["_lst"][cod]
        elif cod in d["_areas"] and d["_areas"][cod][0] is not None:
            um = d["_areas"][cod][0]
        else:
            motivo = f"UM desconocida (area: {umn})"
        if not re.fullmatch(r"\d\.\d\.\d\.\d{5}", cod):
            motivo = f"codigo malformado {cod}"
        pr = float(precio)
        if abs(pr - round(pr, 2)) > 1e-9:
            motivo = f"precio con mas de 2 decimales ({precio})"
        ya = d["_ahk"].get((str(ff), cod))
        if ya and not motivo:
            motivo = f"DUP en lo ya enviado a esta categoria: {ya[0]}"
        d["filas"].append(dict(hoja=hoja, fila=fila, den=den, ff=str(ff), cod=cod, um=um, cant=int(cant), precio=pr, motivo=motivo))
    out = {}
    for pref, d in plan.items():
        out[pref] = dict(xlsx=d["xlsx"], filas=d["filas"])
        ok = [f for f in d["filas"] if not f["motivo"]]
        print(f"{pref}: {len(d['filas'])} filas, cargables {len(ok)}, total cargable {sum(f['cant']*f['precio'] for f in ok):,.0f}")
        for f in d["filas"]:
            if f["motivo"]:
                print("    SALTEA", f["hoja"][3:7], f["fila"], f["cod"], f["den"][:25], "->", f["motivo"])
    (DIR / "nocub_plan.json").write_text(json.dumps(out, ensure_ascii=False, indent=1), encoding="utf-8")


if __name__ == "__main__":
    main()
