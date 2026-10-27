#!/usr/bin/env python3
"""Escribe cargas/f26/<pref>_t<i>-<j>.ahk con las filas [i:j) del plan cargas/f26/<pref>.json (para reintentos tras una caida).
  python -I tramo_f26.py 04_01.28c 1 2"""
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
import nocub_lotes as nl
pref, i, j = sys.argv[1], int(sys.argv[2]), int(sys.argv[3])
plan = json.loads((Path(__file__).resolve().parent / "cargas" / "f26" / f"{pref}.json").read_text(encoding="utf-8"))
filas = plan["ok"][i:j]
cuerpos = [f"{f['ff']}{{Enter}}{f['cod']}{{Enter}}{{Delete}}{{Delete}}{{Delete}}{f['um']}{{Enter}}{f['cant']}{{Enter}}{nl.num(f['precio'])}{{Sleep 50}}{{Enter}}{{Enter}}{{Enter}}" for f in filas]
out = Path(__file__).resolve().parent / "cargas" / "f26" / f"{pref}_t{i}-{j}.ahk"
nl.escribir(out, cuerpos)
print(out.name, len(cuerpos), "filas, $%.2f" % sum(f["cant"] * f["precio"] for f in filas))
