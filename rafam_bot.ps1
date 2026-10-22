<#
 rafam_bot.ps1 - Navegacion automatica de RAFAM: login -> Presupuesto -> Formulacion -> F7 -> categoria.
 SOLO LECTURA: no agrega, modifica ni borra nada. Termina con el detalle de la categoria abierto
 (la carga real la dispara el .ahk con F1, revisada por el usuario).

 Uso:
   powershell -NoProfile -ExecutionPolicy Bypass -File .\rafam_bot.ps1               # login automatico
   powershell -NoProfile -ExecutionPolicy Bypass -File .\rafam_bot.ps1 -SinLogin     # espera que alguien inicie sesion a mano
   ... -Categoria 13      # 13 = Economia y Finanzas / 01 Actividad Central / 13 Administracion de Politicas Fiscales

 Credencial: NO esta en este archivo ni en el repo. Se lee de %LOCALAPPDATA%\rafam_bot\cred.xml
 (cifrada con DPAPI; se crea una vez con rafam_credencial.ps1). Un solo intento de login (evita bloquear el usuario).

 Requisitos del modo desatendido: sesion de Windows iniciada y escritorio DESBLOQUEADO (usa clics y teclas reales).
 Ante cualquier cosa rara (ventana que no aparece, rect invalido) frena con error y deja capturas en .\logs
#>
param([switch]$SinLogin, [string]$Categoria = '13', [int]$EsperaLoginSeg = 300)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type @"
using System;
using System.Text;
using System.Collections.Generic;
using System.Runtime.InteropServices;
public class RB {
  public delegate bool EnumProc(IntPtr h, IntPtr l);
  [StructLayout(LayoutKind.Sequential)] public struct RECT { public int L, T, R, B; }
  [DllImport("user32.dll")] public static extern bool SetProcessDPIAware();
  [DllImport("user32.dll")] static extern bool EnumWindows(EnumProc p, IntPtr l);
  [DllImport("user32.dll")] static extern bool IsWindowVisible(IntPtr h);
  [DllImport("user32.dll", CharSet=CharSet.Unicode)] static extern int GetWindowText(IntPtr h, StringBuilder s, int n);
  [DllImport("user32.dll")] public static extern bool GetWindowRect(IntPtr h, out RECT r);
  [DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr h);
  [DllImport("user32.dll")] public static extern bool ShowWindow(IntPtr h, int c);
  [DllImport("user32.dll")] public static extern bool SetCursorPos(int x, int y);
  [DllImport("user32.dll")] public static extern void mouse_event(uint f, uint dx, uint dy, uint d, UIntPtr e);
  public static List<string> Titles = new List<string>();
  public static List<long> Handles = new List<long>();
  public static void Scan() {
    Titles.Clear(); Handles.Clear();
    EnumWindows((h, l) => {
      if (IsWindowVisible(h)) {
        var t = new StringBuilder(256); GetWindowText(h, t, 256);
        if (t.Length > 0) { Titles.Add(t.ToString()); Handles.Add(h.ToInt64()); }
      }
      return true;
    }, IntPtr.Zero);
  }
}
"@
[RB]::SetProcessDPIAware() | Out-Null
$LogDir = Join-Path $PSScriptRoot 'logs'
New-Item -ItemType Directory -Force $LogDir | Out-Null

function Log($m) { Write-Output ("[{0}] {1}" -f (Get-Date -Format 'HH:mm:ss'), $m) }
function Stop-Bot($m) { Log "FRENADO: $m"; throw $m }

function Find-Win([string]$pattern) {
  [RB]::Scan()
  for ($i = 0; $i -lt [RB]::Titles.Count; $i++) {
    if ([RB]::Titles[$i] -like $pattern) { return [IntPtr]([long][RB]::Handles[$i]) }
  }
  return [IntPtr]::Zero
}
function Wait-Win([string]$pattern, [int]$seg) {
  $fin = (Get-Date).AddSeconds($seg)
  while ((Get-Date) -lt $fin) {
    $h = Find-Win $pattern
    if ($h -ne [IntPtr]::Zero) { return $h }
    Start-Sleep -Milliseconds 500
  }
  Stop-Bot "no aparecio la ventana '$pattern' en $seg s"
}
function Get-Rect([IntPtr]$h) {
  $r = New-Object RB+RECT
  [RB]::GetWindowRect($h, [ref]$r) | Out-Null
  return $r
}
# Trae la ventana al frente (restaurandola si esta minimizada) y devuelve su rectangulo ACTUAL.
function Show-Win([IntPtr]$h) {
  $r = Get-Rect $h
  if ($r.L -lt -1000) { [RB]::ShowWindow($h, 9) | Out-Null; Start-Sleep -Milliseconds 1500 }
  [RB]::SetForegroundWindow($h) | Out-Null
  Start-Sleep -Milliseconds 400
  $r = Get-Rect $h
  if (($r.R - $r.L) -le 0 -or $r.L -lt -1000) { Stop-Bot "ventana no visible (rect $($r.L),$($r.T))" }
  return $r
}
function Click-Rel([IntPtr]$h, [int]$rx, [int]$ry, [switch]$Double) {
  $r = Show-Win $h
  [RB]::SetCursorPos($r.L + $rx, $r.T + $ry) | Out-Null
  Start-Sleep -Milliseconds 250
  $n = 1; if ($Double) { $n = 2 }
  for ($i = 0; $i -lt $n; $i++) {
    [RB]::mouse_event(2, 0, 0, 0, [UIntPtr]::Zero)
    [RB]::mouse_event(4, 0, 0, 0, [UIntPtr]::Zero)
    Start-Sleep -Milliseconds 80
  }
}
function Shot([IntPtr]$h, [string]$nombre) {
  $r = Get-Rect $h
  $w = $r.R - $r.L; $ht = $r.B - $r.T
  if ($w -le 0 -or $r.L -lt -1000) { return }
  $bmp = New-Object System.Drawing.Bitmap $w, $ht
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.CopyFromScreen($r.L, $r.T, 0, 0, $bmp.Size)
  $f = Join-Path $LogDir ("{0}_{1}.png" -f (Get-Date -Format 'yyyyMMdd_HHmmss'), $nombre)
  $bmp.Save($f, [System.Drawing.Imaging.ImageFormat]::Png)
  $g.Dispose(); $bmp.Dispose()
  Log "captura $f"
}
function Esc-Keys([string]$s) {
  (($s.ToCharArray() | ForEach-Object { if ('+^%~(){}[]'.Contains([string]$_)) { '{' + $_ + '}' } else { [string]$_ } }) -join '')
}

$exe = '\\FALKNER\Rafam\RAFAM.exe'
$menuPat = 'Municipalidad de Moron'
$loginPat = '*Inicio de sesi*n a RAFAM'

# 1) Abrir RAFAM e iniciar sesion
$menu = Find-Win $menuPat
if ($menu -eq [IntPtr]::Zero) {
  if (-not (Get-Process -Name RAFAM -ErrorAction SilentlyContinue)) { Log 'Abriendo RAFAM'; Start-Process $exe }
  $login = Wait-Win $loginPat 90
  if ($SinLogin) {
    Log "Ventana de login lista. Inicia sesion a mano; espero hasta $EsperaLoginSeg s..."
  } else {
    $credPath = Join-Path $env:LOCALAPPDATA 'rafam_bot\cred.xml'
    if (-not (Test-Path $credPath)) { Stop-Bot 'Falta la credencial: ejecutar una vez rafam_credencial.ps1' }
    $cred = Import-Clixml $credPath
    Log "Login automatico como $($cred.UserName)"
    Click-Rel $login 187 57
    [System.Windows.Forms.SendKeys]::SendWait((Esc-Keys $cred.UserName))
    Click-Rel $login 187 91
    [System.Windows.Forms.SendKeys]::SendWait((Esc-Keys $cred.GetNetworkCredential().Password))
    [System.Windows.Forms.SendKeys]::SendWait('{ENTER}')
    $cred = $null
  }
  $menu = Wait-Win $menuPat $EsperaLoginSeg
}
Log 'Menu de sistemas de RAFAM listo'
Start-Sleep -Seconds 2

# 2) Presupuesto (RAFAM lanza Presupuesto.exe como proceso aparte; el menu se minimiza solo)
Click-Rel $menu 700 138
$pre = Wait-Win 'Municipalidad de Moron - Presupuesto' 120
Start-Sleep -Seconds 2
Shot $pre '02_presupuesto'

# 3) Formulacion -> F7 - Compra de Bienes y Servicios
Click-Rel $pre 43 35
Start-Sleep -Seconds 1
Click-Rel $pre 127 125
$f7 = Wait-Win 'Actualizaci*n de Compras*' 60
Start-Sleep -Seconds 2
Shot $f7 '03_f7_arbol'     # verificar en la captura: Presupuesto = 2027

# 4) Categoria (el arbol abre siempre arriba, por eso las coordenadas son fijas)
switch ($Categoria) {
  '13'    { $rx = 166; $ry = 205 }
  default { Stop-Bot "Categoria '$Categoria' sin coordenadas definidas (ver RECONOCIMIENTO.md)" }
}
Click-Rel $f7 $rx $ry
Start-Sleep -Seconds 1
Click-Rel $f7 $rx $ry -Double
Start-Sleep -Seconds 6
Shot $f7 '04_f7_detalle'
Log "OK: detalle de la categoria $Categoria abierto. No se escribio nada en RAFAM."
