param([string]$Type = "all")

$GIT_BASE = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master"

$NORMAL_MOVES = @(
    @{ name="Acupressure";     desc="Sharply raises a random stat.";                                cat="Status" }
    @{ name="After You";       desc="Gives the target priority in the next turn.";                  cat="Status" }
    @{ name="Assist";          desc="Randomly uses a known ally move.";                              cat="Status" }
    @{ name="Attract";         desc="Opposite gender may be unable to attack.";                      cat="Status" }
    @{ name="Barrage";         desc="Hits 2-5 times with round objects.";                            cat="Physical" }
    @{ name="Baton Pass";      desc="Switches out and passes stat changes.";                         cat="Status" }
    @{ name="Belly Drum";      desc="Reduces HP to max Attack.";                                     cat="Status" }
    @{ name="Bestow";          desc="Gives the user's held item to the target.";                     cat="Status" }
    @{ name="Bide";            desc="Waits 2 turns then strikes back double.";                       cat="Physical" }
    @{ name="Bind";            desc="Traps and damages the target for 4-5 turns.";                   cat="Physical" }
    @{ name="Block";           desc="Prevents the target from fleeing or switching.";                cat="Status" }
    @{ name="Blood Moon";      desc="A devastating attack that cannot be used twice in a row.";      cat="Special" }
    @{ name="Body Slam";       desc="A slam that may paralyze the target.";                          cat="Physical" }
    @{ name="Boomburst";       desc="A deafening boom that damages all nearby.";                     cat="Special" }
    @{ name="Camouflage";      desc="Changes the user's type to match the terrain.";                 cat="Status" }
    @{ name="Captivate";       desc="Sharply lowers Sp.Atk if opposite gender.";                     cat="Status" }
    @{ name="Celebrate";       desc="A celebration that has no battle effect.";                      cat="Status" }
    @{ name="Chip Away";       desc="Ignores the target's stat changes.";                            cat="Physical" }
    @{ name="Comet Punch";     desc="A rapid flurry of punches.";                                    cat="Physical" }
    @{ name="Confide";         desc="Lowers the target's Sp.Atk.";                                   cat="Status" }
    @{ name="Constrict";       desc="A squeezing attack that may lower Speed.";                      cat="Physical" }
    @{ name="Conversion";      desc="Changes type to match the first move.";                         cat="Status" }
    @{ name="Conversion 2";    desc="Changes type to resist the opponent's last move.";             cat="Status" }
    @{ name="Copycat";         desc="Mimics the last move used.";                                    cat="Status" }
    @{ name="Court Change";    desc="Swaps the effects on both sides of the field.";                 cat="Status" }
    @{ name="Covet";           desc="A cute attack that steals the target's item.";                  cat="Physical" }
    @{ name="Crush Claw";      desc="A sharp claw that may lower Defense.";                          cat="Physical" }
    @{ name="Crush Grip";      desc="A crushing grip stronger at higher HP.";                        cat="Physical" }
    @{ name="Cut";             desc="A basic cut using sharp claws or blades.";                      cat="Physical" }
    @{ name="Defense Curl";    desc="Raises the user's Defense stat.";                               cat="Status" }
    @{ name="Disable";         desc="Disables the opponent's last used move.";                       cat="Status" }
    @{ name="Dizzy Punch";     desc="A punch that may confuse the target.";                          cat="Physical" }
    @{ name="Doodle";          desc="Changes abilities of the user and allies to match the target."; cat="Status" }
    @{ name="Double Hit";      desc="A two-strike attack that hits twice.";                          cat="Physical" }
    @{ name="Double Slap";     desc="A rapid slap that hits 2-5 times.";                            cat="Physical" }
    @{ name="Double Team";     desc="Raises the user's evasiveness.";                                cat="Status" }
    @{ name="Double-Edge";     desc="A life-risking tackle that hurts the user.";                    cat="Physical" }
    @{ name="Echoed Voice";    desc="A voice attack that grows each turn.";                          cat="Special" }
    @{ name="Egg Bomb";        desc="A large egg bomb thrown at the target.";                        cat="Physical" }
    @{ name="Encore";          desc="Forces the target to repeat its last move.";                    cat="Status" }
    @{ name="Endeavor";        desc="Reduces HP to match the target's HP.";                          cat="Physical" }
    @{ name="Endure";          desc="Always leaves at least 1 HP.";                                  cat="Status" }
    @{ name="Entrainment";     desc="Makes the target's Ability match the user's.";                  cat="Status" }
    @{ name="Explosion";       desc="A massive explosion that faints the user.";                     cat="Physical" }
    @{ name="Extreme Speed";   desc="A lightning-fast move that strikes first.";                     cat="Physical" }
    @{ name="Facade";          desc="Doubles power when the user has a status condition.";           cat="Physical" }
    @{ name="Fake Out";        desc="A first-turn flinch that always goes first.";                   cat="Physical" }
    @{ name="False Swipe";     desc="Leaves the target with at least 1 HP.";                        cat="Physical" }
    @{ name="Feint";           desc="Hits a protecting target and breaks the protection.";           cat="Physical" }
    @{ name="Fillet Away";     desc="Lowers HP but sharply boosts offenses and Speed.";              cat="Status" }
    @{ name="Flail";           desc="A desperate attack stronger at low HP.";                        cat="Physical" }
    @{ name="Flash";           desc="Lowers the target's accuracy.";                                 cat="Status" }
    @{ name="Focus Energy";    desc="Increases the critical hit ratio.";                             cat="Status" }
    @{ name="Follow Me";       desc="Draws all attacks to the user in double battles.";              cat="Status" }
    @{ name="Foresight";       desc="Allows Normal and Fighting moves to hit Ghost types.";          cat="Status" }
    @{ name="Frustration";     desc="A strong attack based on low friendship.";                      cat="Physical" }
    @{ name="Fury Attack";     desc="A furious jab that hits 2-5 times.";                           cat="Physical" }
    @{ name="Fury Swipes";     desc="A rapid scratch that hits 2-5 times.";                         cat="Physical" }
    @{ name="Giga Impact";     desc="A powerful charge that leaves the user immobile.";              cat="Physical" }
    @{ name="Glare";           desc="Paralyzes the target with a fearsome glare.";                   cat="Status" }
    @{ name="Growl";           desc="Lowers the target's Attack stat.";                              cat="Status" }
    @{ name="Growth";          desc="Raises the user's Attack and Sp.Atk.";                          cat="Status" }
    @{ name="Guillotine";      desc="A powerful pincer that can knock out in one hit.";              cat="Physical" }
    @{ name="Happy Hour";      desc="Doubles prize money after battle.";                             cat="Status" }
    @{ name="Harden";          desc="Raises the user's Defense stat.";                               cat="Status" }
    @{ name="Head Charge";     desc="A painful headbutt that damages the user.";                     cat="Physical" }
    @{ name="Headbutt";        desc="A headbutt that may flinch the target.";                        cat="Physical" }
    @{ name="Heal Bell";       desc="Cures all status conditions in the user's party.";              cat="Status" }
    @{ name="Helping Hand";    desc="Boosts an ally's attack power.";                                cat="Status" }
    @{ name="Hidden Power";    desc="A unique attack whose type varies by Pokemon.";                 cat="Special" }
    @{ name="Hold Back";       desc="Leaves the target with at least 1 HP.";                         cat="Physical" }
    @{ name="Hold Hands";      desc="A friendly handhold with no battle effect.";                    cat="Status" }
    @{ name="Horn Attack";     desc="An attack using a horn to jab the target.";                     cat="Physical" }
    @{ name="Horn Drill";      desc="A drilling horn that can knock out in one hit.";                cat="Physical" }
    @{ name="Howl";            desc="Raises the user's Attack stat.";                                cat="Status" }
    @{ name="Hyper Beam";      desc="A devastating beam that leaves the user immobile.";             cat="Special" }
    @{ name="Hyper Drill";     desc="A powerful drill that breaks through protection.";              cat="Physical" }
    @{ name="Hyper Fang";      desc="A sharp fang attack that may flinch.";                          cat="Physical" }
    @{ name="Hyper Voice";     desc="A loud shout that damages all nearby foes.";                    cat="Special" }
    @{ name="Judgment";        desc="A powerful attack by the creator of all.";                      cat="Special" }
    @{ name="Laser Focus";     desc="Guarantees a critical hit on the next attack.";                 cat="Status" }
    @{ name="Last Resort";     desc="A strong attack only usable after all other moves.";            cat="Physical" }
    @{ name="Leer";            desc="Lowers the target's Defense stat.";                             cat="Status" }
    @{ name="Lock-On";         desc="Guarantees the next move will hit.";                            cat="Status" }
    @{ name="Lovely Kiss";     desc="Puts the target to sleep with a kiss.";                         cat="Status" }
    @{ name="Lucky Chant";     desc="Prevents the target from landing critical hits.";               cat="Status" }
    @{ name="Me First";        desc="Uses the target's move against it with more power.";            cat="Status" }
    @{ name="Mean Look";       desc="Prevents the target from fleeing or switching.";                cat="Status" }
    @{ name="Mega Kick";       desc="An extremely powerful kick with immense force.";                cat="Physical" }
    @{ name="Mega Punch";      desc="An extremely powerful punch with immense force.";               cat="Physical" }
    @{ name="Metronome";       desc="Randomly uses almost any move in the game.";                    cat="Status" }
    @{ name="Milk Drink";      desc="Heals the user by half of its max HP.";                         cat="Status" }
    @{ name="Mimic";           desc="Copies the target's last move for the battle.";                 cat="Status" }
    @{ name="Mind Reader";     desc="Guarantees the next move will hit the target.";                 cat="Status" }
    @{ name="Minimize";        desc="Raises the user's evasiveness dramatically.";                   cat="Status" }
    @{ name="Morning Sun";     desc="Heals the user based on the weather.";                          cat="Status" }
    @{ name="Multi-Attack";    desc="Changes type to match the held memory disc.";                   cat="Physical" }
    @{ name="Natural Gift";    desc="A berry-powered attack that varies by held berry.";             cat="Physical" }
    @{ name="Nature Power";    desc="Uses a terrain-dependent move.";                                cat="Status" }
    @{ name="Noble Roar";      desc="Lowers the target's Attack and Sp.Atk.";                        cat="Status" }
    @{ name="Odor Sleuth";     desc="Allows Normal and Fighting moves to hit Ghost types.";          cat="Status" }
    @{ name="Pain Split";      desc="Averages the HP of the user and target.";                       cat="Status" }
    @{ name="Pay Day";         desc="An attack that scatters coins on the ground.";                  cat="Physical" }
    @{ name="Perish Song";     desc="All active Pokemon faint after three turns.";                   cat="Status" }
    @{ name="Play Nice";       desc="Lowers the target's Attack and makes it less angry.";           cat="Status" }
    @{ name="Population Bomb"; desc="A swarm attack that hits up to 10 times.";                      cat="Physical" }
    @{ name="Pound";           desc="A basic pound using the user's body part.";                     cat="Physical" }
    @{ name="Power Shift";     desc="Swaps the user's Attack and Defense stats.";                    cat="Status" }
    @{ name="Present";         desc="A gift that may heal the target instead.";                      cat="Physical" }
    @{ name="Protect";         desc="Protects the user from all attacks that turn.";                 cat="Status" }
    @{ name="Psych Up";        desc="Copies the target's stat changes.";                             cat="Status" }
    @{ name="Quick Attack";    desc="A fast attack that always strikes first.";                      cat="Physical" }
    @{ name="Rage";            desc="Raises the user's Attack stat when hit.";                       cat="Physical" }
    @{ name="Raging Bull";     desc="A charge that breaks Reflect and Light Screen.";                cat="Physical" }
    @{ name="Rapid Spin";      desc="A spin that frees the user from binds.";                        cat="Physical" }
    @{ name="Razor Wind";      desc="A cutting wind that strikes on the second turn.";               cat="Special" }
    @{ name="Recover";         desc="Heals the user by half of its max HP.";                         cat="Status" }
    @{ name="Recycle";         desc="Restores the user's consumed held item.";                       cat="Status" }
    @{ name="Reflect Type";    desc="Changes the user's type to match the target's.";                cat="Status" }
    @{ name="Refresh";         desc="Cures poison, burn, and paralysis.";                            cat="Status" }
    @{ name="Relic Song";      desc="A song that may put the target to sleep.";                      cat="Special" }
    @{ name="Retaliate";       desc="Doubles power after a teammate faints.";                        cat="Physical" }
    @{ name="Return";          desc="A strong attack based on high friendship.";                     cat="Physical" }
    @{ name="Revelation Dance";desc="An attack whose type matches the user's primary type.";         cat="Special" }
    @{ name="Revival Blessing";desc="Revives a fainted ally with some HP.";                          cat="Status" }
    @{ name="Roar";            desc="Forces the target to switch out.";                              cat="Status" }
    @{ name="Rock Climb";      desc="A climbing attack that may confuse the target.";                cat="Physical" }
    @{ name="Round";           desc="A song that increases power with allies.";                      cat="Special" }
    @{ name="Safeguard";       desc="Protects the user's party from status conditions.";             cat="Status" }
    @{ name="Scary Face";      desc="Sharply lowers the target's Speed.";                            cat="Status" }
    @{ name="Scratch";         desc="Scratches the target with sharp claws.";                        cat="Physical" }
    @{ name="Screech";         desc="Sharply lowers the target's Defense.";                          cat="Status" }
    @{ name="Secret Power";    desc="An attack with effects based on the terrain.";                  cat="Physical" }
    @{ name="Self-Destruct";   desc="A massive explosion that faints the user.";                     cat="Physical" }
    @{ name="Sharpen";         desc="Raises the user's Attack stat.";                                cat="Status" }
    @{ name="Shed Tail";       desc="Creates a substitute and switches out.";                        cat="Status" }
    @{ name="Shell Smash";     desc="Lowers defenses but sharply boosts offenses and Speed.";        cat="Status" }
    @{ name="Simple Beam";     desc="Changes the target's Ability to Simple.";                       cat="Status" }
    @{ name="Sing";            desc="Puts the target to sleep with a soothing song.";                cat="Status" }
    @{ name="Sketch";          desc="Permanently copies the target's last move.";                    cat="Status" }
    @{ name="Skull Bash";      desc="Tucks in and charges on the first turn.";                       cat="Physical" }
    @{ name="Slack Off";       desc="Heals the user by half of its max HP.";                         cat="Status" }
    @{ name="Slam";            desc="A powerful slam using a long body part.";                       cat="Physical" }
    @{ name="Slash";           desc="A sharp slash with a high crit rate.";                          cat="Physical" }
    @{ name="Sleep Talk";      desc="Uses a random known move while asleep.";                        cat="Status" }
    @{ name="Smelling Salts";  desc="An attack that powers up on paralyzed targets.";               cat="Physical" }
    @{ name="Smokescreen";     desc="Lowers the target's accuracy.";                                 cat="Status" }
    @{ name="Snore";           desc="A loud snore attack usable while asleep.";                      cat="Special" }
    @{ name="Soft-Boiled";     desc="Heals the user by half of its max HP.";                         cat="Status" }
    @{ name="Sonic Boom";      desc="Always inflicts 20 HP of damage.";                              cat="Special" }
    @{ name="Spike Cannon";    desc="Fires spikes that hit 2-5 times.";                             cat="Physical" }
    @{ name="Spit Up";         desc="A powerful shot stronger after Stockpile.";                     cat="Special" }
    @{ name="Splash";          desc="A harmless splash with no effect.";                             cat="Status" }
    @{ name="Spotlight";       desc="Draws attention to the target in double battles.";              cat="Status" }
    @{ name="Stockpile";       desc="Stores energy to boost Defense and Sp.Def.";                    cat="Status" }
    @{ name="Stomp";           desc="A heavy stomp that may flinch the target.";                     cat="Physical" }
    @{ name="Strength";        desc="A powerful body slam to crush the target.";                     cat="Physical" }
    @{ name="Struggle";        desc="A desperate last-resort attack.";                                cat="Physical" }
    @{ name="Stuff Cheeks";    desc="Eats a berry and sharply raises Defense.";                      cat="Status" }
    @{ name="Substitute";      desc="Creates a decoy using a quarter of max HP.";                    cat="Status" }
    @{ name="Super Fang";      desc="A fang attack that cuts HP in half.";                           cat="Physical" }
    @{ name="Supersonic";      desc="Confuses the target with sound waves.";                          cat="Status" }
    @{ name="Swagger";         desc="Confuses the target but sharply raises its Attack.";             cat="Status" }
    @{ name="Swallow";         desc="Restores HP based on Stockpile charges.";                       cat="Status" }
    @{ name="Sweet Scent";     desc="Lowers the target's evasiveness.";                              cat="Status" }
    @{ name="Swift";           desc="Star-shaped rays that never miss the target.";                  cat="Special" }
    @{ name="Swords Dance";    desc="Sharply raises the user's Attack stat.";                        cat="Status" }
    @{ name="Tackle";          desc="A basic tackle to hit the target.";                             cat="Physical" }
    @{ name="Tail Slap";       desc="A tail slap that hits 2-5 times.";                             cat="Physical" }
    @{ name="Tail Whip";       desc="Lowers the target's Defense stat.";                             cat="Status" }
    @{ name="Take Down";       desc="A reckless charge that damages the user.";                      cat="Physical" }
    @{ name="Tearful Look";    desc="Lowers the target's Attack and Sp.Atk.";                        cat="Status" }
    @{ name="Teatime";         desc="All active Pokemon eat their held berries.";                    cat="Status" }
    @{ name="Techno Blast";    desc="A beam attack that changes type with a drive.";                 cat="Special" }
    @{ name="Teeter Dance";    desc="A dance that confuses all Pokemon around.";                     cat="Status" }
    @{ name="Tera Blast";      desc="A blast that changes type when Terastallized.";                 cat="Special" }
    @{ name="Tera Starstorm";  desc="A stellar blast that hits all foes when Terastallized.";        cat="Special" }
    @{ name="Terrain Pulse";   desc="A beam boosted by the current terrain.";                        cat="Special" }
    @{ name="Thrash";          desc="A rampage that confuses the user.";                             cat="Physical" }
    @{ name="Tickle";          desc="Lowers the target's Attack and Defense.";                       cat="Status" }
    @{ name="Tidy Up";         desc="Clears hazards and boosts Attack and Speed.";                   cat="Status" }
    @{ name="Transform";       desc="Copies the target's appearance, stats, and moves.";             cat="Status" }
    @{ name="Tri Attack";      desc="Fires three beams that may paralyze, burn, or freeze.";         cat="Special" }
    @{ name="Trump Card";      desc="A stronger attack the fewer PP remain.";                        cat="Special" }
    @{ name="Uproar";          desc="A loud rampage that prevents sleep for all.";                   cat="Special" }
    @{ name="Vise Grip";       desc="A powerful grip that squeezes the target.";                     cat="Physical" }
    @{ name="Weather Ball";    desc="A ball that changes type and power with the weather.";          cat="Special" }
    @{ name="Whirlwind";       desc="Forces the target to switch out.";                              cat="Status" }
    @{ name="Wish";            desc="Heals the user's replacement at the end of the turn.";          cat="Status" }
    @{ name="Work Up";         desc="Raises the user's Attack and Sp.Atk.";                          cat="Status" }
    @{ name="Wrap";            desc="A wrapping attack that traps the target.";                      cat="Physical" }
    @{ name="Wring Out";       desc="A powerful squeeze stronger at higher HP.";                     cat="Special" }
    @{ name="Yawn";            desc="Puts the target to sleep next turn.";                           cat="Status" }
)

function New-MoveJson {
    param($Move, $MoveType)
    $safeName = $Move.name -replace "[^\w\- ]", ""
    $folder = "Normal"
    $jsonFile = "Poke Moves/$folder/$safeName.json"
    $cost = $null
    if ($Move.cat -eq "Physical") { $cost = "ATK" }
    elseif ($Move.cat -eq "Special") { $cost = "SP.ATK" }

    $elements = @(
        @{
            id = "bg"; type = "image"
            name = "Normal Moves"
            src = "$GIT_BASE/Poke%20Dice/Nomal%20Moves.png"
            x = 0; y = 0; w = 265; h = 165; zIndex = 1
        }
        @{
            id = "name"; type = "text"
            text = $Move.name
            font = "Georgia"; size = 12; bold = $true; italic = $false
            color = "#ffffff"; align = "left"
            x = 44; y = 40; w = 165; h = 43; zIndex = 2
        }
        @{
            id = "desc"; type = "text"
            text = $Move.desc
            font = "Georgia"; size = 11; bold = $false; italic = $false
            color = "#5C3A1E"; align = "left"
            x = 44; y = 69; w = 180; h = 38; zIndex = 3
        }
    )

    if ($cost) {
        $xIcon = if ($cost -eq "ATK") { 173 } else { 172 }
        $elements += @{
            id = "cost"; type = "image"
            name = "$cost (Dice)"
            src = "$GIT_BASE/Poke%20Dice/Stats/$cost.png"
            x = $xIcon; y = 38; w = 83; h = 50; zIndex = 4
        }
    }

    $json = @{ canvasW = 265; canvasH = 165; elements = $elements }
    $json | ConvertTo-Json -Depth 5 | Set-Content -Path $jsonFile -Encoding UTF8
    Write-Host "Wrote $jsonFile"
    return $jsonFile
}

$jsonFiles = @()
foreach ($item in $NORMAL_MOVES) {
    $jsonFiles += New-MoveJson -Move $item -MoveType "Normal"
}

Write-Host "`nGenerated $($jsonFiles.Count) JSON files. Run render_move_template.ps1 for each to produce PNGs."
return $jsonFiles
