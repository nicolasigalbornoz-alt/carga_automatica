# Prompt para la sesión en bypass: carga de formularios F7 (RAFAM Prod, Presupuesto 2027)

Trabajá en D:\Usuarios\310019\carga_automatica. Leé README.md y RECONOCIMIENTO.md (y la memoria del proyecto).

## Alcance (leer primero)
- Solo cargás el **Formulario 7** (Presupuesto > Formulación > F7 - Compra de Bienes y Servicios). Nada de F1, F4, F5, F8, F9, F11 ni otros módulos.
- Todo lo que ves en el árbol del F7 (los números como 01, 13, 24...) son **categorías** (programas o actividades centrales con sus actividades); no son formularios.
- Por cada archivo hacés dos cosas: (1) seleccionar en el árbol la **subjurisdicción correcta**, que se lee del nombre de la carpeta
  (o algo semejante: el nombre/numero de la carpeta contra el nombre de la subjurisdicción en RAFAM); (2) dentro de ella, abrir la
  **categoría que indica el nombre del archivo** y cargar ahí las filas del F7 de la planilla.

## Contexto
- RAFAM es PRODUCCIÓN. Usuario L310019. La contraseña NUNCA la ingresás ni la guardás vos: yo abro RAFAM con
  ejecutar_bot.cmd (credencial cifrada). Si no está abierto, pedime que lo abra.
- Ya está cargado: 03 - Economía y Finanzas / 01.13.00 (subjurisdicción 1110103000, 01 Actividad Central, 13
  Administración de Políticas Fiscales): 121 registros, $3.274.639.920. NO lo recargues. Ojo: en la carpeta
  "07 - Educación" hay OTRO 01.13.00.xlsx, que es una categoría distinta (Logística): ese SÍ falta.
- Los formularios están en formularios\<NN - Subjurisdicción>-<fecha>-1-001\<NN - Subjurisdicción>\<PP.AA.OO>.xlsx
  (33 archivos, 32 pendientes). Hoja oculta "Carga"; el generar_ahk.py ya la lee y tiene --excluir, --desde,
  --primeras y --auto (las tres últimas, probalas antes de usarlas).

## Cómo identificar la categoría de cada archivo (NO uses el encabezado de la planilla, no es confiable)
- Carpeta "NN - ..." = subjurisdicción. Para 03, 05, 07 y 11 el código es 11101NN000 (1110103000 Economía y
  Finanzas, 1110105000 Obras y Serv. Públicos, 1110107000 Educación y Des. de la Comunidad, 1110111000
  Planificación Estratégica). Para 00 HCD, 13 Mujeres GyD, 16 Jefatura de Gabinete, 17 Seguridad Ciudadana y
  25 Desarrollo Productivo NO asumas el código: ubicalos por nombre en el árbol del F7 y mostrame el código.
- Archivo PP.AA.OO = programa . actividad/proyecto . obra. Ej.: 01.13.00 = 01 Actividad Central / 13; 24.01.00 =
  programa 24 / actividad 01. Si AA = 00 (45.00.00, 31.00.00, 48.00.00) la categoría es el programa mismo.
- Antes de escribir en cada categoría, abrí su detalle y compará el encabezado de RAFAM (jurisdicción, programa,
  actividad) con carpeta + archivo. Si no coincide: no cargues, frená y avisame.

## Reglas
1. NUNCA borres, modifiques ni reemplaces nada ya cargado (ni tacho ni goma de la barra), aunque el total suba.
2. Si un código ya existe en la categoría y fuente, saltealo (--excluir) y reportalo; no lo dupliques.
3. Antes de cargar: leé la línea base de la categoría (registros "N de M" y total). Después de cada lote verificá
   base + filas nuevas, tanto en cantidad como en total. Si no coincide: frená, capturas, diagnóstico; no reintentes a ciegas.
4. Primero 1 fila de prueba por categoría (--ventana "Actualizaci" --pausa 300), verificá, y después lotes de ~20.
   Nunca recargues filas que ya están. F2 frena el .ahk.
5. No uses Downloads\formulario 7 19.01 seguridad para borrar.xls ni nada que implique borrar.
6. rafam_bot.ps1 hoy solo abre la categoría 13 de Economía (coordenadas fijas). Generalizalo para abrir cualquier
   categoría del árbol (scroll + capturas), sin tocar nada del árbol salvo navegar.
8. **Unidad de medida** (aviso del autor del .ahk original). Los ítems de la hoja "F7 especial" que NO figuran en el listado
   de bienes del F7 no traen la unidad de medida automática: hay que ponerla a mano. Regla por inciso (primer dígito del código):
   inciso 4 -> UM siempre **3** (cada uno); inciso 3 -> UM siempre **176** (servicio); inciso 2 -> hay que verlo caso por caso
   (no la inventes: compará con el "Listado de bienes" de la propia planilla). ANTES de cargar cada archivo, validá la UM de
   cada fila contra esta regla; las que no cumplan o vengan vacías NO las cargues: anotalas en el archivo de pendientes (regla 9)
   y seguí con el resto. Hacelo también, en solo lectura, con los archivos ya cargados y anotá las dudosas en ese mismo archivo.
9. **NO TE DETENGAS por filas problemáticas.** Creá y mantené `PENDIENTES_REVISION.md` (en la raíz del proyecto) y agregá ahí, en
   cuanto aparezca, TODO lo que haya que revisar a mano: filas con `#REF!` o código malformado, UM vacía o que no cumple la
   regla 8, códigos duplicados salteados, filas que hacen caer Presupuesto.exe u otro error, planillas sin filas con datos,
   filas raras. Una tabla con: subjurisdicción | categoría | archivo | fila(s) y código | motivo | qué hay que decidir.
   Salteá esas filas y seguí con la carga del resto, de un archivo al siguiente, sin pedirme confirmación. Si Presupuesto.exe
   se cae, reabrilo, volvé a la categoría, releé la línea base y retomá desde la fila exacta, sin recargar lo que ya está.
   Detenete SOLO si: (a) tras un lote el conteo o el total no es base + filas cargadas, (b) el encabezado de RAFAM no coincide con
   carpeta + archivo, o (c) RAFAM no se puede reabrir sin que ingreses una contraseña. Todo lo demás va al archivo y se sigue.
   Al terminar, mostrame un resumen y el contenido de PENDIENTES_REVISION.md.
10. **Excluido por el usuario:** "Fondo Fortalecimiento de Programa Social", 32.02.00, $14.082.775 (subjurisdicción 07 Educación).
    Ya está sacado: NO lo cargues y no lo cuentes como pendiente. Si igual aparece en la carpeta o en RAFAM, no lo toques
    (nunca borres) y anotalo en PENDIENTES_REVISION.md. Si la línea base de 07 ya no lo incluye, es lo esperado.
7. Yo no uso la PC mientras cargás. Informá el avance por archivo.

## Orden (actualizado 20/10)
1. ~~Primero 16/01.06.00~~ **YA CARGADA el 20/10** (1110116000 / 01 Actividad Central / 06). No la repitas.
2. **Después, seguí con lo que faltaba:** 25 Desarrollo Productivo (16.01/02/04/05), 00 HCD (01.41, 01.42), 05 Obras Y Serv. Púb. y 07 Educación
   (menos 32.02.00, ver regla 10). Lo ya cargado de 03, 11, 13 y 16 (31.00, 48.00, 35.01) no se repite.
   **07 Educación se re-descargó el 21/10** (carpeta `07 - Educación y Des. De la Com.-20261021T124257Z-1-001`; la carpeta del 20/10 ya
   no está). Ahora son 16 archivos. **CORRECCIÓN: ya se cargaron el 20/10 (con la versión anterior) 01.11, 01.13 (Logística, la 13 de
   Educación, no la de Economía), 34.01, 34.02 y 44.01: NO los recargues.** Si la planilla nueva cambió, compará con lo que hay en RAFAM y
   cargá SOLO filas cuyo código no exista en esa categoría (nunca modifiques ni borres lo ya cargado) y anotá las diferencias en
   PENDIENTES_REVISION.md. **Nuevos o sin cargar:** 01.09, 01.43, 01.44, 01.50, 18.01, 32.01, 39.00, 42.01, 43.01, más 38.01 y 38.06 (ayer
   sin filas con datos: releelos). No confundas 01.44 (Actividad Central, actividad 44) con 44.01 (programa 44, actividad 01). Releé cada
   planilla, no uses datos de ayer; ojo con las que vengan sin valores calculados (como 01.06) y con precios con puntos de miles.
   32.02.00 no está (excluido, regla 10). Subjurisdicción 1110107000. Fuente de verdad de lo hecho y lo pendiente: la memoria del
   proyecto (rafam-avance-carga-f7) y PENDIENTES_REVISION.md.
   Los archivos "sin filas con datos" (07/38.01, 07/38.06, 17/19.01) solo se anotan en PENDIENTES_REVISION.md.

## Reporte por archivo (tabla)
categoría (código y nombre) | filas en la planilla | duplicadas salteadas (códigos) | cargadas |
registros y total antes → después | resultado de la verificación.
Al terminar cada subjurisdicción, un agente de solo lectura revisa los registros cargados.
