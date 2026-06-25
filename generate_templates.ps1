param(
    [int]$StartId = 1,
    [int]$EndId = 150,
    [string]$OutputDir = "$PSScriptRoot\templates",
    [string]$DataFile = "$PSScriptRoot\pokemon_batch_$($StartId)_$($EndId).json"
)

$GIT_BASE = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master"

$pokemon = Get-Content $DataFile | ConvertFrom-Json
$moves = Get-Content "$PSScriptRoot\move_powers.json" | ConvertFrom-Json

New-Item -ItemType Directory -Path $OutputDir -Force

$typeKeyMap = @{
    "bug"="Bug";"dark"="Dark";"dragon"="Dragon";"electric"="Electric";
    "fairy"="Fairy";"fighting"="Fighting";"fire"="Fire";"flying"="Flying";
    "ghost"="Ghost";"grass"="Grass";"ground"="Ground";"ice"="Ice";
    "normal"="Normal";"poison"="Poison";"psychic"="Psychic";"rock"="Rock";
    "steel"="Steel";"water"="Water"
}

function Get-EligibleMoves($type, $stage) {
    $cap = $typeKeyMap[$type]
    if (-not $cap) { return @() }
    $eligible = $moves | Where-Object { $_.type -eq $cap }
    switch ($stage) {
        1 { $eligible = $eligible | Where-Object { $_.power -eq $null -or ([int]$_.power -le 50) } }
        2 { $eligible = $eligible | Where-Object { $_.power -eq $null -or ([int]$_.power -le 100) } }
        3 { $eligible = $eligible | Where-Object { $_.power -eq $null -or ([int]$_.power -gt 100) } }
    }
    return $eligible
}

function Pick-Moves($type1, $type2, $stage) {
    $primaryPool = Get-EligibleMoves $type1 $stage
    if ($type2) {
        $secondaryPool = Get-EligibleMoves $type2 $stage
    } else {
        $secondaryPool = Get-EligibleMoves "normal" $stage
    }

    $picked = @()
    $usedNames = @{}

    # Pick damaging moves first (prefer unique, high power)
    $primaryDamaging = $primaryPool | Where-Object { $_.power -ne $null } | Sort-Object { -[int]$_.power }
    $secondaryDamaging = $secondaryPool | Where-Object { $_.power -ne $null } | Sort-Object { -[int]$_.power }
    $primaryStatus = $primaryPool | Where-Object { $_.power -eq $null }
    $secondaryStatus = $secondaryPool | Where-Object { $_.power -eq $null }

    # Pick 2 primary moves
    $primaryCandidates = if ($primaryDamaging.Count -ge 2) { $primaryDamaging[0..1] } elseif ($primaryDamaging.Count -eq 1) { @($primaryDamaging[0]) + @($primaryStatus | Select-Object -First 1) } else { $primaryStatus | Select-Object -First 2 }
    foreach ($m in $primaryCandidates) { if ($m -and -not $usedNames.ContainsKey($m.name)) { $picked += $m; $usedNames[$m.name] = $true } }

    # Pick 1 secondary move
    $secondaryCandidates = if ($secondaryDamaging.Count -ge 1) { $secondaryDamaging[0] } else { $secondaryStatus | Select-Object -First 1 }
    if ($secondaryCandidates -and -not $usedNames.ContainsKey($secondaryCandidates.name)) { $picked += $secondaryCandidates; $usedNames[$secondaryCandidates.name] = $true }

    # Fill remaining slots from primary pool
    while ($picked.Count -lt 3) {
        $remaining = $primaryPool | Where-Object { -not $usedNames.ContainsKey($_.name) } | Sort-Object { if ($_.power -eq $null) { 0 } else { -[int]$_.power } }
        if ($remaining.Count -gt 0) { $picked += $remaining[0]; $usedNames[$remaining[0].name] = $true } else { break }
    }

    return $picked
}

$baseElements = @(
    @{id="el1"; type="image"; name="Pokemon View Panel"; src="$GIT_BASE/Pokemon%20View%20Panel.png"; x=0; y=0; w=2002; h=1251; zIndex=1; tags="panel=pokemonview"},
    @{id="el15"; type="image"; name="Pokemon Stat Bar"; src="$GIT_BASE/Poke%20Dice/Pokemon%20Stat%20Bar.png"; x=617; y=324; w=549; h=435; zIndex=11; tags="pokemon=statbar"},
    @{id="el16"; type="image"; name="Specialty"; src="$GIT_BASE/Poke%20Dice/Specialty.png"; x=391; y=591; w=788; h=303; zIndex=12; tags="uibar=specialty"},
    @{id="el17"; type="image"; name="Starting Dice"; src="$GIT_BASE/Poke%20Dice/Starting%20Dice.png"; x=942; y=220; w=427; h=342; zIndex=13; tags="uibar-startingdice"}
)

Write-Host "Generating templates for Pokemon $StartId-$EndId..."

foreach ($p in $pokemon) {
    $pokeId = $p.id
    $pname = $p.name
    $stage = $p.stage
    $t1 = $p.type1
    $t2 = if ($p.type2) { $p.type2 } else { $null }
    $s1key = $p.stat1_display
    $s2key = $p.stat2_display

    switch ($stage) {
        1 { $t1val = 2; $t2val = 1; $s1val = 2; $s2val = 1 }
        2 { $t1val = 4; $t2val = 3; $s1val = 4; $s2val = 3 }
        3 { $t1val = 6; $t2val = 5; $s1val = 6; $s2val = 5 }
    }

    $t1cap = $typeKeyMap[$t1]
    $t2cap = if ($t2) { $typeKeyMap[$t2] } else { $t1cap }

    $pickedMoves = Pick-Moves $t1 $t2 $stage

    $elements = @()
    $elements += $baseElements

    $slotName = "$("{0:d3}" -f $pokeId)_$pname"
    $elements += @{id="el2"; type="image"; name=$slotName; src="$GIT_BASE/Pokemon%20Assets/Brown%20Slot%20Images/$slotName.png"; x=610; y=411; w=188; h=286; zIndex=2; tags="button=pokemon"}

    $elements += @{id="el3"; type="image"; name=$t1cap; src="$GIT_BASE/Poke%20Dice/Types/$t1cap.png"; x=992; y=405; w=220; h=205; zIndex=3; tags="dievalue=$t1"}
    $elements += @{id="el4"; type="image"; name=$t2cap; src="$GIT_BASE/Poke%20Dice/Types/$t2cap.png"; x=1108; y=405; w=220; h=205; zIndex=4; tags="dievalue=$t2"}

    $elements += @{id="el5"; type="image"; name=$s1key; src="$GIT_BASE/Poke%20Dice/Stats/$s1key.png"; x=992; y=525; w=220; h=205; zIndex=5; tags="dievalue=$($s1key.ToLower())"}
    $elements += @{id="el6"; type="image"; name=$s2key; src="$GIT_BASE/Poke%20Dice/Stats/$s2key.png"; x=1108; y=525; w=220; h=205; zIndex=6; tags="dievalue=$($s2key.ToLower())"}

    $elements += @{id="el7"; type="text"; name="Die Amount"; text="$t1val"; font="Georgia"; size=30; bold=$false; italic=$false; color="#8B4513"; align="left"; x=1089; y=423; w=42; h=59; zIndex=7; tags="primarytype=dieamount"}
    $elements += @{id="el8"; type="text"; name="Die Amount"; text="$t2val"; font="Georgia"; size=30; bold=$false; italic=$false; color="#8B4513"; align="left"; x=1203; y=423; w=48; h=46; zIndex=8; tags="secondarytype=dieamount"}
    $elements += @{id="el9"; type="text"; name="Die Amount"; text="$s1val"; font="Georgia"; size=30; bold=$false; italic=$false; color="#8B4513"; align="left"; x=1089; y=543; w=48; h=47; zIndex=9; tags="stat1=dieamount"}
    $elements += @{id="el10"; type="text"; name="Die Amount"; text="$s2val"; font="Georgia"; size=30; bold=$false; italic=$false; color="#8B4513"; align="left"; x=1203; y=543; w=46; h=48; zIndex=10; tags="stat2=dieamount"}

    $moveY = @(620, 716, 814)
    for ($i = 0; $i -lt 3; $i++) {
        $mi = $i + 18
        if ($i -lt $pickedMoves.Count) {
            $m = $pickedMoves[$i]
            $mtype = $m.type
            $mname = $m.name
            $mx = if ($i -eq 1) { 998 } else { 996 }
            $elements += @{id="el$mi"; type="image"; name=$mname; src="$GIT_BASE/Poke%20Moves/$mtype/$([System.Uri]::EscapeDataString($mname)).png"; x=$mx; y=$moveY[$i]; w=352; h=222; zIndex=$mi; tags="movetemplate=$($mname.ToLower().Replace(' ','_'))"}
        }
    }

    $template = @{
        elements = $elements
        nextId = 22
        canvasW = "1920"
        canvasH = "1080"
        _timestamp = (Get-Date -Format "yyyy-MM-ddTHH:mm:ss.fffZ")
        _version = "2.0"
    }

    $json = $template | ConvertTo-Json -Depth 5
    $outFile = "$OutputDir\$("{0:d3}" -f $pokeId)_$pname.json"
    $json | Set-Content $outFile -Encoding UTF8
    Write-Host "  $("{0:d3}" -f $pokeId) $pname (stage=$stage, dice=$t1cap$t1val/$t2cap$t2val, moves=$($pickedMoves[0].name),$($pickedMoves[1].name),$($pickedMoves[2].name))"
}

Write-Host "All templates saved to $OutputDir"
