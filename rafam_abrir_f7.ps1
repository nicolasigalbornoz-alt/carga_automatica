<#
 rafam_abrir_f7.ps1 - Abre el arbol del F7 (Presupuesto > Formulacion > F7) desde el modulo Presupuesto ya abierto.
 Solo navega. Si el F7 ya esta abierto no hace nada. Deja captura del arbol en .\logs
#>
. "$PSScriptRoot\rafam_util.ps1"
if ((Find-Win 'Actualizaci*n de Compras*') -ne [IntPtr]::Zero) { Log 'F7 ya abierto'; return }
$pre = Wait-Win 'Municipalidad de Moron - Presupuesto' 20
Click-Rel $pre 43 35
Start-Sleep -Seconds 1
Click-Rel $pre 127 125
$f7 = Wait-Win 'Actualizaci*n de Compras*' 60
Start-Sleep -Seconds 2
Shot $f7 'f7_arbol'
