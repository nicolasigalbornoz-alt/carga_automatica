<#
 buscar_codigo.ps1 - Solo lectura. Con el detalle de una categoria abierto, busca codigos de bien (formato RAFAM de 8 digitos,
 ej. 29302306) con el boton Buscar (binoculares), columna "Bien". Dice si EXISTE o NO (aviso "No hay ninguna coincidencia").
 Cierra el dialogo al terminar. No agrega, modifica ni borra nada.
   .\buscar_codigo.ps1 -Codigos 29302306,25804751
#>
param([Parameter(Mandatory)][string[]]$Codigos)
. "$PSScriptRoot\rafam_util.ps1"
$f7 = Find-Win 'Actualizaci*n de Compras*'
if ($f7 -eq [IntPtr]::Zero) { Stop-Bot 'no esta abierto el F7' }
Click-Rel $f7 211 41
$b = Wait-Win 'Buscar' 10
Click-Rel $b 155 45
[System.Windows.Forms.SendKeys]::SendWait('{DOWN}')
Start-Sleep -Milliseconds 400
foreach ($c in $Codigos) {
  Click-Rel $b 150 72
  [System.Windows.Forms.SendKeys]::SendWait('{END}+{HOME}{BS}' + $c)
  Click-Rel $b 245 72
  $a = [IntPtr]::Zero
  for ($k = 0; $k -lt 8 -and $a -eq [IntPtr]::Zero; $k++) { Start-Sleep -Milliseconds 500; $a = Find-Win 'Aviso' }
  if ($a -ne [IntPtr]::Zero) {
    Log "$c : NO EXISTE (No hay ninguna coincidencia)"
    for ($i = 0; $i -lt 3; $i++) { $a = Find-Win 'Aviso'; if ($a -eq [IntPtr]::Zero) { break }; Click-Rel $a 122 83; Start-Sleep -Milliseconds 700 }
  } else {
    Shot $f7 "busca_$c"
    Log "$c : EXISTE (ver captura)"
  }
}
$b = Find-Win 'Buscar'
if ($b -ne [IntPtr]::Zero) { Click-Rel $b 286 15 }
