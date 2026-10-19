# carga_automatica

Carga automática de formularios en RAFAM (Presupuesto, ejercicio 2027) con AutoHotkey 1.x.

## Flujo

1. Abrir el formulario (ej. 01.13) y exportar/copiar la hoja oculta de carga.
2. `python generar_ahk.py "01.13.xlsx" -o "03 01.13.ahk"` — arma el `.ahk`:
   concatena cada fila sin espacios (`Send ...`), descarta filas vacías o en 0
   (reemplaza el Ctrl+H y el borrado manual de filas).
   También acepta `.csv` y un `.ahk` ya armado (lo re-limpia).
3. Abrir el `.ahk` con AutoHotkey (ícono H verde).
4. En RAFAM: abrir el F7 de la categoría, clic en agregar (lápiz), clic en fuente
   de financiamiento para confirmar que esté puesta y pulsar **F1**.

## Controles del `.ahk` generado

| Tecla | Acción |
|-------|--------|
| F1 | empieza a cargar |
| F2 | frena de inmediato (timestop) |
| Pause | pausa / reanuda |

Opciones del generador: `--pausa MS` (espera extra entre filas), `--ventana TITULO`
(frena si la ventana de RAFAM deja de estar activa), `--hoja NOMBRE`.
Un tooltip muestra el avance (`Fila n de N`).

## Contexto para una sesión local (PC con RAFAM)

- Programa: `\\FALKNER\Rafam\RAFAM.exe` (acceso directo "RAFAM - Acceso directo").
- Usuario: `L310019`. La contraseña NO va en el repo: pedirla al usuario.
- Trabajar en la pestaña **Presupuesto**, ejercicio **2027**.
- Carga: abrir el F7 de la categoría, lápiz (agregar), confirmar fuente de financiamiento, F1.
- Las cargas reales las revisa y dispara el usuario; frenar con F2 ante cualquier cosa rara.

Archivos: `generar_ahk.py` (generador), `03 01.13.ahk` (ejemplo cargado a mano), `cat.ahk` (plantilla mínima).
