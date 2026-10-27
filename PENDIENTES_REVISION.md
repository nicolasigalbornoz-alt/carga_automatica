# Pendientes de revision (carga F7, RAFAM Prod 2027)

Generado durante la carga del 20/10/2026. Las filas de esta tabla NO se cargaron (salvo las marcadas "YA CARGADA", que se
cargaron antes de aplicar la regla 8 y quedan como dudosas: no se borra nada). Regla 8: inciso 4 -> UM 3, inciso 3 -> UM 176,
inciso 2 -> debe coincidir con el "Listado de bienes" de la planilla; si el codigo no esta en el listado la UM no se puede
verificar y la fila queda pendiente.

| Subjurisdiccion | Categoria | Archivo | Fila(s) y codigo | Motivo | Que hay que decidir |
|---|---|---|---|---|---|
| 03 Economia y Finanzas | 01.39 | 01.39.00.xlsx | fila 3, 3.1.5.01384 (distribucion de correos, 1 x $11.000.000) | duplicado: ya existia en la categoria (12 x $10.426.659) | ninguna (se conserva lo existente) |
| 03 Economia y Finanzas | 01.07 | 01.07.00.xlsx | filas 102 y 103: 2.9.6.06808, 2.9.6.07480 (UM 3) | YA CARGADA: inciso 2 fuera del listado, UM 3 no verificable | confirmar que UM 3 es la correcta |
| 11 Planificacion Estrategica | 45 (45.00.00) | 45.00.00.xlsx | fila 48: #REF! (FF 0, cant 0, precio 0) | formula rota en la planilla; sin datos reales | corregir/eliminar la fila en la planilla |
| 16 Jefatura de Gabinete | 35.01 | 35.01.00.xlsx | filas 156, 157, 166: #REF! (FF/codigo/UM rotos; cant 20, 2, 8; precios 7.900, 47.499, 65.000) | formulas rotas en la planilla | corregir los codigos y cargar a mano |
| 16 Jefatura de Gabinete | 35.01 | 35.01.00.xlsx | fila 158: #REF! (FF 110, cant 10, precio 42.000) | codigo/UM con #REF! | corregir el codigo y cargar a mano |
| 16 Jefatura de Gabinete | 35.01 | 35.01.00.xlsx | fila 163: 2.5.5.0057 (FF 110, UM 3, 10 x $16.000) | codigo malformado (4 digitos finales en lugar de 5) | confirmar el codigo (¿2.5.5.00057?) y cargar a mano |
| 16 Jefatura de Gabinete | 35.01 | 35.01.00.xlsx | fila 167: 2.7.5.00579 (FF 110, UM 3, 40 x $9.650) | **hace caer Presupuesto.exe** (excepcion de coma flotante, reproducible 2 veces); inciso 2 fuera del listado | revisar el codigo en el catalogo de RAFAM; cargar a mano |
| 16 Jefatura de Gabinete | 35.01 | 35.01.00.xlsx | filas 159, 160, 161, 162, 164, 165, 168: 2.2.9.07097, 2.3.1.04846, 2.3.3.07274, 2.4.9.08058, 2.5.5.05077, 2.5.8.04490, 2.7.5.01921 (UM 3) | YA CARGADA: inciso 2 fuera del listado, UM 3 no verificable | confirmar que UM 3 es la correcta |
| 17 Seguridad Ciudadana | 19.01 | 19.01.00.xlsx | planilla completa | sin filas con datos en la hoja Carga | confirmar que no hay nada que cargar |
| 25 Desarrollo Productivo (1110125000) | 16.02 Promocion del Comercio | 16.02.00.xlsx | fila 97: 2.3.3.00861 (sobre c/membrete, cant 15) | **YA CARGADA CON PRECIO PROBABLEMENTE ERRONEO**: la planilla trae 23,113 (punto de miles mal interpretado) y RAFAM la guardo como $23,11 (x15 = $346,65). En 16.04 el mismo bien esta en $23.113 | corregir a mano el precio en RAFAM a $23.113 (no se modifico lo cargado) |
| 16 Jefatura de Gabinete | 48 (48.00.00) | 48.00.00.xlsx | fila 59: 3.3.3.01627 (1 x precio 20,5) | YA CARGADA con precio $20,50: valor dudoso (¿$20.500?) | confirmar el precio correcto |
| 00 HCD (1110200000) | 01.41 Formacion y Sancion de las Ordenanzas | 01.41.00.xlsx | fila 103, 2.9.9.06356 (FF 110, UM 3, cant 50, precio 50000) | inciso 2 fuera del listado: UM 3 no verificable | confirmar la UM correcta y cargarla a mano |
| 00 HCD (1110200000) | 01.41 Formacion y Sancion de las Ordenanzas | 01.41.00.xlsx | fila 104, 2.9.9.07499 (FF 110, UM 3, cant 200, precio 50000) | inciso 2 fuera del listado: UM 3 no verificable | confirmar la UM correcta y cargarla a mano |
| 00 HCD (1110200000) | 01.41 Formacion y Sancion de las Ordenanzas | 01.41.00.xlsx | fila 106, 3.3.1.07030 (FF 110, UM 3, cant 1, precio 5000000) | inciso 3 con UM 3 (debe ser 176) | confirmar la UM correcta y cargarla a mano |
| 05 Obras y Serv. Publicos (1110105000) | 25.01 Mantenimiento de Redes Viales | 25.01.00.xlsx | fila 41, 2.5.8.04751 (FF 110, UM 3, cant 100, precio 200000) | inciso 2 fuera del listado: UM 3 no verificable | confirmar la UM correcta y cargarla a mano |
| 05 Obras y Serv. Publicos (1110105000) | 25.01 Mantenimiento de Redes Viales | 25.01.00.xlsx | fila 42, 2.5.9.03225 (FF 110, UM 3, cant 1200, precio 300000) | inciso 2 fuera del listado: UM 3 no verificable | confirmar la UM correcta y cargarla a mano |
| 05 Obras y Serv. Publicos (1110105000) | 27.01 Mantenimiento de Luminarias y Senalizacion Vial | 27.01.00.xlsx | fila 39, 2.9.3.02306 (FF 110, UM 3, cant 100, precio 400000) | inciso 2 fuera del listado: UM 3 no verificable | confirmar la UM correcta y cargarla a mano |
| 05 Obras y Serv. Publicos (1110105000) | 28.01 Servicios de Inhumaciones y Exhumaciones | 28.01.00.xlsx | fila 73, 2.9.9.05156 (FF 110, UM 3, cant 20, precio 200000) | inciso 2 fuera del listado: UM 3 no verificable | confirmar la UM correcta y cargarla a mano |
| 07 Educacion y Des. de la Com. (1110107000) | 01.11 Desarrollo Territorial y Unidades de Gestion Comunitaria | 01.11.00.xlsx | fila 29, 3.2.1.02527 (FF 110, UM 176, cant 12, precio 1500000) | duplicado: ya existe en la categoria (3.2.1.02527) | ninguna (ya estaba cargado) |
| 07 Educacion y Des. de la Com. (1110107000) | 34.01 Educacion | 34.01.00.xlsx | fila 128,  (FF , UM 3, cant 0, precio 0) | fila vacia (sin FF, cantidad 0 y precio 0) | ninguna (no hay dato que cargar) |
| 07 Educacion y Des. de la Com. (1110107000) | 34.01 Educacion | 34.01.00.xlsx | fila 129,  (FF , UM 3, cant 0, precio 0) | fila vacia (sin FF, cantidad 0 y precio 0) | ninguna (no hay dato que cargar) |
| 07 Educacion y Des. de la Com. (1110107000) | 34.01 Educacion | 34.01.00.xlsx | fila 130,  (FF , UM 3, cant 0, precio 0) | fila vacia (sin FF, cantidad 0 y precio 0) | ninguna (no hay dato que cargar) |
| 07 Educacion y Des. de la Com. (1110107000) | 34.01 Educacion | 34.01.00.xlsx | fila 131,  (FF , UM 3, cant 0, precio 0) | fila vacia (sin FF, cantidad 0 y precio 0) | ninguna (no hay dato que cargar) |
| 16 Jefatura de Gabinete (1110116000) | 01.06 Jefatura de Gabinete | 01.06.00.xlsx | fila 30: NEUMATICO P/AUTO (cant 10, FF 110) | el bien no figura en el "Listado de bienes" (codigo y precio = 0): sin codigo no se puede cargar | indicar el codigo y el precio y cargarlo a mano |
| 16 Jefatura de Gabinete (1110116000) | 01.06 Jefatura de Gabinete | 01.06.00.xlsx | fila 31: "Subtotal" (fila de totales de la hoja F7 comun) | no es un bien: la hoja Carga arrastra una fila de subtotal | ninguna (no se carga) |
| 16 Jefatura de Gabinete (1110116000) | 01.06 Jefatura de Gabinete | 01.06.00.xlsx | fila 34, 3.9.1.07239 (FF 110, UM 3, cant 15, precio 2000000) | inciso 3 con UM 3 (debe ser 176) | confirmar la UM correcta y cargarla a mano |
| 16 Jefatura de Gabinete (1110116000) | 01.06 Jefatura de Gabinete | 01.06.00.xlsx | planilla completa | el archivo se guardo SIN los valores calculados de las formulas (la hoja Carga salia vacia). Se recalculo una COPIA con Excel, sin tocar el original, y se cargo desde esa copia | volver a guardar el original en Excel para que traiga los valores |
| 07 Educacion y Des. de la Com. (1110107000) | 44.01 Mejoramiento Habitacional | 44.01.00.xlsx | 101 filas de la hoja Carga (filas 1-9, 17, 19-24, 26-43, 45-48, 66, 75-76, 91-92, 94-97, 99-124, 129, 132, 134-148, 150, 152-161): todos los campos son #REF! (FF, codigo, UM, cantidad, precio) | formulas rotas en la planilla, sin ningun dato recuperable; NO se cargaron. Se cargaron las 60 filas validas (filas 10-16, 18, 25, 44, 49-65, 67-74, 77-90, 93, 98, 125-128, 130-131, 133, 149, 151) | revisar la planilla original: si faltan bienes por cargar, rehacer esas filas y cargarlas a mano |
| 05 Obras y Serv. Publicos (1110105000) | 01.19 Mantenimiento Edilicio Municipal | 01.19.00.xlsx | fila 96: 2.7.5.00770 (martillo, 10 x $15.108) | INCIDENTE YA CORREGIDO: durante un lote se mezclaron teclas del usuario con las del bot y el precio quedo en $15.108.110 (total +$150.930.020). Se corrigio con "Modificar" + "Guardar" a $15.108 (costo $151.080) y el total volvio a coincidir | revisar que el registro 27500770 figure a $15.108 |
| 07 Educacion | 01.43.00 | 01.43.00.xlsx | fila 76, 2.5.6.00793 (FF 110, UM 2, cant 3000, precio 2667) | duplicado: ya existe en la categoria (2.5.6.00793) | ninguna (ya estaba cargado) |
| 07 Educacion | 01.43.00 | 01.43.00.xlsx | fila 170, 2.3.3.07305 (FF 110, UM 3, cant 6, precio 75000) | inciso 2 fuera del listado: UM 3 no verificable | confirmar la UM correcta y cargarla a mano |
| 07 Educacion | 01.50.00 | 01.50.00.xlsx | fila 57, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 01.50.00 | 01.50.00.xlsx | fila 58, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 01.50.00 | 01.50.00.xlsx | fila 59, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 01.50.00 | 01.50.00.xlsx | fila 65, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 01.50.00 | 01.50.00.xlsx | fila 70, 2.3.3.07305 (FF 110, UM 3, cant 2, precio 75000) | inciso 2 fuera del listado: UM 3 no verificable | confirmar la UM correcta y cargarla a mano |
| 07 Educacion | 01.50.00 | 01.50.00.xlsx | fila 71, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 01.50.00 | 01.50.00.xlsx | fila 72, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 32.01.00 | 32.01.00.xlsx | fila 107, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 32.01.00 | 32.01.00.xlsx | fila 108, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 32.01.00 | 32.01.00.xlsx | fila 109, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 32.01.00 | 32.01.00.xlsx | fila 110, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 32.01.00 | 32.01.00.xlsx | fila 111, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 32.01.00 | 32.01.00.xlsx | fila 113, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.01.00 | 38.01.00.xlsx | fila 2, #REF! (FF 110, UM #REF!, cant #REF!, precio #REF!) | codigo malformado '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.01.00 | 38.01.00.xlsx | fila 8, #REF! (FF 110, UM #REF!, cant #REF!, precio #REF!) | codigo malformado '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 8, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 40, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 44, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 49, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 56, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 57, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 58, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 59, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 60, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 61, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 62, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 63, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 64, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 65, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 66, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 78, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 79, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 81, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 82, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 112, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 115, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 118, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.06.00 | 38.06.00.xlsx | fila 120, #REF! (FF #REF!, UM #REF!, cant #REF!, precio #REF!) | FF invalida '#REF!' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 42.01.00 | 42.01.00.xlsx | fila 96, 0 (FF 110, UM 0, cant 7, precio 400000) | codigo malformado '0' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 42.01.00 | 42.01.00.xlsx | fila 97, 0 (FF 110, UM 0, cant 1, precio 160000) | codigo malformado '0' | corregir la fila en la planilla y cargarla a mano |
| 07 Educacion | 38.01 y 38.06 | 38.01.00.xlsx, 38.06.00.xlsx | (aclaracion) | las lineas anteriores "sin filas con datos" ya no valen: la carpeta se re-descargo el 21/10 y ahora traen datos. Se cargaron 13 filas (38.01) y 98 filas (38.06); las filas con #REF! estan listadas arriba | ninguna |
| 07 Educacion | 01.50, 32.01, 38.01, 38.06 | los 4 .xlsx | planilla completa | llegaron SIN los valores calculados de las formulas (hoja Carga visible y vacia, igual que 01.06). Se recalculo una COPIA de cada una con Excel (no se toco el original) y se cargo desde la copia | volver a guardar los originales en Excel para que traigan los valores |
| 07 Educacion | 39.00.00 Casa Comunal CIS | 39.00.00.xlsx | 27 codigos: 2.7.9.01625, 2.9.4.01067, 2.7.5.05636, 2.7.5.04675, 2.7.5.03693, 2.7.5.02295, 2.7.5.02293, 2.7.5.01987, 2.9.4.02400, 2.7.5.01976, 2.7.5.01815, 2.7.5.01447, 2.5.5.02450, 2.4.3.02335, 2.2.9.03951, 4.3.6.00001, 4.3.6.00002, 2.2.9.00702, 2.2.3.00923, 2.9.6.00401, 2.2.3.00920, 2.9.4.01016, 2.9.4.00687, 2.9.3.03614, 2.9.1.03301, 2.9.1.00564, 2.9.1.00639 | la categoria ya tenia 38 registros, casi todos con fuente 132 (De origen provincial); la planilla trae todo con fuente 110. Por la regla 2 (mismo codigo Y misma fuente) NO eran duplicados y se cargaron con fuente 110 (RAFAM los acepto). Quedan los mismos bienes con dos fuentes (varios con distinto precio, p. ej. 2.9.4.01016: 132 a $8.000 / 110 a $8.309). Solo el 3.5.4.02195 (fuente 110) ya existia y no estaba en la planilla | confirmar si es correcto tener los bienes con las dos fuentes o si hay que sacar las filas de fuente 110 (borrarlas lo decide el usuario) |
| 07 Educacion | (general) | - | - | 21/10 al abrir el F7 RAFAM mostro un cuadro "Error no especificado -2147467259" que no se podia cerrar (sin carga en curso, no se escribio nada); se cerro Presupuesto/RAFAM y se reabrio con ejecutar_bot (rafam_bot.ps1). Economia 01.13 siguio en 121 reg. / $3.274.639.920 | ninguna |

## Resoluciones del usuario (21/10/2026)

- **07 Educacion / 39.00.00 Casa Comunal CIS (la fila de 27 codigos con fuente 110 vs 132):** RESUELTO. La fuente correcta es **110**
  (habia una confusion con 131/132). Las filas cargadas con fuente 110 estan bien y quedan. NO se borra nada: lo preexistente con
  fuente 132 tambien se conserva. Si alguna fila de 39.00 quedo sin cargar por esa duda, se puede cargar con fuente 110.

## CONCILIACION F7 vs TIPEADO (26/10/2026; conciliar_f7.py -> REVISION_F7_vs_CARGADO.xlsx)

De 4.417 bienes con datos en los F7 de la carpeta valida, 4.386 se tipearon con el mismo codigo, fuente, cantidad y precio. Quedan 25 sin cargar y 8 con valores distintos:
- **Duplicados por regla (se conserva lo cargado), 6:** 03/01.13 gas oil 2.5.6.00793; 03/01.39 3.1.5.01384; 07/01.11 3.2.1.02527; 07/01.43 gas oil 2.5.6.00793;
  17/19.01 4.8.1.01748 (fila 24: 1 x 7.000.000; se cargo la fila 67: 200 x 3.500.000 = $700.000.000, REVISAR monto) y 2.9.6.01190 (fila 33: 20 x 28.000; se cargo 200 x 70.000).
- **KIT/SET sin codigo de UM, 5 ($65.065.000), 17/19.01:** el usuario pidio cargarlas igual: usar UM 3 (CADA UNO) y anotar que la real es KIT/SET.
- **Datos incompletos, 3:** 07/42.01 cortina black out y pantalla proyector (sin codigo ni UM); 16/35.01 esmalte antioxidante blanco (codigo 2.5.5.0057 malformado).
- **Sin evidencia de que se tipearon, 8 (verificar en RAFAM):** 07/38.01 matafuegos 3.3.3.01627 (20 x 48.000) y equipamiento 4.6.0.03794 (6 x 300.000); 16/35.01 lentejuelas 2.2.9.06109,
  soporte microfono 2.7.9.07956, foam board y telgopor (2.9.2.07011, mismo codigo dos veces); 16/48.00 azucar, te y edulcorante (comunes); 16/01.06 azucar (1030 u., precio ilegible en la copia).
- **35.01: 8 bienes tipeados con la cantidad/precio de OTRO bien** (Carga desalineada por las filas #REF!): tela acetato (2.2.9.07097: F7 2 x 47.499, tipeado 50 x 95.000), papel paspartou (F7 10 x 42.000, tipeado 150 x 250),
  banner (F7 50 x 95.000, tipeado 15 x 17.500), barra pistola (F7 150 x 250, tipeado 9 x 21.100), tinta (F7 9 x 21.100, tipeado 6 x 51.000), plastico de burbujas (F7 10 x 16.000, tipeado 20 x 14.900),
  masilla durlock 2.7.5.00579 (F7 6 x 51.000, tipeado 40 x 9.650; esa fila hacia caer Presupuesto: puede no estar cargada), extensores (F7 20 x 14.900, tipeado 50 x 2.533). Corregir en RAFAM = decision del usuario.
- Ya resueltos aunque el .ahk no coincida: 03/01.07 3.4.6.08119 y 4.3.6.01555 (cargados 23/10 con precio redondeado), 11/01.25 3.4.9.04331 (modificado a mano 23/10).
Limite de la conciliacion: compara lo que se TIPEO, no lo que RAFAM guardo (la sesion bypass verifico conteo y total por lote).

## FUENTE VALIDA desde el 26/10/2026 17:38

El usuario dejo como **unica carpeta valida** `formularios\drive-download-20261026T173837Z-1-001\` (62 archivos, subcarpetas `NN - Nombre`: ahora
incluye `04 - Salud` y `27 - Transito y Transporte`). Todo lo anterior (carpetas viejas, descarga de las 16:52, zips y `_backup_originales`) se MOVIO a
`formularios\_ARCHIVO_previo_26-10\` (nada borrado). Usar siempre rutas de la carpeta valida; auditar_planillas.py ya la toma. Las ediciones hechas antes sobre
las copias viejas (16.02 F11 -> 23113, 01.41 D24, 01.25 D39, 48.00 F12 -> 20500, UM 176 de 01.41 y 01.06) quedaron en el archivo, NO en la carpeta valida.

**Lista del portal del 26/10 (11 formularios):** los 11 estan en la carpeta valida y el total del F7 de cada uno coincide al peso con el del portal.
Nuevos para cargar: 04 Salud 41.01 ($60.127.470; 26 bienes que Carga no incluye, $18.651.250), 49.01 ($64.743.352; 35 no incluidos, $16.247.500),
23.01 ($323.889.756; 22 no incluidos, $71.668.480; 9 filas #REF! con bien real); 27 Transito 01.38 ($151.197.878; 2 no incluidos, $75.630.000), 20.01
($111.467.012), 20.02 ($35.929.085); 17 Seguridad 19.04 ($17.277.535), 19.11 ($54.509.830), 19.01 ($2.723.019.009, version nueva); 16 Jefatura 46.01
($14.994.910), 01.02 ($825.680.363). 19.11: Carga!B7.. trae FF en 0 (valor guardado desactualizado; en el F7 es 110): recalcular una COPIA con Excel.

## Auditoria de planillas 21/10/2026 (auditar_planillas.py; listados en PARA_AREAS.xlsx/.md y NO_CUBIERTOS.xlsx)

> **CORRECCION 26/10/2026 al punto 1:** NO todas las filas `#REF!` de Carga son filas borradas. Las que la auditoria marca con origen en una
> celda real del F7 (no "formula con #REF!") son **bienes reales con la fuente/codigo/UM rotos solo en Carga**; los datos estan intactos en el F7 y
> hay que cargarlos desde el F7. Casos: 35.01 (Carga filas 508, 509, 510, 518 <- F7 especial E11, E12, A11, E21: 20x7.900, 2x47.499, 10x42.000,
> 8x65.000 = $1.192.998), 38.01 (Carga filas 8 y 513 <- F7 comun A12 y F7 especial A16), 17/19.01 (ver abajo). 45.00 (Carga 513) tiene cantidad y
> precio 0: nada que cargar.
>
> **17 Seguridad Ciudadana / 19.01.00 (version nueva del 26/10 13:59):** total del F7 = $2.723.019.009 (= total aprobado en el portal). 219 bienes:
> 182 via Carga ($2.498.517.309), 35 que Carga no incluye ($195.466.180) y 2 con Carga rota: **F7 comun fila 72** (FF 110, 2.9.3.01563 CABLE UTP,
> ROLLO = 208, 80 x $271.944 = $21.755.520) y **F7 especial fila 61** (FF 110, 2.9.6.01201 POLEA, CADA UNO = 3, 80 x $91.000 = $7.280.000).
> La carga anterior de 19.01 fue de la version vieja (casi vacia): leer la linea base de la categoria antes de cargar y cargar solo lo que falte.
> UM: en esta planilla las areas escribieron "UNIDAD" (inciso 2 y 4); inciso 4 = 3 por regla; "UNIDAD" en inciso 2 se asume = CADA UNO (3): confirmar.
> 19.04.00 ($17.277.535) y 19.11.00 figuran aprobados en el portal pero todavia NO estan en formularios\17 - Seguridad Ciudadana.

1. **Las filas `#REF!` de la hoja Carga NO son bienes perdidos.** Apuntan a filas que alguien borro del F7: en cada planilla,
   bienes del F7 = filas validas de Carga + bienes no cubiertos (ej. 44.01: 72 = 60 + 12; 38.06: 104 = 98 + 6; 01.50: 66 = 66).
   Las entradas de arriba de 11/45.00, 16/35.01 (filas 156-158, 166), 07/44.01, 07/38.06, 07/01.50 y 07/32.01 por `#REF!`:
   **RESUELTAS, no hay nada que corregir ni cargar a mano.**
2. **HALLAZGO GRANDE: 199 bienes escritos en el F7 que la hoja Carga no incluye, por $1.757.596.120 (15 planillas).** Probable causa:
   las areas insertaron filas en el F7 y las formulas de Carga no las siguieron. NO se cargaron. Detalle exacto (hoja, fila,
   codigo, UM, cantidad, precio) en NO_CUBIERTOS.xlsx. Por planilla: 00/01.41 (1), 03/01.07 (24, $856.795.101), 03/01.13 (13,
   $99.002.384), 03/01.17 (5), 07/01.11 (5), 07/01.13 (18), 07/32.01 (1), 07/38.01 (2), 07/38.06 (6), 07/39.00 (35), 07/44.01 (12),
   11/01.25 (20, $346.466.200), 13/29.01 (26), 16/35.01 (24, $375.477.878), 16/48.00 (7). Todos con cantidad, precio, codigo y FF validos.
   **Decision del usuario pendiente antes de cargarlos.**
3. **Ediciones aplicadas en los Excel (con Excel; backup en formularios\_backup_originales\):**
   16.02 F7 especial F11: 23.113 -> 23113 (punto de miles; en 16.04 el mismo bien esta en 23113);
   01.41 F7 especial D24: SERVICIO -> CADA UNO (inciso 4); 01.25 F7 especial D39: UNIDAD -> CADA UNO (inciso 4);
   01.41 Carga!I106 (3.3.1.07030): UM 3 -> 176 (inciso 3); 01.06 Carga!I34 (3.9.1.07239): UM 3 -> 176 (inciso 3).
   Las dos filas de UM 176 (01.41 fila 106 y 01.06 fila 34) quedaron **listas para cargar** (no estaban cargadas).
4. **Unidad de medida inciso 2 (regla del autor del .ahk): las areas tipearon la UM en F7 especial col. D, pero Carga la ignora y usa 3
   por defecto.** Con el catalogo del Listado (CADA UNO 3, PAQUETE 210, ROLLO 208, CAJA 180, TONELADA 22) hay 8 bienes cuya UM no es 3:
   01.41 CAJA NAVIDENA (D13, CAJA 180); 25.01 CONCRETO ASFALTICO (D14, TON -> TONELADA 22); 28.01 POLIETILENO (D12, RL -> ROLLO 208,
   confirmar); 35.01 LENTEJUELAS (D11) y PAPEL PASPARTOUF (D13) PAQUETE 210; TELA ACETATO (D12), PLASTICO DE BURBUJAS (D18) y TANZA (D26)
   ROLLO 208. Los ya cargados con UM 3 quedaron con la UM equivocada en RAFAM (hay que corregirlos con Modificar: lo decide el usuario).
5. **Correcciones en RAFAM que NO hice (ya cargado, no se toca sin orden):** 16.02 SOBRE C/MEMBRETE (2.3.3.00861) quedo a $23,11 y debe ser
   $23.113; 48.00 MANTENIMIENTO MATAFUEGOS (F12) precio $20,50 (¿$20.500?, confirmar con el area); y los 8 de UM del punto 4.
6. **Para las areas (falta informacion; celdas exactas en PARA_AREAS.xlsx):** 42.01 CORTINA BLACK OUT (B11/D11) y PANTALLA PROYECTOR (B12/D12) sin
   codigo ni UM; 35.01 ESMALTE ANTIOXIDANTE BLANCO (B16): codigo malformado `2.5.5.0057` (no esta en el Listado; parecido pero distinto:
   2.5.5.00570 ESMALTE SINTETICO); precios con mas de 2 decimales en 03/01.07 F29 y F34 y 11/01.25 F22; 01.06 NEUMATICO P/AUTO (F7 comun fila 34).

## Actualizacion 22/10/2026

- La carpeta formularios se **reemplazo por copias nuevas** (carpetas planas `NN - Nombre`, sin sufijo de fecha; backup de lo anterior en
  `formularios\_backup_originales`). Mis ediciones del 21/10 se habian pisado y **se reaplicaron** el 22/10, mas una nueva por pedido del usuario:
  16.02 F11 -> 23113; 01.41 D24 y 01.25 D39 -> CADA UNO; 01.41 Carga!I106 y 01.06 Carga!I34 -> UM 176;
  **48.00 F7 especial F12 (MANTENIMIENTO MATAFUEGOS): 20,5 -> 20500** (precio correcto segun el usuario).
- **Archivos nuevos del 22/10:** 03/01.27, 10 Legal y Tecnica/01.12, 16/01.16, 22 Desarrollo Local, Empleo y E.S/01.29, 01.34 y 36.01 (290 filas
  validas en Carga + 2 bienes no cubiertos en 16/01.16). Los demas archivos ya existian: algunos YA ESTAN cargados y otros no: revisar la
  linea base de cada categoria en RAFAM antes de cargar y cargar solo lo que falte (nunca duplicar ni borrar).
- Ahora los bienes no cubiertos por Carga son **201 ($1.759.896.120)**; el detalle vigente esta en NO_CUBIERTOS.xlsx.
- **Decision del usuario sobre la unidad de medida:** dejar la UM **como la expresan las areas** (nombre tipeado en la columna D del F7 especial,
  traducido al codigo del catalogo del Listado: CADA UNO 3, PAQUETE 210, ROLLO 208, CAJA 180, TONELADA 22; C/U = 3, TON = 22, RL = 208).
  Aplica a los bienes de inciso 2 fuera del Listado; para inciso 3 (176) e inciso 4 (3) rige la regla del autor del .ahk.
- **48.00 MATAFUEGOS:** el precio correcto es $20.500. Si ya esta cargado a $20,50, corregirlo en RAFAM con Modificar + Guardar (solo ese campo).

## Carga del 22/10/2026 (UM como la expresan las areas)

**Cargado y verificado (registros y total = base + filas):** 03/01.27 (0->27, $277.313.044); 16/01.16 (3->44, $68.964.899);
10 Legal y Tecnica = 1110110000 (Asistencia Legal y Tecnica) /01.12 (5->20, $101.982.567); 22 Desarrollo Local = 1110122000 /01.29 (4->70,
$193.544.889), /01.34 (1->56, $37.166.300), /36.01 (7->93, $190.284.335); 17 Seguridad Ciudadana 1110117000 /19.01 (9->11, $13.579.385.391).
Filas sueltas que estaban pendientes y se cargaron (se verifico antes con Buscar que el codigo no existia): 01.41 3.3.1.07030 (176),
2.9.9.06356 (3), 2.9.9.07499 (CAJA 180) -> 117 reg / $287.976.296; 01.06 3.9.1.07239 (176) -> 45 / $1.180.579.622;
25.01 2.5.8.04751 (3) y 2.5.9.03225 (TONELADA 22) -> 46 / $1.057.902.598; 27.01 2.9.3.02306 (3) -> 46; 28.01 2.9.9.05156 (ROLLO 208) -> 79;
01.43 2.3.3.07305 (3) -> 179 / $480.925.044; 01.50 2.3.3.07305 (3) -> 66 / $31.310.197.
**48.00 MATAFUEGOS (3.3.3.01627):** corregido con Modificar + Guardar de $20,50 a $20.500 (total 24.419.850,00, 71 reg.).

**Siguen sin cargar / decidir:**
- NO_CUBIERTOS.xlsx (201 bienes): esperan decision del usuario.
- 01.06: NEUMATICO P/AUTO (sin codigo/precio) y fila "Subtotal" (no es bien). 42.01: CORTINA BLACK OUT y PANTALLA PROYECTOR sin codigo. 35.01: 2.5.5.0057 malformado.
- 16.02 SOBRE C/MEMBRETE (2.3.3.00861) sigue en $23,11 (debe ser $23.113): la unica excepcion autorizada a modificar era 48.00.
- 35.01 cargados antes con UM 3 pero las areas expresaron otra: LENTEJUELAS y PAPEL PASPARTOUF (PAQUETE 210); TELA ACETATO, PLASTICO DE BURBUJAS y TANZA (ROLLO 208). No se tocan (regla de no modificar).
- Error propio corregido: las ediciones de UM del 22/10 cayeron en filas equivocadas de 01.41 (I106) y 01.06 (I34); se restauraron las formulas y el 176 se puso en I512 (01.41) e I510 (01.06). Las planillas 01.41 y 01.06 fueron modificadas (backup en formularios\_backup_originales).
- 17/19.01: la planilla nueva trae 2 filas (antes "sin datos"); ya cargadas.

## NO_CUBIERTOS.xlsx cargados el 22/10/2026 (decision del usuario)

Cargados 198 de 201 bienes (conteo y total verificados por categoria; antes se busco cada codigo con Buscar para no duplicar):
00/01.41 ->118 reg/$299.976.296; 03/01.07 ->131/$1.472.864.986; 03/01.13 ->134/$3.373.642.304; 03/01.17 ->122/$995.539.435;
07/01.11 ->42/$1.217.957.610; 07/01.13 ->81/$62.540.016; 07/32.01 ->113/$201.340.005; 07/38.01 ->19/$79.760.460; 07/38.06 ->106/$89.036.066;
07/39.00 ->180/$99.588.058 (fuente 110; los 5 codigos que ya existian estan en fuente 132, no son duplicados); 07/44.01 ->74/$22.579.957;
11/01.25 ->164/$925.231.194,94; 13/29.01 ->186/$141.754.300; 16/01.16 ->46/$71.264.899; 16/35.01 ->193/$953.586.025; 16/48.00 ->78/$24.421.360.
**NO cargados (3):**
| Subjurisdiccion | Categoria | Codigo | Motivo | Que hay que decidir |
|---|---|---|---|---|
| 03 Economia | 01.07 | 3.4.6.08119 MANTENIMIENTO DE INFRAESTRUCTURA (12 x 5.600.699,7858) | precio con mas de 2 decimales | indicar el precio exacto (2 decimales) |
| 03 Economia | 01.07 | 4.3.6.01555 SERVIDOR (12 x 525.000,0042) | precio con mas de 2 decimales | idem |
| 11 Planificacion | 01.25 | 3.4.9.04331 SERVICIO ASESORAMIENTO PROFESIONAL (12 x 6.500.000) | duplicado: ya existe en la categoria con fuente 110 (12 x 3.359.682) | decidir si se corrige el existente (lo decide el usuario) |
Notas: la UM del inciso 2 fuera del Listado se tomo de la columna D del area (TONELADA 22, ROLLO 208, etc.). RAFAM se cerro solo una vez
al cerrar un "Error: Debe seleccionar una categoria programatica de minimo nivel" (clic fuera del texto de la etiqueta del arbol); se reabrio con rafam_bot.ps1 sin perdida de datos.

## Correcciones autorizadas el 23/10/2026 (excepto 35.01)

El usuario autorizo: redondear a cero decimales los precios con mas de 2 decimales y hacer los cambios pendientes, salvo los de UM de 35.01.
- 03/01.07 (1110103000 / 01 / 07): CARGADOS 3.4.6.08119 MANTENIMIENTO DE INFRAESTRUCTURA INFORMATICA (UM 176, 12 x $5.600.700, redondeo de 5.600.699,7858)
  y 4.3.6.01555 SERVIDOR (UM 3, 12 x $525.000, redondeo de 525.000,0042). Antes se verifico con Buscar que no existian. 131 -> 133 reg.; total
  $1.472.864.986 -> $1.546.373.386 (+67.208.400 +6.300.000). Verificado.
- 11/01.25 (1110111000 / 01 / 25): 3.4.9.04331 SERVICIO ASESORAMIENTO PROFESIONAL (fuente 110) corregido con Modificar + Guardar de 12 x $3.359.682 a
  12 x $6.500.000 (precio de la planilla; solo ese campo). 164 reg. (sin cambio); total $925.231.194,94 -> $962.915.010,94. Verificado.
- 25 Desarrollo Productivo (1110125000) / 16.02: 2.3.3.00861 SOBRE C/MEMBRETE corregido con Modificar + Guardar de $23,11 a $23.113 (15 u.).
  105 reg. (sin cambio); total $16.440.675,95 -> $16.787.024,30. Verificado.
- **Siguen sin tocar (excluidos por el usuario):** UM de 35.01 (LENTEJUELAS, PAPEL PASPARTOUF -> PAQUETE 210; TELA ACETATO, PLASTICO DE BURBUJAS, TANZA -> ROLLO 208) y 35.01 ESMALTE 2.5.5.0057.
- **Siguen pendientes de las areas:** 01.06 NEUMATICO P/AUTO (sin codigo/precio) y fila "Subtotal"; 42.01 CORTINA BLACK OUT y PANTALLA PROYECTOR sin codigo.
- Nota: en modo Modificar, Enter tras el precio abre el dialogo "Guarda los datos modificados?"; para limpiar el campo de precio usar Ctrl+A y Supr (End/Shift+Home lo deja corrupto).

## 16 Jefatura de Gabinete / 01.02.00 (23/10/2026)

Cargado y verificado: 1110116000 / 01 Actividad Central / 02 Comunicacion e Imagen Institucional. Base 3 reg. / $174.003.008,00 (31402382, 34904331, 35402195);
planilla 24 filas / $825.680.363, ninguna duplicada ni con problemas de validacion -> 27 reg. / $999.683.371,00 (prueba 4/$177.636.608; lote de 20 -> 24/$989.246.331).
Unica correccion: 4.3.7.03506 traia precio 1548569,9999999998 (ruido de coma flotante) y se cargo como $1.548.570. Sin UM forzadas (los inciso 2 fuera del Listado dicen CADA UNO = 3).

## Carga del 26/10/2026 (carpeta valida drive-download-20261026T173837Z-1-001; UM como las areas, "UNIDAD" = 3)

Herramientas nuevas: prep_26_10.py (arma la lista completa: Carga + bienes del F7 que Carga no incluye o trae rotos; concilia con el total del portal),
gen_f26.py (prueba + lotes de 20 con registros/total esperados). Una fila de Carga sin bien igual en el F7 se descarta (23.01: 6 filas con codigo de una
fila y cantidad/precio de otra). 19.11: se cargo desde una COPIA recalculada con Excel (FF 110).
Subjurisdicciones: 04 Salud = 1110104000; 27 Transito y Transporte = 1110127000; 16 = 1110116000; 17 = 1110117000.

| Subjurisdiccion / categoria | Planilla | Antes -> despues (reg. / total) | Estado |
|---|---|---|---|
| 04 Salud 41.01 Zoonosis | 56 filas, $60.127.470 | 4 / 229.402.282 -> 60 / 289.529.752 | verificado |
| 04 Salud 49.01 SAME | 109 filas, $64.743.352 | 2 / 93.395.354 -> 111 / 158.138.706 | verificado |
| 04 Salud 23.01 Atencion Primaria | 117 filas, $323.889.756 (84 Carga + 33 del F7) | 7 / 941.568.536 -> 124 / 1.265.458.292 | verificado |
| 16 Jefatura 01.02 | 24 filas | 27 / 999.683.371 (sin cambio) | las 24 filas ya estaban cargadas identicas: nada que cargar |
| 16 Jefatura 46.01 Defensa al Consumidor | 72 filas, $14.994.910 | 1 / 10.788.479 -> 73 / 25.783.389 | verificado |
| 27 Transito 01.38 | 94 filas, $151.197.878 (92 + 2 del F7) | 3 / 276.858.392 -> 97 / 428.056.270 | verificado |
| 27 Transito 20.01 | 27 filas, $111.467.012 | 6 / 263.484.526 -> 33 / 374.951.538 | verificado |
| 27 Transito 20.02 | 35 filas, $35.929.085 | 1 / 26.409.175 -> 36 / 62.338.260 | verificado |
| 17 Seguridad 19.01 (version nueva) | 219 bienes, $2.723.019.009 | 11 / 13.579.385.391 -> 223 / 16.229.779.400 (+212 filas, $2.650.394.009) | verificado; incluye F7 comun fila 72 (cable UTP) y F7 especial fila 61 (polea) |
| 17 Seguridad 19.04 | 18 filas, $17.277.535 | 3 / 151.973.105 -> 21 / 169.250.640 | verificado |
| 17 Seguridad 19.11 | 8 filas, $54.509.830 | 0 -> 8 / 54.509.830 | verificado |

**NO cargados en 17 / 19.01 (7 filas, $72.625.000 de los $2.723.019.009) - decidir:**
| Fila | Codigo | Motivo | Que hay que decidir |
|---|---|---|---|
| Carga#118 | 2.9.6.00904 (5 x 49.000) | UM "KIT" no esta en el catalogo del Listado | codigo de UM para KIT |
| Carga#125 | 2.9.6.06727 (100 x 280.000) | idem | idem |
| Carga#126 | 2.4.3.00627 (100 x 350.000) | idem | idem |
| F7 especial 32 | 2.9.6.07387 KIT DE EMBRAGUE (6 x 210.000) | idem | idem |
| F7 especial 45 | 2.7.5.07458 SET DE HERRAMIENTAS (4 x 140.000) | UM "SET" no esta en el catalogo | codigo de UM para SET |
| F7 especial 24 | 4.8.1.01748 LICENCIA SOFTWARE (1 x 7.000.000) | mismo codigo y fuente ya cargado desde Carga (200 x 3.500.000) | duplicado: conservar el cargado o corregir a mano |
| F7 especial 33 | 2.9.6.01190 RETEN P/AUTOMOTOR (20 x 28.000) | mismo codigo y fuente ya cargado desde Carga (200 x 70.000) | idem |
Otras notas 19.01: UM forzadas por regla (inciso 3 = 176) en 3.3.1.07073, 3.4.6.07674, 3.2.2.06392; "UNIDAD" en inciso 2 tomada como 3 (CADA UNO) por decision del usuario.
23.01: filas de Carga #521-#528 (huerfanas, mezcla de codigo/cantidad/precio) NO se cargaron; los 9 bienes reales salen del F7 (2.9.5.03688, 3.3.1.03820, 3.3.3.04981, 4.3.6.02109, 4.3.3.00130, 3.3.3.02440 y otros).

## 16 Jefatura de Gabinete / 35.01 (1110116000): correccion de cantidad y precio (26/10/2026)

Autorizado por el usuario. Modificar + Guardar, solo cantidad y precio (FF 110, UM sin tocar; herramienta `modificar_registro.ps1`). Antes se verifico con Buscar que cada registro tenia exactamente los valores "hoy".
- 2.2.9.07097 TELA ACETATO: 50 x 95.000 -> 2 x 47.499
- 2.3.1.04846 PAPEL PASPARTOUF: 150 x 250 -> 10 x 42.000
- 2.3.3.07274 BANNER: 15 x 17.500 -> 50 x 95.000
- 2.4.9.08058 BARRA PISTOLA ENCOLADORA: 9 x 21.100 -> 150 x 250
- 2.5.5.05077 TINTA: 6 x 51.000 -> 9 x 21.100
- 2.5.8.04490 PLASTICO DE BURBUJAS: 20 x 14.900 -> 10 x 16.000
- 2.7.5.01921 EXTENSORES PARA PINTURA: 50 x 2.533 -> 20 x 14.900
- **2.7.5.00579 MASILLA PARA DURLOCK: NO EXISTE en RAFAM (Buscar: "No hay ninguna coincidencia"). No se cargo** (hacia caer Presupuesto.exe; F7: 6 x 51.000).
Verificado: 193 registros (sin cambio); total $953.586.025 -> $953.565.873 (-$20.152). La baja esperada de $100.152 suponia la masilla: los 7 existentes suman -$20.152; la masilla (6 x 51.000 = +$306.000 si se cargara) no esta, y el -$80.000 restante era el cambio de 40 x 9.650 ($386.000) a $306.000 que no aplica.

## 04 Salud (1110104000) / 01.28 y 22.01 (27/10/2026): carga desde formularios nuevos

Cargadas y verificadas conteo+total por lote. **01.28**: 6 -> 308 registros, $1.018.160.521 -> $2.210.084.671 (302 filas; 5 sin cargar, abajo). **22.01**: 9 -> 261 registros, $5.008.473.070 -> $11.519.552.164 (252 filas; 1 duplicado, 2 repetidas y 4 sin cargar, abajo). Incluyen los bienes que la hoja Carga no cubria (01.28: 34 / $512.148.237; 22.01: 35 / $244.075.674 tras redondear, el F7 dice $244.075.907).

| Subjurisdiccion | Categoria | Fila / codigo | Motivo | Que hay que decidir |
|---|---|---|---|---|
| 04 Salud | 01.28 | 2.3.4.01153 - Carga#225 (UM 180 CAJA) - $2.324.000,00 | NO EXISTE en el catalogo de RAFAM: al tipear el codigo (FF 110) no se completa la descripcion ("Ingrese el Bien"); hace desordenar el lote | confirmar el codigo correcto con el area y cargarlo a mano |
| 04 Salud | 01.28 | 2.9.2.00588 - Carga#227 (UM 3) - $4.231.612,80 | NO EXISTE en el catalogo de RAFAM: al tipear el codigo (FF 110) no se completa la descripcion ("Ingrese el Bien"); hace desordenar el lote | confirmar el codigo correcto con el area y cargarlo a mano |
| 04 Salud | 01.28 | 4.3.8.00263 - Carga#257 (UM 3) - $72.000.000,00 | NO EXISTE en el catalogo de RAFAM: al tipear el codigo (FF 110) no se completa la descripcion ("Ingrese el Bien"); hace desordenar el lote | confirmar el codigo correcto con el area y cargarlo a mano |
| 04 Salud | 01.28 | 3.3.3.02014 - F7 especial!30 DISPENSERS AGUA CORRIENTE (11 x 2.962.130,6; UM 176) - $32.583.436,60 | NO EXISTE en el catalogo de RAFAM: al tipear el codigo (FF 110) no se completa la descripcion ("Ingrese el Bien"); hace desordenar el lote | confirmar el codigo correcto con el area y cargarlo a mano |
| 04 Salud | 01.28 | 3.3.3.02439 - F7 especial!38 RECOLECCION DE RESIDUOS PATOLOGICOS (3 x 120.000.000; UM 176) - $360.000.000,00 | NO EXISTE en el catalogo de RAFAM: al tipear el codigo (FF 110) no se completa la descripcion ("Ingrese el Bien"); hace desordenar el lote | confirmar el codigo correcto con el area y cargarlo a mano |
| 04 Salud | 22.01 | 2.5.2.02445 - Carga#135 (13.500 x 3.285,69; UM 3) - $44.356.815,00 | NO EXISTE en el catalogo de RAFAM (idem) | confirmar el codigo correcto con el area y cargarlo a mano |
| 04 Salud | 22.01 | 3.3.3.06763 - Carga#199 (2 x 3.000.000; UM 176) - $6.000.000,00 | NO EXISTE en el catalogo de RAFAM (idem) | confirmar el codigo correcto con el area y cargarlo a mano |
| 04 Salud | 22.01 | 3.3.3.02354 - Carga#208 (5 x 4.122.565,2; UM 176) - $20.612.826,00 | NO EXISTE en el catalogo de RAFAM (idem) | confirmar el codigo correcto con el area y cargarlo a mano |
| 04 Salud | 22.01 | 3.3.3.03558 - Carga#216 (320 x 244.545,19; UM 176) - $78.254.460,80 | NO EXISTE en el catalogo de RAFAM (idem) | confirmar el codigo correcto con el area y cargarlo a mano |
| 04 Salud | 22.01 | 3.4.2.02099 - Carga#209 (90 x 351.520,44) | duplicado: ya existia en la categoria (FF 110) | ninguna (se conserva lo existente) |
| 04 Salud | 22.01 | 2.5.2.06622 - Carga#176 (7.380 x 619,99) y 2.5.2.07176 - Carga#177 (1.373 x 580,64) | repetidos en la planilla (mismo codigo y FF que Carga#159 y #160, con otra cantidad/precio); se cargo la primera aparicion | decidir si se suman o cual vale |
| 04 Salud | 22.01 | 109 bienes cargados con precio REDONDEADO a 2 decimales (decision del usuario 27/10; la planilla trae decimales largos, ej. 1383,0994553376909) | RAFAM solo guarda 2 decimales | ninguna; el redondeo suma +$4.254 netos sobre el total de 22.01 |
| 04 Salud | 01.28 | 2.9.9.07467 (900 x 1.500) | UM "PLIEGO" sin codigo en el catalogo: se cargo con UM 3 (CADA UNO) por decision del usuario | confirmar la UM |
| 04 Salud | 01.28 / 22.01 | UM tomadas del catalogo de las otras planillas: KILOGRAMO = 1 (2.5.1.02281, 2.7.9.00820 y 22.01 inciso 2 de 1), PAQUETE = 210, etc.; CAJA 180, ROLLO 208, METRO 4, LITROS 2, PAR 146 | no estaban en la lista del usuario | revisar las UM distintas de 3/180/208/4/2/146/176 |

## 17 Seguridad Ciudadana (1110117000) / 19.01 (27/10/2026): nueva version de la planilla

Autorizacion expresa del usuario (solo 17/19.01): reemplazar lo cargado el 26/10 por la version nueva (12:13). Base 223 reg / $16.229.779.400 -> **228 reg / $16.422.262.049** (verificado: base 13.579.385.391 de los 11 registros previos + F7 nuevo $2.850.576.658 menos las 2 filas repetidas $7.700.000). Se modifico la CANTIDAD de **162 registros** (mismo codigo, FF 110 y precio; +$114.418.649; detalle en `logs\mod_lote.log` y `cargas\f26\17_19.01_mods.csv`; el primero, 2.9.9.01888 50->60, a mano) y se cargaron **5 bienes nuevos** (+$78.064.000): 2.9.6.07387 KIT DE EMBRAGUE (7 x 210.000), 2.7.5.07458 SET DE HERRAMIENTAS (5 x 140.000), 2.9.6.00904 DISTRIBUIDOR (6 x 49.000), 2.9.6.06727 CONJUNTO DE EMBRAGUE Y RULEMAN (120 x 280.000), 2.4.3.00627 CORREA (120 x 350.000). UM 3 para KIT/SET (decision del usuario) -> **confirmar la UM**. 49 registros ya estaban con la cantidad nueva. No se borro nada. Los 2 #REF! reales (cable UTP 2.9.3.01563 y polea 2.9.6.01201) solo se actualizaron en cantidad.

| Subjurisdiccion | Categoria | Fila / codigo | Motivo | Que hay que decidir |
|---|---|---|---|---|
| 17 Seguridad Ciudadana | 19.01 | 4.8.1.01748 LICENCIA SOFTWARE (F7 especial 24: 1 x 7.000.000, UM 3) | repetido (mismo codigo y FF 110 que LICENCIA 200 x 3.500.000, ya cargada y sin cambios). Se intento cargarlo: **RAFAM no lo graba** (el formulario queda sin guardar); se descarto, sin efecto | decidir si se corrige la planilla (otro codigo) o se modifica el registro existente |
| 17 Seguridad Ciudadana | 19.01 | 2.9.6.01190 RETEN P/ AUTOMOTOR (F7 especial 33: 25 x 28.000, antes 20) | repetido (mismo codigo y FF que RETEN P/AUTOMOTOR 230 x 70.000, cuya cantidad subio de 200 a 230). No se intento: mismo caso que la licencia | idem; $700.000 sin cargar |
