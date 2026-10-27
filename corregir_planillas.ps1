<#
 corregir_planillas.ps1 - Aplica correcciones PUNTUALES y verificadas a las planillas F7, usando Excel (COM) para no perder
 formato, validaciones ni formulas. ANTES de tocar cada archivo hace una copia en formularios\_backup_originales\.
   powershell -NoProfile -ExecutionPolicy Bypass -File .\corregir_planillas.ps1 -Ediciones ediciones.json [-Simular]
 ediciones.json: lista de {ruta, hoja, celda, esperado, valor, motivo}. Si el valor actual de la celda no es "esperado",
 NO la toca (la planilla cambio). -Simular solo informa. No toca nada fuera de las celdas listadas.
#>
param([Parameter(Mandatory = $true)][string]$Ediciones, [switch]$Simular)
$ErrorActionPreference = 'Stop'
$lista = Get-Content -Raw -Encoding UTF8 $Ediciones | ConvertFrom-Json
$raizBk = Join-Path $PSScriptRoot 'formularios\_backup_originales'
$xl = $null
try {
  if (-not $Simular) { $xl = New-Object -ComObject Excel.Application; $xl.Visible = $false; $xl.DisplayAlerts = $false }
  foreach ($g in ($lista | Group-Object ruta)) {
    $ruta = $g.Name
    if (-not (Test-Path -LiteralPath $ruta)) { Write-Output "NO EXISTE: $ruta"; continue }
    $rel = $ruta.Substring((Join-Path $PSScriptRoot 'formularios').Length).TrimStart('\')
    $bk = Join-Path $raizBk $rel
    if ($Simular) { Write-Output "[simulacion] $rel  ($($g.Count) cambios)"; }
    else {
      if (-not (Test-Path -LiteralPath $bk)) {
        New-Item -ItemType Directory -Force (Split-Path $bk) | Out-Null
        Copy-Item -LiteralPath $ruta -Destination $bk
      }
      $wb = $xl.Workbooks.Open($ruta)
    }
    foreach ($e in $g.Group) {
      if ($Simular) { Write-Output ("   {0}!{1}: esperado '{2}' -> '{3}'  ({4})" -f $e.hoja, $e.celda, $e.esperado, $e.valor, $e.motivo); continue }
      $ws = $null
      foreach ($s in $wb.Worksheets) { if ($s.Name -like ($e.hoja + '*')) { $ws = $s; break } }
      if (-not $ws) { Write-Output "   hoja no encontrada: $($e.hoja)"; continue }
      $c = $ws.Range($e.celda)
      $actual = $c.Value2
      if ("$actual" -ne "$($e.esperado)") { Write-Output ("   OMITIDA {0}!{1}: valor actual '{2}' no es el esperado '{3}'" -f $e.hoja, $e.celda, $actual, $e.esperado); continue }
      if ($e.valor -is [string]) { $c.Value2 = [string]$e.valor } else { $c.Value2 = [double]$e.valor }
      Write-Output ("   OK {0}!{1}: '{2}' -> '{3}'  ({4})" -f $e.hoja, $e.celda, $actual, $e.valor, $e.motivo)
    }
    if (-not $Simular) { $wb.Save(); $wb.Close($false); Write-Output "guardado: $rel (backup en _backup_originales)" }
  }
}
finally {
  if ($xl) { $xl.Quit(); [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($xl) }
}
