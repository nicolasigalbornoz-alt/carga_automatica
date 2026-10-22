<#
 rafam_salir_alta.ps1 - Sale del modo "Alta" (Esc -> "Cancelar alta: ¿Cancela los datos ingresados?" -> Si; solo descarta el
 formulario vacio en curso, las filas ya grabadas quedan) y cierra el F7. No usa tacho ni goma.
#>
. "$PSScriptRoot\rafam_util.ps1"
$a = Find-Win 'Alta de Compras*'
if ($a -eq [IntPtr]::Zero) { Stop-Bot 'no hay ventana Alta abierta' }
$null = Show-Win $a
[System.Windows.Forms.SendKeys]::SendWait('{ESC}')
$d = Wait-Win 'Cancelar alta' 10
Click-Rel $d 97 80            # boton "Si"
Start-Sleep -Seconds 2
$f = Wait-Win 'Actualizaci*n de Compras*' 10
Shot $f 'tras_alta'
Click-Rel $f 20 41            # cerrar F7
Start-Sleep -Seconds 1
