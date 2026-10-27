<#
 rafam_nav.ps1 - Herramienta de navegacion manual (solo mouse/captura) sobre la ventana F7 de RAFAM.
   -Accion shot            captura de la ventana (devuelve la ruta del png)
   -Accion click -X -Y     un clic en coordenadas relativas a la ventana
   -Accion dclick -X -Y    doble clic
   -Accion wheel -Y <n>    rueda del mouse (n<0 baja) sobre el centro del arbol
   -Accion keys -Texto     SendKeys (ej. '{PGDN}')
 -Ventana: patron del titulo (por defecto el F7).
#>
param([string]$Accion, [int]$X, [int]$Y, [string]$Texto, [string]$Ventana = 'Actualizaci*n de Compras*', [string]$Nombre = 'nav')
. "$PSScriptRoot\rafam_util.ps1"
$h = Find-Win $Ventana
if ($h -eq [IntPtr]::Zero) { Stop-Bot "no existe la ventana '$Ventana'" }
switch ($Accion) {
  'shot'   { $null = Show-Win $h; Shot $h $Nombre }
  'click'  { Click-Rel $h $X $Y; Start-Sleep -Milliseconds 700; Shot $h $Nombre }
  'dclick' { Click-Rel $h $X $Y; Start-Sleep -Milliseconds 300; Click-Rel $h $X $Y -Double; Start-Sleep -Seconds 3; Shot $h $Nombre }
  'wheel'  { $r = Show-Win $h; [RB]::SetCursorPos($r.L + 300, $r.T + 250) | Out-Null; Start-Sleep -Milliseconds 200
             $d = [BitConverter]::ToUInt32([BitConverter]::GetBytes([int](-120 * $Y)), 0)   # Y>0 baja Y pasos
             [RB]::mouse_event(0x0800, 0, 0, $d, [UIntPtr]::Zero); Start-Sleep -Milliseconds 700; Shot $h $Nombre }
  'keys'   { $null = Show-Win $h; [System.Windows.Forms.SendKeys]::SendWait($Texto); Start-Sleep -Milliseconds 700; Shot $h $Nombre }
  default  { Stop-Bot "accion '$Accion' desconocida" }
}
