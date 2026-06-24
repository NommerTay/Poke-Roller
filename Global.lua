-- ==========================================
-- GLOBAL SCRIPT — Standalone Crafting Board UI
-- ==========================================

-- ── STATE ───────────────────────────────────────────────────
-- Keyed by player color
local resources   = {}  -- resources[color][key] = number
local ball_counts = {}  -- ball_counts[color][idx] = number

local APRICORN_COLORS = {"red","blue","yellow","black","white","pink","green"}

local POKEBALLS = {
    { key="pokeball",   name="Pokeball",     cost={red=1} },
    { key="greatball",  name="Great Ball",   cost={red=1, blue=1} },
    { key="ultraball",  name="Ultra Ball",   cost={yellow=1, black=1} },
    { key="heavyball",  name="Heavy Ball",   cost={red=1, black=1} },
    { key="lightball",  name="Light Ball",   cost={white=1, pink=1} },
    { key="loveball",   name="Love Ball",    cost={pink=2} },
    { key="healball",   name="Heal Ball",    cost={yellow=1, white=1, pink=1} },
    { key="luxuryball", name="Luxury Ball",  cost={red=2, yellow=1} },
    { key="quickball",  name="Quick Ball",   cost={blue=2, yellow=1} },
    { key="phaseball",  name="Phase Ball",   cost={green=1, yellow=1, red=1} },
    { key="safariball", name="Safari Ball",  cost={green=1, yellow=1, white=1} },
    { key="masterball", name="Master Ball",  cost={red=1, blue=1, black=1} },
    { key="noiball",    name="Noi Ball",     cost={black=3} },
}

local RESOURCE_KEYS = {
    "journey_points","rare_candy",
    "red","blue","yellow","black","white","pink","green"
}

local SEAT_COLORS = {"White","Red","Orange","Yellow","Green","Teal","Blue","Purple","Pink","Grey"}

-- ── POKEMON DATA ────────────────────────────────────────────
local POKEMON_DATA = {
  {1,"bulbasaur","grass","poison"},
  {2,"ivysaur","grass","poison"},
  {3,"venusaur","grass","poison"},
  {4,"charmander","fire"},
  {5,"charmeleon","fire"},
  {6,"charizard","fire","flying"},
  {7,"squirtle","water"},
  {8,"wartortle","water"},
  {9,"blastoise","water"},
  {10,"caterpie","bug"},
  {11,"metapod","bug"},
  {12,"butterfree","bug","flying"},
  {13,"weedle","bug","poison"},
  {14,"kakuna","bug","poison"},
  {15,"beedrill","bug","poison"},
  {16,"pidgey","normal","flying"},
  {17,"pidgeotto","normal","flying"},
  {18,"pidgeot","normal","flying"},
  {19,"rattata","normal"},
  {20,"raticate","normal"},
  {21,"spearow","normal","flying"},
  {22,"fearow","normal","flying"},
  {23,"ekans","poison"},
  {24,"arbok","poison"},
  {25,"pikachu","electric"},
  {26,"raichu","electric"},
  {27,"sandshrew","ground"},
  {28,"sandslash","ground"},
  {29,"nidoran-f","poison"},
  {30,"nidorina","poison"},
  {31,"nidoqueen","poison","ground"},
  {32,"nidoran-m","poison"},
  {33,"nidorino","poison"},
  {34,"nidoking","poison","ground"},
  {35,"clefairy","fairy"},
  {36,"clefable","fairy"},
  {37,"vulpix","fire"},
  {38,"ninetales","fire"},
  {39,"jigglypuff","normal","fairy"},
  {40,"wigglytuff","normal","fairy"},
  {41,"zubat","poison","flying"},
  {42,"golbat","poison","flying"},
  {43,"oddish","grass","poison"},
  {44,"gloom","grass","poison"},
  {45,"vileplume","grass","poison"},
  {46,"paras","bug","grass"},
  {47,"parasect","bug","grass"},
  {48,"venonat","bug","poison"},
  {49,"venomoth","bug","poison"},
  {50,"diglett","ground"},
  {51,"dugtrio","ground"},
  {52,"meowth","normal"},
  {53,"persian","normal"},
  {54,"psyduck","water"},
  {55,"golduck","water"},
  {56,"mankey","fighting"},
  {57,"primeape","fighting"},
  {58,"growlithe","fire"},
  {59,"arcanine","fire"},
  {60,"poliwag","water"},
  {61,"poliwhirl","water"},
  {62,"poliwrath","water","fighting"},
  {63,"abra","psychic"},
  {64,"kadabra","psychic"},
  {65,"alakazam","psychic"},
  {66,"machop","fighting"},
  {67,"machoke","fighting"},
  {68,"machamp","fighting"},
  {69,"bellsprout","grass","poison"},
  {70,"weepinbell","grass","poison"},
  {71,"victreebel","grass","poison"},
  {72,"tentacool","water","poison"},
  {73,"tentacruel","water","poison"},
  {74,"geodude","rock","ground"},
  {75,"graveler","rock","ground"},
  {76,"golem","rock","ground"},
  {77,"ponyta","fire"},
  {78,"rapidash","fire"},
  {79,"slowpoke","water","psychic"},
  {80,"slowbro","water","psychic"},
  {81,"magnemite","electric","steel"},
  {82,"magneton","electric","steel"},
  {83,"farfetchd","normal","flying"},
  {84,"doduo","normal","flying"},
  {85,"dodrio","normal","flying"},
  {86,"seel","water"},
  {87,"dewgong","water","ice"},
  {88,"grimer","poison"},
  {89,"muk","poison"},
  {90,"shellder","water"},
  {91,"cloyster","water","ice"},
  {92,"gastly","ghost","poison"},
  {93,"haunter","ghost","poison"},
  {94,"gengar","ghost","poison"},
  {95,"onix","rock","ground"},
  {96,"drowzee","psychic"},
  {97,"hypno","psychic"},
  {98,"krabby","water"},
  {99,"kingler","water"},
  {100,"voltorb","electric"},
  {101,"electrode","electric"},
  {102,"exeggcute","grass","psychic"},
  {103,"exeggutor","grass","psychic"},
  {104,"cubone","ground"},
  {105,"marowak","ground"},
  {106,"hitmonlee","fighting"},
  {107,"hitmonchan","fighting"},
  {108,"lickitung","normal"},
  {109,"koffing","poison"},
  {110,"weezing","poison"},
  {111,"rhyhorn","ground","rock"},
  {112,"rhydon","ground","rock"},
  {113,"chansey","normal"},
  {114,"tangela","grass"},
  {115,"kangaskhan","normal"},
  {116,"horsea","water"},
  {117,"seadra","water"},
  {118,"goldeen","water"},
  {119,"seaking","water"},
  {120,"staryu","water"},
  {121,"starmie","water","psychic"},
  {122,"mr-mime","psychic","fairy"},
  {123,"scyther","bug","flying"},
  {124,"jynx","ice","psychic"},
  {125,"electabuzz","electric"},
  {126,"magmar","fire"},
  {127,"pinsir","bug"},
  {128,"tauros","normal"},
  {129,"magikarp","water"},
  {130,"gyarados","water","flying"},
  {131,"lapras","water","ice"},
  {132,"ditto","normal"},
  {133,"eevee","normal"},
  {134,"vaporeon","water"},
  {135,"jolteon","electric"},
  {136,"flareon","fire"},
  {137,"porygon","normal"},
  {138,"omanyte","rock","water"},
  {139,"omastar","rock","water"},
  {140,"kabuto","rock","water"},
  {141,"kabutops","rock","water"},
  {142,"aerodactyl","rock","flying"},
  {143,"snorlax","normal"},
  {144,"articuno","ice","flying"},
  {145,"zapdos","electric","flying"},
  {146,"moltres","fire","flying"},
  {147,"dratini","dragon"},
  {148,"dragonair","dragon"},
  {149,"dragonite","dragon","flying"},
  {150,"mewtwo","psychic"},
  {151,"mew","psychic"},
  {152,"chikorita","grass"},
  {153,"bayleef","grass"},
  {154,"meganium","grass"},
  {155,"cyndaquil","fire"},
  {156,"quilava","fire"},
  {157,"typhlosion","fire"},
  {158,"totodile","water"},
  {159,"croconaw","water"},
  {160,"feraligatr","water"},
  {161,"sentret","normal"},
  {162,"furret","normal"},
  {163,"hoothoot","normal","flying"},
  {164,"noctowl","normal","flying"},
  {165,"ledyba","bug","flying"},
  {166,"ledian","bug","flying"},
  {167,"spinarak","bug","poison"},
  {168,"ariados","bug","poison"},
  {169,"crobat","poison","flying"},
  {170,"chinchou","water","electric"},
  {171,"lanturn","water","electric"},
  {172,"pichu","electric"},
  {173,"cleffa","fairy"},
  {174,"igglybuff","normal","fairy"},
  {175,"togepi","fairy"},
  {176,"togetic","fairy","flying"},
  {177,"natu","psychic","flying"},
  {178,"xatu","psychic","flying"},
  {179,"mareep","electric"},
  {180,"flaaffy","electric"},
  {181,"ampharos","electric"},
  {182,"bellossom","grass"},
  {183,"marill","water","fairy"},
  {184,"azumarill","water","fairy"},
  {185,"sudowoodo","rock"},
  {186,"politoed","water"},
  {187,"hoppip","grass","flying"},
  {188,"skiploom","grass","flying"},
  {189,"jumpluff","grass","flying"},
  {190,"aipom","normal"},
  {191,"sunkern","grass"},
  {192,"sunflora","grass"},
  {193,"yanma","bug","flying"},
  {194,"wooper","water","ground"},
  {195,"quagsire","water","ground"},
  {196,"espeon","psychic"},
  {197,"umbreon","dark"},
  {198,"murkrow","dark","flying"},
  {199,"slowking","water","psychic"},
  {200,"misdreavus","ghost"},
  {201,"unown","psychic"},
  {202,"wobbuffet","psychic"},
  {203,"girafarig","normal","psychic"},
  {204,"pineco","bug"},
  {205,"forretress","bug","steel"},
  {206,"dunsparce","normal"},
  {207,"gligar","ground","flying"},
  {208,"steelix","steel","ground"},
  {209,"snubbull","fairy"},
  {210,"granbull","fairy"},
  {211,"qwilfish","water","poison"},
  {212,"scizor","bug","steel"},
  {213,"shuckle","bug","rock"},
  {214,"heracross","bug","fighting"},
  {215,"sneasel","dark","ice"},
  {216,"teddiursa","normal"},
  {217,"ursaring","normal"},
  {218,"slugma","fire"},
  {219,"magcargo","fire","rock"},
  {220,"swinub","ice","ground"},
  {221,"piloswine","ice","ground"},
  {222,"corsola","water","rock"},
  {223,"remoraid","water"},
  {224,"octillery","water"},
  {225,"delibird","ice","flying"},
  {226,"mantine","water","flying"},
  {227,"skarmory","steel","flying"},
  {228,"houndour","dark","fire"},
  {229,"houndoom","dark","fire"},
  {230,"kingdra","water","dragon"},
  {231,"phanpy","ground"},
  {232,"donphan","ground"},
  {233,"porygon2","normal"},
  {234,"stantler","normal"},
  {235,"smeargle","normal"},
  {236,"tyrogue","fighting"},
  {237,"hitmontop","fighting"},
  {238,"smoochum","ice","psychic"},
  {239,"elekid","electric"},
  {240,"magby","fire"},
  {241,"miltank","normal"},
  {242,"blissey","normal"},
  {243,"raikou","electric"},
  {244,"entei","fire"},
  {245,"suicune","water"},
  {246,"larvitar","rock","ground"},
  {247,"pupitar","rock","ground"},
  {248,"tyranitar","rock","dark"},
  {249,"lugia","psychic","flying"},
  {250,"ho-oh","fire","flying"},
  {251,"celebi","psychic","grass"},
  {252,"treecko","grass"},
  {253,"grovyle","grass"},
  {254,"sceptile","grass"},
  {255,"torchic","fire"},
  {256,"combusken","fire","fighting"},
  {257,"blaziken","fire","fighting"},
  {258,"mudkip","water"},
  {259,"marshtomp","water","ground"},
  {260,"swampert","water","ground"},
  {261,"poochyena","dark"},
  {262,"mightyena","dark"},
  {263,"zigzagoon","normal"},
  {264,"linoone","normal"},
  {265,"wurmple","bug"},
  {266,"silcoon","bug"},
  {267,"beautifly","bug","flying"},
  {268,"cascoon","bug"},
  {269,"dustox","bug","poison"},
  {270,"lotad","water","grass"},
  {271,"lombre","water","grass"},
  {272,"ludicolo","water","grass"},
  {273,"seedot","grass"},
  {274,"nuzleaf","grass","dark"},
  {275,"shiftry","grass","dark"},
  {276,"taillow","normal","flying"},
  {277,"swellow","normal","flying"},
  {278,"wingull","water","flying"},
  {279,"pelipper","water","flying"},
  {280,"ralts","psychic","fairy"},
  {281,"kirlia","psychic","fairy"},
  {282,"gardevoir","psychic","fairy"},
  {283,"surskit","bug","water"},
  {284,"masquerain","bug","flying"},
  {285,"shroomish","grass"},
  {286,"breloom","grass","fighting"},
  {287,"slakoth","normal"},
  {288,"vigoroth","normal"},
  {289,"slaking","normal"},
  {290,"nincada","bug","ground"},
  {291,"ninjask","bug","flying"},
  {292,"shedinja","bug","ghost"},
  {293,"whismur","normal"},
  {294,"loudred","normal"},
  {295,"exploud","normal"},
  {296,"makuhita","fighting"},
  {297,"hariyama","fighting"},
  {298,"azurill","normal","fairy"},
  {299,"nosepass","rock"},
  {300,"skitty","normal"},
  {301,"delcatty","normal"},
  {302,"sableye","dark","ghost"},
  {303,"mawile","steel","fairy"},
  {304,"aron","steel","rock"},
  {305,"lairon","steel","rock"},
  {306,"aggron","steel","rock"},
  {307,"meditite","fighting","psychic"},
  {308,"medicham","fighting","psychic"},
  {309,"electrike","electric"},
  {310,"manectric","electric"},
  {311,"plusle","electric"},
  {312,"minun","electric"},
  {313,"volbeat","bug"},
  {314,"illumise","bug"},
  {315,"roselia","grass","poison"},
  {316,"gulpin","poison"},
  {317,"swalot","poison"},
  {318,"carvanha","water","dark"},
  {319,"sharpedo","water","dark"},
  {320,"wailmer","water"},
  {321,"wailord","water"},
  {322,"numel","fire","ground"},
  {323,"camerupt","fire","ground"},
  {324,"torkoal","fire"},
  {325,"spoink","psychic"},
  {326,"grumpig","psychic"},
  {327,"spinda","normal"},
  {328,"trapinch","ground"},
  {329,"vibrava","ground","dragon"},
  {330,"flygon","ground","dragon"},
  {331,"cacnea","grass"},
  {332,"cacturne","grass","dark"},
  {333,"swablu","normal","flying"},
  {334,"altaria","dragon","flying"},
  {335,"zangoose","normal"},
  {336,"seviper","poison"},
  {337,"lunatone","rock","psychic"},
  {338,"solrock","rock","psychic"},
  {339,"barboach","water","ground"},
  {340,"whiscash","water","ground"},
  {341,"corphish","water"},
  {342,"crawdaunt","water","dark"},
  {343,"baltoy","ground","psychic"},
  {344,"claydol","ground","psychic"},
  {345,"lileep","rock","grass"},
  {346,"cradily","rock","grass"},
  {347,"anorith","rock","bug"},
  {348,"armaldo","rock","bug"},
  {349,"feebas","water"},
  {350,"milotic","water"},
  {351,"castform","normal"},
  {352,"kecleon","normal"},
  {353,"shuppet","ghost"},
  {354,"banette","ghost"},
  {355,"duskull","ghost"},
  {356,"dusclops","ghost"},
  {357,"tropius","grass","flying"},
  {358,"chimecho","psychic"},
  {359,"absol","dark"},
  {360,"wynaut","psychic"},
  {361,"snorunt","ice"},
  {362,"glalie","ice"},
  {363,"spheal","ice","water"},
  {364,"sealeo","ice","water"},
  {365,"walrein","ice","water"},
  {366,"clamperl","water"},
  {367,"huntail","water"},
  {368,"gorebyss","water"},
  {369,"relicanth","water","rock"},
  {370,"luvdisc","water"},
  {371,"bagon","dragon"},
  {372,"shelgon","dragon"},
  {373,"salamence","dragon","flying"},
  {374,"beldum","steel","psychic"},
  {375,"metang","steel","psychic"},
  {376,"metagross","steel","psychic"},
  {377,"regirock","rock"},
  {378,"regice","ice"},
  {379,"registeel","steel"},
  {380,"latias","dragon","psychic"},
  {381,"latios","dragon","psychic"},
  {382,"kyogre","water"},
  {383,"groudon","ground"},
  {384,"rayquaza","dragon","flying"},
  {385,"jirachi","steel","psychic"},
  {386,"deoxys-normal","psychic"},
  {387,"turtwig","grass"},
  {388,"grotle","grass"},
  {389,"torterra","grass","ground"},
  {390,"chimchar","fire"},
  {391,"monferno","fire","fighting"},
  {392,"infernape","fire","fighting"},
  {393,"piplup","water"},
  {394,"prinplup","water"},
  {395,"empoleon","water","steel"},
  {396,"starly","normal","flying"},
  {397,"staravia","normal","flying"},
  {398,"staraptor","normal","flying"},
  {399,"bidoof","normal"},
  {400,"bibarel","normal","water"},
  {401,"kricketot","bug"},
  {402,"kricketune","bug"},
  {403,"shinx","electric"},
  {404,"luxio","electric"},
  {405,"luxray","electric"},
  {406,"budew","grass","poison"},
  {407,"roserade","grass","poison"},
  {408,"cranidos","rock"},
  {409,"rampardos","rock"},
  {410,"shieldon","rock","steel"},
  {411,"bastiodon","rock","steel"},
  {412,"burmy","bug"},
  {413,"wormadam-plant","bug","grass"},
  {414,"mothim","bug","flying"},
  {415,"combee","bug","flying"},
  {416,"vespiquen","bug","flying"},
  {417,"pachirisu","electric"},
  {418,"buizel","water"},
  {419,"floatzel","water"},
  {420,"cherubi","grass"},
  {421,"cherrim","grass"},
  {422,"shellos","water"},
  {423,"gastrodon","water","ground"},
  {424,"ambipom","normal"},
  {425,"drifloon","ghost","flying"},
  {426,"drifblim","ghost","flying"},
  {427,"buneary","normal"},
  {428,"lopunny","normal"},
  {429,"mismagius","ghost"},
  {430,"honchkrow","dark","flying"},
  {431,"glameow","normal"},
  {432,"purugly","normal"},
  {433,"chingling","psychic"},
  {434,"stunky","poison","dark"},
  {435,"skuntank","poison","dark"},
  {436,"bronzor","steel","psychic"},
  {437,"bronzong","steel","psychic"},
  {438,"bonsly","rock"},
  {439,"mime-jr","psychic","fairy"},
  {440,"happiny","normal"},
  {441,"chatot","normal","flying"},
  {442,"spiritomb","ghost","dark"},
  {443,"gible","dragon","ground"},
  {444,"gabite","dragon","ground"},
  {445,"garchomp","dragon","ground"},
  {446,"munchlax","normal"},
  {447,"riolu","fighting"},
  {448,"lucario","fighting","steel"},
  {449,"hippopotas","ground"},
  {450,"hippowdon","ground"},
  {451,"skorupi","poison","bug"},
  {452,"drapion","poison","dark"},
  {453,"croagunk","poison","fighting"},
  {454,"toxicroak","poison","fighting"},
  {455,"carnivine","grass"},
  {456,"finneon","water"},
  {457,"lumineon","water"},
  {458,"mantyke","water","flying"},
  {459,"snover","grass","ice"},
  {460,"abomasnow","grass","ice"},
  {461,"weavile","dark","ice"},
  {462,"magnezone","electric","steel"},
  {463,"lickilicky","normal"},
  {464,"rhyperior","ground","rock"},
  {465,"tangrowth","grass"},
  {466,"electivire","electric"},
  {467,"magmortar","fire"},
  {468,"togekiss","fairy","flying"},
  {469,"yanmega","bug","flying"},
  {470,"leafeon","grass"},
  {471,"glaceon","ice"},
  {472,"gliscor","ground","flying"},
  {473,"mamoswine","ice","ground"},
  {474,"porygon-z","normal"},
  {475,"gallade","psychic","fighting"},
  {476,"probopass","rock","steel"},
  {477,"dusknoir","ghost"},
  {478,"froslass","ice","ghost"},
  {479,"rotom","electric","ghost"},
  {480,"uxie","psychic"},
  {481,"mesprit","psychic"},
  {482,"azelf","psychic"},
  {483,"dialga","steel","dragon"},
  {484,"palkia","water","dragon"},
  {485,"heatran","fire","steel"},
  {486,"regigigas","normal"},
  {487,"giratina-altered","ghost","dragon"},
  {488,"cresselia","psychic"},
  {489,"phione","water"},
  {490,"manaphy","water"},
  {491,"darkrai","dark"},
  {492,"shaymin-land","grass"},
  {493,"arceus","normal"},
  {494,"victini","psychic","fire"},
  {495,"snivy","grass"},
  {496,"servine","grass"},
  {497,"serperior","grass"},
  {498,"tepig","fire"},
  {499,"pignite","fire","fighting"},
  {500,"emboar","fire","fighting"},
  {501,"oshawott","water"},
  {502,"dewott","water"},
  {503,"samurott","water"},
  {504,"patrat","normal"},
  {505,"watchog","normal"},
  {506,"lillipup","normal"},
  {507,"herdier","normal"},
  {508,"stoutland","normal"},
  {509,"purrloin","dark"},
  {510,"liepard","dark"},
  {511,"pansage","grass"},
  {512,"simisage","grass"},
  {513,"pansear","fire"},
  {514,"simisear","fire"},
  {515,"panpour","water"},
  {516,"simipour","water"},
  {517,"munna","psychic"},
  {518,"musharna","psychic"},
  {519,"pidove","normal","flying"},
  {520,"tranquill","normal","flying"},
  {521,"unfezant","normal","flying"},
  {522,"blitzle","electric"},
  {523,"zebstrika","electric"},
  {524,"roggenrola","rock"},
  {525,"boldore","rock"},
  {526,"gigalith","rock"},
  {527,"woobat","psychic","flying"},
  {528,"swoobat","psychic","flying"},
  {529,"drilbur","ground"},
  {530,"excadrill","ground","steel"},
  {531,"audino","normal"},
  {532,"timburr","fighting"},
  {533,"gurdurr","fighting"},
  {534,"conkeldurr","fighting"},
  {535,"tympole","water"},
  {536,"palpitoad","water","ground"},
  {537,"seismitoad","water","ground"},
  {538,"throh","fighting"},
  {539,"sawk","fighting"},
  {540,"sewaddle","bug","grass"},
  {541,"swadloon","bug","grass"},
  {542,"leavanny","bug","grass"},
  {543,"venipede","bug","poison"},
  {544,"whirlipede","bug","poison"},
  {545,"scolipede","bug","poison"},
  {546,"cottonee","grass","fairy"},
  {547,"whimsicott","grass","fairy"},
  {548,"petilil","grass"},
  {549,"lilligant","grass"},
  {550,"basculin-red-striped","water"},
  {551,"sandile","ground","dark"},
  {552,"krokorok","ground","dark"},
  {553,"krookodile","ground","dark"},
  {554,"darumaka","fire"},
  {555,"darmanitan-standard","fire"},
  {556,"maractus","grass"},
  {557,"dwebble","bug","rock"},
  {558,"crustle","bug","rock"},
  {559,"scraggy","dark","fighting"},
  {560,"scrafty","dark","fighting"},
  {561,"sigilyph","psychic","flying"},
  {562,"yamask","ghost"},
  {563,"cofagrigus","ghost"},
  {564,"tirtouga","water","rock"},
  {565,"carracosta","water","rock"},
  {566,"archen","rock","flying"},
  {567,"archeops","rock","flying"},
  {568,"trubbish","poison"},
  {569,"garbodor","poison"},
  {570,"zorua","dark"},
  {571,"zoroark","dark"},
  {572,"minccino","normal"},
  {573,"cinccino","normal"},
  {574,"gothita","psychic"},
  {575,"gothorita","psychic"},
  {576,"gothitelle","psychic"},
  {577,"solosis","psychic"},
  {578,"duosion","psychic"},
  {579,"reuniclus","psychic"},
  {580,"ducklett","water","flying"},
  {581,"swanna","water","flying"},
  {582,"vanillite","ice"},
  {583,"vanillish","ice"},
  {584,"vanilluxe","ice"},
  {585,"deerling","normal","grass"},
  {586,"sawsbuck","normal","grass"},
  {587,"emolga","electric","flying"},
  {588,"karrablast","bug"},
  {589,"escavalier","bug","steel"},
  {590,"foongus","grass","poison"},
  {591,"amoonguss","grass","poison"},
  {592,"frillish-male","water","ghost"},
  {593,"jellicent-male","water","ghost"},
  {594,"alomomola","water"},
  {595,"joltik","bug","electric"},
  {596,"galvantula","bug","electric"},
  {597,"ferroseed","grass","steel"},
  {598,"ferrothorn","grass","steel"},
  {599,"klink","steel"},
  {600,"klang","steel"},
  {601,"klinklang","steel"},
  {602,"tynamo","electric"},
  {603,"eelektrik","electric"},
  {604,"eelektross","electric"},
  {605,"elgyem","psychic"},
  {606,"beheeyem","psychic"},
  {607,"litwick","ghost","fire"},
  {608,"lampent","ghost","fire"},
  {609,"chandelure","ghost","fire"},
  {610,"axew","dragon"},
  {611,"fraxure","dragon"},
  {612,"haxorus","dragon"},
  {613,"cubchoo","ice"},
  {614,"beartic","ice"},
  {615,"cryogonal","ice"},
  {616,"shelmet","bug"},
  {617,"accelgor","bug"},
  {618,"stunfisk","ground","electric"},
  {619,"mienfoo","fighting"},
  {620,"mienshao","fighting"},
  {621,"druddigon","dragon"},
  {622,"golett","ground","ghost"},
  {623,"golurk","ground","ghost"},
  {624,"pawniard","dark","steel"},
  {625,"bisharp","dark","steel"},
  {626,"bouffalant","normal"},
  {627,"rufflet","normal","flying"},
  {628,"braviary","normal","flying"},
  {629,"vullaby","dark","flying"},
  {630,"mandibuzz","dark","flying"},
  {631,"heatmor","fire"},
  {632,"durant","bug","steel"},
  {633,"deino","dark","dragon"},
  {634,"zweilous","dark","dragon"},
  {635,"hydreigon","dark","dragon"},
  {636,"larvesta","bug","fire"},
  {637,"volcarona","bug","fire"},
  {638,"cobalion","steel","fighting"},
  {639,"terrakion","rock","fighting"},
  {640,"virizion","grass","fighting"},
  {641,"tornadus-incarnate","flying"},
  {642,"thundurus-incarnate","electric","flying"},
  {643,"reshiram","dragon","fire"},
  {644,"zekrom","dragon","electric"},
  {645,"landorus-incarnate","ground","flying"},
  {646,"kyurem","dragon","ice"},
  {647,"keldeo-ordinary","water","fighting"},
  {648,"meloetta-aria","normal","psychic"},
  {649,"genesect","bug","steel"},
  {650,"chespin","grass"},
  {651,"quilladin","grass"},
  {652,"chesnaught","grass","fighting"},
  {653,"fennekin","fire"},
  {654,"braixen","fire"},
  {655,"delphox","fire","psychic"},
  {656,"froakie","water"},
  {657,"frogadier","water"},
  {658,"greninja","water","dark"},
  {659,"bunnelby","normal"},
  {660,"diggersby","normal","ground"},
  {661,"fletchling","normal","flying"},
  {662,"fletchinder","fire","flying"},
  {663,"talonflame","fire","flying"},
  {664,"scatterbug","bug"},
  {665,"spewpa","bug"},
  {666,"vivillon","bug","flying"},
  {667,"litleo","fire","normal"},
  {668,"pyroar-male","fire","normal"},
  {669,"flabebe","fairy"},
  {670,"floette","fairy"},
  {671,"florges","fairy"},
  {672,"skiddo","grass"},
  {673,"gogoat","grass"},
  {674,"pancham","fighting"},
  {675,"pangoro","fighting","dark"},
  {676,"furfrou","normal"},
  {677,"espurr","psychic"},
  {678,"meowstic-male","psychic"},
  {679,"honedge","steel","ghost"},
  {680,"doublade","steel","ghost"},
  {681,"aegislash-shield","steel","ghost"},
  {682,"spritzee","fairy"},
  {683,"aromatisse","fairy"},
  {684,"swirlix","fairy"},
  {685,"slurpuff","fairy"},
  {686,"inkay","dark","psychic"},
  {687,"malamar","dark","psychic"},
  {688,"binacle","rock","water"},
  {689,"barbaracle","rock","water"},
  {690,"skrelp","poison","water"},
  {691,"dragalge","poison","dragon"},
  {692,"clauncher","water"},
  {693,"clawitzer","water"},
  {694,"helioptile","electric","normal"},
  {695,"heliolisk","electric","normal"},
  {696,"tyrunt","rock","dragon"},
  {697,"tyrantrum","rock","dragon"},
  {698,"amaura","rock","ice"},
  {699,"aurorus","rock","ice"},
  {700,"sylveon","fairy"},
  {701,"hawlucha","fighting","flying"},
  {702,"dedenne","electric","fairy"},
  {703,"carbink","rock","fairy"},
  {704,"goomy","dragon"},
  {705,"sliggoo","dragon"},
  {706,"goodra","dragon"},
  {707,"klefki","steel","fairy"},
  {708,"phantump","ghost","grass"},
  {709,"trevenant","ghost","grass"},
  {710,"pumpkaboo-average","ghost","grass"},
  {711,"gourgeist-average","ghost","grass"},
  {712,"bergmite","ice"},
  {713,"avalugg","ice"},
  {714,"noibat","flying","dragon"},
  {715,"noivern","flying","dragon"},
  {716,"xerneas","fairy"},
  {717,"yveltal","dark","flying"},
  {718,"zygarde-50","dragon","ground"},
  {719,"diancie","rock","fairy"},
  {720,"hoopa","psychic","ghost"},
  {721,"volcanion","fire","water"},
  {722,"rowlet","grass","flying"},
  {723,"dartrix","grass","flying"},
  {724,"decidueye","grass","ghost"},
  {725,"litten","fire"},
  {726,"torracat","fire"},
  {727,"incineroar","fire","dark"},
  {728,"popplio","water"},
  {729,"brionne","water"},
  {730,"primarina","water","fairy"},
  {731,"pikipek","normal","flying"},
  {732,"trumbeak","normal","flying"},
  {733,"toucannon","normal","flying"},
  {734,"yungoos","normal"},
  {735,"gumshoos","normal"},
  {736,"grubbin","bug"},
  {737,"charjabug","bug","electric"},
  {738,"vikavolt","bug","electric"},
  {739,"crabrawler","fighting"},
  {740,"crabominable","fighting","ice"},
  {741,"oricorio-baile","fire","flying"},
  {742,"cutiefly","bug","fairy"},
  {743,"ribombee","bug","fairy"},
  {744,"rockruff","rock"},
  {745,"lycanroc-midday","rock"},
  {746,"wishiwashi-solo","water"},
  {747,"mareanie","poison","water"},
  {748,"toxapex","poison","water"},
  {749,"mudbray","ground"},
  {750,"mudsdale","ground"},
  {751,"dewpider","water","bug"},
  {752,"araquanid","water","bug"},
  {753,"fomantis","grass"},
  {754,"lurantis","grass"},
  {755,"morelull","grass","fairy"},
  {756,"shiinotic","grass","fairy"},
  {757,"salandit","poison","fire"},
  {758,"salazzle","poison","fire"},
  {759,"stufful","normal","fighting"},
  {760,"bewear","normal","fighting"},
  {761,"bounsweet","grass"},
  {762,"steenee","grass"},
  {763,"tsareena","grass"},
  {764,"comfey","fairy"},
  {765,"oranguru","normal","psychic"},
  {766,"passimian","fighting"},
  {767,"wimpod","bug","water"},
  {768,"golisopod","bug","water"},
  {769,"sandygast","ghost","ground"},
  {770,"palossand","ghost","ground"},
  {771,"pyukumuku","water"},
  {772,"type-null","normal"},
  {773,"silvally","normal"},
  {774,"minior-red-meteor","rock","flying"},
  {775,"komala","normal"},
  {776,"turtonator","fire","dragon"},
  {777,"togedemaru","electric","steel"},
  {778,"mimikyu-disguised","ghost","fairy"},
  {779,"bruxish","water","psychic"},
  {780,"drampa","normal","dragon"},
  {781,"dhelmise","ghost","grass"},
  {782,"jangmo-o","dragon"},
  {783,"hakamo-o","dragon","fighting"},
  {784,"kommo-o","dragon","fighting"},
  {785,"tapu-koko","electric","fairy"},
  {786,"tapu-lele","psychic","fairy"},
  {787,"tapu-bulu","grass","fairy"},
  {788,"tapu-fini","water","fairy"},
  {789,"cosmog","psychic"},
  {790,"cosmoem","psychic"},
  {791,"solgaleo","psychic","steel"},
  {792,"lunala","psychic","ghost"},
  {793,"nihilego","rock","poison"},
  {794,"buzzwole","bug","fighting"},
  {795,"pheromosa","bug","fighting"},
  {796,"xurkitree","electric"},
  {797,"celesteela","steel","flying"},
  {798,"kartana","grass","steel"},
  {799,"guzzlord","dark","dragon"},
  {800,"necrozma","psychic"},
  {801,"magearna","steel","fairy"},
  {802,"marshadow","fighting","ghost"},
  {803,"poipole","poison"},
  {804,"naganadel","poison","dragon"},
  {805,"stakataka","rock","steel"},
  {806,"blacephalon","fire","ghost"},
  {807,"zeraora","electric"},
  {808,"meltan","steel"},
  {809,"melmetal","steel"},
  {810,"grookey","grass"},
  {811,"thwackey","grass"},
  {812,"rillaboom","grass"},
  {813,"scorbunny","fire"},
  {814,"raboot","fire"},
  {815,"cinderace","fire"},
  {816,"sobble","water"},
  {817,"drizzile","water"},
  {818,"inteleon","water"},
  {819,"skwovet","normal"},
  {820,"greedent","normal"},
  {821,"rookidee","flying"},
  {822,"corvisquire","flying"},
  {823,"corviknight","flying","steel"},
  {824,"blipbug","bug"},
  {825,"dottler","bug","psychic"},
  {826,"orbeetle","bug","psychic"},
  {827,"nickit","dark"},
  {828,"thievul","dark"},
  {829,"gossifleur","grass"},
  {830,"eldegoss","grass"},
  {831,"wooloo","normal"},
  {832,"dubwool","normal"},
  {833,"chewtle","water"},
  {834,"drednaw","water","rock"},
  {835,"yamper","electric"},
  {836,"boltund","electric"},
  {837,"rolycoly","rock"},
  {838,"carkol","rock","fire"},
  {839,"coalossal","rock","fire"},
  {840,"applin","grass","dragon"},
  {841,"flapple","grass","dragon"},
  {842,"appletun","grass","dragon"},
  {843,"silicobra","ground"},
  {844,"sandaconda","ground"},
  {845,"cramorant","flying","water"},
  {846,"arrokuda","water"},
  {847,"barraskewda","water"},
  {848,"toxel","electric","poison"},
  {849,"toxtricity-amped","electric","poison"},
  {850,"sizzlipede","fire","bug"},
  {851,"centiskorch","fire","bug"},
  {852,"clobbopus","fighting"},
  {853,"grapploct","fighting"},
  {854,"sinistea","ghost"},
  {855,"polteageist","ghost"},
  {856,"hatenna","psychic"},
  {857,"hattrem","psychic"},
  {858,"hatterene","psychic","fairy"},
  {859,"impidimp","dark","fairy"},
  {860,"morgrem","dark","fairy"},
  {861,"grimmsnarl","dark","fairy"},
  {862,"obstagoon","dark","normal"},
  {863,"perrserker","steel"},
  {864,"cursola","ghost"},
  {865,"sirfetchd","fighting"},
  {866,"mr-rime","ice","psychic"},
  {867,"runerigus","ground","ghost"},
  {868,"milcery","fairy"},
  {869,"alcremie","fairy"},
  {870,"falinks","fighting"},
  {871,"pincurchin","electric"},
  {872,"snom","ice","bug"},
  {873,"frosmoth","ice","bug"},
  {874,"stonjourner","rock"},
  {875,"eiscue-ice","ice"},
  {876,"indeedee-male","psychic","normal"},
  {877,"morpeko-full-belly","electric","dark"},
  {878,"cufant","steel"},
  {879,"copperajah","steel"},
  {880,"dracozolt","electric","dragon"},
  {881,"arctozolt","electric","ice"},
  {882,"dracovish","water","dragon"},
  {883,"arctovish","water","ice"},
  {884,"duraludon","steel","dragon"},
  {885,"dreepy","dragon","ghost"},
  {886,"drakloak","dragon","ghost"},
  {887,"dragapult","dragon","ghost"},
  {888,"zacian","fairy"},
  {889,"zamazenta","fighting"},
  {890,"eternatus","poison","dragon"},
  {891,"kubfu","fighting"},
  {892,"urshifu-single-strike","fighting","dark"},
  {893,"zarude","dark","grass"},
  {894,"regieleki","electric"},
  {895,"regidrago","dragon"},
  {896,"glastrier","ice"},
  {897,"spectrier","ghost"},
  {898,"calyrex","psychic","grass"},
  {899,"wyrdeer","normal","psychic"},
  {900,"kleavor","bug","rock"},
  {901,"ursaluna","ground","normal"},
  {902,"basculegion-male","water","ghost"},
  {903,"sneasler","fighting","poison"},
  {904,"overqwil","dark","poison"},
  {905,"enamorus-incarnate","fairy","flying"},
  {906,"sprigatito","grass"},
  {907,"floragato","grass"},
  {908,"meowscarada","grass","dark"},
  {909,"fuecoco","fire"},
  {910,"crocalor","fire"},
  {911,"skeledirge","fire","ghost"},
  {912,"quaxly","water"},
  {913,"quaxwell","water"},
  {914,"quaquaval","water","fighting"},
  {915,"lechonk","normal"},
  {916,"oinkologne-male","normal"},
  {917,"tarountula","bug"},
  {918,"spidops","bug"},
  {919,"nymble","bug"},
  {920,"lokix","bug","dark"},
  {921,"pawmi","electric"},
  {922,"pawmo","electric","fighting"},
  {923,"pawmot","electric","fighting"},
  {924,"tandemaus","normal"},
  {925,"maushold-family-of-four","normal"},
  {926,"fidough","fairy"},
  {927,"dachsbun","fairy"},
  {928,"smoliv","grass","normal"},
  {929,"dolliv","grass","normal"},
  {930,"arboliva","grass","normal"},
  {931,"squawkabilly-green-plumage","normal","flying"},
  {932,"nacli","rock"},
  {933,"naclstack","rock"},
  {934,"garganacl","rock"},
  {935,"charcadet","fire"},
  {936,"armarouge","fire","psychic"},
  {937,"ceruledge","fire","ghost"},
  {938,"tadbulb","electric"},
  {939,"bellibolt","electric"},
  {940,"wattrel","electric","flying"},
  {941,"kilowattrel","electric","flying"},
  {942,"maschiff","dark"},
  {943,"mabosstiff","dark"},
  {944,"shroodle","poison","normal"},
  {945,"grafaiai","poison","normal"},
  {946,"bramblin","grass","ghost"},
  {947,"brambleghast","grass","ghost"},
  {948,"toedscool","ground","grass"},
  {949,"toedscruel","ground","grass"},
  {950,"klawf","rock"},
  {951,"capsakid","grass"},
  {952,"scovillain","grass","fire"},
  {953,"rellor","bug"},
  {954,"rabsca","bug","psychic"},
  {955,"flittle","psychic"},
  {956,"espathra","psychic"},
  {957,"tinkatink","fairy","steel"},
  {958,"tinkatuff","fairy","steel"},
  {959,"tinkaton","fairy","steel"},
  {960,"wiglett","water"},
  {961,"wugtrio","water"},
  {962,"bombirdier","flying","dark"},
  {963,"finizen","water"},
  {964,"palafin-zero","water"},
  {965,"varoom","steel","poison"},
  {966,"revavroom","steel","poison"},
  {967,"cyclizar","dragon","normal"},
  {968,"orthworm","steel"},
  {969,"glimmet","rock","poison"},
  {970,"glimmora","rock","poison"},
  {971,"greavard","ghost"},
  {972,"houndstone","ghost"},
  {973,"flamigo","flying","fighting"},
  {974,"cetoddle","ice"},
  {975,"cetitan","ice"},
  {976,"veluza","water","psychic"},
  {977,"dondozo","water"},
  {978,"tatsugiri-curly","dragon","water"},
  {979,"annihilape","fighting","ghost"},
  {980,"clodsire","poison","ground"},
  {981,"farigiraf","normal","psychic"},
  {982,"dudunsparce-two-segment","normal"},
  {983,"kingambit","dark","steel"},
  {984,"great-tusk","ground","fighting"},
  {985,"scream-tail","fairy","psychic"},
  {986,"brute-bonnet","grass","dark"},
  {987,"flutter-mane","ghost","fairy"},
  {988,"slither-wing","bug","fighting"},
  {989,"sandy-shocks","electric","ground"},
  {990,"iron-treads","ground","steel"},
  {991,"iron-bundle","ice","water"},
  {992,"iron-hands","fighting","electric"},
  {993,"iron-jugulis","dark","flying"},
  {994,"iron-moth","fire","poison"},
  {995,"iron-thorns","rock","electric"},
  {996,"frigibax","dragon","ice"},
  {997,"arctibax","dragon","ice"},
  {998,"baxcalibur","dragon","ice"},
  {999,"gimmighoul","ghost"},
  {1000,"gholdengo","steel","ghost"},
  {1001,"wo-chien","dark","grass"},
  {1002,"chien-pao","dark","ice"},
  {1003,"ting-lu","dark","ground"},
  {1004,"chi-yu","dark","fire"},
  {1005,"roaring-moon","dragon","dark"},
  {1006,"iron-valiant","fairy","fighting"},
  {1007,"koraidon","fighting","dragon"},
  {1008,"miraidon","electric","dragon"},
  {1009,"walking-wake","water","dragon"},
  {1010,"iron-leaves","grass","psychic"},
  {1011,"dipplin","grass","dragon"},
  {1012,"poltchageist","grass","ghost"},
  {1013,"sinistcha","grass","ghost"},
  {1014,"okidogi","poison","fighting"},
  {1015,"munkidori","poison","psychic"},
  {1016,"fezandipiti","poison","fairy"},
  {1017,"ogerpon","grass"},
  {1018,"archaludon","steel","dragon"},
  {1019,"hydrapple","grass","dragon"},
  {1020,"gouging-fire","fire","dragon"},
  {1021,"raging-bolt","electric","dragon"},
  {1022,"iron-boulder","rock","psychic"},
  {1023,"iron-crown","steel","psychic"},
  {1024,"terapagos","normal"},
  {1025,"pecharunt","poison","ghost"},
  {10001,"deoxys-attack","psychic"},
  {10002,"deoxys-defense","psychic"},
  {10003,"deoxys-speed","psychic"},
  {10004,"wormadam-sandy","bug","ground"},
  {10005,"wormadam-trash","bug","steel"},
  {10006,"shaymin-sky","grass","flying"},
  {10007,"giratina-origin","ghost","dragon"},
  {10008,"rotom-heat","electric","fire"},
  {10009,"rotom-wash","electric","water"},
  {10010,"rotom-frost","electric","ice"},
  {10011,"rotom-fan","electric","flying"},
  {10012,"rotom-mow","electric","grass"},
  {10013,"castform-sunny","fire"},
  {10014,"castform-rainy","water"},
  {10015,"castform-snowy","ice"},
  {10016,"basculin-blue-striped","water"},
  {10017,"darmanitan-zen","fire","psychic"},
  {10018,"meloetta-pirouette","normal","fighting"},
  {10019,"tornadus-therian","flying"},
  {10020,"thundurus-therian","electric","flying"},
  {10021,"landorus-therian","ground","flying"},
  {10022,"kyurem-black","dragon","ice"},
  {10023,"kyurem-white","dragon","ice"},
  {10024,"keldeo-resolute","water","fighting"},
  {10025,"meowstic-female","psychic"},
  {10026,"aegislash-blade","steel","ghost"},
  {10027,"pumpkaboo-small","ghost","grass"},
  {10028,"pumpkaboo-large","ghost","grass"},
  {10029,"pumpkaboo-super","ghost","grass"},
  {10030,"gourgeist-small","ghost","grass"},
  {10031,"gourgeist-large","ghost","grass"},
  {10032,"gourgeist-super","ghost","grass"},
  {10033,"venusaur-mega","grass","poison"},
  {10034,"charizard-mega-x","fire","dragon"},
  {10035,"charizard-mega-y","fire","flying"},
  {10036,"blastoise-mega","water"},
  {10037,"alakazam-mega","psychic"},
  {10038,"gengar-mega","ghost","poison"},
  {10039,"kangaskhan-mega","normal"},
  {10040,"pinsir-mega","bug","flying"},
  {10041,"gyarados-mega","water","dark"},
  {10042,"aerodactyl-mega","rock","flying"},
  {10043,"mewtwo-mega-x","psychic","fighting"},
  {10044,"mewtwo-mega-y","psychic"},
  {10045,"ampharos-mega","electric","dragon"},
  {10046,"scizor-mega","bug","steel"},
  {10047,"heracross-mega","bug","fighting"},
  {10048,"houndoom-mega","dark","fire"},
  {10049,"tyranitar-mega","rock","dark"},
  {10050,"blaziken-mega","fire","fighting"},
  {10051,"gardevoir-mega","psychic","fairy"},
  {10052,"mawile-mega","steel","fairy"},
  {10053,"aggron-mega","steel"},
  {10054,"medicham-mega","fighting","psychic"},
  {10055,"manectric-mega","electric"},
  {10056,"banette-mega","ghost"},
  {10057,"absol-mega","dark"},
  {10058,"garchomp-mega","dragon","ground"},
  {10059,"lucario-mega","fighting","steel"},
  {10060,"abomasnow-mega","grass","ice"},
  {10061,"floette-eternal","fairy"},
  {10062,"latias-mega","dragon","psychic"},
  {10063,"latios-mega","dragon","psychic"},
  {10064,"swampert-mega","water","ground"},
  {10065,"sceptile-mega","grass","dragon"},
  {10066,"sableye-mega","dark","ghost"},
  {10067,"altaria-mega","dragon","fairy"},
  {10068,"gallade-mega","psychic","fighting"},
  {10069,"audino-mega","normal","fairy"},
  {10070,"sharpedo-mega","water","dark"},
  {10071,"slowbro-mega","water","psychic"},
  {10072,"steelix-mega","steel","ground"},
  {10073,"pidgeot-mega","normal","flying"},
  {10074,"glalie-mega","ice"},
  {10075,"diancie-mega","rock","fairy"},
  {10076,"metagross-mega","steel","psychic"},
  {10077,"kyogre-primal","water"},
  {10078,"groudon-primal","ground","fire"},
  {10079,"rayquaza-mega","dragon","flying"},
  {10080,"pikachu-rock-star","electric"},
  {10081,"pikachu-belle","electric"},
  {10082,"pikachu-pop-star","electric"},
  {10083,"pikachu-phd","electric"},
  {10084,"pikachu-libre","electric"},
  {10085,"pikachu-cosplay","electric"},
  {10086,"hoopa-unbound","psychic","dark"},
  {10087,"camerupt-mega","fire","ground"},
  {10088,"lopunny-mega","normal","fighting"},
  {10089,"salamence-mega","dragon","flying"},
  {10090,"beedrill-mega","bug","poison"},
  {10091,"rattata-alola","dark","normal"},
  {10092,"raticate-alola","dark","normal"},
  {10093,"raticate-totem-alola","dark","normal"},
  {10094,"pikachu-original-cap","electric"},
  {10095,"pikachu-hoenn-cap","electric"},
  {10096,"pikachu-sinnoh-cap","electric"},
  {10097,"pikachu-unova-cap","electric"},
  {10098,"pikachu-kalos-cap","electric"},
  {10099,"pikachu-alola-cap","electric"},
  {10100,"raichu-alola","electric","psychic"},
  {10101,"sandshrew-alola","ice","steel"},
  {10102,"sandslash-alola","ice","steel"},
  {10103,"vulpix-alola","ice"},
  {10104,"ninetales-alola","ice","fairy"},
  {10105,"diglett-alola","ground","steel"},
  {10106,"dugtrio-alola","ground","steel"},
  {10107,"meowth-alola","dark"},
  {10108,"persian-alola","dark"},
  {10109,"geodude-alola","rock","electric"},
  {10110,"graveler-alola","rock","electric"},
  {10111,"golem-alola","rock","electric"},
  {10112,"grimer-alola","poison","dark"},
  {10113,"muk-alola","poison","dark"},
  {10114,"exeggutor-alola","grass","dragon"},
  {10115,"marowak-alola","fire","ghost"},
  {10116,"greninja-battle-bond","water","dark"},
  {10117,"greninja-ash","water","dark"},
  {10118,"zygarde-10-power-construct","dragon","ground"},
  {10119,"zygarde-50-power-construct","dragon","ground"},
  {10120,"zygarde-complete","dragon","ground"},
  {10121,"gumshoos-totem","normal"},
  {10122,"vikavolt-totem","bug","electric"},
  {10123,"oricorio-pom-pom","electric","flying"},
  {10124,"oricorio-pau","psychic","flying"},
  {10125,"oricorio-sensu","ghost","flying"},
  {10126,"lycanroc-midnight","rock"},
  {10127,"wishiwashi-school","water"},
  {10128,"lurantis-totem","grass"},
  {10129,"salazzle-totem","poison","fire"},
  {10130,"minior-orange-meteor","rock","flying"},
  {10131,"minior-yellow-meteor","rock","flying"},
  {10132,"minior-green-meteor","rock","flying"},
  {10133,"minior-blue-meteor","rock","flying"},
  {10134,"minior-indigo-meteor","rock","flying"},
  {10135,"minior-violet-meteor","rock","flying"},
  {10136,"minior-red","rock","flying"},
  {10137,"minior-orange","rock","flying"},
  {10138,"minior-yellow","rock","flying"},
  {10139,"minior-green","rock","flying"},
  {10140,"minior-blue","rock","flying"},
  {10141,"minior-indigo","rock","flying"},
  {10142,"minior-violet","rock","flying"},
  {10143,"mimikyu-busted","ghost","fairy"},
  {10144,"mimikyu-totem-disguised","ghost","fairy"},
  {10145,"mimikyu-totem-busted","ghost","fairy"},
  {10146,"kommo-o-totem","dragon","fighting"},
  {10147,"magearna-original","steel","fairy"},
  {10148,"pikachu-partner-cap","electric"},
  {10149,"marowak-totem","fire","ghost"},
  {10150,"ribombee-totem","bug","fairy"},
  {10151,"rockruff-own-tempo","rock"},
  {10152,"lycanroc-dusk","rock"},
  {10153,"araquanid-totem","water","bug"},
  {10154,"togedemaru-totem","electric","steel"},
  {10155,"necrozma-dusk","psychic","steel"},
  {10156,"necrozma-dawn","psychic","ghost"},
  {10157,"necrozma-ultra","psychic","dragon"},
  {10158,"pikachu-starter","electric"},
  {10159,"eevee-starter","normal"},
  {10160,"pikachu-world-cap","electric"},
  {10161,"meowth-galar","steel"},
  {10162,"ponyta-galar","psychic"},
  {10163,"rapidash-galar","psychic","fairy"},
  {10164,"slowpoke-galar","psychic"},
  {10165,"slowbro-galar","poison","psychic"},
  {10166,"farfetchd-galar","fighting"},
  {10167,"weezing-galar","poison","fairy"},
  {10168,"mr-mime-galar","ice","psychic"},
  {10169,"articuno-galar","psychic","flying"},
  {10170,"zapdos-galar","fighting","flying"},
  {10171,"moltres-galar","dark","flying"},
  {10172,"slowking-galar","poison","psychic"},
  {10173,"corsola-galar","ghost"},
  {10174,"zigzagoon-galar","dark","normal"},
  {10175,"linoone-galar","dark","normal"},
  {10176,"darumaka-galar","ice"},
  {10177,"darmanitan-galar-standard","ice"},
  {10178,"darmanitan-galar-zen","ice","fire"},
  {10179,"yamask-galar","ground","ghost"},
  {10180,"stunfisk-galar","ground","steel"},
  {10181,"zygarde-10","dragon","ground"},
  {10182,"cramorant-gulping","flying","water"},
  {10183,"cramorant-gorging","flying","water"},
  {10184,"toxtricity-low-key","electric","poison"},
  {10185,"eiscue-noice","ice"},
  {10186,"indeedee-female","psychic","normal"},
  {10187,"morpeko-hangry","electric","dark"},
  {10188,"zacian-crowned","fairy","steel"},
  {10189,"zamazenta-crowned","fighting","steel"},
  {10190,"eternatus-eternamax","poison","dragon"},
  {10191,"urshifu-rapid-strike","fighting","water"},
  {10192,"zarude-dada","dark","grass"},
  {10193,"calyrex-ice","psychic","ice"},
  {10194,"calyrex-shadow","psychic","ghost"},
  {10195,"venusaur-gmax","grass","poison"},
  {10196,"charizard-gmax","fire","flying"},
  {10197,"blastoise-gmax","water"},
  {10198,"butterfree-gmax","bug","flying"},
  {10199,"pikachu-gmax","electric"},
  {10200,"meowth-gmax","normal"},
  {10201,"machamp-gmax","fighting"},
  {10202,"gengar-gmax","ghost","poison"},
  {10203,"kingler-gmax","water"},
  {10204,"lapras-gmax","water","ice"},
  {10205,"eevee-gmax","normal"},
  {10206,"snorlax-gmax","normal"},
  {10207,"garbodor-gmax","poison"},
  {10208,"melmetal-gmax","steel"},
  {10209,"rillaboom-gmax","grass"},
  {10210,"cinderace-gmax","fire"},
  {10211,"inteleon-gmax","water"},
  {10212,"corviknight-gmax","flying","steel"},
  {10213,"orbeetle-gmax","bug","psychic"},
  {10214,"drednaw-gmax","water","rock"},
  {10215,"coalossal-gmax","rock","fire"},
  {10216,"flapple-gmax","grass","dragon"},
  {10217,"appletun-gmax","grass","dragon"},
  {10218,"sandaconda-gmax","ground"},
  {10219,"toxtricity-amped-gmax","electric","poison"},
  {10220,"centiskorch-gmax","fire","bug"},
  {10221,"hatterene-gmax","psychic","fairy"},
  {10222,"grimmsnarl-gmax","dark","fairy"},
  {10223,"alcremie-gmax","fairy"},
  {10224,"copperajah-gmax","steel"},
  {10225,"duraludon-gmax","steel","dragon"},
  {10226,"urshifu-single-strike-gmax","fighting","dark"},
  {10227,"urshifu-rapid-strike-gmax","fighting","water"},
  {10228,"toxtricity-low-key-gmax","electric","poison"},
  {10229,"growlithe-hisui","fire","rock"},
  {10230,"arcanine-hisui","fire","rock"},
  {10231,"voltorb-hisui","electric","grass"},
  {10232,"electrode-hisui","electric","grass"},
  {10233,"typhlosion-hisui","fire","ghost"},
  {10234,"qwilfish-hisui","dark","poison"},
  {10235,"sneasel-hisui","fighting","poison"},
  {10236,"samurott-hisui","water","dark"},
  {10237,"lilligant-hisui","grass","fighting"},
  {10238,"zorua-hisui","normal","ghost"},
  {10239,"zoroark-hisui","normal","ghost"},
  {10240,"braviary-hisui","psychic","flying"},
  {10241,"sliggoo-hisui","steel","dragon"},
  {10242,"goodra-hisui","steel","dragon"},
  {10243,"avalugg-hisui","ice","rock"},
  {10244,"decidueye-hisui","grass","fighting"},
  {10245,"dialga-origin","steel","dragon"},
  {10246,"palkia-origin","water","dragon"},
  {10247,"basculin-white-striped","water"},
  {10248,"basculegion-female","water","ghost"},
  {10249,"enamorus-therian","fairy","flying"},
  {10250,"tauros-paldea-combat-breed","fighting"},
  {10251,"tauros-paldea-blaze-breed","fighting","fire"},
  {10252,"tauros-paldea-aqua-breed","fighting","water"},
  {10253,"wooper-paldea","poison","ground"},
  {10254,"oinkologne-female","normal"},
  {10255,"dudunsparce-three-segment","normal"},
  {10256,"palafin-hero","water"},
  {10257,"maushold-family-of-three","normal"},
  {10258,"tatsugiri-droopy","dragon","water"},
  {10259,"tatsugiri-stretchy","dragon","water"},
  {10260,"squawkabilly-blue-plumage","normal","flying"},
  {10261,"squawkabilly-yellow-plumage","normal","flying"},
  {10262,"squawkabilly-white-plumage","normal","flying"},
  {10263,"gimmighoul-roaming","ghost"},
  {10264,"koraidon-limited-build","fighting","dragon"},
  {10265,"koraidon-sprinting-build","fighting","dragon"},
  {10266,"koraidon-swimming-build","fighting","dragon"},
  {10267,"koraidon-gliding-build","fighting","dragon"},
  {10268,"miraidon-low-power-mode","electric","dragon"},
  {10269,"miraidon-drive-mode","electric","dragon"},
  {10270,"miraidon-aquatic-mode","electric","dragon"},
  {10271,"miraidon-glide-mode","electric","dragon"},
  {10272,"ursaluna-bloodmoon","ground","normal"},
  {10273,"ogerpon-wellspring-mask","grass","water"},
  {10274,"ogerpon-hearthflame-mask","grass","fire"},
  {10275,"ogerpon-cornerstone-mask","grass","rock"},
  {10276,"terapagos-terastal","normal"},
  {10277,"terapagos-stellar","normal"},
  {10278,"clefable-mega","fairy","flying"},
  {10279,"victreebel-mega","grass","poison"},
  {10280,"starmie-mega","water","psychic"},
  {10281,"dragonite-mega","dragon","flying"},
  {10282,"meganium-mega","grass","fairy"},
  {10283,"feraligatr-mega","water","dragon"},
  {10284,"skarmory-mega","steel","flying"},
  {10285,"froslass-mega","ice","ghost"},
  {10286,"emboar-mega","fire","fighting"},
  {10287,"excadrill-mega","ground","steel"},
  {10288,"scolipede-mega","bug","poison"},
  {10289,"scrafty-mega","dark","fighting"},
  {10290,"eelektross-mega","electric"},
  {10291,"chandelure-mega","ghost","fire"},
  {10292,"chesnaught-mega","grass","fighting"},
  {10293,"delphox-mega","fire","psychic"},
  {10294,"greninja-mega","water","dark"},
  {10295,"pyroar-mega","fire","normal"},
  {10296,"floette-mega","fairy"},
  {10297,"malamar-mega","dark","psychic"},
  {10298,"barbaracle-mega","rock","fighting"},
  {10299,"dragalge-mega","poison","dragon"},
  {10300,"hawlucha-mega","fighting","flying"},
  {10301,"zygarde-mega","dragon","ground"},
  {10302,"drampa-mega","normal","dragon"},
  {10303,"falinks-mega","fighting"},
  {10304,"raichu-mega-x","electric"},
  {10305,"raichu-mega-y","electric"},
  {10306,"chimecho-mega","psychic","steel"},
  {10307,"absol-mega-z","dark","ghost"},
  {10308,"staraptor-mega","fighting","flying"},
  {10309,"garchomp-mega-z","dragon"},
  {10310,"lucario-mega-z","fighting","steel"},
  {10311,"heatran-mega","fire","steel"},
  {10312,"darkrai-mega","dark"},
  {10313,"golurk-mega","ground","ghost"},
  {10314,"meowstic-mega","psychic"},
  {10315,"crabominable-mega","fighting","ice"},
  {10316,"golisopod-mega","bug","steel"},
  {10317,"magearna-mega","steel","fairy"},
  {10318,"magearna-original-mega","steel","fairy"},
  {10319,"zeraora-mega","electric"},
  {10320,"scovillain-mega","grass","fire"},
  {10321,"glimmora-mega","rock","poison"},
  {10322,"tatsugiri-curly-mega","dragon","water"},
  {10323,"tatsugiri-droopy-mega","dragon","water"},
  {10324,"tatsugiri-stretchy-mega","dragon","water"},
  {10325,"baxcalibur-mega","dragon","ice"},
}

-- ── INIT ────────────────────────────────────────────────────

local _cached_assets = nil

local BASE_ASSETS = {
    { name = "craftingBoardBG",       url = "https://tmpfiles.org/dl/w0waJrY5cGaO/craftingbg_cropped.png" },
    { name = "breederBG",              url = "https://tmpfiles.org/dl/wEw6J8YJce7D/breederbg_cropped.png" },
    { name = "obtainBtn",              url = "https://tmpfiles.org/dl/wowPdhzpOh4P/obtain-btn.png" },
    { name = "breederIcon",            url = "https://tmpfiles.org/dl/w6wAdBzDOfxq/icon_breeder_1781973639243.png" },
    { name = "The Hatcher",            url = "https://tmpfiles.org/dl/wawodkSNcQ06/thehatcher.png" },
    { name = "Offer Up",               url = "https://tmpfiles.org/dl/wFwgd4SWcvJx/offerup.png" },
    { name = "Another Monday",         url = "https://tmpfiles.org/dl/wowkdWSTcRLp/anothermondy.png" },
    { name = "Chow Down",              url = "https://tmpfiles.org/dl/w4wkdGSfcxHw/chowdown.png" },
    { name = "Mew-Nip",               url = "https://tmpfiles.org/dl/wlwPd7SScsTa/mew-nip.png" },
    { name = "Nocturnal Endeavours",   url = "https://tmpfiles.org/dl/wpwddLSuc4oQ/nocturnalendevours.png" },
    { name = "Relaxation",             url = "https://tmpfiles.org/dl/wtwFdiSjcBW3/relaxation.png" },
    { name = "The Shining Star",       url = "https://tmpfiles.org/dl/wqwfdASlcJ73/theshiningstar.png" },
    { name = "Training Ball",          url = "https://tmpfiles.org/dl/wDwSdxSqc9yr/trainingball.png" },
    { name = "bency", url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/BENCY.png" },
    { name = "type_bug",      url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/bug.png" },
    { name = "type_dark",     url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/dark.png" },
    { name = "type_dragon",   url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/dragon.png" },
    { name = "type_electric", url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/electric.png" },
    { name = "type_fairy",    url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/fairy.png" },
    { name = "type_fighting", url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/fighting.png" },
    { name = "type_fire",     url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/fire.png" },
    { name = "type_flying",   url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/flying.png" },
    { name = "type_ghost",    url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/ghost.png" },
    { name = "type_grass",    url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/grass.png" },
    { name = "type_ground",   url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/ground.png" },
    { name = "type_ice",      url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/ice.png" },
    { name = "type_normal",   url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/normal.png" },
    { name = "type_poison",   url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/poison.png" },
    { name = "type_psychic",  url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/psychic.png" },
    { name = "type_rock",     url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/rock.png" },
    { name = "type_steel",    url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/steel.png" },
    { name = "type_water",    url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Types/water.png" },
    { name = "dexPanel",   url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/DEX%20PANEL.png" },
    { name = "dexNext",    url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/DEX%20NEXT.png" },
    { name = "pokeViewPanel", url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20View%20Panel.png" },
}

function onLoad()
    -- Register all custom UI assets after a delay so UI is ready
    Wait.frames(function()
        local all_assets = {}
        for _, a in ipairs(BASE_ASSETS) do
            table.insert(all_assets, { name = a.name, url = a.url })
        end

        for _, entry in ipairs(POKEMON_DATA) do
            local poke_id = entry[1]
            local poke_name = entry[2]
            table.insert(all_assets, {
                name = string.format("pokeCard_%03d", poke_id),
                url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20Assets/Slot%20Images/" .. string.format("%03d", poke_id) .. "_" .. poke_name .. ".png"
            })
        end

        -- Register Poke Dice (types + stats)
        local DICE_TYPE_FILES = {
            bug="Bug", dark="Dark", dragon="Dragon", electric="Electric",
            fairy="Fairy", fighting="Fighting", fire="Fire", flying="Flying",
            ghost="Ghost", grass="Grass", ground="Ground", ice="Ice",
            normal="Normal", poison="Poison", psychic="Psychic", rock="Rock",
            steel="Steel", water="Water"
        }
        for type_lower, type_cap in pairs(DICE_TYPE_FILES) do
            table.insert(all_assets, {
                name = "diceType_" .. type_lower,
                url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Poke%20Dice/Types/" .. type_cap .. ".png"
            })
        end
        local DICE_STATS = {hp="HP", atk="ATK", def="DEF", spatk="SP.ATK", spdef="SP.DEF", spd="SPD"}
        for stat_lower, stat_upper in pairs(DICE_STATS) do
            table.insert(all_assets, {
                name = "diceStat_" .. stat_lower,
                url = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Poke%20Dice/Stats/" .. stat_upper .. ".png"
            })
        end

        print("PokeRoller: registering " .. #POKEMON_DATA .. " card assets...")
        UI.setCustomAssets(all_assets)
        _cached_assets = all_assets
        print("PokeRoller: assets registered. Refreshing UI...")

        Wait.time(function()
            UI.setXml(UI.getXml())
            Wait.frames(function()
                refreshPokedexPage()
                print("PokeRoller: pokedex ready — all cards pre-loaded.")
            end, 5)
        end, 2.0)
    end, 10)

    -- TEMP: Place a random perk on the center test slot for encyclopedia placement testing
    local perk_images = {"The Hatcher","Offer Up","Another Monday","Chow Down","Mew-Nip","Nocturnal Endeavours","Relaxation","The Shining Star","Training Ball"}
    UI.setAttribute("test_encyclopedia_slot", "image", perk_images[math.random(#perk_images)])

    for _, color in ipairs(SEAT_COLORS) do
        resources[color]   = {}
        ball_counts[color] = {}

        for _, k in ipairs(RESOURCE_KEYS) do
            resources[color][k] = 0
        end
        for i = 1, #POKEBALLS do
            ball_counts[color][i] = 0
        end
    end
end

local panel_open = {}

function toggleCraftingPanel(player, value, id)
    local color = id and id:match("crafting_toggle_(.+)") or tostring(value)
    if not color or color == "" then
        print("toggleCraftingPanel: could not determine color. id="..tostring(id).." value="..tostring(value))
        return
    end
    panel_open[color] = not panel_open[color]
    local active_str = panel_open[color] and "true" or "false"
    UI.setAttribute("crafting_panel_"..color, "active", active_str)
    UI.setAttribute("prof_btn_"..color.."_breeder_container", "active", active_str)
end

function toggleCategoryPanel(player, value, id)
    if not id then return end
    local category, color = id:match("^(.-)_toggle_(.+)$")
    if not category or not color then return end
    if category == "pokemon" or category == "pokedex" then
        togglePokedex(color)
    else
        broadcastToColor(category.." panel coming soon!", color, {0.8,0.8,0.8})
    end
end

-- ── RECIPES PANEL ────────────────────────────────────────────

function openRecipesPanel(player, value, id)
    local color = id and id:match("^recipes_(.+)$") or "White"
    UI.setAttribute("recipes_panel_"..color, "active", "true")
end

function closeRecipesPanel(params)
    local color = type(params) == "table" and params.color or tostring(params)
    UI.setAttribute("recipes_panel_"..color, "active", "false")
end

-- ── RESOURCE COUNTERS ────────────────────────────────────────

function adjustResource(player, value, id)
    local color, key = id:match("^res_(.-)_(.+)$")
    if not color or not key then return end
    local delta = (value == "-2") and -1 or 1
    resources[color][key] = (resources[color][key] or 0) + delta
    local val = resources[color][key]
    UI.setValue("res_val_"..color.."_"..key, val ~= 0 and tostring(val) or "")
end

function craftBall(player, value, id)
    local color, idxStr = id:match("^ball_(.-)_(%d+)$")
    if not color then return end
    local idx  = tonumber(idxStr)
    local ball = POKEBALLS[idx]
    if not ball then return end

    if value == "-2" then
        -- Right click: remove one
        if (ball_counts[color][idx] or 0) > 0 then
            ball_counts[color][idx] = ball_counts[color][idx] - 1
            local count = ball_counts[color][idx]
            UI.setValue("ball_val_"..color.."_"..idx, count > 0 and tostring(count) or "")
        end
        return
    end

    -- Left click: craft — check cost
    for apri, qty in pairs(ball.cost) do
        if (resources[color][apri] or 0) < qty then
            broadcastToColor(
                "Not enough apricorns! Need "..qty.." "
                ..apri:sub(1,1):upper()..apri:sub(2)
                .." Apricorn(s) to craft "..ball.name..".",
                color, {1,0.4,0.4}
            )
            return
        end
    end
    for apri, qty in pairs(ball.cost) do
        resources[color][apri] = resources[color][apri] - qty
        UI.setValue("res_val_"..color.."_"..apri,
            resources[color][apri] ~= 0 and tostring(resources[color][apri]) or "")
    end
    ball_counts[color][idx] = (ball_counts[color][idx] or 0) + 1
    local count = ball_counts[color][idx]
    UI.setValue("ball_val_"..color.."_"..idx, count > 0 and tostring(count) or "")
    broadcastToColor("Crafted a "..ball.name.."!", color, {0.4,1,0.4})
end

-- ── BREEDER STATION LOGIC ───────────────────────────────────────
local breeder_panel_open = {}
local unlocked_perk_ids = {} -- list of active perk IDs for each color
local current_options = {} -- list of 3 perk IDs drawn for each color
local pending_claim_perk_id = {} -- perk ID waiting for click confirmation
local encyclopedia_open = {}

local PERK_POOL = {
    { id=1,  name="The Hatcher",          desc="Spend 1 Action To Decrease An Eggs Timer By 1", image="The Hatcher" },
    { id=2,  name="Offer Up",             desc="For Every First Stage Evolution Pokemon You Have, You Have A +10% Chance To Be Given A Random Apricorn From Your Fledging Pokemon At The End Of Every Round.", image="Offer Up" },
    { id=3,  name="Another Monday",       desc="Working In Pokemon-Care Surely Has Ruined Your Mondays. Ghost Type Pokemon Have Been Added To Your Pool for Encounters.", image="Another Monday" },
    { id=4,  name="Chow Down",            desc='You May Spend One Action Per Round To Feed One of Your Teams Pokemon A Hardy Chow, Granting Them The "Fueled" Effect Until Next The Combat Phase.', image="Chow Down" },
    { id=5,  name="Mew-Nip",             desc="Hey Bub! You Want Some Nip?.... Mew-Nip Has Been Added To Your Pool For Rewards When Foraging.", image="Mew-Nip" },
    { id=6,  name="Nocturnal Endeavours", desc='Burgling..... Is Honestly Your Only Hope With The Lack of Eggs In Your life. You May Spend Your Last Action In The Last Round Of The Day To Add 1 +The Amount Of Rounds Went Without Gaining An Egg That Day of Egg Dice To The "End of Day Roll Phase".', image="Nocturnal Endeavours" },
    { id=7,  name="Relaxation",           desc="Its Your Day Off! Skip Your Action For One Round To Gain An Additional Action On The Next Round. Can Only Be Used Once Per Day.", image="Relaxation" },
    { id=8,  name="The Shining Star",     desc="Gain +15% To Encounter Shiny Variations Of Pokemon When Doing A Encounter.", image="The Shining Star" },
    { id=9,  name="Training Ball",        desc="I'm A Black Belt At Crocheti! Not That Your Mid-Life Crisis Got You Back Into Crocheting, But Here Have Some Pity. For Anyone Who Has A Higher Level Pokemon Than You During A Combat Phase You Were Involved In. Must Remove One Random Die Added Into Combat.", image="Training Ball" },
}

local function wrapLines(text, maxLen)
    if #text <= maxLen then return text end
    local lines = {}
    while #text > maxLen do
        local breakAt = text:sub(1, maxLen):match("^.*()%s")
        if not breakAt then breakAt = maxLen end
        table.insert(lines, text:sub(1, breakAt - 1))
        text = text:sub(breakAt + 1)
    end
    table.insert(lines, text)
    return table.concat(lines, "\n")
end

local function getPerkById(id)
    for _, p in ipairs(PERK_POOL) do
        if p.id == id then return p end
    end
    return nil
end

local function hasValue(tab, val)
    if not tab then return false end
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

local function fillEncyclopediaSlot(color, perk_id)
    local perk = getPerkById(perk_id)
    if not perk then return end

    -- Check if perk image is already in any encyclopedia slot
    for slot = 1, 30 do
        local img = UI.getAttribute("encyclopedia_slot_"..slot.."_"..color, "image")
        if img == perk.image then return end
    end

    -- Find the first slot with no image assigned
    for slot = 1, 30 do
        local img = UI.getAttribute("encyclopedia_slot_"..slot.."_"..color, "image")
        if not img or img == "" then
            if encyclopedia_open[color] then
                UI.setAttribute("encyclopedia_slot_"..slot.."_"..color, "active", "true")
            end
            UI.setAttribute("encyclopedia_slot_"..slot.."_"..color, "image", perk.image)
            return
        end
    end
end

function toggleBreederStation(player, value, id)
    local color = id:match("prof_btn_(.-)_breeder")
    if not color or color == "" then return end
    breeder_panel_open[color] = not breeder_panel_open[color]
    local active_str = breeder_panel_open[color] and "true" or "false"
    UI.setAttribute("breeder_station_"..color, "active", active_str)
    UI.setAttribute("draw_breeder_"..color, "active", active_str)
    UI.setAttribute("encyclopedia_btn_"..color, "active", active_str)
    if not breeder_panel_open[color] then
        encyclopedia_open[color] = false
        UI.setAttribute("encyclopedia_panel_"..color, "active", "false")
        for slot = 1, 30 do
            UI.setAttribute("encyclopedia_slot_"..slot.."_"..color, "active", "false")
        end
        local detail_ids = {"img","name","effect"}
        for _, d in ipairs(detail_ids) do
            UI.setAttribute("encyclopedia_detail_"..d.."_"..color, "active", "false")
        end
    end
    for idx = 1, 3 do
        if not breeder_panel_open[color] then
            UI.setAttribute("option_slot_"..idx.."_btn_"..color, "active", "false")
        end
    end
    for idx = 1, 6 do
        if not breeder_panel_open[color] then
            UI.setAttribute("active_slot_"..idx.."_img_"..color, "active", "false")
        elseif unlocked_perk_ids[color] and unlocked_perk_ids[color][idx] then
            UI.setAttribute("active_slot_"..idx.."_img_"..color, "active", "true")
        end
    end
end

function toggleEncyclopedia(player, value, id)
    local color = id:match("encyclopedia_btn_(%a+)")
    if not color or color == "" then return end

    -- Requirement 8: Ensure button only triggerable when breeder panel is open
    if not breeder_panel_open[color] then return end

    encyclopedia_open[color] = not encyclopedia_open[color]
    if encyclopedia_open[color] then
        UI.setAttribute("encyclopedia_panel_"..color, "image", "bency")
    end
    UI.setAttribute("encyclopedia_panel_"..color, "active", encyclopedia_open[color] and "true" or "false")
    if not encyclopedia_open[color] then
        local detail_ids = {"img","name","effect"}
        for _, d in ipairs(detail_ids) do
            UI.setAttribute("encyclopedia_detail_"..d.."_"..color, "active", "false")
        end
    end

    -- Show/hide root-level encyclopedia slot buttons (only ones with an image)
    local active = encyclopedia_open[color] and "true" or "false"
    for slot = 1, 30 do
        local img = UI.getAttribute("encyclopedia_slot_"..slot.."_"..color, "image")
        if img and img ~= "" then
            UI.setAttribute("encyclopedia_slot_"..slot.."_"..color, "active", active)
        end
    end
end

function drawBreederPerk(player, value, id)
    local color = id:match("draw_breeder_(.+)")
    if not color or color == "" then return end

    -- Requirement 8: Ensure panel is open
    if not breeder_panel_open[color] then return end

    if not unlocked_perk_ids[color] then
        unlocked_perk_ids[color] = {}
    end

    -- Max 6 active slots
    if #unlocked_perk_ids[color] >= 6 then
        broadcastToColor("All 6 Breeder perk slots are already unlocked!", color, {1,0.5,0})
        return
    end

    -- Cost 1 Rare Candy
    local candy = resources[color]["rare_candy"] or 0
    if candy < 1 then
        broadcastToColor("You need 1 Rare Candy to draw a perk!", color, {1,0.3,0.3})
        return
    end

    -- Find remaining locked perks
    local locked_perks = {}
    for _, perk in ipairs(PERK_POOL) do
        if not hasValue(unlocked_perk_ids[color], perk.id) then
            table.insert(locked_perks, perk)
        end
    end

    if #locked_perks == 0 then
        broadcastToColor("No more Breeder perks available in the pool!", color, {1,0.5,0})
        return
    end

    -- Deduct 1 Rare Candy
    resources[color]["rare_candy"] = candy - 1
    UI.setValue("res_val_"..color.."_rare_candy", resources[color]["rare_candy"] ~= 0 and tostring(resources[color]["rare_candy"]) or "")

    -- Pick 3 unique locked perks
    local drawn = {}
    local pool_size = #locked_perks
    local count_to_pick = math.min(3, pool_size)
    
    while #drawn < count_to_pick do
        local r = math.random(pool_size)
        local item = locked_perks[r]
        local already_drawn = false
        for _, d in ipairs(drawn) do
            if d.id == item.id then already_drawn = true break end
        end
        if not already_drawn then
            table.insert(drawn, item)
        end
    end

    -- Save current options
    current_options[color] = {}
    for idx, p in ipairs(drawn) do
        current_options[color][idx] = p.id
        -- Display options
        UI.setAttribute("option_slot_"..idx.."_btn_"..color, "active", "true")
        UI.setAttribute("option_slot_"..idx.."_btn_"..color, "image", p.image)
        UI.setAttribute("option_slot_"..idx.."_btn_"..color, "tooltip", "<b>" .. p.name .. "</b>\n<i>" .. p.desc .. "</i>")
    end

    -- Hide unneeded option slots if drawing pool has fewer options left
    for idx = count_to_pick + 1, 3 do
        UI.setAttribute("option_slot_"..idx.."_btn_"..color, "active", "false")
    end

    broadcastToColor("🎲 Rolled 3 random perk options! Spend 1 Rare Candy to complete.", color, {0.4,1,0.4})
end

function clickOptionPerk(player, value, id)
    local opt_idx, color = id:match("option_slot_(%d+)_btn_(%a+)")
    if not opt_idx or not color then return end
    opt_idx = tonumber(opt_idx)

    -- Requirement 8: Ensure panel is open
    if not breeder_panel_open[color] then return end

    if not current_options[color] or not current_options[color][opt_idx] then return end
    local perk_id = current_options[color][opt_idx]

    pending_claim_perk_id[color] = perk_id
    
    -- Show confirmation dialog
    UI.setAttribute("confirmation_panel_"..color, "active", "true")
end

function confirmClaimYes(player, value, id)
    local color = id:match("confirm_claim_yes_(%a+)")
    if not color or not pending_claim_perk_id[color] then return end

    local perk_id = pending_claim_perk_id[color]
    local perk = getPerkById(perk_id)

    if perk then
        if not unlocked_perk_ids[color] then unlocked_perk_ids[color] = {} end
        table.insert(unlocked_perk_ids[color], perk_id)

        -- Clear all three option slots
        current_options[color] = nil
        for idx = 1, 3 do
            UI.setAttribute("option_slot_"..idx.."_btn_"..color, "active", "false")
        end

        -- Activate the newly filled slot (lowest empty = current count after insert)
        local new_slot = #unlocked_perk_ids[color]
        UI.setAttribute("active_slot_"..new_slot.."_img_"..color, "active", "true")
        UI.setAttribute("active_slot_"..new_slot.."_img_"..color, "image", perk.image)
        local tooltip_desc = wrapLines(perk.desc, 55)
        UI.setAttribute("active_slot_"..new_slot.."_img_"..color, "tooltip", "<b>" .. perk.name .. "</b>\n<i>" .. tooltip_desc .. "</i>")

        -- Fill the first empty slot in the encyclopedia with this perk's icon
        fillEncyclopediaSlot(color, perk_id)

        broadcastToColor("🎁 Claimed Active Perk: " .. perk.name .. "!", color, {0.4,1,0.4})
    end

    pending_claim_perk_id[color] = nil
    UI.setAttribute("confirmation_panel_"..color, "active", "false")
end

function confirmClaimNo(player, value, id)
    local color = id:match("confirm_claim_no_(%a+)")
    if not color then return end

    pending_claim_perk_id[color] = nil
    UI.setAttribute("confirmation_panel_"..color, "active", "false")
    broadcastToColor("Cancelled claim request.", color, {0.9,0.7,0.1})
end

function clickEncyclopediaSlot(player, value, id)
    local slot, color = id:match("encyclopedia_slot_(%d+)_(%a+)")
    if not slot or not color then return end

    local img = UI.getAttribute(id, "image")
    if not img or img == "" then return end

    -- Look up the perk by image
    local perk
    for _, p in ipairs(PERK_POOL) do
        if p.image == img then
            perk = p
            break
        end
    end
    if not perk then return end

    -- Toggle detail view elements
    local ids = {
        "encyclopedia_detail_img_"..color,
        "encyclopedia_detail_name_"..color,
        "encyclopedia_detail_effect_"..color,
    }
    if UI.getAttribute(ids[1], "active") == "true" then
        for _, eid in ipairs(ids) do
            UI.setAttribute(eid, "active", "false")
        end
        return
    end

    UI.setAttribute("encyclopedia_detail_img_"..color, "image", perk.image)
    UI.setAttribute("encyclopedia_detail_name_"..color, "text", perk.name)
    UI.setAttribute("encyclopedia_detail_effect_"..color, "text", perk.desc)
    for _, eid in ipairs(ids) do
        UI.setAttribute(eid, "active", "true")
    end
end

-- ── POKEMON BASE STATS ──────────────────────────────────────
-- Keyed by pokemon id with explicit dice values from designer templates
local POKEMON_STATS = {
    -- Charizard (#006): 3-stage 3rd evo, dual Fire/Flying
    -- Template: type=5x/3x, stat=SP.ATK 5x / SPD 3x
    [6] = {
        hp=78, atk=84, def=78, spatk=109, spdef=85, spd=100,
        type1_val=5, type2_val=3,
        stat1_key="spatk", stat1_val=5,
        stat2_key="spd", stat2_val=3,
    },
}

-- ── POKEMON VIEW PANEL ──────────────────────────────────────

local pokeview_open = {}
local pokedex_open = {}

local SNAPSHOT_VER = 13

function showPokemonView(color, poke_id, poke_name)
    local snapshot_url = string.format(
        "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Snapshots/%03d_%s.png?v=%d",
        poke_id, poke_name:lower(), SNAPSHOT_VER
    )

    UI.setAttribute("pokeview_panel_" .. color, "image", snapshot_url)
    UI.setAttribute("pokeview_panel_" .. color, "active", "true")
    UI.setAttribute("pokeview_close_" .. color, "active", "true")

    pokeview_open[color] = true

    if pokedex_open[color] then
        togglePokedex(color)
    end
end

function closePokemonView(player, value, id)
    local color = id and id:match("pokeview_close_(%a+)")
    if not color then return end

    UI.setAttribute("pokeview_panel_" .. color, "active", "false")
    UI.setAttribute("pokeview_close_" .. color, "active", "false")
    pokeview_open[color] = false

    if not pokedex_open[color] then
        togglePokedex(color)
    end
end

-- ── POKEDEX ─────────────────────────────────────────────────
local pokedex_page_offset = 0
local POKEDEX_COLORS = {"White", "Red", "Blue", "Green"}

local POKEDEX_CARDS = {
    { id=1,  name="Bulbasaur",  asset="pokeCard1" },
    { id=2,  name="Ivysaur",    asset="pokeCard2" },
    { id=3,  name="Venusaur",   asset="pokeCard3" },
    { id=4,  name="Charmander", asset="pokeCard4" },
    { id=5,  name="Charmeleon", asset="pokeCard5" },
    { id=6,  name="Charizard",  asset="pokeCard6" },
    { id=7,  name="Squirtle",   asset="pokeCard7" },
    { id=8,  name="Wartortle",  asset="pokeCard8" },
    { id=9,  name="Blastoise",  asset="pokeCard9" },
    { id=10, name="Caterpie",   asset="pokeCard10" },
    { id=11, name="Metapod",    asset="pokeCard11" },
    { id=12, name="Butterfree", asset="pokeCard12" },
    { id=13, name="Weedle",     asset="pokeCard13" },
    { id=14, name="Kakuna",     asset="pokeCard14" },
    { id=15, name="Beedrill",   asset="pokeCard15" },
    { id=16, name="Pidgey",     asset="pokeCard16" },
    { id=17, name="Pidgeotto",  asset="pokeCard17" },
    { id=18, name="Pidgeot",    asset="pokeCard18" },
    { id=19, name="Rattata",    asset="pokeCard19" },
    { id=20, name="Raticate",   asset="pokeCard20" },
}

function togglePokedex(color)
    if not color then return end
    pokedex_open[color] = not pokedex_open[color]
    local active = pokedex_open[color] and "true" or "false"
    UI.setAttribute("pokedex_panel_"..color, "active", active)
    for i = 1, 20 do
        UI.setAttribute("pokedex_card_" .. i .. "_" .. color, "active", active)
    end
    UI.setAttribute("pokedex_close_"..color, "active", active)
    UI.setAttribute("pokedex_next_"..color, "active", active)
end

function closePokedex(player, value, id)
    local color = id and id:match("pokedex_close_(%a+)")
    if not color then return end
    pokedex_open[color] = false
    UI.setAttribute("pokedex_panel_"..color, "active", "false")
    for i = 1, 20 do
        UI.setAttribute("pokedex_card_" .. i .. "_" .. color, "active", "false")
    end
    UI.setAttribute("pokedex_close_"..color, "active", "false")
    UI.setAttribute("pokedex_next_"..color, "active", "false")
end

function pokedexCardClick(player, value, id)
    local card_idx, color = id:match("pokedex_card_(%d+)_(%a+)")
    if not card_idx or not color then return end
    local poke = POKEDEX_CARDS[tonumber(card_idx)]
    if not poke or poke.id == 0 then return end
    showPokemonView(color, poke.id, poke.name)
end

function refreshPokedexPage()
    local start_idx = pokedex_page_offset * 20 + 1
    for slot = 1, 20 do
        local data_idx = start_idx + slot - 1
        local entry = POKEMON_DATA[data_idx]
        local asset_name
        if entry then
            local poke_id = entry[1]
            local poke_name = entry[2]
            asset_name = string.format("pokeCard_%03d", poke_id)
            POKEDEX_CARDS[slot] = { id=poke_id, name=poke_name, asset=asset_name }
        else
            asset_name = ""
            POKEDEX_CARDS[slot] = { id=0, name="???", asset="" }
        end
        for _, color in ipairs(POKEDEX_COLORS) do
            UI.setAttribute("pokedex_card_" .. slot .. "_" .. color, "image", asset_name)
        end
    end
end

function pokedexNEXT(player, value, id)
    local color = id and id:match("pokedex_next_(%a+)")
    if not color then return end
    pokedex_page_offset = pokedex_page_offset + 1
    local total_pages = math.ceil(#POKEMON_DATA / 20)
    if pokedex_page_offset >= total_pages then
        pokedex_page_offset = 0
    end
    refreshPokedexPage()
    broadcastToColor("📖 Page " .. (pokedex_page_offset + 1) .. "/" .. total_pages, color, {0.4, 1, 0.4})
end

function printDebugCoords(player, value, id)
    local offset = UI.getAttribute("debug_coord_panel", "offsetXY")
    if offset then
        UI.setValue("debug_coord_val", "Offset: " .. offset)
        broadcastToColor("📍 Dragged Co-ords: " .. offset, player.color, {0.2, 1, 0.2})
        print("📍 Dragged Co-ords: " .. offset)
    else
        broadcastToColor("Could not detect offset.", player.color, {1, 0.2, 0.2})
    end
end
