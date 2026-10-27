<#
 rafam_util.ps1 - Funciones comunes (ventanas, clics, capturas) para los scripts de navegacion de RAFAM.
 Se usa con dot-source:  . "$PSScriptRoot
afam_util.ps1"
#>
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
  [DllImport("user32.dll")] public static extern IntPtr GetForegroundWindow();
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
  # Seguridad: si la ventana no quedo al frente (ej. el usuario esta en otro escritorio/ventana), no clickear.
  if ([RB]::GetForegroundWindow() -ne $h) { Stop-Bot 'la ventana de RAFAM no esta al frente; no se envian clics ni teclas' }
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

