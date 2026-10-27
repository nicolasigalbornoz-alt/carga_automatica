<#
 rafam_credencial.ps1 - Guarda la credencial de RAFAM cifrada (DPAPI) para rafam_bot.ps1.
 Lo ejecuta EL USUARIO una sola vez:  powershell -ExecutionPolicy Bypass -File .\rafam_credencial.ps1
 - Pide usuario y contrasena en una ventana de Windows (la contrasena no se muestra ni se escribe en pantalla).
 - Guarda en %LOCALAPPDATA%\rafam_bot\cred.xml, FUERA del repo. Solo lo puede descifrar el mismo usuario
   de Windows en esta misma PC (la tarea programada tiene que correr con ese usuario).
 - Si cambia la contrasena de RAFAM, volver a ejecutarlo.
#>
$dir = Join-Path $env:LOCALAPPDATA 'rafam_bot'
New-Item -ItemType Directory -Force $dir | Out-Null
$c = Get-Credential -UserName 'L310019' -Message 'Credencial de RAFAM (se guarda cifrada para este usuario de Windows)'
if (-not $c) { Write-Output 'Cancelado, no se guardo nada.'; exit 1 }
$c | Export-Clixml (Join-Path $dir 'cred.xml')
Write-Output "Credencial guardada en $dir\cred.xml (cifrada, fuera del repo)."
