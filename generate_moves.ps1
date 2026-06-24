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
    $folder = $MoveType
    $jsonFile = "Poke Moves/$folder/$safeName.json"
    $cost = $null
    if ($Move.cat -eq "Physical") { $cost = "ATK" }
    elseif ($Move.cat -eq "Special") { $cost = "SP.ATK" }

    $bgFile = if ($MoveType -eq "Normal") { "Nomal%20Moves.png" } else { "$([uri]::EscapeDataString("$MoveType Moves.png"))" }
    $bgSrc = "$GIT_BASE/Poke%20Dice/$bgFile"

    $elements = @(
        @{
            id = "bg"; type = "image"
            name = "$MoveType Moves"
            src = $bgSrc
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

$FIRE_MOVES = @(
    @{ name="Armor Cannon";     desc="Fires armor as blazing projectiles, lowering Defense and Sp.Def.";         cat="Special" }
    @{ name="Bitter Blade";     desc="A bitter slash that restores HP from damage dealt.";                       cat="Physical" }
    @{ name="Blast Burn";       desc="A massive fiery explosion that leaves the user immobile.";                  cat="Special" }
    @{ name="Blaze Kick";       desc="A fiery kick with a high crit rate that may burn.";                         cat="Physical" }
    @{ name="Blazing Torque";   desc="A blazing attack that may burn the target.";                                cat="Physical" }
    @{ name="Blue Flare";       desc="A powerful blue flame attack that may burn.";                               cat="Special" }
    @{ name="Burn Up";          desc="A massive fire attack that removes the user's Fire type.";                  cat="Special" }
    @{ name="Burning Bulwark";  desc="Protects the user and burns attackers on contact.";                         cat="Status" }
    @{ name="Burning Jealousy"; desc="Burns opponents who had a stat raised that turn.";                          cat="Special" }
    @{ name="Ember";            desc="A small flame that may burn the target.";                                   cat="Special" }
    @{ name="Eruption";         desc="A massive eruption stronger when the user has more HP.";                    cat="Special" }
    @{ name="Fiery Dance";      desc="A fiery dance that may raise the user's Sp.Atk.";                           cat="Special" }
    @{ name="Fire Blast";       desc="An intense blast of fire that may burn.";                                   cat="Special" }
    @{ name="Fire Fang";        desc="A fiery fang that may burn or flinch.";                                     cat="Physical" }
    @{ name="Fire Lash";        desc="A fiery lash that lowers the target's Defense.";                            cat="Physical" }
    @{ name="Fire Pledge";      desc="A fire pledge that combines with other pledges.";                           cat="Special" }
    @{ name="Fire Punch";       desc="A fiery punch that may burn the target.";                                   cat="Physical" }
    @{ name="Fire Spin";        desc="A vortex of fire that traps the target for 4-5 turns.";                     cat="Special" }
    @{ name="Flame Burst";      desc="A bursting flame that damages nearby Pokemon.";                             cat="Special" }
    @{ name="Flame Charge";     desc="A flaming charge that raises the user's Speed.";                            cat="Physical" }
    @{ name="Flame Wheel";      desc="A wheel of fire that may burn and thaws the user.";                         cat="Physical" }
    @{ name="Flamethrower";     desc="A steady stream of fire that may burn the target.";                          cat="Special" }
    @{ name="Flare Blitz";      desc="A reckless charge that deals heavy recoil damage.";                          cat="Physical" }
    @{ name="Fusion Flare";     desc="A fusion flame that doubles power after Fusion Bolt.";                      cat="Special" }
    @{ name="Heat Crash";       desc="A heavy body slam stronger when the user is heavier.";                      cat="Physical" }
    @{ name="Heat Wave";        desc="A wave of heat that may burn the target.";                                  cat="Special" }
    @{ name="Incinerate";       desc="A fire attack that destroys the target's held berry.";                      cat="Special" }
    @{ name="Inferno";          desc="An intense flame that always burns the target.";                             cat="Special" }
    @{ name="Lava Plume";       desc="A plume of lava that may burn the target.";                                 cat="Special" }
    @{ name="Magma Storm";      desc="A vortex of magma that traps the target for 4-5 turns.";                    cat="Special" }
    @{ name="Mind Blown";       desc="A head explosion that deals heavy recoil damage.";                           cat="Special" }
    @{ name="Mystical Fire";    desc="A mystical flame that lowers the target's Sp.Atk.";                         cat="Special" }
    @{ name="Overheat";         desc="A powerful blast that sharply lowers the user's Sp.Atk.";                    cat="Special" }
    @{ name="Pyro Ball";        desc="A fireball that may burn and thaws the user.";                              cat="Physical" }
    @{ name="Raging Fury";      desc="A rampage that confuses the user afterward.";                                cat="Physical" }
    @{ name="Sacred Fire";      desc="A sacred flame that may burn the target.";                                  cat="Special" }
    @{ name="Searing Shot";     desc="A searing shot that may burn multiple targets.";                             cat="Special" }
    @{ name="Shell Trap";       desc="A trap that explodes when the user is hit physically.";                      cat="Special" }
    @{ name="Sizzly Slide";     desc="A sliding attack that always burns the target.";                             cat="Physical" }
    @{ name="Sunny Day";        desc="Intensifies sunlight for 5 turns.";                                          cat="Status" }
    @{ name="Temper Flare";     desc="A rising fury that powers up after a previous failure.";                     cat="Physical" }
    @{ name="Torch Song";       desc="A fiery tune that raises the user's Sp.Atk.";                               cat="Special" }
    @{ name="V-create";         desc="A devastating charge that lowers the user's stats.";                         cat="Physical" }
    @{ name="Will-O-Wisp";      desc="A sinister flame that burns the target.";                                   cat="Status" }
)

$PSYCHIC_MOVES = @(
    @{ name="Agility";          desc="Sharply raises the user's Speed stat.";                              cat="Status" }
    @{ name="Ally Switch";      desc="Switches positions with an ally in battle.";                          cat="Status" }
    @{ name="Amnesia";          desc="Sharply raises the user's Sp.Def stat.";                              cat="Status" }
    @{ name="Barrier";          desc="Sharply raises the user's Defense stat.";                             cat="Status" }
    @{ name="Calm Mind";        desc="Raises the user's Sp.Atk and Sp.Def.";                                cat="Status" }
    @{ name="Confusion";        desc="A weak psychic attack that may confuse.";                             cat="Special" }
    @{ name="Cosmic Power";     desc="Raises the user's Defense and Sp.Def.";                               cat="Status" }
    @{ name="Dream Eater";      desc="Eats the target's dream to restore HP.";                              cat="Special" }
    @{ name="Eerie Spell";      desc="A powerful sound that drains PP from the target.";                    cat="Special" }
    @{ name="Esper Wing";       desc="A psychic wing that raises the user's Speed.";                        cat="Special" }
    @{ name="Expanding Force";  desc="A psychic wave boosted by Psychic Terrain.";                          cat="Special" }
    @{ name="Extrasensory";     desc="A psychic attack that may flinch the target.";                        cat="Special" }
    @{ name="Freezing Glare";   desc="A psychic glare that may freeze the target.";                         cat="Special" }
    @{ name="Future Sight";     desc="A future attack that strikes the target in 2 turns.";                cat="Special" }
    @{ name="Glitzy Glow";      desc="A psychic glow that raises Sp.Def after attacking.";                  cat="Special" }
    @{ name="Gravity";          desc="Grounds all Pokemon and boosts move accuracy.";                       cat="Status" }
    @{ name="Guard Split";      desc="Averages the Defense and Sp.Def with the target.";                    cat="Status" }
    @{ name="Guard Swap";       desc="Swaps Defense and Sp.Def changes with the target.";                   cat="Status" }
    @{ name="Heal Block";       desc="Prevents the target from using healing moves.";                       cat="Status" }
    @{ name="Heal Pulse";       desc="Restores half of the target's max HP.";                               cat="Status" }
    @{ name="Healing Wish";     desc="The user faints but fully heals the replacement.";                    cat="Status" }
    @{ name="Heart Stamp";      desc="A heart-shaped stamp that may flinch.";                               cat="Physical" }
    @{ name="Heart Swap";       desc="Swaps all stat changes with the target.";                             cat="Status" }
    @{ name="Hyperspace Hole";  desc="A wormhole attack that bypasses protection.";                         cat="Special" }
    @{ name="Hypnosis";         desc="A hypnotic suggestion that puts the target to sleep.";                cat="Status" }
    @{ name="Imprison";         desc="Prevents the target from using moves the user knows.";                cat="Status" }
    @{ name="Instruct";         desc="Makes the target repeat its last move immediately.";                  cat="Status" }
    @{ name="Kinesis";          desc="A psychic distraction that lowers accuracy.";                         cat="Status" }
    @{ name="Light Screen";     desc="Halves special damage taken by the user's party.";                    cat="Status" }
    @{ name="Lumina Crash";     desc="A psychic crash that sharply lowers Sp.Def.";                         cat="Special" }
    @{ name="Lunar Blessing";   desc="Heals status and raises Defense and Sp.Def.";                         cat="Status" }
    @{ name="Lunar Dance";      desc="The user faints but fully restores the replacement.";                 cat="Status" }
    @{ name="Luster Purge";     desc="A psychic burst that may lower Sp.Def.";                              cat="Special" }
    @{ name="Magic Coat";       desc="Reflects status moves back to the user.";                             cat="Status" }
    @{ name="Magic Powder";     desc="Changes the target's type to Psychic.";                               cat="Status" }
    @{ name="Magic Room";       desc="Suppresses the effects of held items for 5 turns.";                   cat="Status" }
    @{ name="Meditate";         desc="Raises the user's Attack stat.";                                      cat="Status" }
    @{ name="Miracle Eye";      desc="Allows Psychic moves to hit Dark types.";                              cat="Status" }
    @{ name="Mirror Coat";      desc="Reflects a special attack back with double power.";                   cat="Special" }
    @{ name="Mist Ball";        desc="A mist ball that may lower Sp.Atk.";                                  cat="Special" }
    @{ name="Mystical Power";   desc="A mystical attack that raises the user's Sp.Atk.";                    cat="Special" }
    @{ name="Photon Geyser";    desc="A photon blast that uses the higher Attack stat.";                    cat="Special" }
    @{ name="Power Split";      desc="Averages the Attack and Sp.Atk with the target.";                     cat="Status" }
    @{ name="Power Swap";       desc="Swaps Attack and Sp.Atk changes with the target.";                    cat="Status" }
    @{ name="Power Trick";      desc="Swaps the user's Attack and Defense stats.";                          cat="Status" }
    @{ name="Prismatic Laser";  desc="A powerful prismatic beam that leaves the user immobile.";             cat="Special" }
    @{ name="Psybeam";          desc="A psychic beam that may confuse the target.";                          cat="Special" }
    @{ name="Psyblade";         desc="A psychic blade that powers up on Psychic Terrain.";                  cat="Physical" }
    @{ name="Psychic";          desc="A strong psychic attack that may lower Sp.Def.";                      cat="Special" }
    @{ name="Psychic Fangs";    desc="A psychic fang that breaks Light Screen and Reflect.";                cat="Physical" }
    @{ name="Psychic Noise";    desc="A psychic blast that prevents the target from healing.";               cat="Special" }
    @{ name="Psychic Terrain";  desc="A terrain that boosts Psychic moves and blocks priority.";            cat="Status" }
    @{ name="Psycho Boost";     desc="A powerful psychic blast that sharply lowers Sp.Atk.";                cat="Special" }
    @{ name="Psycho Cut";       desc="A psychic blade with a high critical hit rate.";                      cat="Physical" }
    @{ name="Psycho Shift";     desc="Shifts the user's status condition to the target.";                   cat="Status" }
    @{ name="Psyshield Bash";   desc="A shield bash that raises the user's Defense.";                       cat="Physical" }
    @{ name="Psyshock";         desc="A psychic shock that damages based on the target's Defense.";         cat="Special" }
    @{ name="Psystrike";        desc="A psychic strike that damages based on the target's Defense.";        cat="Special" }
    @{ name="Psywave";          desc="A psychic wave that deals variable damage.";                          cat="Special" }
    @{ name="Reflect";          desc="Halves physical damage taken by the user's party.";                    cat="Status" }
    @{ name="Rest";             desc="The user sleeps for 2 turns to fully heal.";                          cat="Status" }
    @{ name="Role Play";        desc="Copies the target's Ability.";                                        cat="Status" }
    @{ name="Skill Swap";       desc="Swaps Abilities with the target.";                                    cat="Status" }
    @{ name="Speed Swap";       desc="Swaps Speed stat changes with the target.";                           cat="Status" }
    @{ name="Stored Power";     desc="A psychic attack stronger with more raised stats.";                   cat="Special" }
    @{ name="Synchronoise";     desc="A psychic wave that hits targets sharing the user's type.";           cat="Special" }
    @{ name="Take Heart";       desc="Raises Sp.Atk and Sp.Def and heals status.";                          cat="Status" }
    @{ name="Telekinesis";      desc="Levitates the target for 3 turns.";                                   cat="Status" }
    @{ name="Teleport";         desc="Lets the user flee from battle.";                                     cat="Status" }
    @{ name="Trick";            desc="Swaps held items with the target.";                                   cat="Status" }
    @{ name="Trick Room";       desc="Slower Pokemon move first for 5 turns.";                              cat="Status" }
    @{ name="Twin Beam";        desc="Fires two psychic beams at the target.";                              cat="Special" }
    @{ name="Wonder Room";      desc="Swaps the Defense and Sp.Def of all Pokemon.";                        cat="Status" }
    @{ name="Zen Headbutt";     desc="A psychic headbutt that may flinch the target.";                      cat="Physical" }
)

$ELECTRIC_MOVES = @(
    @{ name="Aura Wheel";       desc="An energy wheel attack that changes type with the user's form.";             cat="Physical" }
    @{ name="Bolt Beak";        desc="A powerful beak strike that goes first when the user is faster.";            cat="Physical" }
    @{ name="Bolt Strike";      desc="A powerful lightning strike that may paralyze.";                              cat="Physical" }
    @{ name="Buzzy Buzz";       desc="A buzzing shock that always paralyzes the target.";                           cat="Special" }
    @{ name="Charge";           desc="Raises Sp.Def and powers up the next Electric move.";                         cat="Status" }
    @{ name="Charge Beam";      desc="A beam that may raise the user's Sp.Atk.";                                   cat="Special" }
    @{ name="Discharge";        desc="A burst of electricity that may paralyze.";                                  cat="Special" }
    @{ name="Double Shock";     desc="A double shock that removes the user's Electric type.";                      cat="Physical" }
    @{ name="Eerie Impulse";    desc="Sharply lowers the target's Sp.Atk.";                                        cat="Status" }
    @{ name="Electric Terrain"; desc="A terrain that boosts Electric moves and prevents sleep.";                   cat="Status" }
    @{ name="Electrify";        desc="Changes the target's move to Electric type.";                                 cat="Status" }
    @{ name="Electro Ball";     desc="A ball of electricity stronger when the user is faster.";                    cat="Special" }
    @{ name="Electro Drift";    desc="A electric charge that is boosted even more if super-effective.";             cat="Special" }
    @{ name="Electro Shot";     desc="Charges on first turn and attacks on the second.";                           cat="Special" }
    @{ name="Electroweb";       desc="An electric net that traps and lowers Speed.";                               cat="Special" }
    @{ name="Fusion Bolt";      desc="A fusion bolt that doubles power after Fusion Flare.";                       cat="Physical" }
    @{ name="Ion Deluge";       desc="Changes Normal-type moves to Electric type.";                                cat="Status" }
    @{ name="Magnet Rise";      desc="The user levitates to avoid Ground moves for 5 turns.";                      cat="Status" }
    @{ name="Magnetic Flux";    desc="Raises Defense and Sp.Def of allies with Plus or Minus.";                    cat="Status" }
    @{ name="Nuzzle";           desc="A cute nuzzle that always paralyzes the target.";                             cat="Physical" }
    @{ name="Overdrive";        desc="A loud guitar riff that damages all nearby foes.";                            cat="Special" }
    @{ name="Parabolic Charge"; desc="An electric charge that restores HP from damage dealt.";                     cat="Special" }
    @{ name="Pika Papow";       desc="A Pikachu-exclusive move that powers up with friendship.";                   cat="Special" }
    @{ name="Plasma Fists";     desc="A plasma punch that changes Normal moves to Electric type.";                 cat="Physical" }
    @{ name="Rising Voltage";   desc="An electric rise that doubles power on Electric Terrain.";                   cat="Special" }
    @{ name="Shock Wave";       desc="A shock wave that never misses the target.";                                 cat="Special" }
    @{ name="Spark";            desc="A sparking attack that may paralyze the target.";                             cat="Physical" }
    @{ name="Supercell Slam";   desc="A powerful slam that damages the user if it misses.";                        cat="Physical" }
    @{ name="Thunder";          desc="A massive lightning bolt that may paralyze.";                                cat="Special" }
    @{ name="Thunder Cage";     desc="An electric cage that traps the target for 4-5 turns.";                      cat="Special" }
    @{ name="Thunder Fang";     desc="An electrified fang that may paralyze or flinch.";                           cat="Physical" }
    @{ name="Thunder Punch";    desc="An electrified punch that may paralyze the target.";                          cat="Physical" }
    @{ name="Thunder Shock";    desc="A jolt of electricity that may paralyze the target.";                        cat="Special" }
    @{ name="Thunder Wave";     desc="A gentle wave that paralyzes the target.";                                   cat="Status" }
    @{ name="Thunderbolt";      desc="A strong electric blast that may paralyze the target.";                      cat="Special" }
    @{ name="Thunderclap";      desc="A thunderclap that strikes before the target's move.";                       cat="Special" }
    @{ name="Volt Switch";      desc="An electric attack that switches the user out.";                              cat="Special" }
    @{ name="Volt Tackle";      desc="A reckless tackle that deals heavy recoil damage.";                           cat="Physical" }
    @{ name="Wild Charge";      desc="A reckless charge that deals recoil damage.";                                cat="Physical" }
    @{ name="Wildbolt Storm";   desc="A wild storm that may paralyze the target.";                                 cat="Special" }
    @{ name="Zap Cannon";       desc="A powerful cannon that always paralyzes but may miss.";                      cat="Special" }
    @{ name="Zing Zap";         desc="A sparking zap that may flinch the target.";                                  cat="Physical" }
    @{ name="Zippy Zap";        desc="A zippy zap that always goes first and raises evasiveness.";                 cat="Physical" }
)

$FAIRY_MOVES = @(
    @{ name="Alluring Voice";   desc="A voice that confuses the target if its stats were raised.";                cat="Special" }
    @{ name="Aromatic Mist";    desc="Raises the Sp.Def of an ally.";                                              cat="Status" }
    @{ name="Baby-Doll Eyes";   desc="Lowers the target's Attack and always goes first.";                          cat="Status" }
    @{ name="Charm";            desc="Sharply lowers the target's Attack.";                                        cat="Status" }
    @{ name="Crafty Shield";    desc="Protects allies from status moves in double battles.";                       cat="Status" }
    @{ name="Dazzling Gleam";   desc="A dazzling flash of light that damages all foes.";                            cat="Special" }
    @{ name="Decorate";         desc="Sharply raises the target's Attack and Sp.Atk.";                              cat="Status" }
    @{ name="Disarming Voice";  desc="A sweet voice that never misses the target.";                                cat="Special" }
    @{ name="Draining Kiss";    desc="A kiss that restores HP from damage dealt.";                                 cat="Special" }
    @{ name="Fairy Lock";       desc="Prevents all Pokemon from fleeing for the next turn.";                       cat="Status" }
    @{ name="Fairy Wind";       desc="A gentle fairy wind that strikes the target.";                               cat="Special" }
    @{ name="Fleur Cannon";     desc="A powerful beam that sharply lowers the user's Sp.Atk.";                     cat="Special" }
    @{ name="Floral Healing";   desc="Heals the target based on the terrain.";                                     cat="Status" }
    @{ name="Flower Shield";    desc="Raises the Defense of all Grass-type Pokemon.";                              cat="Status" }
    @{ name="Geomancy";         desc="Charges then sharply raises Sp.Atk, Sp.Def, and Speed.";                    cat="Status" }
    @{ name="Light of Ruin";    desc="A devastating light attack that deals heavy recoil.";                        cat="Special" }
    @{ name="Magical Torque";   desc="A magical attack that may confuse the target.";                              cat="Physical" }
    @{ name="Misty Explosion";  desc="An explosion that faints the user, boosted by Misty Terrain.";               cat="Special" }
    @{ name="Misty Terrain";    desc="A terrain that weakens Dragon moves and prevents status.";                   cat="Status" }
    @{ name="Moonblast";        desc="A lunar blast that may lower the target's Sp.Atk.";                          cat="Special" }
    @{ name="Moonlight";        desc="Heals the user based on the weather.";                                       cat="Status" }
    @{ name="Nature's Madness"; desc="A nature strike that always cuts HP in half.";                               cat="Special" }
    @{ name="Play Rough";       desc="A rough play attack that may lower the target's Attack.";                    cat="Physical" }
    @{ name="Sparkly Swirl";    desc="A sparkly swirl that heals the user's status conditions.";                   cat="Special" }
    @{ name="Spirit Break";     desc="A spirit-breaking strike that lowers the target's Sp.Atk.";                  cat="Physical" }
    @{ name="Springtide Storm"; desc="A spring storm that may lower the target's Attack.";                         cat="Special" }
    @{ name="Strange Steam";    desc="A strange steam that may confuse the target.";                               cat="Special" }
    @{ name="Sweet Kiss";       desc="A sweet kiss that confuses the target.";                                     cat="Status" }
)

$DARK_MOVES = @(
    @{ name="Assurance";        desc="A vengeful strike that doubles power if the target was damaged.";              cat="Physical" }
    @{ name="Baddy Bad";        desc="A bad blast that damages and sets up a protective barrier.";                   cat="Special" }
    @{ name="Beat Up";          desc="All party members join in to attack the target.";                              cat="Physical" }
    @{ name="Bite";             desc="A biting attack that may flinch the target.";                                  cat="Physical" }
    @{ name="Brutal Swing";     desc="A wild swing that damages all nearby Pokemon.";                                cat="Physical" }
    @{ name="Ceaseless Edge";   desc="A slicing attack that scatters shards to inflict residual damage.";            cat="Physical" }
    @{ name="Comeuppance";      desc="Deals double damage to the last attacker.";                                    cat="Physical" }
    @{ name="Crunch";           desc="A crushing bite that may lower the target's Defense.";                         cat="Physical" }
    @{ name="Dark Pulse";       desc="A dark blast that may flinch the target.";                                    cat="Special" }
    @{ name="Dark Void";        desc="A dark void that puts multiple targets to sleep.";                             cat="Status" }
    @{ name="Darkest Lariat";   desc="A spinning lariat that ignores the target's stat changes.";                    cat="Physical" }
    @{ name="Embargo";          desc="Prevents the target from using its held item.";                                cat="Status" }
    @{ name="Fake Tears";       desc="A crying act that sharply lowers the target's Sp.Def.";                        cat="Status" }
    @{ name="False Surrender";  desc="A sneaky strike that never misses the target.";                                cat="Physical" }
    @{ name="Feint Attack";     desc="A deceptive attack that never misses the target.";                             cat="Physical" }
    @{ name="Fiery Wrath";      desc="A wrathful blaze that may flinch the target.";                                 cat="Special" }
    @{ name="Flatter";          desc="Confuses the target but sharply raises its Sp.Atk.";                           cat="Status" }
    @{ name="Fling";            desc="Throws the user's held item at the target.";                                   cat="Physical" }
    @{ name="Foul Play";        desc="Attacks using the target's own Attack stat.";                                  cat="Physical" }
    @{ name="Hone Claws";       desc="Raises the user's Attack and accuracy.";                                       cat="Status" }
    @{ name="Hyperspace Fury";  desc="A fury of attacks that bypass protection but lower Defense.";                  cat="Special" }
    @{ name="Jaw Lock";         desc="Locks jaws with the target to trap both in battle.";                           cat="Physical" }
    @{ name="Knock Off";        desc="Knocks off the target's held item and damages it.";                            cat="Physical" }
    @{ name="Kowtow Cleave";    desc="A humble cleave that never misses the target.";                                cat="Physical" }
    @{ name="Lash Out";         desc="A lashing strike that doubles power after a stat drop.";                       cat="Physical" }
    @{ name="Memento";          desc="The user faints but sharply lowers the target's offenses.";                    cat="Status" }
    @{ name="Nasty Plot";       desc="A plotting move that sharply raises the user's Sp.Atk.";                       cat="Status" }
    @{ name="Night Daze";       desc="A dark shock wave that may lower the target's accuracy.";                      cat="Special" }
    @{ name="Night Slash";      desc="A swift slash with a high critical hit rate.";                                 cat="Physical" }
    @{ name="Obstruct";         desc="Protects the user and lowers the attacker's Defense on contact.";              cat="Status" }
    @{ name="Parting Shot";     desc="Lowers the target's offenses and switches the user out.";                      cat="Status" }
    @{ name="Payback";          desc="A revenge strike that doubles power if the user moves second.";                cat="Physical" }
    @{ name="Power Trip";       desc="An attack that grows stronger with more raised stats.";                        cat="Physical" }
    @{ name="Punishment";       desc="An attack that grows stronger with more raised stats.";                        cat="Physical" }
    @{ name="Pursuit";          desc="A strike that hits harder when the target tries to switch.";                   cat="Physical" }
    @{ name="Quash";            desc="Forces the target to move last this turn.";                                    cat="Status" }
    @{ name="Ruination";        desc="A ruinous strike that always cuts the target's HP in half.";                   cat="Special" }
    @{ name="Snarl";            desc="A snarl that damages and lowers the target's Sp.Atk.";                         cat="Special" }
    @{ name="Snatch";           desc="Steals the effect of the target's next status move.";                          cat="Status" }
    @{ name="Sucker Punch";     desc="A sneaky punch that strikes before the target's move.";                        cat="Physical" }
    @{ name="Switcheroo";       desc="Swaps held items with the target.";                                            cat="Status" }
    @{ name="Taunt";            desc="Taunts the target, forcing it to use only attacking moves.";                   cat="Status" }
    @{ name="Thief";            desc="A stealing attack that takes the target's held item.";                         cat="Physical" }
    @{ name="Throat Chop";      desc="A chopping strike that prevents the target from using sound moves.";           cat="Physical" }
    @{ name="Topsy-Turvy";      desc="Inverts the target's stat changes.";                                           cat="Status" }
    @{ name="Torment";          desc="Prevents the target from using the same move twice.";                          cat="Status" }
    @{ name="Wicked Blow";      desc="A wicked punch that always lands a critical hit.";                             cat="Physical" }
    @{ name="Wicked Torque";    desc="A wicked attack that may put the target to sleep.";                            cat="Physical" }
)

$DRAGON_MOVES = @(
    @{ name="Breaking Swipe";   desc="A sweeping tail that lowers the target's Attack.";                             cat="Physical" }
    @{ name="Clanging Scales";  desc="A loud clanging scale that lowers the user's Defense.";                       cat="Special" }
    @{ name="Clangorous Soul";  desc="Raises all of the user's stats by sacrificing some HP.";                      cat="Status" }
    @{ name="Core Enforcer";    desc="A core blast that suppresses the target's Ability.";                           cat="Special" }
    @{ name="Draco Meteor";     desc="A meteor shower that sharply lowers the user's Sp.Atk.";                      cat="Special" }
    @{ name="Dragon Breath";    desc="A breath of dragon fire that may paralyze the target.";                        cat="Special" }
    @{ name="Dragon Cheer";     desc="A cheer that raises the ally's critical hit rate.";                           cat="Status" }
    @{ name="Dragon Claw";      desc="A sharp dragon claw that tears at the target.";                                cat="Physical" }
    @{ name="Dragon Dance";     desc="A dance that raises the user's Attack and Speed.";                             cat="Status" }
    @{ name="Dragon Darts";     desc="A dart attack that strikes twice in one turn.";                                cat="Physical" }
    @{ name="Dragon Energy";    desc="A draconic blast stronger when the user has more HP.";                         cat="Special" }
    @{ name="Dragon Hammer";    desc="A hammer strike using the user's body.";                                       cat="Physical" }
    @{ name="Dragon Pulse";     desc="A pulse of draconic energy that damages the target.";                          cat="Special" }
    @{ name="Dragon Rage";      desc="A rage that always inflicts 40 HP of damage.";                                 cat="Special" }
    @{ name="Dragon Rush";      desc="A devastating charge that may flinch the target.";                             cat="Physical" }
    @{ name="Dragon Tail";      desc="A tail strike that forces the target to switch out.";                          cat="Physical" }
    @{ name="Dual Chop";        desc="A double chopping strike that hits twice.";                                    cat="Physical" }
    @{ name="Dynamax Cannon";   desc="A cannon blast that deals double damage to Dynamax targets.";                  cat="Special" }
    @{ name="Eternabeam";       desc="An eternal beam that leaves the user unable to move next turn.";               cat="Special" }
    @{ name="Fickle Beam";      desc="A beam that may sometimes deal double damage.";                                cat="Special" }
    @{ name="Glaive Rush";      desc="A glaive rush that leaves the user vulnerable to double damage.";              cat="Physical" }
    @{ name="Nihil Light";      desc="A nihil light that leaves the user unable to move next turn.";                 cat="Special" }
    @{ name="Order Up";         desc="An order that damages and may raise the user's stats.";                        cat="Physical" }
    @{ name="Outrage";          desc="A rampage that confuses the user afterward.";                                  cat="Physical" }
    @{ name="Roar of Time";     desc="A temporal roar that leaves the user unable to move next turn.";               cat="Special" }
    @{ name="Scale Shot";       desc="A scale shot that hits 2-5 times and raises Speed.";                          cat="Physical" }
    @{ name="Spacial Rend";     desc="A spatial rend that has a high critical hit rate.";                            cat="Special" }
    @{ name="Twister";          desc="A twisting wind that may flinch Flying types.";                                cat="Special" }
)

$BUG_MOVES = @(
    @{ name="Attack Order";     desc="An order to attack with a high critical hit rate.";                            cat="Physical" }
    @{ name="Bug Bite";         desc="A biting attack that also eats the target's held berry.";                      cat="Physical" }
    @{ name="Bug Buzz";         desc="A buzzing sound that may lower the target's Sp.Def.";                          cat="Special" }
    @{ name="Defend Order";     desc="An order to defend that raises the user's Defense and Sp.Def.";               cat="Status" }
    @{ name="Fell Stinger";     desc="A stinger that sharply raises the user's Attack if it KOs.";                   cat="Physical" }
    @{ name="First Impression"; desc="A first-strike attack that only works on the first turn.";                     cat="Physical" }
    @{ name="Fury Cutter";      desc="A cutter that grows stronger with each consecutive hit.";                      cat="Physical" }
    @{ name="Heal Order";       desc="An order to heal that restores half of the user's max HP.";                    cat="Status" }
    @{ name="Infestation";      desc="An infestation that traps and damages the target.";                            cat="Special" }
    @{ name="Leech Life";       desc="A leeching bite that restores HP from damage dealt.";                          cat="Physical" }
    @{ name="Lunge";            desc="A lunging strike that lowers the target's Attack.";                             cat="Physical" }
    @{ name="Megahorn";         desc="A powerful horn strike with immense force.";                                    cat="Physical" }
    @{ name="Pin Missile";      desc="A missile pin attack that hits 2-5 times.";                                   cat="Physical" }
    @{ name="Pollen Puff";      desc="A pollen puff that damages foes but heals allies.";                            cat="Special" }
    @{ name="Pounce";           desc="A pouncing attack that lowers the target's Speed.";                             cat="Physical" }
    @{ name="Powder";           desc="A powder that causes the target to explode if using a Fire move.";             cat="Status" }
    @{ name="Quiver Dance";     desc="A dance that raises Sp.Atk, Sp.Def, and Speed.";                               cat="Status" }
    @{ name="Rage Powder";      desc="A powder that draws attacks to the user in double battles.";                   cat="Status" }
    @{ name="Signal Beam";      desc="A signal beam that may confuse the target.";                                   cat="Special" }
    @{ name="Silk Trap";        desc="A silk trap that protects the user and lowers the attacker's Speed.";          cat="Status" }
    @{ name="Silver Wind";      desc="A silver wind that may raise the user's stats.";                               cat="Special" }
    @{ name="Skitter Smack";    desc="A skittering smack that lowers the target's Sp.Atk.";                          cat="Physical" }
    @{ name="Spider Web";       desc="A spider web that prevents the target from fleeing.";                          cat="Status" }
    @{ name="Steamroller";      desc="A rolling steamroller that may flinch the target.";                             cat="Physical" }
    @{ name="Sticky Web";       desc="A sticky web that lowers the Speed of incoming foes.";                         cat="Status" }
    @{ name="String Shot";      desc="A string shot that lowers the target's Speed.";                                cat="Status" }
    @{ name="Struggle Bug";     desc="A struggle bug that lowers the target's Sp.Atk.";                              cat="Special" }
    @{ name="Tail Glow";        desc="A tail glow that sharply raises the user's Sp.Atk.";                           cat="Status" }
    @{ name="Twineedle";        desc="A twin needle attack that hits twice and may poison.";                         cat="Physical" }
    @{ name="U-turn";           desc="An attack that switches the user out after striking.";                          cat="Physical" }
    @{ name="X-Scissor";        desc="A cross-shaped slashing attack with sharp scythes.";                           cat="Physical" }
)

$GROUND_MOVES = @(
    @{ name="Bone Club";        desc="A bone club that may make the target flinch.";                     cat="Physical" }
    @{ name="Bone Rush";        desc="A bone rush that hits the target 2-5 times.";                     cat="Physical" }
    @{ name="Bonemerang";       desc="A bonemerang that hits the target twice.";                        cat="Physical" }
    @{ name="Bulldoze";         desc="A bulldoze that lowers the target's Speed.";                       cat="Physical" }
    @{ name="Dig";              desc="A dig that strikes on the second turn.";                           cat="Physical" }
    @{ name="Drill Run";        desc="A drill run with a high critical hit rate.";                       cat="Physical" }
    @{ name="Earth Power";      desc="An earth power that may lower Sp.Def.";                           cat="Special" }
    @{ name="Earthquake";       desc="An earthquake that damages all nearby Pokemon.";                   cat="Physical" }
    @{ name="Fissure";          desc="A fissure that causes a one-hit KO.";                              cat="Physical" }
    @{ name="Headlong Rush";    desc="A headlong rush that lowers the user's defenses.";                cat="Physical" }
    @{ name="High Horsepower";  desc="A high horsepower strike at the target.";                         cat="Physical" }
    @{ name="Land's Wrath";     desc="A wrath of the land that strikes the target.";                     cat="Physical" }
    @{ name="Magnitude";        desc="A magnitude quake of varying strength.";                           cat="Physical" }
    @{ name="Mighty Cleave";    desc="A mighty cleave that never misses.";                               cat="Physical" }
    @{ name="Mud Bomb";         desc="A mud bomb that may lower the target's accuracy.";                 cat="Special" }
    @{ name="Mud Shot";         desc="A mud shot that lowers the target's Speed.";                      cat="Special" }
    @{ name="Mud Sport";        desc="A mud sport that weakens Electric moves.";                         cat="Status" }
    @{ name="Mud-Slap";         desc="A mud slap that lowers the target's accuracy.";                    cat="Special" }
    @{ name="Precipice Blades"; desc="A precipice blade that strikes the target with great force.";      cat="Physical" }
    @{ name="Rototiller";       desc="A rototiller that raises the Attack and Sp.Atk of Grass types.";   cat="Status" }
    @{ name="Sand Attack";      desc="A sand attack that lowers the target's accuracy.";                 cat="Status" }
    @{ name="Sand Tomb";        desc="A sand tomb that traps the target for 4-5 turns.";                cat="Physical" }
    @{ name="Scorching Sands";  desc="A scorching sand that may burn the target.";                       cat="Special" }
    @{ name="Shore Up";         desc="A shore up that heals the user based on the weather.";             cat="Status" }
    @{ name="Spikes";           desc="A spike trap that damages incoming foes.";                          cat="Status" }
    @{ name="Stomping Tantrum"; desc="A stomping tantrum that doubles power after a miss.";              cat="Physical" }
    @{ name="Thousand Arrows";  desc="A thousand arrows that can hit Flying types.";                     cat="Physical" }
    @{ name="Thousand Waves";   desc="A thousand waves that trap the target.";                           cat="Physical" }
)

$FIGHTING_MOVES = @(
    @{ name="Arm Thrust";       desc="An arm thrust that hits the target 2-5 times.";                   cat="Physical" }
    @{ name="Aura Sphere";      desc="An aura sphere that never misses the target.";                     cat="Special" }
    @{ name="Body Press";       desc="A body press that uses the user's Defense stat.";                  cat="Physical" }
    @{ name="Brick Break";      desc="A brick break that shatters barriers.";                            cat="Physical" }
    @{ name="Circle Throw";     desc="A circle throw that forces the target to switch.";                 cat="Physical" }
    @{ name="Close Combat";     desc="A close combat that lowers the user's defenses.";                  cat="Physical" }
    @{ name="Coaching";         desc="A coaching call that raises the ally's Attack and Defense.";       cat="Status" }
    @{ name="Collision Course"; desc="A collision course that is boosted when super-effective.";         cat="Physical" }
    @{ name="Counter";          desc="A counter that returns physical damage in kind.";                  cat="Physical" }
    @{ name="Cross Chop";       desc="A cross chop with a high critical hit rate.";                      cat="Physical" }
    @{ name="Detect";           desc="A detect that protects the user from attacks.";                    cat="Status" }
    @{ name="Double Iron Bash"; desc="A double iron bash that hits twice and may flinch.";               cat="Physical" }
    @{ name="Double Kick";      desc="A double kick that strikes the target twice.";                     cat="Physical" }
    @{ name="Drain Punch";      desc="A drain punch that restores HP from damage dealt.";                cat="Physical" }
    @{ name="Dynamic Punch";    desc="A dynamic punch that always confuses the target.";                 cat="Physical" }
    @{ name="Final Gambit";     desc="A final gambit that deals damage equal to the user's HP.";         cat="Special" }
    @{ name="Flying Press";     desc="A flying press that is part Fighting and part Flying.";            cat="Physical" }
    @{ name="Focus Blast";      desc="A focus blast that may lower the target's Sp.Def.";               cat="Special" }
    @{ name="Focus Punch";      desc="A focus punch that fails if the user is hit first.";               cat="Physical" }
    @{ name="Force Palm";       desc="A force palm that may paralyze the target.";                       cat="Physical" }
    @{ name="High Jump Kick";   desc="A high jump kick that hurts the user if it misses.";               cat="Physical" }
    @{ name="Jump Kick";        desc="A jump kick that hurts the user if it misses.";                    cat="Physical" }
    @{ name="Karate Chop";      desc="A karate chop with a high critical hit rate.";                     cat="Physical" }
    @{ name="Low Kick";         desc="A low kick that is stronger on heavier targets.";                  cat="Physical" }
    @{ name="Low Sweep";        desc="A low sweep that lowers the target's Speed.";                      cat="Physical" }
    @{ name="Mach Punch";       desc="A mach punch that always strikes first.";                          cat="Physical" }
    @{ name="Mat Block";        desc="A mat block that protects the user from attacks.";                cat="Status" }
    @{ name="Meteor Mash";      desc="A meteor mash that may raise the user's Attack.";                  cat="Physical" }
    @{ name="No Retreat";       desc="A no-retreat stance that raises all stats but traps the user.";    cat="Status" }
    @{ name="Octolock";         desc="An octolock that lowers the target's defenses each turn.";          cat="Status" }
    @{ name="Power-Up Punch";   desc="A power-up punch that raises the user's Attack.";                  cat="Physical" }
    @{ name="Quick Guard";      desc="A quick guard that protects from priority moves.";                 cat="Status" }
    @{ name="Revenge";          desc="A revenge strike that doubles power if the user was hit.";         cat="Physical" }
    @{ name="Reversal";         desc="A reversal that is stronger with less HP.";                        cat="Physical" }
    @{ name="Rock Smash";       desc="A rock smash that may lower the target's Defense.";               cat="Physical" }
    @{ name="Rolling Kick";     desc="A rolling kick that may flinch the target.";                       cat="Physical" }
    @{ name="Sacred Sword";     desc="A sacred sword that ignores the target's stat changes.";           cat="Physical" }
    @{ name="Secret Sword";     desc="A secret sword that damages using the target's Defense.";          cat="Special" }
    @{ name="Seismic Toss";     desc="A seismic toss that deals damage equal to the user's level.";      cat="Physical" }
    @{ name="Sky Uppercut";     desc="A sky uppercut that can hit Flying targets.";                      cat="Physical" }
    @{ name="Storm Throw";      desc="A storm throw that always lands a critical hit.";                  cat="Physical" }
    @{ name="Submission";       desc="A submission that deals recoil damage to the user.";               cat="Physical" }
    @{ name="Superpower";       desc="A superpower that lowers the user's Attack and Defense.";          cat="Physical" }
    @{ name="Triple Arrows";    desc="A triple arrow that may lower Defense or flinch.";                 cat="Physical" }
    @{ name="Triple Kick";      desc="A triple kick that grows stronger with each hit.";                 cat="Physical" }
    @{ name="Upper Hand";       desc="An upper hand that strikes before the target's priority move.";    cat="Physical" }
    @{ name="Vacuum Wave";      desc="A vacuum wave that always strikes first.";                         cat="Special" }
    @{ name="Vital Throw";      desc="A vital throw that always moves last but never misses.";           cat="Physical" }
    @{ name="Wake-Up Slap";     desc="A wake-up slap that deals double damage to sleeping targets.";     cat="Physical" }
)

$GHOST_MOVES = @(
    @{ name="Astonish";         desc="An astonishing attack that may flinch the target.";                cat="Physical" }
    @{ name="Astral Barrage";   desc="An astral barrage that strikes multiple targets.";                 cat="Special" }
    @{ name="Confuse Ray";      desc="A confuse ray that confuses the target.";                          cat="Status" }
    @{ name="Curse";            desc="A curse that slowly drains the target's HP.";                      cat="Status" }
    @{ name="Destiny Bond";     desc="A destiny bond that faints the user if it faints.";                cat="Status" }
    @{ name="Grudge";           desc="A grudge that depletes the move that faints the user.";            cat="Status" }
    @{ name="Hex";              desc="A hex that doubles power on targets with status.";                 cat="Special" }
    @{ name="Infernal Parade";  desc="An infernal parade that may burn the target.";                     cat="Special" }
    @{ name="Last Respects";    desc="A last respects strike that grows with each fallen ally.";         cat="Physical" }
    @{ name="Lick";             desc="A lick that may paralyze the target.";                              cat="Physical" }
    @{ name="Moongeist Beam";   desc="A moongeist beam that ignores the target's Ability.";              cat="Special" }
    @{ name="Night Shade";      desc="A night shade that deals damage equal to the user's level.";       cat="Special" }
    @{ name="Nightmare";        desc="A nightmare that damages sleeping targets each turn.";             cat="Status" }
    @{ name="Ominous Wind";     desc="An ominous wind that may raise all of the user's stats.";          cat="Special" }
    @{ name="Phantom Force";    desc="A phantom force that strikes on the second turn.";                 cat="Physical" }
    @{ name="Poltergeist";      desc="A poltergeist that hurls the target's held item.";                 cat="Physical" }
    @{ name="Rage Fist";        desc="A rage fist that grows stronger with each hit taken.";             cat="Physical" }
    @{ name="Shadow Ball";      desc="A shadow ball that may lower the target's Sp.Def.";               cat="Special" }
    @{ name="Shadow Bone";      desc="A shadow bone that may lower the target's Defense.";              cat="Physical" }
    @{ name="Shadow Claw";      desc="A shadow claw with a high critical hit rate.";                     cat="Physical" }
    @{ name="Shadow Force";     desc="A shadow force that strikes on the second turn.";                  cat="Physical" }
    @{ name="Shadow Punch";     desc="A shadow punch that never misses the target.";                     cat="Physical" }
    @{ name="Shadow Sneak";     desc="A shadow sneak that always strikes first.";                        cat="Physical" }
    @{ name="Spectral Thief";   desc="A spectral thief that steals the target's stat boosts.";           cat="Physical" }
    @{ name="Spirit Shackle";   desc="A spirit shackle that traps the target.";                          cat="Physical" }
    @{ name="Spite";            desc="A spite that reduces the PP of the target's last move.";           cat="Status" }
    @{ name="Trick-or-Treat";   desc="A trick-or-treat that adds Ghost type to the target.";             cat="Status" }
)

$FLYING_MOVES = @(
    @{ name="Acrobatics";       desc="An acrobatic strike that is stronger without a held item.";        cat="Physical" }
    @{ name="Aerial Ace";       desc="An aerial ace that never misses the target.";                      cat="Physical" }
    @{ name="Aeroblast";        desc="An aeroblast with a high critical hit rate.";                      cat="Special" }
    @{ name="Air Cutter";       desc="An air cutter with a high critical hit rate.";                     cat="Special" }
    @{ name="Air Slash";        desc="An air slash that may flinch the target.";                         cat="Special" }
    @{ name="Beak Blast";       desc="A beak blast that may burn the target on contact.";                cat="Physical" }
    @{ name="Brave Bird";       desc="A brave bird that deals heavy recoil damage.";                     cat="Physical" }
    @{ name="Chatter";          desc="A chatter that always confuses the target.";                       cat="Special" }
    @{ name="Defog";            desc="A defog that clears the field and lowers evasiveness.";            cat="Status" }
    @{ name="Dive";             desc="A dive that strikes on the second turn.";                          cat="Physical" }
    @{ name="Dragon Ascent";    desc="A dragon ascent that lowers the user's defenses.";                 cat="Physical" }
    @{ name="Drill Peck";       desc="A drill peck that pierces the target.";                            cat="Physical" }
    @{ name="Dual Wingbeat";    desc="A dual wingbeat that strikes the target twice.";                   cat="Physical" }
    @{ name="Feather Dance";    desc="A feather dance that sharply lowers the target's Attack.";         cat="Status" }
    @{ name="Floaty Fall";      desc="A floaty fall that may flinch the target.";                        cat="Physical" }
    @{ name="Fly";              desc="A fly that strikes on the second turn.";                           cat="Physical" }
    @{ name="Gust";             desc="A gust that can hit Flying targets.";                              cat="Special" }
    @{ name="Hurricane";        desc="A hurricane that may confuse the target.";                         cat="Special" }
    @{ name="Oblivion Wing";    desc="An oblivion wing that restores HP from damage dealt.";             cat="Special" }
    @{ name="Peck";             desc="A peck that strikes the target.";                                  cat="Physical" }
    @{ name="Pluck";            desc="A pluck that eats the target's held berry.";                       cat="Physical" }
    @{ name="Roost";            desc="A roost that restores half of the user's max HP.";                 cat="Status" }
    @{ name="Sky Attack";       desc="A sky attack with a high critical hit rate that may flinch.";      cat="Physical" }
    @{ name="Sky Drop";         desc="A sky drop that lifts and drops the target on the second turn.";   cat="Physical" }
    @{ name="Tailwind";         desc="A tailwind that doubles the party's Speed.";                       cat="Status" }
    @{ name="Wing Attack";      desc="A wing attack that strikes the target with wings.";                cat="Physical" }
)

$jsonFiles = @()
if ($Type -eq "all" -or $Type -eq "normal") {
    foreach ($item in $NORMAL_MOVES) {
        $jsonFiles += New-MoveJson -Move $item -MoveType "Normal"
    }
}
if ($Type -eq "all" -or $Type -eq "fire") {
    foreach ($item in $FIRE_MOVES) {
        $jsonFiles += New-MoveJson -Move $item -MoveType "Fire"
    }
}
if ($Type -eq "all" -or $Type -eq "psychic") {
    foreach ($item in $PSYCHIC_MOVES) {
        $jsonFiles += New-MoveJson -Move $item -MoveType "Psychic"
    }
}
if ($Type -eq "all" -or $Type -eq "electric") {
    foreach ($item in $ELECTRIC_MOVES) {
        $jsonFiles += New-MoveJson -Move $item -MoveType "Electric"
    }
}
if ($Type -eq "all" -or $Type -eq "fairy") {
    foreach ($item in $FAIRY_MOVES) {
        $jsonFiles += New-MoveJson -Move $item -MoveType "Fairy"
    }
}
if ($Type -eq "all" -or $Type -eq "dark") {
    foreach ($item in $DARK_MOVES) {
        $jsonFiles += New-MoveJson -Move $item -MoveType "Dark"
    }
}
if ($Type -eq "all" -or $Type -eq "dragon") {
    foreach ($item in $DRAGON_MOVES) {
        $jsonFiles += New-MoveJson -Move $item -MoveType "Dragon"
    }
}
if ($Type -eq "all" -or $Type -eq "bug") {
    foreach ($item in $BUG_MOVES) {
        $jsonFiles += New-MoveJson -Move $item -MoveType "Bug"
    }
}
if ($Type -eq "all" -or $Type -eq "ground") {
    foreach ($item in $GROUND_MOVES) {
        $jsonFiles += New-MoveJson -Move $item -MoveType "Ground"
    }
}
if ($Type -eq "all" -or $Type -eq "fighting") {
    foreach ($item in $FIGHTING_MOVES) {
        $jsonFiles += New-MoveJson -Move $item -MoveType "Fighting"
    }
}
if ($Type -eq "all" -or $Type -eq "ghost") {
    foreach ($item in $GHOST_MOVES) {
        $jsonFiles += New-MoveJson -Move $item -MoveType "Ghost"
    }
}
if ($Type -eq "all" -or $Type -eq "flying") {
    foreach ($item in $FLYING_MOVES) {
        $jsonFiles += New-MoveJson -Move $item -MoveType "Flying"
    }
}

Write-Host "`nGenerated $($jsonFiles.Count) JSON files. Run render_move_template.ps1 for each to produce PNGs."
return $jsonFiles
