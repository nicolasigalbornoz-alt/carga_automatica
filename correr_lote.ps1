<#
 correr_lote.ps1 - Lanza un .ahk de carga (generado con --auto) sobre la ventana "Alta de Compras", espera a que
 termine ("Carga terminada") y deja una captura. Frena si la ventana no queda al frente. F2 sigue frenando el .ahk.
   .\correr_lote.ps1 -Ahk .\cargas\x.ahk -TimeoutSeg 900
#>
param([Parameter(Mandatory)][string]$Ahk, [int]$TimeoutSeg = 900, [string]$Nombre = 'lote')
. "$PSScriptRoot\rafam_util.ps1"
$alta = Find-Win 'Alta de Compras*'
if ($alta -eq [IntPtr]::Zero) { Stop-Bot 'no esta abierta la ventana "Alta de Compras" (hay que tocar el lapiz antes)' }
Click-Rel $alta 192 165     # foco en Fuente de Financiamiento
Log "Lanzando $Ahk"
$p = Start-Process -FilePath (Resolve-Path $Ahk) -PassThru
$fin = (Get-Date).AddSeconds($TimeoutSeg)
$ok = $false
while ((Get-Date) -lt $fin) {
  if ((Find-Win 'Carga terminada') -ne [IntPtr]::Zero) { $ok = $true; break }
  if ($p.HasExited) { break }       # F2 o ventana equivocada (MsgBox 'Carga frenada' -> sigue vivo)
  if ((Find-Win 'Carga frenada*') -ne [IntPtr]::Zero) { break }
  Start-Sleep -Seconds 2
}
Start-Sleep -Seconds 1
$a = Find-Win 'Alta de Compras*'
if ($a -ne [IntPtr]::Zero) { Shot $a $Nombre }
if ($ok) { Log 'Lote terminado' } else { Log 'ATENCION: el lote NO termino normalmente (frenado, error o timeout); revisar la captura' }
Get-Process AutoHotkey* -ErrorAction SilentlyContinue | Where-Object { $_.Id -eq $p.Id } | Stop-Process -Force
