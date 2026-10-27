<#
 modificar_registro.ps1 - Modifica SOLO cantidad y precio del registro ya mostrado en el detalle del F7
 (dejarlo seleccionado antes con buscar_codigo.ps1). Dos etapas para poder mirar la captura antes de grabar:
   .\modificar_registro.ps1 -Cant 2 -Precio 47499            # entra a Modificar, limpia (Ctrl+A, Supr) y tipea; NO graba
   .\modificar_registro.ps1 -Guardar                         # Enter -> "Guarda los datos modificados?" -> Si
   .\modificar_registro.ps1 -Cancelar                        # Esc/No: descarta lo tipeado
 No toca unidad de medida ni ningun otro campo.
#>
param([double]$Cant = -1, [double]$Precio = -1, [switch]$Guardar, [switch]$Cancelar)
. "$PSScriptRoot\rafam_util.ps1"
$K = [System.Windows.Forms.SendKeys]
if ($Guardar) {
  $m = Find-Win 'Modificaci*n de Compras*'
  if ($m -eq [IntPtr]::Zero) { Stop-Bot 'no esta la ventana de Modificacion' }
  $null = Show-Win $m
  $K::SendWait('{ENTER}')
  $d = Wait-Win 'Modificar' 10
  Shot $d 'mod_dlg'
  Click-Rel $d 97 80          # boton "Si"
  Start-Sleep -Seconds 3
  $f = Find-Win '*de Compras de Bienes*'
  if ($f -ne [IntPtr]::Zero) { Shot $f 'mod_guardado' }
  Log 'Guardado (verificar captura)'
  return
}
if ($Cancelar) {
  $m = Find-Win 'Modificaci*n de Compras*'
  if ($m -eq [IntPtr]::Zero) { Stop-Bot 'no esta la ventana de Modificacion' }
  $null = Show-Win $m
  $K::SendWait('{ESC}')
  Start-Sleep -Seconds 2
  $d = Find-Win 'Modificar'
  if ($d -ne [IntPtr]::Zero) { Shot $d 'mod_cancel_dlg' }
  return
}
if ($Cant -lt 0 -or $Precio -lt 0) { Stop-Bot 'faltan -Cant y -Precio' }
$f7 = Find-Win 'Actualizaci*n de Compras*'
if ($f7 -eq [IntPtr]::Zero) { Stop-Bot 'no esta el detalle del F7 en modo consulta' }
Click-Rel $f7 426 41          # icono Modificar
$m = Wait-Win 'Modificaci*n de Compras*' 10
Start-Sleep -Seconds 1
Shot $m 'mod_abierto'
$c = [string]::Format([Globalization.CultureInfo]::InvariantCulture, '{0:0.##}', $Cant)
$p = [string]::Format([Globalization.CultureInfo]::InvariantCulture, '{0:0.##}', $Precio)
Click-Rel $m 140 252          # Cantidad
$K::SendWait('^a{DEL}')
$K::SendWait($c)
Click-Rel $m 345 252          # Precio
$K::SendWait('^a{DEL}')
$K::SendWait($p)
Start-Sleep -Milliseconds 500
Shot $m 'mod_tipeado'
Log "Tipeado cant=$c precio=$p; revisar captura y luego -Guardar"
