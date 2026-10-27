#!/usr/bin/env python3
"""Genera los .ahk (prueba de 1 fila + lotes) de una planilla a partir de cargas/f26/<pref>.json (hecho por prep_26_10.py).

  python -I gen_f26.py 04_41.01 --base-n 4 --base-total 229402282 --existentes 110:25600793,110:31202391 [--lote 20]

--existentes: "FF:codigo" (8 digitos o con puntos) de lo que YA esta en la categoria; esas filas se saltean y se reportan.
Escribe cargas/f26/<pref>_prueba.ahk y _d<k>.ahk e imprime registros/total ESPERADOS tras cada uno."""
import argparse, json, sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import nocub_lotes as nl
import plan_carga as pc

DIR = Path(__file__).resolve().parent


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("pref")
    ap.add_argument("--base-n", type=int, required=True)
    ap.add_argument("--base-total", type=float, required=True)
    ap.add_argument("--existentes", default="")
    ap.add_argument("--lote", type=int, default=20)
    a = ap.parse_args()
    plan = json.loads((DIR / "cargas" / "f26" / f"{a.pref}.json").read_text(encoding="utf-8"))
    ex = set()
    for e in (x for x in a.existentes.split(",") if x.strip()):
        ff, cod = e.split(":")
        ex.add((ff.strip(), pc.dotted(cod)))
    cuerpos, tot, dup = [], [], []
    for f in plan["ok"]:
        if (f["ff"], f["cod"]) in ex:
            dup.append(f)
            continue
        cuerpos.append(f"{f['ff']}{{Enter}}{f['cod']}{{Enter}}{{Delete}}{{Delete}}{{Delete}}{f['um']}{{Enter}}{f['cant']}{{Enter}}{nl.num(f['precio'])}{{Sleep 50}}{{Enter}}{{Enter}}{{Enter}}")
        tot.append(f["cant"] * f["precio"])
    for f in dup:
        print(f"  SALTEA duplicado FF {f['ff']} {f['cod']} ({f['origen']}: {f['cant']} x {f['precio']})")
    print(f"{a.pref}: a cargar {len(cuerpos)} filas, ${sum(tot):,.2f} | duplicados salteados {len(dup)} | pendientes {len(plan['pend'])}")
    n, t = a.base_n, a.base_total
    out = DIR / "cargas" / "f26"
    for old in out.glob(f"{a.pref}_*.ahk"):
        old.unlink()
    tramos = [("prueba", 0, 1)] + [(f"d{i + 1}", i, a.lote) for i in range(1, len(cuerpos), a.lote)]
    for nombre, desde, k in tramos:
        sel = cuerpos[desde:desde + k]
        if not sel:
            continue
        f = out / f"{a.pref}_{nombre}.ahk"
        nl.escribir(f, sel)
        n += len(sel)
        t += sum(tot[desde:desde + k])
        print(f"{nombre}: +{len(sel)} -> esperado {n} / {t:,.2f}   [{f.name}]")
    (out / f"{a.pref}_dups.json").write_text(json.dumps(dup, ensure_ascii=False, indent=1), encoding="utf-8")


if __name__ == "__main__":
    main()
