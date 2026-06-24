param([string]$Type = "all")

$GIT_BASE = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master"

$FIRE_MOVES = @(
    @{ name="Ember";        desc="A weak fire that may burn the foe.";                  cost="SP.ATK" }
    @{ name="Flamethrower"; desc="A powerful flame that may burn the target.";           cost="SP.ATK" }
    @{ name="Fire Blast";   desc="A huge fireball that may burn the target.";            cost="SP.ATK" }
    @{ name="Heat Wave";    desc="A hot wind that may burn the target.";                 cost="SP.ATK" }
    @{ name="Overheat";     desc="A powerful attack that lowers Sp.Atk.";                cost="SP.ATK" }
    @{ name="Inferno";      desc="A massive fire that always burns the target.";         cost="SP.ATK" }
    @{ name="Mystical Fire";desc="A special flame that lowers the foe's Sp.Atk.";        cost="SP.ATK" }
    @{ name="Incinerate";   desc="A fire that destroys the target's held item.";         cost="SP.ATK" }
    @{ name="Lava Plume";   desc="A plume of fire that may burn the target.";            cost="SP.ATK" }
    @{ name="Fire Spin";    desc="Traps the target in a ring of fire for 4-5 turns.";    cost="SP.ATK" }
    @{ name="Fire Pledge";  desc="A fire column that combos with Grass/Water Pledge.";   cost="SP.ATK" }
    @{ name="Fire Fang";    desc="A fiery bite that may burn or flinch the target.";     cost="ATK" }
    @{ name="Fire Lash";    desc="A fiery lash that lowers the target's Defense.";       cost="ATK" }
    @{ name="Flare Blitz";  desc="A reckless charge that damages the user too.";         cost="ATK" }
    @{ name="Flame Charge"; desc="A fiery charge that raises the user's Speed.";         cost="ATK" }
    @{ name="Blaze Kick";   desc="A fiery kick that may burn the target.";               cost="ATK" }
    @{ name="Fire Punch";   desc="A fiery fist punch that may burn the target.";         cost="ATK" }
    @{ name="Flame Wheel";  desc="A wheel of fire that may burn the target.";            cost="ATK" }
    @{ name="Flame Burst";  desc="Attacks the target with a burst of flame.";            cost="SP.ATK" }
)

$NORMAL_MOVES = @(
    @{ name="Tackle";       desc="A basic tackle to hit the target.";                    cost="ATK" }
    @{ name="Body Slam";    desc="A slam that may paralyze the target.";                 cost="ATK" }
    @{ name="Slash";        desc="A sharp slash with a high crit rate.";                 cost="ATK" }
    @{ name="Headbutt";     desc="A headbutt that may flinch the target.";               cost="ATK" }
    @{ name="Take Down";    desc="A reckless charge that damages the user.";             cost="ATK" }
    @{ name="Double-Edge";  desc="A life-risking tackle that hurts the user.";           cost="ATK" }
    @{ name="Mega Kick";    desc="An extremely powerful kick with immense force.";       cost="ATK" }
    @{ name="Mega Punch";   desc="An extremely powerful punch with immense force.";      cost="ATK" }
    @{ name="Pound";        desc="A basic pound using the user's body part.";            cost="ATK" }
    @{ name="Strength";     desc="A powerful body slam to crush the target.";            cost="ATK" }
    @{ name="Facade";       desc="Doubles power when the user is poisoned/burned/paralyzed."; cost="ATK" }
    @{ name="Giga Impact";  desc="A powerful charge that leaves the user immobile.";     cost="ATK" }
    @{ name="Extreme Speed";desc="A lightning-fast move that strikes first.";             cost="ATK" }
    @{ name="Hyper Fang";   desc="A sharp fang attack that may flinch.";                 cost="ATK" }
    @{ name="Rage";         desc="Raises the user's Attack stat when hit.";              cost="ATK" }
    @{ name="Scratch";      desc="Scratches the target with sharp claws.";               cost="ATK" }
    @{ name="Quick Attack"; desc="A fast attack that always strikes first.";             cost="ATK" }
    @{ name="Hyper Beam";   desc="A devastating beam that leaves the user immobile.";    cost="SP.ATK" }
    @{ name="Swift";        desc="Star-shaped rays that never miss the target.";         cost="SP.ATK" }
    @{ name="Hyper Voice";  desc="A loud shout that damages all nearby foes.";           cost="SP.ATK" }
    @{ name="Boomburst";    desc="A deafening boom that damages all nearby.";            cost="SP.ATK" }
    @{ name="Tri Attack";   desc="Fires three beams that may paralyze/burn/freeze.";     cost="SP.ATK" }
    @{ name="Uproar";       desc="A loud rampage that prevents sleep for all.";          cost="SP.ATK" }
)

$GIT_BASE = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master"

function New-MoveJson {
    param($Move, $MoveType)

    $bgName = if ($MoveType -eq "Fire") { "Fire Moves" } else { "Normal Moves" }
    $bgFile = if ($MoveType -eq "Fire") { "Fire%20Moves.png" } else { "Nomal%20Moves.png" }
    $costName = "$($Move.cost) (Dice)"
    $costFile = "Poke%20Dice/Stats/$($Move.cost).png"
    $folder = if ($MoveType -eq "Fire") { "Fire" } else { "Normal" }
    $safeName = $Move.name -replace "[^\w\- ]", ""
    $jsonFile = "Poke Moves/$folder/$safeName.json"
    $xIcon = if ($Move.cost -eq "ATK") { 173 } else { 172 }

    $json = @{
        canvasW = 265
        canvasH = 165
        elements = @(
            @{
                id = "bg"
                type = "image"
                name = $bgName
                src = "$GIT_BASE/Poke%20Dice/$bgFile"
                x = 0; y = 0; w = 265; h = 165; zIndex = 1
            }
            @{
                id = "name"
                type = "text"
                text = $Move.name
                font = "Georgia"; size = 12; bold = $true; italic = $false
                color = "#ffffff"; align = "left"
                x = 44; y = 40; w = 165; h = 43; zIndex = 2
            }
            @{
                id = "desc"
                type = "text"
                text = $Move.desc
                font = "Georgia"; size = 11; bold = $false; italic = $false
                color = "#5C3A1E"; align = "left"
                x = 44; y = 69; w = 180; h = 38; zIndex = 3
            }
            @{
                id = "cost"
                type = "image"
                name = $costName
                src = "$GIT_BASE/$costFile"
                x = $xIcon; y = 38; w = 83; h = 50; zIndex = 4
            }
        )
    }

    $json | ConvertTo-Json -Depth 5 | Set-Content -Path $jsonFile -Encoding UTF8
    Write-Host "Wrote $jsonFile"
    return $jsonFile
}

$moves = @()
if ($Type -eq "Fire" -or $Type -eq "all") {
    $moves += $FIRE_MOVES | ForEach-Object { @{ move=$_; type="Fire" } }
}
if ($Type -eq "Normal" -or $Type -eq "all") {
    $moves += $NORMAL_MOVES | ForEach-Object { @{ move=$_; type="Normal" } }
}

$jsonFiles = @()
foreach ($item in $moves) {
    $jsonFiles += New-MoveJson -Move $item.move -MoveType $item.type
}

Write-Host "`nGenerated $($jsonFiles.Count) JSON files. Run render_move_template.ps1 for each to produce PNGs."
return $jsonFiles
