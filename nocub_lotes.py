#!/usr/bin/env python3
"""Genera los .ahk (prueba de 1 fila + lotes de 20) para los bienes no cubiertos de UNA categoria (solo lectura sobre RAFAM).
  python -I nocub_lotes.py 03_01.07 --base-n 106 --base-total 296123208 [--existentes 25600793,...] [--excluir 3.4.6.08117,...]
Lee nocub_plan.json (hecho por nocub_prep.py). Imprime registros/total ESPERADOS tras cada lote."""
import argparse, json, sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import generar_ahk as g
import plan_carga as pc

DIR = Path(__file__).resolve().parent


def num(x):
    return str(int(x)) if float(x).is_integer() else repr(x)


def escribir(salida, cuerpos, pausa=300, ventana="Alta de Compras"):
    lineas = g.CABECERA.format(pausa=pausa, ventana=ventana, total=len(cuerpos),
                               auto="AUTO := 3\nToolTip, Carga automatica en %AUTO% s (F2 la cancela)\nSleep, % AUTO * 1000\nGoSub, Cargar\nExitApp\n",
                               entrada="Cargar:").splitlines()
    for b in cuerpos:
        lineas += ["Chk()", f"Send {b}"]
    lineas += ["ToolTip", 'MsgBox, 64, Carga terminada, Se enviaron %TOTAL% filas.', "return"]
    Path(salida).write_bytes(("\r\n".join(lineas) + "\r\n").encode("utf-8-sig"))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("pref")
    ap.add_argument("--base-n", type=int, required=True)
    ap.add_argument("--base-total", type=float, required=True)
    ap.add_argument("--existentes", default="", help="codigos (8 digitos o con puntos) que ya existen en la categoria con la misma fuente")
    ap.add_argument("--lote", type=int, default=20)
    a = ap.parse_args()
    plan = json.loads((DIR / "nocub_plan.json").read_text(encoding="utf-8"))[a.pref]
    ex = {pc.dotted(c) for c in a.existentes.split(",") if c.strip()}
    cuerpos, tot, vistos = [], [], set()
    for f in plan["filas"]:
        if f["motivo"]:
            continue
        if f["cod"] in ex:
            print("  SALTEA (ya existe en RAFAM)", f["cod"], f["den"])
            continue
        if (f["ff"], f["cod"]) in vistos:
            print("  SALTEA (repetido en no cubiertos)", f["cod"], f["den"])
            continue
        vistos.add((f["ff"], f["cod"]))
        cuerpos.append(f"{f['ff']}{{Enter}}{f['cod']}{{Enter}}{{Delete}}{{Delete}}{{Delete}}{f['um']}{{Enter}}{f['cant']}{{Enter}}{num(f['precio'])}{{Sleep 50}}{{Enter}}{{Enter}}{{Enter}}")
        tot.append(f["cant"] * f["precio"])
    out = DIR / "cargas" / "nocub"
    out.mkdir(parents=True, exist_ok=True)
    print(f"{a.pref}: a cargar {len(cuerpos)} filas, ${sum(tot):,.2f}")
    n, t = a.base_n, a.base_total
    tramos = [("prueba", 0, 1)] + [(f"d{i + 1}", i, a.lote) for i in range(1, len(cuerpos), a.lote)]
    for nombre, desde, k in tramos:
        sel = cuerpos[desde:desde + k]
        if not sel:
            continue
        f = out / f"{a.pref}_{nombre}.ahk"
        escribir(f, sel)
        n += len(sel)
        t += sum(tot[desde:desde + k])
        print(f"{nombre}: +{len(sel)} -> esperado {n} / {t:,.2f}   [{f.name}]")


if __name__ == "__main__":
    main()
