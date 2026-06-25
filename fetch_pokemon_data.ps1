param(
    [int]$StartId = 1,
    [int]$EndId = 150
)

Add-Type -AssemblyName System.Web

$lines = Get-Content "$PSScriptRoot\pokedex_data.lua" | Select-String -Pattern "^\s*\{\d+,"
$pokemon = @()
foreach ($l in $lines) {
    if ($l -match '\{(\d+),"([^"]+)"(?:,"([^"]+)")?(?:,"([^"]+)")?\}') {
        $id = [int]$Matches[1]
        if ($id -ge $StartId -and $id -le $EndId) {
            $pokemon += [PSCustomObject]@{id=$id; name=$Matches[2]; type1=$Matches[3]; type2=if($Matches[4]){$Matches[4]}else{""}}
        }
    }
}

Write-Host "Fetching data for Pokemon $StartId-$EndId ($($pokemon.Count) total)..."

$result = @()
$i = 0
foreach ($p in $pokemon) {
    $i++
    Write-Progress -Activity "Fetching PokeAPI data" -Status "$($p.id) $($p.name)" -PercentComplete (($i-1)/$pokemon.Count*100)

    try {
        # Fetch base stats
        $pokemonUrl = "https://pokeapi.co/api/v2/pokemon/$($p.id)"
        $pokemonData = Invoke-RestMethod -Uri $pokemonUrl -TimeoutSec 10

        $stats = @{}
        foreach ($s in $pokemonData.stats) {
            $stats[$s.stat.name] = $s.base_stat
        }

        # Top 2 stats, tie-break top-to-bottom: hp, attack, defense, special-attack, special-defense, speed
        $statOrder = @("hp","attack","defense","special-attack","special-defense","speed")
        $statDisplay = @{hp="HP"; attack="ATK"; defense="DEF"; "special-attack"="SP.ATK"; "special-defense"="SP.DEF"; speed="SPD"}
        $sorted = $statOrder | Sort-Object { $stats[$_] } -Descending
        $topStat = $sorted[0]
        $secondStat = $sorted[1]

        # Fetch species for evolution data
        $speciesUrl = "https://pokeapi.co/api/v2/pokemon-species/$($p.id)"
        $speciesData = Invoke-RestMethod -Uri $speciesUrl -TimeoutSec 10
        $evolvesFrom = $null
        if ($speciesData.evolves_from_species) {
            $evolvesFrom = [int]($speciesData.evolves_from_species.url -replace '.*/(\d+)/', '$1')
        }

        $result += [PSCustomObject]@{
            id = $p.id
            name = $p.name
            type1 = $p.type1
            type2 = $p.type2
            hp = $stats["hp"]
            attack = $stats["attack"]
            defense = $stats["defense"]
            spatk = $stats["special-attack"]
            spdef = $stats["special-defense"]
            spd = $stats["speed"]
            stat1_key = $topStat
            stat1_display = $statDisplay[$topStat]
            stat1_val = $stats[$topStat]
            stat2_key = $secondStat
            stat2_display = $statDisplay[$secondStat]
            stat2_val = $stats[$secondStat]
            evolves_from = $evolvesFrom
        }
    } catch {
        Write-Warning "Failed for #$($p.id) $($p.name): $_"
    }

    # Rate limit: 100 requests per second is fine, but be polite
    Start-Sleep -Milliseconds 50
}

Write-Progress -Activity "Fetching PokeAPI data" -Completed

# Determine evolution stages
$idMap = @{}
foreach ($r in $result) { $idMap[$r.id] = $r }

foreach ($r in $result) {
    $hasPre = $r.evolves_from -ne $null
    $hasPost = $false
    foreach ($other in $result) {
        if ($other.evolves_from -eq $r.id) { $hasPost = $true; break }
    }
    if ($hasPre -and $hasPost) { $r | Add-Member -NotePropertyName "stage" -NotePropertyValue 2 }
    elseif ($hasPre) { $r | Add-Member -NotePropertyName "stage" -NotePropertyValue 3 }
    elseif ($hasPost) { $r | Add-Member -NotePropertyName "stage" -NotePropertyValue 1 }
    else { $r | Add-Member -NotePropertyName "stage" -NotePropertyValue 3 }
}

$result | ConvertTo-Json | Set-Content "$PSScriptRoot\pokemon_batch_$($StartId)_$($EndId).json"
Write-Host "Saved $($result.Count) Pokemon to pokemon_batch_$($StartId)_$($EndId).json"
