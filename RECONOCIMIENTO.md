# Reconocimiento RAFAM (sesión local, 19/10/2026)

Solo lectura: se navegó hasta el F7 sin seleccionar categorías ni escribir datos.

## Entorno verificado

| Item | Resultado |
|------|-----------|
| AutoHotkey | 1.1.30.00 (Unicode 64-bit) en `C:\Program Files\AutoHotkey\`; asociado a `.ahk`. Hay otra copia 1.1 en `%LOCALAPPDATA%\Programs\AutoHotkey` |
| Notepad++ | 7.58 en `C:\Program Files (x86)\Notepad++\` |
| Python | 3.14.6 con openpyxl 3.1.5 (usar `python -I` para leer planillas) |
| RAFAM | `\\FALKNER\Rafam\RAFAM.exe` — v7.0.1, municipalidad de Morón, **entorno Prod (producción)** |
| Módulo Presupuesto | `C:\RafamLocal\Presupuesto.exe` — v7.2.0, proceso aparte que lanza RAFAM |

## Cómo llegar al F7 (Presupuesto 2027)

1. Abrir `\\FALKNER\Rafam\RAFAM.exe`. Aparece "Inicio de sesión a RAFAM": usuario `L310019` y contraseña (**la escribe el usuario**, nunca va al repo ni la tipea la IA).
2. Menú de sistemas ("Municipalidad de Moron", barra de estado `L310019 | Prod`): clic en **PRE – Presupuesto**.
   El menú se minimiza solo; tarda ~10 s en abrirse el módulo.
3. Ventana "Municipalidad de Moron - Presupuesto" (pantalla completa). Menú **Formulación**
   (F1, F4, F5, **F7 – Compra de Bienes y Servicios**, F8, F9, F11). También hay un botón "Bie. y Serv." en la barra.
4. Clic en **F7 – Compra de Bienes y Servicios** → ventana
   "Actualización de Compras de Bienes y Contrataciones de Servicios" (626x454).
   El selector **Presupuesto** ya aparece en **2027**.
5. Árbol de jurisdicciones: Sector Público Municipal No Financiero → Administración Central →
   Departamento Ejecutivo → Subjurisdicción → Actividad Central / Programa → categoría.
   Siguiente paso (no hecho): elegir la categoría, abrir su F7, lápiz (agregar), confirmar fuente de financiamiento.

## Ventanas útiles para `--ventana`

| Ventana | Título |
|---------|--------|
| Módulo | `Municipalidad de Moron - Presupuesto` |
| F7 (árbol) | `Actualización de Compras de Bienes y Contrataciones de Servicios` |
| Detalle de carga (lápiz) | **pendiente**: anotar el título al abrirlo la primera vez |

## Formulario 01.13: qué hay y qué falta

- Planilla: `Downloads\01.13.00.xlsx` (`01.13.00 (1).xlsx` es un duplicado idéntico). Hoja oculta `Carga`.
  Encabezado: Subjurisdicción **1110111000**, "Programa o Actividades centrales" **vacío**.
- 1110111000 = *Planificación Estratégica*. Bajo *01 – Actividad Central* tiene las categorías
  21, 22, 25 y 35: **no existe una "13"**. Categorías "13" vistas en otras subjurisdicciones:
  1110103000 → *13 Administración de Políticas Fiscales*; 1110107000 → *13 Logística*.
  → El usuario confirmó: **01.13 = subjurisdicción 1110103000 (Economía y Finanzas), 01 Actividad Central,
  13 Administración de Políticas Fiscales**. (El encabezado de la planilla dice 1110111000: es el valor de la
  plantilla, no coincide con la categoría real; confirmar que la planilla es la de Políticas Fiscales.)
- `01.13.00.ahk` (generado) tiene 112 filas, todas FF 110, costo total $144.750.452, y es **idéntico** a
  `03 01.13.ahk` (ejemplo "cargado a mano").

### Estado en RAFAM de la categoría 13 (revisado el 19/10/2026, solo lectura)

El detalle (doble clic en la categoría; la ventana conserva el título "Actualización de Compras…") muestra
**10 registros, todos FF 110 Tesoro Municipal, total $3.130.956.268**, ordenados por código:
25600793 gas oil, 31102390 energía eléctrica, 31202391 agua, 31302392 gas natural, 31402382 teléfono,
32102527 alquiler de edificios, 32206834 alquiler de camiones, 34904331 serv. profesionales,
35402195 seguro de riesgo de trabajo, 35502396 servicios bancarios.

- **El 01.13 NO está cargado**: 111 de los 112 códigos no existen en la categoría.
- **Una coincidencia**: `2.5.6.00793` (gas oil, LITROS, FF 110) ya existe con cantidad 2643 × $2.927; el 01.13 trae
  400 × $2.667. Cargarla duplicaría el bien en la misma categoría y fuente: RAFAM probablemente la rechaza y la
  macro seguiría tipeando sobre un diálogo de error. Decidir antes de la carga completa (excluir esa fila o
  corregir la existente a mano).
- Navegación del detalle: botones |< < > >| de la barra (registro anterior/siguiente); la rueda del mouse no mueve la grilla.

## Primera carga de prueba (1 fila, la dispara y verifica el usuario)

`01.13.00_prueba_1fila.ahk` (generado con `--primeras 1 --ventana "Actualizaci" --pausa 300`): una sola fila,
`110 / 2.1.1.00454 (YERBA) / um 1 / 50 / $4.627`, y se frena si la ventana activa no empieza con "Actualizaci".
Pasos: `ejecutar_bot.cmd` (deja abierto el detalle de la categoría 13) → abrir el `.ahk` → lápiz (agregar) →
clic en fuente de financiamiento (110) → **F1** → verificar la fila → borrarla/dejarla según corresponda. **F2** frena.

## Bug corregido en `generar_ahk.py`

La hoja `Carga` tiene descripciones en las columnas U–V (`General`, `1.259`…) que el generador
concatenaba al `Send` (21 de las 112 filas terminaban con texto basura, que se habría tipeado en RAFAM).
Ahora corta cada fila en la última columna que contiene una tecla `{...}` (A–Q en esta planilla) y lo informa
por stderr (`bloque Send: columnas 1-17`). Verificado: 112/112 líneas iguales a `03 01.13.ahk`.

## Notas de operación

- Con la IA sin control de escritorio se operó con capturas de PowerShell y clics por coordenadas relativas a la ventana.
  El menú de RAFAM cambia de posición al restaurarse: siempre releer el rectángulo antes de clickear.
- Frenar siempre con **F2**.
