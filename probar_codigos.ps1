<#
 probar_codigos.ps1 - Con el detalle de una categoria abierto en el F7 (no en Alta), prueba si cada codigo (8 digitos) EXISTE en el catalogo
 de RAFAM: abre un Alta, tipea fuente 110 + codigo y mira si se completa la descripcion; despues sale con Esc -> Si (descarta el formulario
 vacio, NO graba nada: nunca se llega a cantidad/precio).
   .\probar_codigos.ps1 -Codigos 22200385,29200588
#>
param([Parameter(Mandatory)][string]$Codigos, [string]$Fuente = '110')
. "$PSScriptRoot\rafam_util.ps1"
function Px-Desc($h) {
  $r = Get-Rect $h
  $bmp = New-Object System.Drawing.Bitmap 355, 30
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.CopyFromScreen($r.L + 258, $r.T + 182, 0, 0, $bmp.Size)
  $n = 0
  for ($x = 0; $x -lt 355; $x++) { for ($y = 0; $y -lt 30; $y++) { $c = $bmp.GetPixel($x, $y); if (($c.R + $c.G + $c.B) -lt 480) { $n++ } } }
  $g.Dispose(); $bmp.Dispose(); return $n
}
foreach ($c in ($Codigos -split '[,; ]+' | Where-Object { $_ })) {
  $f7 = Find-Win 'Actualizaci*n de Compras*'
  if ($f7 -eq [IntPtr]::Zero) { Stop-Bot 'no esta el detalle del F7' }
  Click-Rel $f7 397 41
  $a = Wait-Win 'Alta de Compras*' 10
  Start-Sleep -Milliseconds 800
  Click-Rel $a 192 165
  [System.Windows.Forms.SendKeys]::SendWait($Fuente + '{ENTER}')
  Start-Sleep -Milliseconds 500
  [System.Windows.Forms.SendKeys]::SendWait($c + '{ENTER}')
  Start-Sleep -Milliseconds 900
  $n = Px-Desc $a
  $av = Find-Win 'Aviso*'
  if ($av -ne [IntPtr]::Zero) { Log "$c : AVISO"; Shot $av "aviso_$c"; Click-Rel $av 122 83; Start-Sleep -Milliseconds 700 }
  elseif ($n -gt 30) { Log "$c : EXISTE ($n px)" } else { Log "$c : NO EXISTE ($n px)"; Shot $a "noexiste_$c" }
  [System.Windows.Forms.SendKeys]::SendWait('{ESC}')
  $d = Wait-Win 'Cancelar alta' 10
  Click-Rel $d 97 80
  Start-Sleep -Milliseconds 1500
}
