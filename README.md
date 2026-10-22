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

## Bot de navegación (login automático, solo lectura)

`rafam_bot.ps1` abre RAFAM, inicia sesión, entra a Presupuesto → Formulación → F7 y abre el detalle de la
categoría (`-Categoria 13` = Economía y Finanzas / 01 / 13 Administración de Políticas Fiscales). No escribe nada
en RAFAM; deja capturas en `logs/` (ignorado por git). Ver `RECONOCIMIENTO.md` para el recorrido.

1. **Una sola vez**: doble clic en `guardar_credencial.cmd`. Una ventana de Windows pide usuario y contraseña y los
   guarda cifrados (DPAPI) en `%LOCALAPPDATA%\rafam_bot\cred.xml`, **fuera del repo**. Solo los puede leer el mismo
   usuario de Windows en esta PC. Si cambia la contraseña de RAFAM, repetir.
2. Correr: doble clic en `ejecutar_bot.cmd` (o `powershell -File rafam_bot.ps1`). Un único intento de login.
3. Desatendido: programar `ejecutar_bot.cmd` en el Programador de tareas con el mismo usuario de Windows,
   "Ejecutar solo cuando el usuario haya iniciado sesión". El escritorio tiene que estar **desbloqueado**
   (el bot usa clics y teclas reales). Ejemplo:
   `schtasks /Create /TN "RAFAM bot" /TR "D:\Usuarios\310019\carga_automatica\ejecutar_bot.cmd" /SC DAILY /ST 07:00 /IT`

La contraseña nunca va en el repo (este repo tiene remoto en GitHub).
