Add-Type -AssemblyName System.Web

$moves = Get-Content "$PSScriptRoot\move_catalog.json" | ConvertFrom-Json
Write-Host "Fetching power data for $($moves.Count) moves..."

$existing = @{}
if (Test-Path "$PSScriptRoot\move_powers.json") {
    $existingData = Get-Content "$PSScriptRoot\move_powers.json" | ConvertFrom-Json
    foreach ($m in $existingData) { $existing[$m.name] = $m }
    Write-Host "Loaded $($existing.Count) cached moves"
}

$results = @()
$i = 0
foreach ($m in $moves) {
    $i++
    if ($existing.ContainsKey($m.name)) {
        $results += $existing[$m.name]
        continue
    }

    Write-Progress -Activity "Fetching move data" -Status "$($m.name) ($($i)/$($moves.Count))" -PercentComplete (($i-1)/$moves.Count*100)

    try {
        $urlName = [System.Web.HttpUtility]::UrlEncode($m.name.ToLower().Replace(" ", "-").Replace(".", "").Replace("'", "").Replace("é", "e"))
        $url = "https://pokeapi.co/api/v2/move/$urlName"
        $data = Invoke-RestMethod -Uri $url -TimeoutSec 10
        $power = if ($data.power -eq $null) { $null } else { [int]$data.power }
        $results += [PSCustomObject]@{name=$m.name; type=$m.type; power=$power; hasCost=$m.HasCost}
    } catch {
        Write-Warning "Failed: $($m.name) - $_"
        $results += [PSCustomObject]@{name=$m.name; type=$m.type; power=$null; hasCost=$m.HasCost}
    }

    Start-Sleep -Milliseconds 30
}

Write-Progress -Activity "Fetching move data" -Completed

$results | ConvertTo-Json | Set-Content "$PSScriptRoot\move_powers.json"
Write-Host "Saved $($results.Count) move power entries"
