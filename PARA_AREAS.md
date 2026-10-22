# Pendientes para las areas (presupuesto 2027) - actualizado 22/10/2026

Todo lo demas de las planillas ya esta cargado en RAFAM. Falta solo lo siguiente.


## 03 Economia y Finanzas

| Archivo | Hoja | Celda | Concepto | Tipo | Que falta |
|---|---|---|---|---|---|
| 01.07.00.xlsx | F7 especial | F29 | MANTENIMIENTO DE INFRAESTRUCTURA INFORMATICA (3.4.6.08119) | CONFIRMAR PRECIO | El precio unitario tiene mas de 2 decimales (5.600.699,7858) y RAFAM solo admite 2. NO esta cargado. Indicar el precio unitario con 2 decimales (12 unidades) para poder cargarlo. |
| 01.07.00.xlsx | F7 especial | F34 | SERVIDOR (4.3.6.01555) | CONFIRMAR PRECIO | El precio unitario tiene mas de 2 decimales (525.000,0042). NO esta cargado. Indicar el precio unitario con 2 decimales (12 unidades) para poder cargarlo. |

## 11 Planificacion Estrategica

| Archivo | Hoja | Celda | Concepto | Tipo | Que falta |
|---|---|---|---|---|---|
| 01.25.00.xlsx | F7 especial | F29 | SERVICIO ASESORAMIENTO PROFESIONAL (3.4.9.04331) | CONFIRMAR PRECIO | La planilla dice 12 x $6.500.000, pero en RAFAM esta categoria ya tiene ese codigo (fuente 110) con 12 x $3.359.682. NO se cargo para no duplicar. Confirmar cual es el precio correcto; si es el de la planilla, presupuesto corrige el existente en RAFAM. |
| 01.25.00.xlsx | F7 especial | F22 | MANT. EQUIPO DE COMPUTACION (3.3.3.01657) | CONFIRMAR PRECIO | El precio unitario tiene decimales de mas (521.785,71428571). Se cargo, y RAFAM lo guarda con 2 decimales. Confirmar el precio unitario con 2 decimales (14 servicios). |

## 16 Jefatura de Gabinete

| Archivo | Hoja | Celda | Concepto | Tipo | Que falta |
|---|---|---|---|---|---|
| 01.06.00.xlsx | F7 comun | C40 | NEUMATICO P/AUTO (cantidad 10) | FALTA DATO | El bien no figura en el Listado de bienes (codigo y precio = 0). NO esta cargado. Indicar codigo del bien (0.0.0.00000), unidad de medida y precio, cargandolo en la hoja F7 especial. |
| 35.01.00.xlsx | F7 especial | B16 | ESMALTE ANTIOXIDANTE BLANCO | FALTA DATO | Codigo malformado '2.5.5.0057' (4 digitos finales en vez de 5; no esta en el Listado). NO esta cargado. Indicar el codigo correcto (¿2.5.5.00570 ESMALTE SINTETICO u otro?). |
| 48.00.00.xlsx | F7 especial | F24:F30 | ESTANTE, PERCHERO, SILLA, MESA DE REUNIONES, VENTILADOR DE PARED, BIBLIOTECA, CANASTO METALICO | CONFIRMAR PRECIO | Los precios son muy bajos ($80, $40, $100, $350, $100, $200 y $20 por unidad). Se cargaron tal cual; parecen estar expresados en miles. Confirmar el precio unitario real de cada bien (y revisar tambien los otros precios muy bajos de la planilla). |

## 07 Educacion y Des. de la Comunidad

| Archivo | Hoja | Celda | Concepto | Tipo | Que falta |
|---|---|---|---|---|---|
| 42.01.00.xlsx | F7 especial | B11 | CORTINA BLACK OUT (cant. 7, $400.000) | FALTA DATO | Sin codigo del bien. NO esta cargado. Indicar el codigo del bien (0.0.0.00000). |
| 42.01.00.xlsx | F7 especial | D11 | CORTINA BLACK OUT | FALTA DATO | Sin unidad de medida. Indicar la unidad de medida (CADA UNO, METRO, etc.). |
| 42.01.00.xlsx | F7 especial | B12 | PANTALLA PROYECTOR (cant. 1, $160.000) | FALTA DATO | Sin codigo del bien. NO esta cargado. Indicar el codigo del bien (0.0.0.00000). |
| 42.01.00.xlsx | F7 especial | D12 | PANTALLA PROYECTOR | FALTA DATO | Sin unidad de medida. Indicar la unidad de medida. |
