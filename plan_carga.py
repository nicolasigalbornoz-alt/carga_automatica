#!/usr/bin/env python3
"""Planifica la carga de UNA planilla en una categoria de RAFAM (todo en solo lectura sobre RAFAM).

  python -I plan_carga.py <planilla.xlsx> --pref 25_16.01 --base-n 5 --base-total 373349138 \
      --existentes 25600793,31102390 --sub "25 Desarrollo Productivo" --cat "16.01.00" --pend

* Valida cada fila (validar_um.revisar: FF, codigo, UM segun regla 8, cantidad, precio).
* Detecta codigos que ya existen en la categoria (--existentes, formato RAFAM de 8 digitos o con puntos).
* Detecta repetidos (FF+codigo) dentro de la propia planilla.
* Las filas problematicas NO se cargan; con --pend se agregan a PENDIENTES_REVISION.md.
* Genera cargas/<pref>_prueba.ahk (1 fila) y lotes de 20 (_d<k>.ahk) y muestra registros/total ESPERADOS tras cada uno.
"""
import argparse
import re
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import validar_um as v

DIR = Path(__file__).resolve().parent
ROW = v.ROW


def dotted(c):
    c = c.strip()
    if re.fullmatch(r"\d{8}", c):
        return f"{c[0]}.{c[1]}.{c[2]}.{c[3:]}"
    return c


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("xlsx")
    ap.add_argument("--pref", required=True)
    ap.add_argument("--base-n", type=int, required=True)
    ap.add_argument("--base-total", type=float, required=True)
    ap.add_argument("--existentes", default="")
    ap.add_argument("--sub", default="")
    ap.add_argument("--cat", default="")
    ap.add_argument("--pend", action="store_true")
    ap.add_argument("--lote", type=int, default=20)
    ap.add_argument("--solo", default="", help="cargar unicamente estos codigos (coma); el resto se ignora sin reportarlo")
    a = ap.parse_args()

    env = v.envios(a.xlsx)
    ok, bad = v.revisar(a.xlsx)
    existentes = {dotted(c) for c in a.existentes.split(",") if c.strip()}
    excl, pend = {}, []          # indice -> motivo
    for i, cod, mot in bad:
        excl[i] = mot
    seen = {}
    for i, b in enumerate(env, 1):
        if i in excl:
            continue
        m = ROW.match(b)
        ff, cod = m.group(1), m.group(2)
        if cod in existentes:
            excl[i] = f"duplicado: ya existe en la categoria ({cod})"
        elif (ff, cod) in seen:
            excl[i] = f"repetido en la planilla (fila {seen[(ff, cod)]}, FF {ff})"
        else:
            seen[(ff, cod)] = i
    silent = set()               # filas fuera de --solo: no se cargan ni se reportan
    solo = {dotted(c) for c in a.solo.split(",") if c.strip()}
    if solo:
        for i, b in enumerate(env, 1):
            m = ROW.match(b)
            if not m or m.group(2) not in solo:
                silent.add(i)
                excl.setdefault(i, "fuera de --solo")
        faltan = solo - {ROW.match(b).group(2) for b in env if ROW.match(b)}
        if faltan:
            sys.exit(f"--solo: codigos que no estan en la planilla: {sorted(faltan)}")
    archivo = Path(a.xlsx).name
    for i in sorted(excl):
        if i in silent:
            continue
        m = ROW.match(env[i - 1])
        cod = m.group(2) if m else "?"
        d = m.groups() if m else ()
        det = f"fila {i}, {cod}" + (f" (FF {d[0]}, UM {d[2]}, cant {d[3]}, precio {d[4]})" if d else "")
        pend.append((det, excl[i]))
    print(f"filas: {len(env)} | a cargar: {len(env) - len(excl)} | salteadas: {len(excl) - len(silent)}")
    for det, mot in pend:
        print("  SALTEA", det, "->", mot)

    if a.pend and pend:
        f = DIR / "PENDIENTES_REVISION.md"
        if not f.exists():
            f.write_text("# Pendientes de revision (carga F7, RAFAM Prod 2027)\n\n"
                         "| Subjurisdiccion | Categoria | Archivo | Fila(s) y codigo | Motivo | Que hay que decidir |\n"
                         "|---|---|---|---|---|---|\n", encoding="utf-8")
        with f.open("a", encoding="utf-8") as fh:
            for det, mot in pend:
                dec = ("corregir la fila en la planilla y cargarla a mano" if "REF" in mot or "malformado" in mot or "invalida" in mot
                       else "confirmar la UM correcta y cargarla a mano" if "UM" in mot
                       else "ninguna (ya estaba cargado)" if "duplicado" in mot or "repetido" in mot
                       else "revisar")
                fh.write(f"| {a.sub} | {a.cat} | {archivo} | {det} | {mot} | {dec} |\n")

    cargar = [i for i in range(1, len(env) + 1) if i not in excl]
    if not cargar:
        print("nada para cargar")
        return
    nf = ",".join(str(i) for i in sorted(excl))
    base = ["python", "-I", str(DIR / "generar_ahk.py"), a.xlsx, "--ventana", "Alta de Compras", "--pausa", "300", "--auto", "3"]
    if nf:
        base += ["--excluir-filas", nf]
    ov = v.overrides(a.xlsx)
    if ov:
        print("UM forzadas (--um):", ", ".join(f"{c}={u}" for c, u in sorted(ov.items())))
        base += ["--um", ",".join(f"{c}={u}" for c, u in sorted(ov.items()))]
    n, tot = a.base_n, a.base_total
    plan = [("prueba", 1, 1)]
    d = 2
    while d <= len(cargar):
        plan.append((f"d{d}", d, a.lote))
        d += a.lote
    for nombre, desde, cuantas in plan:
        out = DIR / "cargas" / f"{a.pref}_{nombre}.ahk"
        args = base + ["-o", str(out), "--desde", str(desde), "--primeras", str(cuantas)]
        if nombre == "prueba":
            args = base + ["-o", str(out), "--primeras", "1"]
        subprocess.run(args, check=True, capture_output=True)
        c = t = 0
        for l in out.read_text(encoding="utf-8-sig").splitlines():
            if l.startswith("Send "):
                m = ROW.match(l[5:])
                c += 1
                t += float(m.group(4)) * float(m.group(5))
        n += c
        tot += t
        print(f"{nombre}: +{c} filas -> esperado {n} / {tot:,.2f}   [{out.name}]")


if __name__ == "__main__":
    main()
