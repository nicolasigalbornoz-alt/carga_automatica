#!/usr/bin/env python3
"""Valida (solo lectura) la unidad de medida de cada fila de la hoja Carga segun la regla 8 de PROMPT_BYPASS.md.

  inciso 4 (codigo 4.x.x.xxxxx) -> UM 3        inciso 3 -> UM 176
  inciso 2 -> debe coincidir con la UM del 'Listado de bienes' de la propia planilla; si el codigo no esta en el
              listado la UM no se puede verificar (no se inventa).
Uso:  python -I validar_um.py <planilla.xlsx>            -> imprime problemas (una linea por fila)
      desde codigo:  import validar_um; validar_um.revisar(path) -> (filas_ok, problemas)
Una fila 'ok' es la que se puede cargar; 'problemas' = [(nro_fila_en_envios, codigo, motivo)].
"""
import re
import sys
import warnings

sys.path.insert(0, __file__.rsplit("\\", 1)[0] if "\\" in __file__ else ".")
warnings.filterwarnings("ignore")
import generar_ahk as g

ROW = re.compile(r"^(\S*?)\{Enter\}(\S*?)\{Enter\}(?:\{Delete\})*(.*?)\{Enter\}(.*?)\{Enter\}(.*?)\{Sleep")


def listado(path):
    from openpyxl import load_workbook

    wb = load_workbook(path, data_only=True, read_only=False)
    out = {}
    if "Listado de bienes" in wb.sheetnames:
        for r in wb["Listado de bienes"].iter_rows(min_row=2, max_col=5, values_only=True):
            cod, um = r[1], r[4]
            if cod and um is not None:
                try:
                    out[str(cod).strip()] = int(um)
                except (TypeError, ValueError):
                    pass
    return out


def envios(path):
    filas = g.recortar(g.filas_xlsx(path, None))
    return [b for b in (g.cuerpo(f) for f in filas) if b]


# Decision del usuario (22/10): para los bienes de inciso 2 fuera del Listado la UM es la que expresan las areas (col. D de
# "F7 especial") traducida al codigo del catalogo del Listado; inciso 3 = 176 e inciso 4 = 3.
UM_EXTRA = {"C/U": 3, "TON": 22, "RL": 208}


def _norm(s):
    return re.sub(r"\s+", " ", str(s or "")).strip().upper()


def um_areas(path):
    """{codigo: (UM del catalogo o None, nombre tipeado por el area)} de la hoja 'F7 especial' (solo codigos fuera del Listado)."""
    from openpyxl import load_workbook

    wb = load_workbook(path, data_only=True, read_only=False)
    cat = dict(UM_EXTRA)
    cods = set()
    for r in wb["Listado de bienes"].iter_rows(min_row=2, max_col=5, values_only=True):
        if r[1]:
            cods.add(str(r[1]).strip())
        if r[3] and r[4] is not None:
            try:
                cat.setdefault(_norm(r[3]), int(r[4]))
            except (TypeError, ValueError):
                pass
    out = {}
    esp = next(w for w in wb.worksheets if w.title.startswith("F7 esp"))
    for r in range(11, esp.max_row + 1):
        cod, um = esp.cell(r, 2).value, esp.cell(r, 4).value
        cod = str(cod).strip() if cod else ""
        if re.fullmatch(r"\d\.\d\.\d\.\d{5}", cod) and cod not in cods and um:
            out[cod] = (cat.get(_norm(um)), _norm(um))
    return out


def desea_um(cod, areas):
    """UM a cargar segun la decision del usuario, o None si no se puede determinar."""
    if cod[0] == "4":
        return 3
    if cod[0] == "3":
        return 176
    return areas[cod][0] if cod in areas else None


def overrides(path):
    """{codigo: UM} que hay que forzar en el .ahk (--um) porque la hoja Carga trae otra (normalmente 3 por defecto)."""
    areas = um_areas(path)
    ov = {}
    for b in envios(path):
        m = ROW.match(b)
        if m and re.fullmatch(r"\d\.\d\.\d\.\d{5}", m.group(2)) and re.fullmatch(r"\d+", m.group(3) or ""):
            cod, um = m.group(2), int(m.group(3))
            if cod[0] == "2" and cod not in areas:
                continue          # esta en el Listado: Carga ya trae su UM
            d = desea_um(cod, areas)
            if d is not None and d != um:
                ov[cod] = d
    return ov


def revisar(path):
    lst = listado(path)
    areas = um_areas(path)
    ok, bad = [], []
    for i, b in enumerate(envios(path), 1):
        m = ROW.match(b)
        if not m:
            bad.append((i, "?", "fila con formato no reconocido"))
            continue
        ff, cod, um, cant, precio = m.groups()
        motivo = None
        if not re.fullmatch(r"\d{3}", ff):
            motivo = f"FF invalida '{ff}'"
        elif not re.fullmatch(r"\d\.\d\.\d\.\d{5}", cod):
            motivo = f"codigo malformado '{cod}'"
        elif not re.fullmatch(r"\d+", um or ""):
            motivo = f"UM vacia o invalida '{um}'"
        elif not re.fullmatch(r"\d+", cant or "") or int(cant) <= 0:
            motivo = f"cantidad invalida '{cant}'"
        elif not re.fullmatch(r"\d+(\.\d+)?", precio or "") or float(precio) <= 0:
            motivo = f"precio invalido '{precio}'"
        elif re.fullmatch(r"\d+\.\d{3}", precio):
            motivo = f"precio {precio}: probable separador de miles (¿{precio.replace('.', '')}?)"
        else:
            inc, umi = cod[0], int(um)
            # inciso 3 y 4: se fuerzan 176 / 3 (overrides); inciso 2 fuera del Listado: UM del area (F7 especial col. D)
            if inc == "2":
                if cod in lst:
                    if lst[cod] != umi:
                        motivo = f"inciso 2: UM {umi} distinta del listado ({lst[cod]})"
                elif cod not in areas:
                    motivo = f"inciso 2 fuera del listado y sin UM del area en F7 especial: UM {umi} no verificable"
                elif areas[cod][0] is None:
                    motivo = f"inciso 2 fuera del listado: la UM del area '{areas[cod][1]}' no esta en el catalogo"
            elif inc not in "34":
                motivo = f"inciso {inc} no contemplado en la regla"
        (bad if motivo else ok).append((i, cod, motivo) if motivo else (i, cod))
    return ok, bad


if __name__ == "__main__":
    ok, bad = revisar(sys.argv[1])
    print(f"ok={len(ok)} problemas={len(bad)}")
    for i, cod, mot in bad:
        print(f"  fila {i}: {cod} -> {mot}")
