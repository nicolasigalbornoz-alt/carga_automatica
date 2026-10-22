@echo off
rem Doble clic (o tarea programada): abre RAFAM, inicia sesion solo y navega hasta el F7. Solo lectura.
rem Requiere haber corrido guardar_credencial.cmd una vez y el escritorio de Windows desbloqueado.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0rafam_bot.ps1" %*
pause
