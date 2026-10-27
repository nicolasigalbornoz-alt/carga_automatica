<#
 mod_lote_f26.ps1 - Modifica la CANTIDAD de varios registros ya cargados (autorizado por el usuario solo para 17/19.01, 27/10).
 CSV: cod,cant,precio,cant_actual. Por cada fila: buscar_codigo (selecciona), modificar_registro -Cant -Precio (mismo precio), -Guardar.
 Frena ante cualquier error; si el codigo no existe lo anota y sigue. Avance en logs\mod_lote.log; -Desde permite retomar.
   .\mod_lote_f26.ps1 -Csv .\cargas\f26\17_19.01_mods.csv [-Desde 0]
#>
param([Parameter(Mandatory)][string]$Csv, [int]$Desde = 0)
$ErrorActionPreference = 'Stop'
$rows = Import-Csv $Csv
$log = Join-Path $PSScriptRoot 'logs\mod_lote.log'
$delta = 0.0
for ($i = $Desde; $i -lt $rows.Count; $i++) {
  $r = $rows[$i]
  $o = & "$PSScriptRoot\buscar_codigo.ps1" -Codigos $r.cod 6>&1 | Out-String
  if ($o -match 'NO EXISTE') { "$i $($r.cod) NO EXISTE - saltea" | Add-Content $log; continue }
  & "$PSScriptRoot\modificar_registro.ps1" -Cant ([double]$r.cant) -Precio ([double]$r.precio) | Out-Null
  & "$PSScriptRoot\modificar_registro.ps1" -Guardar | Out-Null
  $delta += ([double]$r.cant - [double]$r.cant_actual) * [double]$r.precio
  "$i $($r.cod) $($r.cant_actual)->$($r.cant) x $($r.precio) OK | acumulado +$delta" | Add-Content $log
}
"FIN $($rows.Count)" | Add-Content $log
