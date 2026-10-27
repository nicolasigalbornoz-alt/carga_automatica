@echo off
rem Doble clic: guarda usuario y contrasena de RAFAM cifrados (una sola vez). Los pide una ventana de Windows.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0rafam_credencial.ps1"
pause
