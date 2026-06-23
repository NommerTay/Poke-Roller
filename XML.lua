<!-- Global.xml — Standalone Crafting Board UI -->
<CustomAssets>
    <Asset name="craftingBoardBG" url="https://tmpfiles.org/dl/w0waJrY5cGaO/craftingbg_cropped.png"/>
    <Asset name="breederBG" url="https://tmpfiles.org/dl/wEw6J8YJce7D/breederbg_cropped.png"/>
    <Asset name="obtainBtn" url="https://tmpfiles.org/dl/wowPdhzpOh4P/obtain-btn.png"/>
    <Asset name="breederIcon" url="https://tmpfiles.org/dl/w6wAdBzDOfxq/icon_breeder_1781973639243.png"/>
    <Asset name="The Hatcher" url="https://tmpfiles.org/dl/wawodkSNcQ06/thehatcher.png"/>
    <Asset name="Offer Up" url="https://tmpfiles.org/dl/wFwgd4SWcvJx/offerup.png"/>
    <Asset name="Another Monday" url="https://tmpfiles.org/dl/wowkdWSTcRLp/anothermondy.png"/>
    <Asset name="Chow Down" url="https://tmpfiles.org/dl/w4wkdGSfcxHw/chowdown.png"/>
    <Asset name="Mew-Nip" url="https://tmpfiles.org/dl/wlwPd7SScsTa/mew-nip.png"/>
    <Asset name="Nocturnal Endeavours" url="https://tmpfiles.org/dl/wpwddLSuc4oQ/nocturnalendevours.png"/>
    <Asset name="Relaxation" url="https://tmpfiles.org/dl/wtwFdiSjcBW3/relaxation.png"/>
    <Asset name="The Shining Star" url="https://tmpfiles.org/dl/wqwfdASlcJ73/theshiningstar.png"/>
    <Asset name="Training Ball" url="https://tmpfiles.org/dl/wDwSdxSqc9yr/trainingball.png"/>
    <Asset name="pokeViewPanel" url="https://raw.githubusercontent.com/NommerTay/Poke-Roller/master/Pokemon%20View%20Panel.png"/>
</CustomAssets>

<!-- ══════════════════════════════════════════════════════════
     WHITE PLAYER
     ══════════════════════════════════════════════════════════ -->

<!-- Main crafting panel -->
<Panel id="crafting_panel_White" active="false"
    rectAlignment="LowerLeft"
    offsetXY="10 55"
    width="398" height="987"
    image="craftingBoardBG"
    interactable="false"
    padding="0 0 0 0"
    visibility="White"
/>

<!-- WHITE PLAYER COUNTERS -->
<Button id="res_White_white" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="192 1-157" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="White" />
<Text id="res_val_White_white" rectAlignment="LowerLeft" offsetXY="192 1-157" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White" />
<Button id="res_White_green" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="132 1-157" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="White" />
<Text id="res_val_White_green" rectAlignment="LowerLeft" offsetXY="132 1-157" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White" />
<Button id="res_White_pink" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="72 1-157" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="White" />
<Text id="res_val_White_pink" rectAlignment="LowerLeft" offsetXY="72 1-157" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White" />
<Button id="res_White_yellow" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="192 170" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="White" />
<Text id="res_val_White_yellow" rectAlignment="LowerLeft" offsetXY="192 170" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White" />
<Button id="res_White_blue" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="132 170" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="White" />
<Text id="res_val_White_blue" rectAlignment="LowerLeft" offsetXY="132 170" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White" />
<Button id="res_White_red" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="72 170" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="White" />
<Text id="res_val_White_red" rectAlignment="LowerLeft" offsetXY="72 170" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White" />
<Button id="res_White_black" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="254 144" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="White" />
<Text id="res_val_White_black" rectAlignment="LowerLeft" offsetXY="254 144" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White" />
<Button id="res_White_journey_points" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="69 236" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="White" />
<Text id="res_val_White_journey_points" rectAlignment="LowerLeft" offsetXY="69 236" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White" />
<Button id="res_White_rare_candy" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="129 236" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="White" />
<Text id="res_val_White_rare_candy" rectAlignment="LowerLeft" offsetXY="129 236" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White" />

<Button id="ball_White_13" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="254 519" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Noi Ball" tooltipPosition="Below" visibility="White"/>
<Text id="ball_val_White_13" rectAlignment="LowerLeft" offsetXY="254 562" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White"/>
<Button id="ball_White_12" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="182 519" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Master Ball" tooltipPosition="Below" visibility="White"/>
<Text id="ball_val_White_12" rectAlignment="LowerLeft" offsetXY="182 562" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White"/>
<Button id="ball_White_11" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="110 519" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Safari Ball" tooltipPosition="Below" visibility="White"/>
<Text id="ball_val_White_11" rectAlignment="LowerLeft" offsetXY="110 562" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White"/>
<Button id="ball_White_7" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="110 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Heal Ball" tooltipPosition="Below" visibility="White"/>
<Text id="ball_val_White_7" rectAlignment="LowerLeft" offsetXY="110 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White"/>
<Button id="ball_White_8" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="182 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Luxury Ball" tooltipPosition="Below" visibility="White"/>
<Text id="ball_val_White_8" rectAlignment="LowerLeft" offsetXY="182 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White"/>
<Button id="ball_White_9" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="254 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Quick Ball" tooltipPosition="Below" visibility="White"/>
<Text id="ball_val_White_9" rectAlignment="LowerLeft" offsetXY="254 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White"/>
<Button id="ball_White_6" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="38 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Love Ball" tooltipPosition="Below" visibility="White"/>
<Text id="ball_val_White_6" rectAlignment="LowerLeft" offsetXY="38 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White"/>
<Button id="ball_White_10" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="326 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Phase Ball" tooltipPosition="Below" visibility="White"/>
<Text id="ball_val_White_10" rectAlignment="LowerLeft" offsetXY="326 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White"/>
<Button id="ball_White_5" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="326 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Light Ball" tooltipPosition="Below" visibility="White"/>
<Text id="ball_val_White_5" rectAlignment="LowerLeft" offsetXY="326 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White"/>
<Button id="ball_White_4" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="254 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Heavy Ball" tooltipPosition="Below" visibility="White"/>
<Text id="ball_val_White_4" rectAlignment="LowerLeft" offsetXY="254 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White"/>
<Button id="ball_White_3" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="182 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Ultra Ball" tooltipPosition="Below" visibility="White"/>
<Text id="ball_val_White_3" rectAlignment="LowerLeft" offsetXY="182 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White"/>
<Button id="ball_White_2" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="110 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Great Ball" tooltipPosition="Below" visibility="White"/>
<Text id="ball_val_White_2" rectAlignment="LowerLeft" offsetXY="110 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White"/>
<Button id="ball_White_1" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="38 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Pokeball" tooltipPosition="Below" visibility="White"/>
<Text id="ball_val_White_1" rectAlignment="LowerLeft" offsetXY="38 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="White"/>

<Panel id="recipes_panel_White" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="440" height="300" color="#1a1208" outline="#5a4030" padding="0 0 0 0" visibility="White">
    <VerticalLayout spacing="0">
        <HorizontalLayout height="40" color="#2a1a0a" padding="10 10 6 6" spacing="6">
            <Text fontSize="15" fontStyle="Bold" color="#c8a882" alignment="MiddleLeft" flexibleWidth="1">&#x1F4DC; Crafting Recipes</Text>
            <Button onClick="closeRecipesPanel(White)" width="32" height="32" fontSize="14" fontStyle="Bold" color="#3a1a0a" textColor="#c8a882" highlightedColor="#5a3010">✕</Button>
        </HorizontalLayout>
        <Panel color="#1a1208" padding="16 16 16 16" flexibleHeight="1">
            <Text fontSize="12" color="#6a5a40" alignment="MiddleCenter">Recipe content coming soon.</Text>
        </Panel>
    </VerticalLayout>
</Panel>

<!-- BREEDER PROFESSION BUTTON — root-level global, toggled by crafting panel -->
<Panel id="prof_btn_White_breeder_container" rectAlignment="LowerLeft" offsetXY="35 870" width="345" height="65" image="breederIcon" color="#FFFFFF" padding="0 0 0 0" ignoreLayout="true" visibility="White" active="false">
    <Button id="prof_btn_White_breeder" onClick="toggleBreederStation" width="345" height="65" color="#00000000" textColor="#00000000" />
</Panel>

<Panel id="breeder_station_White" active="false" rectAlignment="LowerLeft" offsetXY="10 78" width="404" height="990" image="breederBG" color="#FFFFFF" padding="0 0 0 0" interactable="false" visibility="White">
    <!-- Active Perk Slots and Option Slots moved to root level -->

    <!-- Perk Option Slots (3) - moved to root level -->

    <!-- Obtain A Perk Button - moved to root level -->

    <!-- Profession Encyclopedia Button (moved to root level) -->

    <!-- Confirmation Dialog moved to root level -->

    <!-- Encyclopedia moved to root level -->
</Panel>


<!-- ══════════════════════════════════════════════════════════
     RED PLAYER
     ══════════════════════════════════════════════════════════ -->

<!-- Main crafting panel -->
<Panel id="crafting_panel_Red" active="false"
    rectAlignment="LowerLeft"
    offsetXY="10 55"
    width="398" height="987"
    image="craftingBoardBG"
    interactable="false"
    padding="0 0 0 0"
    visibility="Red"
/>

<!-- RED PLAYER COUNTERS -->
<Button id="res_Red_white" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="192 1-157" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Red" />
<Text id="res_val_Red_white" rectAlignment="LowerLeft" offsetXY="192 1-157" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red" />
<Button id="res_Red_green" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="132 1-157" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Red" />
<Text id="res_val_Red_green" rectAlignment="LowerLeft" offsetXY="132 1-157" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red" />
<Button id="res_Red_pink" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="72 1-157" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Red" />
<Text id="res_val_Red_pink" rectAlignment="LowerLeft" offsetXY="72 1-157" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red" />
<Button id="res_Red_yellow" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="192 170" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Red" />
<Text id="res_val_Red_yellow" rectAlignment="LowerLeft" offsetXY="192 170" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red" />
<Button id="res_Red_blue" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="132 170" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Red" />
<Text id="res_val_Red_blue" rectAlignment="LowerLeft" offsetXY="132 170" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red" />
<Button id="res_Red_red" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="72 170" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Red" />
<Text id="res_val_Red_red" rectAlignment="LowerLeft" offsetXY="72 170" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red" />
<Button id="res_Red_black" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="254 144" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Red" />
<Text id="res_val_Red_black" rectAlignment="LowerLeft" offsetXY="254 144" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red" />
<Button id="res_Red_journey_points" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="69 236" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Red" />
<Text id="res_val_Red_journey_points" rectAlignment="LowerLeft" offsetXY="69 236" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red" />
<Button id="res_Red_rare_candy" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="129 236" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Red" />
<Text id="res_val_Red_rare_candy" rectAlignment="LowerLeft" offsetXY="129 236" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red" />

<Button id="ball_Red_13" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="254 519" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Noi Ball" tooltipPosition="Below" visibility="Red"/>
<Text id="ball_val_Red_13" rectAlignment="LowerLeft" offsetXY="254 562" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red"/>
<Button id="ball_Red_12" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="182 519" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Master Ball" tooltipPosition="Below" visibility="Red"/>
<Text id="ball_val_Red_12" rectAlignment="LowerLeft" offsetXY="182 562" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red"/>
<Button id="ball_Red_11" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="110 519" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Safari Ball" tooltipPosition="Below" visibility="Red"/>
<Text id="ball_val_Red_11" rectAlignment="LowerLeft" offsetXY="110 562" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red"/>
<Button id="ball_Red_7" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="110 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Heal Ball" tooltipPosition="Below" visibility="Red"/>
<Text id="ball_val_Red_7" rectAlignment="LowerLeft" offsetXY="110 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red"/>
<Button id="ball_Red_8" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="182 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Luxury Ball" tooltipPosition="Below" visibility="Red"/>
<Text id="ball_val_Red_8" rectAlignment="LowerLeft" offsetXY="182 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red"/>
<Button id="ball_Red_9" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="254 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Quick Ball" tooltipPosition="Below" visibility="Red"/>
<Text id="ball_val_Red_9" rectAlignment="LowerLeft" offsetXY="254 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red"/>
<Button id="ball_Red_6" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="38 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Love Ball" tooltipPosition="Below" visibility="Red"/>
<Text id="ball_val_Red_6" rectAlignment="LowerLeft" offsetXY="38 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red"/>
<Button id="ball_Red_10" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="326 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Phase Ball" tooltipPosition="Below" visibility="Red"/>
<Text id="ball_val_Red_10" rectAlignment="LowerLeft" offsetXY="326 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red"/>
<Button id="ball_Red_5" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="326 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Light Ball" tooltipPosition="Below" visibility="Red"/>
<Text id="ball_val_Red_5" rectAlignment="LowerLeft" offsetXY="326 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red"/>
<Button id="ball_Red_4" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="254 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Heavy Ball" tooltipPosition="Below" visibility="Red"/>
<Text id="ball_val_Red_4" rectAlignment="LowerLeft" offsetXY="254 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red"/>
<Button id="ball_Red_3" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="182 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Ultra Ball" tooltipPosition="Below" visibility="Red"/>
<Text id="ball_val_Red_3" rectAlignment="LowerLeft" offsetXY="182 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red"/>
<Button id="ball_Red_2" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="110 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Great Ball" tooltipPosition="Below" visibility="Red"/>
<Text id="ball_val_Red_2" rectAlignment="LowerLeft" offsetXY="110 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red"/>
<Button id="ball_Red_1" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="38 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Pokeball" tooltipPosition="Below" visibility="Red"/>
<Text id="ball_val_Red_1" rectAlignment="LowerLeft" offsetXY="38 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Red"/>

<Panel id="recipes_panel_Red" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="440" height="300" color="#1a1208" outline="#5a4030" padding="0 0 0 0" visibility="Red">
    <VerticalLayout spacing="0">
        <HorizontalLayout height="40" color="#2a1a0a" padding="10 10 6 6" spacing="6">
            <Text fontSize="15" fontStyle="Bold" color="#c8a882" alignment="MiddleLeft" flexibleWidth="1">&#x1F4DC; Crafting Recipes</Text>
            <Button onClick="closeRecipesPanel(Red)" width="32" height="32" fontSize="14" fontStyle="Bold" color="#3a1a0a" textColor="#c8a882" highlightedColor="#5a3010">✕</Button>
        </HorizontalLayout>
        <Panel color="#1a1208" padding="16 16 16 16" flexibleHeight="1">
            <Text fontSize="12" color="#6a5a40" alignment="MiddleCenter">Recipe content coming soon.</Text>
        </Panel>
    </VerticalLayout>
</Panel>

<!-- BREEDER PROFESSION BUTTON — root-level global, toggled by crafting panel -->
<Panel id="prof_btn_Red_breeder_container" rectAlignment="LowerLeft" offsetXY="35 870" width="345" height="65" image="breederIcon" color="#FFFFFF" padding="0 0 0 0" ignoreLayout="true" visibility="Red" active="false">
    <Button id="prof_btn_Red_breeder" onClick="toggleBreederStation" width="345" height="65" color="#00000000" textColor="#00000000" />
</Panel>

<Panel id="breeder_station_Red" active="false" rectAlignment="LowerLeft" offsetXY="10 78" width="404" height="990" image="breederBG" color="#FFFFFF" padding="0 0 0 0" interactable="false" visibility="Red">
    <!-- Active Perk Slots and Option Slots moved to root level -->

    <!-- Perk Option Slots (3) - moved to root level -->

    <!-- Obtain A Perk Button - moved to root level -->

    <!-- Profession Encyclopedia Button (moved to root level) -->

    <!-- Confirmation Dialog moved to root level -->

    <!-- Encyclopedia moved to root level -->
</Panel>


<!-- ══════════════════════════════════════════════════════════
     BLUE PLAYER
     ══════════════════════════════════════════════════════════ -->

<!-- Main crafting panel -->
<Panel id="crafting_panel_Blue" active="false"
    rectAlignment="LowerLeft"
    offsetXY="10 55"
    width="398" height="987"
    image="craftingBoardBG"
    interactable="false"
    padding="0 0 0 0"
    visibility="Blue"
/>

<!-- BLUE PLAYER COUNTERS -->
<Button id="res_Blue_white" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="192 1-157" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Blue" />
<Text id="res_val_Blue_white" rectAlignment="LowerLeft" offsetXY="192 1-157" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue" />
<Button id="res_Blue_green" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="132 1-157" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Blue" />
<Text id="res_val_Blue_green" rectAlignment="LowerLeft" offsetXY="132 1-157" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue" />
<Button id="res_Blue_pink" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="72 1-157" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Blue" />
<Text id="res_val_Blue_pink" rectAlignment="LowerLeft" offsetXY="72 1-157" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue" />
<Button id="res_Blue_yellow" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="192 170" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Blue" />
<Text id="res_val_Blue_yellow" rectAlignment="LowerLeft" offsetXY="192 170" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue" />
<Button id="res_Blue_blue" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="132 170" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Blue" />
<Text id="res_val_Blue_blue" rectAlignment="LowerLeft" offsetXY="132 170" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue" />
<Button id="res_Blue_red" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="72 170" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Blue" />
<Text id="res_val_Blue_red" rectAlignment="LowerLeft" offsetXY="72 170" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue" />
<Button id="res_Blue_black" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="254 144" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Blue" />
<Text id="res_val_Blue_black" rectAlignment="LowerLeft" offsetXY="254 144" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue" />
<Button id="res_Blue_journey_points" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="69 236" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Blue" />
<Text id="res_val_Blue_journey_points" rectAlignment="LowerLeft" offsetXY="69 236" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue" />
<Button id="res_Blue_rare_candy" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="129 236" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Blue" />
<Text id="res_val_Blue_rare_candy" rectAlignment="LowerLeft" offsetXY="129 236" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue" />

<Button id="ball_Blue_13" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="254 519" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Noi Ball" tooltipPosition="Below" visibility="Blue"/>
<Text id="ball_val_Blue_13" rectAlignment="LowerLeft" offsetXY="254 562" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue"/>
<Button id="ball_Blue_12" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="182 519" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Master Ball" tooltipPosition="Below" visibility="Blue"/>
<Text id="ball_val_Blue_12" rectAlignment="LowerLeft" offsetXY="182 562" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue"/>
<Button id="ball_Blue_11" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="110 519" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Safari Ball" tooltipPosition="Below" visibility="Blue"/>
<Text id="ball_val_Blue_11" rectAlignment="LowerLeft" offsetXY="110 562" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue"/>
<Button id="ball_Blue_7" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="110 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Heal Ball" tooltipPosition="Below" visibility="Blue"/>
<Text id="ball_val_Blue_7" rectAlignment="LowerLeft" offsetXY="110 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue"/>
<Button id="ball_Blue_8" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="182 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Luxury Ball" tooltipPosition="Below" visibility="Blue"/>
<Text id="ball_val_Blue_8" rectAlignment="LowerLeft" offsetXY="182 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue"/>
<Button id="ball_Blue_9" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="254 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Quick Ball" tooltipPosition="Below" visibility="Blue"/>
<Text id="ball_val_Blue_9" rectAlignment="LowerLeft" offsetXY="254 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue"/>
<Button id="ball_Blue_6" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="38 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Love Ball" tooltipPosition="Below" visibility="Blue"/>
<Text id="ball_val_Blue_6" rectAlignment="LowerLeft" offsetXY="38 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue"/>
<Button id="ball_Blue_10" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="326 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Phase Ball" tooltipPosition="Below" visibility="Blue"/>
<Text id="ball_val_Blue_10" rectAlignment="LowerLeft" offsetXY="326 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue"/>
<Button id="ball_Blue_5" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="326 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Light Ball" tooltipPosition="Below" visibility="Blue"/>
<Text id="ball_val_Blue_5" rectAlignment="LowerLeft" offsetXY="326 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue"/>
<Button id="ball_Blue_4" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="254 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Heavy Ball" tooltipPosition="Below" visibility="Blue"/>
<Text id="ball_val_Blue_4" rectAlignment="LowerLeft" offsetXY="254 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue"/>
<Button id="ball_Blue_3" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="182 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Ultra Ball" tooltipPosition="Below" visibility="Blue"/>
<Text id="ball_val_Blue_3" rectAlignment="LowerLeft" offsetXY="182 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue"/>
<Button id="ball_Blue_2" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="110 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Great Ball" tooltipPosition="Below" visibility="Blue"/>
<Text id="ball_val_Blue_2" rectAlignment="LowerLeft" offsetXY="110 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue"/>
<Button id="ball_Blue_1" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="38 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Pokeball" tooltipPosition="Below" visibility="Blue"/>
<Text id="ball_val_Blue_1" rectAlignment="LowerLeft" offsetXY="38 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Blue"/>

<Panel id="recipes_panel_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="440" height="300" color="#1a1208" outline="#5a4030" padding="0 0 0 0" visibility="Blue">
    <VerticalLayout spacing="0">
        <HorizontalLayout height="40" color="#2a1a0a" padding="10 10 6 6" spacing="6">
            <Text fontSize="15" fontStyle="Bold" color="#c8a882" alignment="MiddleLeft" flexibleWidth="1">&#x1F4DC; Crafting Recipes</Text>
            <Button onClick="closeRecipesPanel(Blue)" width="32" height="32" fontSize="14" fontStyle="Bold" color="#3a1a0a" textColor="#c8a882" highlightedColor="#5a3010">✕</Button>
        </HorizontalLayout>
        <Panel color="#1a1208" padding="16 16 16 16" flexibleHeight="1">
            <Text fontSize="12" color="#6a5a40" alignment="MiddleCenter">Recipe content coming soon.</Text>
        </Panel>
    </VerticalLayout>
</Panel>

<!-- BREEDER PROFESSION BUTTON — root-level global, toggled by crafting panel -->
<Panel id="prof_btn_Blue_breeder_container" rectAlignment="LowerLeft" offsetXY="35 870" width="345" height="65" image="breederIcon" color="#FFFFFF" padding="0 0 0 0" ignoreLayout="true" visibility="Blue" active="false">
    <Button id="prof_btn_Blue_breeder" onClick="toggleBreederStation" width="345" height="65" color="#00000000" textColor="#00000000" />
</Panel>

<Panel id="breeder_station_Blue" active="false" rectAlignment="LowerLeft" offsetXY="10 78" width="404" height="990" image="breederBG" color="#FFFFFF" padding="0 0 0 0" interactable="false" visibility="Blue">
    <!-- Active Perk Slots and Option Slots moved to root level -->

    <!-- Perk Option Slots (3) - moved to root level -->

    <!-- Obtain A Perk Button - moved to root level -->

    <!-- Profession Encyclopedia Button (moved to root level) -->

    <!-- Confirmation Dialog moved to root level -->

    <!-- Encyclopedia moved to root level -->
</Panel>


<!-- ══════════════════════════════════════════════════════════
     GREEN PLAYER
     ══════════════════════════════════════════════════════════ -->

<!-- Main crafting panel -->
<Panel id="crafting_panel_Green" active="false"
    rectAlignment="LowerLeft"
    offsetXY="10 55"
    width="398" height="987"
    image="craftingBoardBG"
    interactable="false"
    padding="0 0 0 0"
    visibility="Green"
/>

<!-- GREEN PLAYER COUNTERS -->
<Button id="res_Green_white" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="192 1-157" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Green" />
<Text id="res_val_Green_white" rectAlignment="LowerLeft" offsetXY="192 1-157" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green" />
<Button id="res_Green_green" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="132 1-157" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Green" />
<Text id="res_val_Green_green" rectAlignment="LowerLeft" offsetXY="132 1-157" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green" />
<Button id="res_Green_pink" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="72 1-157" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Green" />
<Text id="res_val_Green_pink" rectAlignment="LowerLeft" offsetXY="72 1-157" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green" />
<Button id="res_Green_yellow" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="192 170" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Green" />
<Text id="res_val_Green_yellow" rectAlignment="LowerLeft" offsetXY="192 170" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green" />
<Button id="res_Green_blue" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="132 170" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Green" />
<Text id="res_val_Green_blue" rectAlignment="LowerLeft" offsetXY="132 170" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green" />
<Button id="res_Green_red" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="72 170" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Green" />
<Text id="res_val_Green_red" rectAlignment="LowerLeft" offsetXY="72 170" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green" />
<Button id="res_Green_black" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="254 144" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Green" />
<Text id="res_val_Green_black" rectAlignment="LowerLeft" offsetXY="254 144" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green" />
<Button id="res_Green_journey_points" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="69 236" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Green" />
<Text id="res_val_Green_journey_points" rectAlignment="LowerLeft" offsetXY="69 236" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green" />
<Button id="res_Green_rare_candy" onClick="adjustResource" rectAlignment="LowerLeft" offsetXY="129 236" width="30" height="30" fontSize="1" color="#00000000" textColor="#00000000" visibility="Green" />
<Text id="res_val_Green_rare_candy" rectAlignment="LowerLeft" offsetXY="129 236" width="30" height="30" fontSize="18" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green" />

<Button id="ball_Green_13" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="254 519" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Noi Ball" tooltipPosition="Below" visibility="Green"/>
<Text id="ball_val_Green_13" rectAlignment="LowerLeft" offsetXY="254 562" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green"/>
<Button id="ball_Green_12" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="182 519" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Master Ball" tooltipPosition="Below" visibility="Green"/>
<Text id="ball_val_Green_12" rectAlignment="LowerLeft" offsetXY="182 562" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green"/>
<Button id="ball_Green_11" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="110 519" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Safari Ball" tooltipPosition="Below" visibility="Green"/>
<Text id="ball_val_Green_11" rectAlignment="LowerLeft" offsetXY="110 562" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green"/>
<Button id="ball_Green_7" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="110 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Heal Ball" tooltipPosition="Below" visibility="Green"/>
<Text id="ball_val_Green_7" rectAlignment="LowerLeft" offsetXY="110 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green"/>
<Button id="ball_Green_8" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="182 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Luxury Ball" tooltipPosition="Below" visibility="Green"/>
<Text id="ball_val_Green_8" rectAlignment="LowerLeft" offsetXY="182 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green"/>
<Button id="ball_Green_9" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="254 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Quick Ball" tooltipPosition="Below" visibility="Green"/>
<Text id="ball_val_Green_9" rectAlignment="LowerLeft" offsetXY="254 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green"/>
<Button id="ball_Green_6" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="38 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Love Ball" tooltipPosition="Below" visibility="Green"/>
<Text id="ball_val_Green_6" rectAlignment="LowerLeft" offsetXY="38 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green"/>
<Button id="ball_Green_10" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="326 629" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Phase Ball" tooltipPosition="Below" visibility="Green"/>
<Text id="ball_val_Green_10" rectAlignment="LowerLeft" offsetXY="326 679" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green"/>
<Button id="ball_Green_5" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="326 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Light Ball" tooltipPosition="Below" visibility="Green"/>
<Text id="ball_val_Green_5" rectAlignment="LowerLeft" offsetXY="326 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green"/>
<Button id="ball_Green_4" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="254 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Heavy Ball" tooltipPosition="Below" visibility="Green"/>
<Text id="ball_val_Green_4" rectAlignment="LowerLeft" offsetXY="254 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green"/>
<Button id="ball_Green_3" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="182 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Ultra Ball" tooltipPosition="Below" visibility="Green"/>
<Text id="ball_val_Green_3" rectAlignment="LowerLeft" offsetXY="182 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green"/>
<Button id="ball_Green_2" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="110 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Great Ball" tooltipPosition="Below" visibility="Green"/>
<Text id="ball_val_Green_2" rectAlignment="LowerLeft" offsetXY="110 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green"/>
<Button id="ball_Green_1" onClick="craftBall" rectAlignment="LowerLeft" offsetXY="38 739" width="45" height="25" fontSize="1" color="#00000000" textColor="#00000000" tooltip="Pokeball" tooltipPosition="Below" visibility="Green"/>
<Text id="ball_val_Green_1" rectAlignment="LowerLeft" offsetXY="38 789" width="45" height="35" fontSize="16" fontStyle="Bold" color="#000000" outline="#FFFFFF" outlineSize="1 1" alignment="MiddleCenter" visibility="Green"/>

<Panel id="recipes_panel_Green" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="440" height="300" color="#1a1208" outline="#5a4030" padding="0 0 0 0" visibility="Green">
    <VerticalLayout spacing="0">
        <HorizontalLayout height="40" color="#2a1a0a" padding="10 10 6 6" spacing="6">
            <Text fontSize="15" fontStyle="Bold" color="#c8a882" alignment="MiddleLeft" flexibleWidth="1">&#x1F4DC; Crafting Recipes</Text>
            <Button onClick="closeRecipesPanel(Green)" width="32" height="32" fontSize="14" fontStyle="Bold" color="#3a1a0a" textColor="#c8a882" highlightedColor="#5a3010">✕</Button>
        </HorizontalLayout>
        <Panel color="#1a1208" padding="16 16 16 16" flexibleHeight="1">
            <Text fontSize="12" color="#6a5a40" alignment="MiddleCenter">Recipe content coming soon.</Text>
        </Panel>
    </VerticalLayout>
</Panel>

<!-- BREEDER PROFESSION BUTTON — root-level global, toggled by crafting panel -->
<Panel id="prof_btn_Green_breeder_container" rectAlignment="LowerLeft" offsetXY="35 870" width="345" height="65" image="breederIcon" color="#FFFFFF" padding="0 0 0 0" ignoreLayout="true" visibility="Green" active="false">
    <Button id="prof_btn_Green_breeder" onClick="toggleBreederStation" width="345" height="65" color="#00000000" textColor="#00000000" />
</Panel>

<Panel id="breeder_station_Green" active="false" rectAlignment="LowerLeft" offsetXY="10 78" width="404" height="990" image="breederBG" color="#FFFFFF" padding="0 0 0 0" interactable="false" visibility="Green">
    <!-- Active Perk Slots and Option Slots moved to root level -->

    <!-- Perk Option Slots (3) - moved to root level -->

    <!-- Obtain A Perk Button - moved to root level -->

    <!-- Profession Encyclopedia Button (moved to root level) -->

    <!-- Confirmation Dialog moved to root level -->

    <!-- Encyclopedia moved to root level -->
</Panel>

<!-- TOGGLE BUTTONS -->
<Button id="crafting_toggle_White" onClick="toggleCraftingPanel" rectAlignment="LowerLeft" offsetXY="135 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="White">&#x2692; Crafting</Button>
<Button id="pokemon_toggle_White" rectAlignment="LowerLeft" offsetXY="275 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="White">Pokemon</Button>
<Button id="trainer_toggle_White" onClick="toggleCategoryPanel" rectAlignment="LowerLeft" offsetXY="415 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="White">Trainer</Button>
<Button id="items_toggle_White" onClick="toggleCategoryPanel" rectAlignment="LowerLeft" offsetXY="555 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="White">Items</Button>

<Button id="crafting_toggle_Red" onClick="toggleCraftingPanel" rectAlignment="LowerLeft" offsetXY="135 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="Red">&#x2692; Crafting</Button>
<Button id="pokemon_toggle_Red" rectAlignment="LowerLeft" offsetXY="275 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="Red">Pokemon</Button>
<Button id="trainer_toggle_Red" onClick="toggleCategoryPanel" rectAlignment="LowerLeft" offsetXY="415 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="Red">Trainer</Button>
<Button id="items_toggle_Red" onClick="toggleCategoryPanel" rectAlignment="LowerLeft" offsetXY="555 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="Red">Items</Button>

<Button id="crafting_toggle_Blue" onClick="toggleCraftingPanel" rectAlignment="LowerLeft" offsetXY="135 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="Blue">&#x2692; Crafting</Button>
<Button id="pokemon_toggle_Blue" rectAlignment="LowerLeft" offsetXY="275 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="Blue">Pokemon</Button>
<Button id="trainer_toggle_Blue" onClick="toggleCategoryPanel" rectAlignment="LowerLeft" offsetXY="415 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="Blue">Trainer</Button>
<Button id="items_toggle_Blue" onClick="toggleCategoryPanel" rectAlignment="LowerLeft" offsetXY="555 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="Blue">Items</Button>

<Button id="crafting_toggle_Green" onClick="toggleCraftingPanel" rectAlignment="LowerLeft" offsetXY="135 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="Green">&#x2692; Crafting</Button>
<Button id="pokemon_toggle_Green" rectAlignment="LowerLeft" offsetXY="275 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="Green">Pokemon</Button>
<Button id="trainer_toggle_Green" onClick="toggleCategoryPanel" rectAlignment="LowerLeft" offsetXY="415 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="Green">Trainer</Button>
<Button id="items_toggle_Green" onClick="toggleCategoryPanel" rectAlignment="LowerLeft" offsetXY="555 5" width="130" height="50" fontSize="18" fontStyle="Bold" color="#2a1a0a" textColor="#c8a882" highlightedColor="#3a2a1a" outline="#5a4030" visibility="Green">Items</Button>

<!-- OBTAIN A PERK BUTTONS — root-level global, toggled when breeder station opens -->
<Button id="draw_breeder_White" onClick="drawBreederPerk" rectAlignment="LowerLeft" offsetXY="100 932" width="220" height="60" colors="#00000000|#00000000|#00000000|#00000000" outlineSize="0" visibility="White" active="false" />
<Button id="draw_breeder_Red" onClick="drawBreederPerk" rectAlignment="LowerLeft" offsetXY="100 932" width="220" height="60" colors="#00000000|#00000000|#00000000|#00000000" outlineSize="0" visibility="Red" active="false" />
<Button id="draw_breeder_Blue" onClick="drawBreederPerk" rectAlignment="LowerLeft" offsetXY="100 932" width="220" height="60" colors="#00000000|#00000000|#00000000|#00000000" outlineSize="0" visibility="Blue" active="false" />
<Button id="draw_breeder_Green" onClick="drawBreederPerk" rectAlignment="LowerLeft" offsetXY="100 932" width="220" height="60" colors="#00000000|#00000000|#00000000|#00000000" outlineSize="0" visibility="Green" active="false" />

<!-- ENCYCLOPEDIA BUTTONS — root-level global, toggled when breeder station opens -->
<Button id="encyclopedia_btn_White" onClick="toggleEncyclopedia" rectAlignment="LowerLeft" offsetXY="30 74" width="352" height="114" colors="#00000000|#00000000|#00000000|#00000000" outlineSize="0" visibility="White" active="false" />
<Button id="encyclopedia_btn_Red" onClick="toggleEncyclopedia" rectAlignment="LowerLeft" offsetXY="30 74" width="352" height="114" colors="#00000000|#00000000|#00000000|#00000000" outlineSize="0" visibility="Red" active="false" />
<Button id="encyclopedia_btn_Blue" onClick="toggleEncyclopedia" rectAlignment="LowerLeft" offsetXY="30 74" width="352" height="114" colors="#00000000|#00000000|#00000000|#00000000" outlineSize="0" visibility="Blue" active="false" />
<Button id="encyclopedia_btn_Green" onClick="toggleEncyclopedia" rectAlignment="LowerLeft" offsetXY="30 74" width="352" height="114" colors="#00000000|#00000000|#00000000|#00000000" outlineSize="0" visibility="Green" active="false" />

<!-- ENCYCLOPEDIA PANELS — root-level, bottom center -->
<Panel id="encyclopedia_panel_White" active="false" rectAlignment="LowerCenter" offsetXY="0 -16" width="741" height="602" image="bency" color="#FFFFFF" interactable="false" padding="0 0 0 0" visibility="White" />
<Panel id="encyclopedia_panel_Red" active="false" rectAlignment="LowerCenter" offsetXY="0 -16" width="741" height="602" image="bency" color="#FFFFFF" interactable="false" padding="0 0 0 0" visibility="Red" />
<Panel id="encyclopedia_panel_Blue" active="false" rectAlignment="LowerCenter" offsetXY="0 -16" width="741" height="602" image="bency" color="#FFFFFF" interactable="false" padding="0 0 0 0" visibility="Blue" />
<Panel id="encyclopedia_panel_Green" active="false" rectAlignment="LowerCenter" offsetXY="0 -16" width="741" height="602" image="bency" color="#FFFFFF" interactable="false" padding="0 0 0 0" visibility="Green" />

<!-- TEMP TEST SLOT at center screen for placement verification -->
<Button id="test_encyclopedia_slot" active="true" rectAlignment="MiddleCenter" offsetXY="0 0" width="45" height="50" color="#FFFFFF" />

<!-- ENCYCLOPEDIA DETAIL VIEW — root-level elements for independent positioning -->
<Button id="encyclopedia_detail_img_White" active="false" rectAlignment="MiddleCenter" offsetXY="-232 -190" width="65" height="80" color="#FFFFFF" visibility="White" />
<Text id="encyclopedia_detail_name_White" active="false" rectAlignment="MiddleCenter" offsetXY="-232 -140" width="180" height="25" fontSize="13" fontStyle="Bold" color="#1a1208" alignment="MiddleCenter" visibility="White" />
<Text id="encyclopedia_detail_effect_White" active="false" rectAlignment="MiddleCenter" offsetXY="-232 -344" width="215" height="85" fontSize="10" fontStyle="Bold" color="#1a1208" alignment="MiddleCenter" wrapText="true" visibility="White" />
<Button id="encyclopedia_detail_img_Red" active="false" rectAlignment="MiddleCenter" offsetXY="-232 -190" width="65" height="80" color="#FFFFFF" visibility="Red" />
<Text id="encyclopedia_detail_name_Red" active="false" rectAlignment="MiddleCenter" offsetXY="-232 -140" width="180" height="25" fontSize="13" fontStyle="Bold" color="#1a1208" alignment="MiddleCenter" visibility="Red" />
<Text id="encyclopedia_detail_effect_Red" active="false" rectAlignment="MiddleCenter" offsetXY="-232 -344" width="215" height="85" fontSize="10" fontStyle="Bold" color="#1a1208" alignment="MiddleCenter" wrapText="true" visibility="Red" />
<Button id="encyclopedia_detail_img_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="-232 -190" width="65" height="80" color="#FFFFFF" visibility="Blue" />
<Text id="encyclopedia_detail_name_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="-232 -140" width="180" height="25" fontSize="13" fontStyle="Bold" color="#1a1208" alignment="MiddleCenter" visibility="Blue" />
<Text id="encyclopedia_detail_effect_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="-232 -344" width="215" height="85" fontSize="10" fontStyle="Bold" color="#1a1208" alignment="MiddleCenter" wrapText="true" visibility="Blue" />
<Button id="encyclopedia_detail_img_Green" active="false" rectAlignment="MiddleCenter" offsetXY="-232 -190" width="65" height="80" color="#FFFFFF" visibility="Green" />
<Text id="encyclopedia_detail_name_Green" active="false" rectAlignment="MiddleCenter" offsetXY="-232 -140" width="180" height="25" fontSize="13" fontStyle="Bold" color="#1a1208" alignment="MiddleCenter" visibility="Green" />
<Text id="encyclopedia_detail_effect_Green" active="false" rectAlignment="MiddleCenter" offsetXY="-232 -344" width="215" height="85" fontSize="10" fontStyle="Bold" color="#1a1208" alignment="MiddleCenter" wrapText="true" visibility="Green" />

<!-- ENCYCLOPEDIA PERK SLOTS — root-level global, visible when encyclopedia panel is toggled -->
<Button id="encyclopedia_slot_1_White" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_2_White" active="false" rectAlignment="MiddleCenter" offsetXY="39 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_3_White" active="false" rectAlignment="MiddleCenter" offsetXY="103 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_4_White" active="false" rectAlignment="MiddleCenter" offsetXY="174 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_5_White" active="false" rectAlignment="MiddleCenter" offsetXY="237 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_6_White" active="false" rectAlignment="MiddleCenter" offsetXY="307 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_7_White" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_8_White" active="false" rectAlignment="MiddleCenter" offsetXY="39 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_9_White" active="false" rectAlignment="MiddleCenter" offsetXY="103 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_10_White" active="false" rectAlignment="MiddleCenter" offsetXY="174 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_11_White" active="false" rectAlignment="MiddleCenter" offsetXY="237 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_12_White" active="false" rectAlignment="MiddleCenter" offsetXY="307 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_13_White" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_14_White" active="false" rectAlignment="MiddleCenter" offsetXY="39 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_15_White" active="false" rectAlignment="MiddleCenter" offsetXY="103 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_16_White" active="false" rectAlignment="MiddleCenter" offsetXY="174 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_17_White" active="false" rectAlignment="MiddleCenter" offsetXY="237 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_18_White" active="false" rectAlignment="MiddleCenter" offsetXY="307 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_19_White" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_20_White" active="false" rectAlignment="MiddleCenter" offsetXY="39 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_21_White" active="false" rectAlignment="MiddleCenter" offsetXY="103 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_22_White" active="false" rectAlignment="MiddleCenter" offsetXY="174 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_23_White" active="false" rectAlignment="MiddleCenter" offsetXY="237 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_24_White" active="false" rectAlignment="MiddleCenter" offsetXY="307 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_25_White" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_26_White" active="false" rectAlignment="MiddleCenter" offsetXY="39 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_27_White" active="false" rectAlignment="MiddleCenter" offsetXY="103 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_28_White" active="false" rectAlignment="MiddleCenter" offsetXY="174 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_29_White" active="false" rectAlignment="MiddleCenter" offsetXY="237 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />
<Button id="encyclopedia_slot_30_White" active="false" rectAlignment="MiddleCenter" offsetXY="307 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="White" />

<Button id="encyclopedia_slot_1_Red" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_2_Red" active="false" rectAlignment="MiddleCenter" offsetXY="39 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_3_Red" active="false" rectAlignment="MiddleCenter" offsetXY="103 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_4_Red" active="false" rectAlignment="MiddleCenter" offsetXY="174 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_5_Red" active="false" rectAlignment="MiddleCenter" offsetXY="237 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_6_Red" active="false" rectAlignment="MiddleCenter" offsetXY="307 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_7_Red" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_8_Red" active="false" rectAlignment="MiddleCenter" offsetXY="39 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_9_Red" active="false" rectAlignment="MiddleCenter" offsetXY="103 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_10_Red" active="false" rectAlignment="MiddleCenter" offsetXY="174 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_11_Red" active="false" rectAlignment="MiddleCenter" offsetXY="237 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_12_Red" active="false" rectAlignment="MiddleCenter" offsetXY="307 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_13_Red" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_14_Red" active="false" rectAlignment="MiddleCenter" offsetXY="39 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_15_Red" active="false" rectAlignment="MiddleCenter" offsetXY="103 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_16_Red" active="false" rectAlignment="MiddleCenter" offsetXY="174 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_17_Red" active="false" rectAlignment="MiddleCenter" offsetXY="237 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_18_Red" active="false" rectAlignment="MiddleCenter" offsetXY="307 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_19_Red" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_20_Red" active="false" rectAlignment="MiddleCenter" offsetXY="39 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_21_Red" active="false" rectAlignment="MiddleCenter" offsetXY="103 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_22_Red" active="false" rectAlignment="MiddleCenter" offsetXY="174 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_23_Red" active="false" rectAlignment="MiddleCenter" offsetXY="237 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_24_Red" active="false" rectAlignment="MiddleCenter" offsetXY="307 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_25_Red" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_26_Red" active="false" rectAlignment="MiddleCenter" offsetXY="39 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_27_Red" active="false" rectAlignment="MiddleCenter" offsetXY="103 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_28_Red" active="false" rectAlignment="MiddleCenter" offsetXY="174 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_29_Red" active="false" rectAlignment="MiddleCenter" offsetXY="237 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />
<Button id="encyclopedia_slot_30_Red" active="false" rectAlignment="MiddleCenter" offsetXY="307 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Red" />

<Button id="encyclopedia_slot_1_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_2_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="39 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_3_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="103 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_4_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="174 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_5_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="237 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_6_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="307 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_7_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_8_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="39 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_9_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="103 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_10_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="174 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_11_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="237 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_12_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="307 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_13_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_14_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="39 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_15_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="103 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_16_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="174 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_17_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="237 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_18_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="307 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_19_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_20_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="39 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_21_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="103 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_22_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="174 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_23_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="237 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_24_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="307 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_25_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_26_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="39 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_27_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="103 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_28_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="174 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_29_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="237 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />
<Button id="encyclopedia_slot_30_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="307 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Blue" />

<Button id="encyclopedia_slot_1_Green" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_2_Green" active="false" rectAlignment="MiddleCenter" offsetXY="39 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_3_Green" active="false" rectAlignment="MiddleCenter" offsetXY="103 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_4_Green" active="false" rectAlignment="MiddleCenter" offsetXY="174 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_5_Green" active="false" rectAlignment="MiddleCenter" offsetXY="237 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_6_Green" active="false" rectAlignment="MiddleCenter" offsetXY="307 -154" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_7_Green" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_8_Green" active="false" rectAlignment="MiddleCenter" offsetXY="39 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_9_Green" active="false" rectAlignment="MiddleCenter" offsetXY="103 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_10_Green" active="false" rectAlignment="MiddleCenter" offsetXY="174 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_11_Green" active="false" rectAlignment="MiddleCenter" offsetXY="237 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_12_Green" active="false" rectAlignment="MiddleCenter" offsetXY="307 -234" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_13_Green" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_14_Green" active="false" rectAlignment="MiddleCenter" offsetXY="39 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_15_Green" active="false" rectAlignment="MiddleCenter" offsetXY="103 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_16_Green" active="false" rectAlignment="MiddleCenter" offsetXY="174 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_17_Green" active="false" rectAlignment="MiddleCenter" offsetXY="237 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_18_Green" active="false" rectAlignment="MiddleCenter" offsetXY="307 -314" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_19_Green" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_20_Green" active="false" rectAlignment="MiddleCenter" offsetXY="39 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_21_Green" active="false" rectAlignment="MiddleCenter" offsetXY="103 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_22_Green" active="false" rectAlignment="MiddleCenter" offsetXY="174 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_23_Green" active="false" rectAlignment="MiddleCenter" offsetXY="237 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_24_Green" active="false" rectAlignment="MiddleCenter" offsetXY="307 -395" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_25_Green" active="false" rectAlignment="MiddleCenter" offsetXY="-29 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_26_Green" active="false" rectAlignment="MiddleCenter" offsetXY="39 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_27_Green" active="false" rectAlignment="MiddleCenter" offsetXY="103 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_28_Green" active="false" rectAlignment="MiddleCenter" offsetXY="174 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_29_Green" active="false" rectAlignment="MiddleCenter" offsetXY="237 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />
<Button id="encyclopedia_slot_30_Green" active="false" rectAlignment="MiddleCenter" offsetXY="307 -476" width="45" height="50" onClick="clickEncyclopediaSlot" color="#FFFFFF" visibility="Green" />

<!-- PERK OPTION SLOTS — root-level global, toggled when breeder station opens -->
<Button id="option_slot_1_btn_White" active="false" rectAlignment="LowerLeft" offsetXY="59 680" width="80" height="130" onClick="clickOptionPerk" color="#FFFFFF" visibility="White" />
<Button id="option_slot_2_btn_White" active="false" rectAlignment="LowerLeft" offsetXY="169 680" width="80" height="130" onClick="clickOptionPerk" color="#FFFFFF" visibility="White" />
<Button id="option_slot_3_btn_White" active="false" rectAlignment="LowerLeft" offsetXY="279 680" width="80" height="130" onClick="clickOptionPerk" color="#FFFFFF" visibility="White" />
<Button id="option_slot_1_btn_Red" active="false" rectAlignment="LowerLeft" offsetXY="59 680" width="80" height="130" onClick="clickOptionPerk" color="#FFFFFF" visibility="Red" />
<Button id="option_slot_2_btn_Red" active="false" rectAlignment="LowerLeft" offsetXY="169 680" width="80" height="130" onClick="clickOptionPerk" color="#FFFFFF" visibility="Red" />
<Button id="option_slot_3_btn_Red" active="false" rectAlignment="LowerLeft" offsetXY="279 680" width="80" height="130" onClick="clickOptionPerk" color="#FFFFFF" visibility="Red" />
<Button id="option_slot_1_btn_Blue" active="false" rectAlignment="LowerLeft" offsetXY="59 680" width="80" height="130" onClick="clickOptionPerk" color="#FFFFFF" visibility="Blue" />
<Button id="option_slot_2_btn_Blue" active="false" rectAlignment="LowerLeft" offsetXY="169 680" width="80" height="130" onClick="clickOptionPerk" color="#FFFFFF" visibility="Blue" />
<Button id="option_slot_3_btn_Blue" active="false" rectAlignment="LowerLeft" offsetXY="279 680" width="80" height="130" onClick="clickOptionPerk" color="#FFFFFF" visibility="Blue" />
<Button id="option_slot_1_btn_Green" active="false" rectAlignment="LowerLeft" offsetXY="59 680" width="80" height="130" onClick="clickOptionPerk" color="#FFFFFF" visibility="Green" />
<Button id="option_slot_2_btn_Green" active="false" rectAlignment="LowerLeft" offsetXY="169 680" width="80" height="130" onClick="clickOptionPerk" color="#FFFFFF" visibility="Green" />
<Button id="option_slot_3_btn_Green" active="false" rectAlignment="LowerLeft" offsetXY="279 680" width="80" height="130" onClick="clickOptionPerk" color="#FFFFFF" visibility="Green" />

<!-- ══════════════════════════════════════════════════════════
     ROOT-LEVEL BREEDER UI — confirmation panels, active slots
     ══════════════════════════════════════════════════════════ -->

<!-- CONFIRMATION PANELS — tiny, centered, per player -->
<Panel id="confirmation_panel_White" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="220" height="120" color="#1A1A1AF5" outline="#FFD54F" outlineSize="3" padding="10 10 10 10" visibility="White">
    <VerticalLayout spacing="6" childForceExpandHeight="false">
        <Text fontSize="12" fontStyle="Bold" color="#FFD54F" alignment="MiddleCenter">Claim this perk?</Text>
        <HorizontalLayout spacing="10" height="38">
            <Button id="confirm_claim_yes_White" onClick="confirmClaimYes" text="YES" fontSize="13" fontStyle="Bold" color="#4CAF50" textColor="#FFFFFF" />
            <Button id="confirm_claim_no_White" onClick="confirmClaimNo" text="NO" fontSize="13" fontStyle="Bold" color="#F44336" textColor="#FFFFFF" />
        </HorizontalLayout>
    </VerticalLayout>
</Panel>
<Panel id="confirmation_panel_Red" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="220" height="120" color="#1A1A1AF5" outline="#FFD54F" outlineSize="3" padding="10 10 10 10" visibility="Red">
    <VerticalLayout spacing="6" childForceExpandHeight="false">
        <Text fontSize="12" fontStyle="Bold" color="#FFD54F" alignment="MiddleCenter">Claim this perk?</Text>
        <HorizontalLayout spacing="10" height="38">
            <Button id="confirm_claim_yes_Red" onClick="confirmClaimYes" text="YES" fontSize="13" fontStyle="Bold" color="#4CAF50" textColor="#FFFFFF" />
            <Button id="confirm_claim_no_Red" onClick="confirmClaimNo" text="NO" fontSize="13" fontStyle="Bold" color="#F44336" textColor="#FFFFFF" />
        </HorizontalLayout>
    </VerticalLayout>
</Panel>
<Panel id="confirmation_panel_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="220" height="120" color="#1A1A1AF5" outline="#FFD54F" outlineSize="3" padding="10 10 10 10" visibility="Blue">
    <VerticalLayout spacing="6" childForceExpandHeight="false">
        <Text fontSize="12" fontStyle="Bold" color="#FFD54F" alignment="MiddleCenter">Claim this perk?</Text>
        <HorizontalLayout spacing="10" height="38">
            <Button id="confirm_claim_yes_Blue" onClick="confirmClaimYes" text="YES" fontSize="13" fontStyle="Bold" color="#4CAF50" textColor="#FFFFFF" />
            <Button id="confirm_claim_no_Blue" onClick="confirmClaimNo" text="NO" fontSize="13" fontStyle="Bold" color="#F44336" textColor="#FFFFFF" />
        </HorizontalLayout>
    </VerticalLayout>
</Panel>
<Panel id="confirmation_panel_Green" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="220" height="120" color="#1A1A1AF5" outline="#FFD54F" outlineSize="3" padding="10 10 10 10" visibility="Green">
    <VerticalLayout spacing="6" childForceExpandHeight="false">
        <Text fontSize="12" fontStyle="Bold" color="#FFD54F" alignment="MiddleCenter">Claim this perk?</Text>
        <HorizontalLayout spacing="10" height="38">
            <Button id="confirm_claim_yes_Green" onClick="confirmClaimYes" text="YES" fontSize="13" fontStyle="Bold" color="#4CAF50" textColor="#FFFFFF" />
            <Button id="confirm_claim_no_Green" onClick="confirmClaimNo" text="NO" fontSize="13" fontStyle="Bold" color="#F44336" textColor="#FFFFFF" />
        </HorizontalLayout>
    </VerticalLayout>
</Panel>

<!-- ACTIVE PERK SLOTS — root-level global, shown when breeder station open -->
<Button id="active_slot_1_img_White" active="false" rectAlignment="LowerLeft" offsetXY="59 404" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="White" />
<Button id="active_slot_2_img_White" active="false" rectAlignment="LowerLeft" offsetXY="169 404" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="White" />
<Button id="active_slot_3_img_White" active="false" rectAlignment="LowerLeft" offsetXY="279 404" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="White" />
<Button id="active_slot_4_img_White" active="false" rectAlignment="LowerLeft" offsetXY="59 254" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="White" />
<Button id="active_slot_5_img_White" active="false" rectAlignment="LowerLeft" offsetXY="169 254" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="White" />
<Button id="active_slot_6_img_White" active="false" rectAlignment="LowerLeft" offsetXY="279 245" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="White" />

<Button id="active_slot_1_img_Red" active="false" rectAlignment="LowerLeft" offsetXY="59 404" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Red" />
<Button id="active_slot_2_img_Red" active="false" rectAlignment="LowerLeft" offsetXY="169 404" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Red" />
<Button id="active_slot_3_img_Red" active="false" rectAlignment="LowerLeft" offsetXY="279 404" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Red" />
<Button id="active_slot_4_img_Red" active="false" rectAlignment="LowerLeft" offsetXY="59 254" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Red" />
<Button id="active_slot_5_img_Red" active="false" rectAlignment="LowerLeft" offsetXY="169 254" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Red" />
<Button id="active_slot_6_img_Red" active="false" rectAlignment="LowerLeft" offsetXY="279 245" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Red" />

<Button id="active_slot_1_img_Blue" active="false" rectAlignment="LowerLeft" offsetXY="59 404" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Blue" />
<Button id="active_slot_2_img_Blue" active="false" rectAlignment="LowerLeft" offsetXY="169 404" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Blue" />
<Button id="active_slot_3_img_Blue" active="false" rectAlignment="LowerLeft" offsetXY="279 404" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Blue" />
<Button id="active_slot_4_img_Blue" active="false" rectAlignment="LowerLeft" offsetXY="59 254" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Blue" />
<Button id="active_slot_5_img_Blue" active="false" rectAlignment="LowerLeft" offsetXY="169 254" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Blue" />
<Button id="active_slot_6_img_Blue" active="false" rectAlignment="LowerLeft" offsetXY="279 245" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Blue" />

<Button id="active_slot_1_img_Green" active="false" rectAlignment="LowerLeft" offsetXY="59 404" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Green" />
<Button id="active_slot_2_img_Green" active="false" rectAlignment="LowerLeft" offsetXY="169 404" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Green" />
<Button id="active_slot_3_img_Green" active="false" rectAlignment="LowerLeft" offsetXY="279 404" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Green" />
<Button id="active_slot_4_img_Green" active="false" rectAlignment="LowerLeft" offsetXY="59 254" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Green" />
<Button id="active_slot_5_img_Green" active="false" rectAlignment="LowerLeft" offsetXY="169 254" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Green" />
<Button id="active_slot_6_img_Green" active="false" rectAlignment="LowerLeft" offsetXY="279 245" width="80" height="130" image="breederIcon" color="#FFFFFF" colors="#FFFFFF|#FFFFFF|#FFFFFF|#FFFFFF" outlineSize="0" visibility="Green" />

<!-- COORDINATE FINDER — small draggable dot, placed at prof_btn position for reference -->
<Panel id="debug_coord_panel" active="true"
    rectAlignment="LowerLeft"
    offsetXY="35 870"
    width="12" height="12"
    color="#00FF00"
    allowDragging="true"
    returnToOriginalPosition="false"
>
    <Text id="debug_coord_val" fontSize="1" color="#00000000">.</Text>
</Panel>

<!-- ══════════════════════════════════════════════════════════
     POKEDEX — centered DEX Panel with 20 card buttons (4 rows × 5 cols)
     ══════════════════════════════════════════════════════════ -->

<!-- WHITE -->
<Panel id="pokedex_panel_White" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="2000" height="1300" image="dexPanel" color="#FFFFFF" padding="0 0 0 0" interactable="false" visibility="White" />
<Button id="pokedex_card_16_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 -300" width="100" height="140" image="pokeCard16" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_17_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 -300" width="100" height="140" image="pokeCard17" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_18_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 -300" width="100" height="140" image="pokeCard18" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_19_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 -300" width="100" height="140" image="pokeCard19" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_20_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 -300" width="100" height="140" image="pokeCard20" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_11_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 -157" width="100" height="140" image="pokeCard11" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_12_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 -157" width="100" height="140" image="pokeCard12" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_13_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 -157" width="100" height="140" image="pokeCard13" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_14_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 -157" width="100" height="140" image="pokeCard14" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_15_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 -157" width="100" height="140" image="pokeCard15" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_6_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 -14" width="100" height="140" image="pokeCard6" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_7_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 -14" width="100" height="140" image="pokeCard7" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_8_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 -14" width="100" height="140" image="pokeCard8" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_9_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 -14" width="100" height="140" image="pokeCard9" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_10_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 -14" width="100" height="140" image="pokeCard10" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_1_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 130" width="100" height="140" image="pokeCard1" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_2_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 130" width="100" height="140" image="pokeCard2" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_3_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 130" width="100" height="140" image="pokeCard3" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_4_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 130" width="100" height="140" image="pokeCard4" color="#FFFFFF" visibility="White" />
<Button id="pokedex_card_5_White" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 130" width="100" height="140" image="pokeCard5" color="#FFFFFF" visibility="White" />
<Button id="pokedex_close_White" onClick="closePokedex" active="false" rectAlignment="MiddleCenter" offsetXY="930 -600" width="40" height="40" fontSize="16" fontStyle="Bold" color="#1a0000" textColor="#ff6666" highlightedColor="#330000" visibility="White">✕</Button>
<Button id="pokedex_next_White" onClick="pokedexNEXT" active="false" rectAlignment="MiddleCenter" offsetXY="210 248" width="200" height="110" image="dexNext" color="#FFFFFF" visibility="White" />

<!-- RED -->
<Panel id="pokedex_panel_Red" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="2000" height="1300" image="dexPanel" color="#FFFFFF" padding="0 0 0 0" interactable="false" visibility="Red" />
<Button id="pokedex_card_16_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 -300" width="100" height="140" image="pokeCard16" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_17_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 -300" width="100" height="140" image="pokeCard17" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_18_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 -300" width="100" height="140" image="pokeCard18" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_19_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 -300" width="100" height="140" image="pokeCard19" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_20_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 -300" width="100" height="140" image="pokeCard20" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_11_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 -157" width="100" height="140" image="pokeCard11" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_12_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 -157" width="100" height="140" image="pokeCard12" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_13_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 -157" width="100" height="140" image="pokeCard13" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_14_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 -157" width="100" height="140" image="pokeCard14" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_15_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 -157" width="100" height="140" image="pokeCard15" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_6_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 -14" width="100" height="140" image="pokeCard6" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_7_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 -14" width="100" height="140" image="pokeCard7" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_8_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 -14" width="100" height="140" image="pokeCard8" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_9_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 -14" width="100" height="140" image="pokeCard9" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_10_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 -14" width="100" height="140" image="pokeCard10" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_1_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 130" width="100" height="140" image="pokeCard1" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_2_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 130" width="100" height="140" image="pokeCard2" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_3_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 130" width="100" height="140" image="pokeCard3" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_4_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 130" width="100" height="140" image="pokeCard4" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_card_5_Red" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 130" width="100" height="140" image="pokeCard5" color="#FFFFFF" visibility="Red" />
<Button id="pokedex_close_Red" onClick="closePokedex" active="false" rectAlignment="MiddleCenter" offsetXY="930 -600" width="40" height="40" fontSize="16" fontStyle="Bold" color="#1a0000" textColor="#ff6666" highlightedColor="#330000" visibility="Red">✕</Button>
<Button id="pokedex_next_Red" onClick="pokedexNEXT" active="false" rectAlignment="MiddleCenter" offsetXY="210 248" width="200" height="110" image="dexNext" color="#FFFFFF" visibility="Red" />

<!-- BLUE -->
<Panel id="pokedex_panel_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="2000" height="1300" image="dexPanel" color="#FFFFFF" padding="0 0 0 0" interactable="false" visibility="Blue" />
<Button id="pokedex_card_16_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 -300" width="100" height="140" image="pokeCard16" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_17_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 -300" width="100" height="140" image="pokeCard17" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_18_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 -300" width="100" height="140" image="pokeCard18" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_19_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 -300" width="100" height="140" image="pokeCard19" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_20_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 -300" width="100" height="140" image="pokeCard20" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_11_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 -157" width="100" height="140" image="pokeCard11" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_12_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 -157" width="100" height="140" image="pokeCard12" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_13_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 -157" width="100" height="140" image="pokeCard13" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_14_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 -157" width="100" height="140" image="pokeCard14" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_15_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 -157" width="100" height="140" image="pokeCard15" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_6_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 -14" width="100" height="140" image="pokeCard6" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_7_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 -14" width="100" height="140" image="pokeCard7" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_8_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 -14" width="100" height="140" image="pokeCard8" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_9_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 -14" width="100" height="140" image="pokeCard9" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_10_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 -14" width="100" height="140" image="pokeCard10" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_1_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 130" width="100" height="140" image="pokeCard1" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_2_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 130" width="100" height="140" image="pokeCard2" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_3_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 130" width="100" height="140" image="pokeCard3" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_4_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 130" width="100" height="140" image="pokeCard4" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_card_5_Blue" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 130" width="100" height="140" image="pokeCard5" color="#FFFFFF" visibility="Blue" />
<Button id="pokedex_close_Blue" onClick="closePokedex" active="false" rectAlignment="MiddleCenter" offsetXY="930 -600" width="40" height="40" fontSize="16" fontStyle="Bold" color="#1a0000" textColor="#ff6666" highlightedColor="#330000" visibility="Blue">✕</Button>
<Button id="pokedex_next_Blue" onClick="pokedexNEXT" active="false" rectAlignment="MiddleCenter" offsetXY="210 248" width="200" height="110" image="dexNext" color="#FFFFFF" visibility="Blue" />

<!-- GREEN -->
<Panel id="pokedex_panel_Green" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="2000" height="1300" image="dexPanel" color="#FFFFFF" padding="0 0 0 0" interactable="false" visibility="Green" />
<Button id="pokedex_card_16_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 -300" width="100" height="140" image="pokeCard16" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_17_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 -300" width="100" height="140" image="pokeCard17" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_18_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 -300" width="100" height="140" image="pokeCard18" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_19_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 -300" width="100" height="140" image="pokeCard19" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_20_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 -300" width="100" height="140" image="pokeCard20" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_11_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 -157" width="100" height="140" image="pokeCard11" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_12_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 -157" width="100" height="140" image="pokeCard12" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_13_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 -157" width="100" height="140" image="pokeCard13" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_14_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 -157" width="100" height="140" image="pokeCard14" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_15_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 -157" width="100" height="140" image="pokeCard15" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_6_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 -14" width="100" height="140" image="pokeCard6" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_7_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 -14" width="100" height="140" image="pokeCard7" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_8_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 -14" width="100" height="140" image="pokeCard8" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_9_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 -14" width="100" height="140" image="pokeCard9" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_10_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 -14" width="100" height="140" image="pokeCard10" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_1_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-350 130" width="100" height="140" image="pokeCard1" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_2_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-210 130" width="100" height="140" image="pokeCard2" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_3_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="-70 130" width="100" height="140" image="pokeCard3" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_4_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="70 130" width="100" height="140" image="pokeCard4" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_card_5_Green" onClick="pokedexCardClick" active="false" rectAlignment="MiddleCenter" offsetXY="210 130" width="100" height="140" image="pokeCard5" color="#FFFFFF" visibility="Green" />
<Button id="pokedex_close_Green" onClick="closePokedex" active="false" rectAlignment="MiddleCenter" offsetXY="930 -600" width="40" height="40" fontSize="16" fontStyle="Bold" color="#1a0000" textColor="#ff6666" highlightedColor="#330000" visibility="Green">✕</Button>
<Button id="pokedex_next_Green" onClick="pokedexNEXT" active="false" rectAlignment="MiddleCenter" offsetXY="210 248" width="200" height="110" image="dexNext" color="#FFFFFF" visibility="Green" />

<!-- Pokedex toggle buttons — bottom-right (rendered after panels so they stay clickable) -->
<Button id="pokedex_toggle_White" onClick="toggleCategoryPanel" rectAlignment="LowerRight" offsetXY="-10 5" width="160" height="55" fontSize="18" fontStyle="Bold" color="#1a0000" textColor="#ff3333" highlightedColor="#330000" outline="#ff3333" outlineSize="2" visibility="White">POKEDEX</Button>
<Button id="pokedex_toggle_Red" onClick="toggleCategoryPanel" rectAlignment="LowerRight" offsetXY="-10 5" width="160" height="55" fontSize="18" fontStyle="Bold" color="#1a0000" textColor="#ff3333" highlightedColor="#330000" outline="#ff3333" outlineSize="2" visibility="Red">POKEDEX</Button>
<Button id="pokedex_toggle_Blue" onClick="toggleCategoryPanel" rectAlignment="LowerRight" offsetXY="-10 5" width="160" height="55" fontSize="18" fontStyle="Bold" color="#1a0000" textColor="#ff3333" highlightedColor="#330000" outline="#ff3333" outlineSize="2" visibility="Blue">POKEDEX</Button>
<Button id="pokedex_toggle_Green" onClick="toggleCategoryPanel" rectAlignment="LowerRight" offsetXY="-10 5" width="160" height="55" fontSize="18" fontStyle="Bold" color="#1a0000" textColor="#ff3333" highlightedColor="#330000" outline="#ff3333" outlineSize="2" visibility="Green">POKEDEX</Button>

<!-- ══════════════════════════════════════════════════════════
     POKEMON VIEW PANEL — snapshot-based, same scale as pokedex
     Shows a pre-rendered snap from the designer tool
     ══════════════════════════════════════════════════════════ -->

<!-- WHITE -->
<Panel id="pokeview_panel_White" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="2000" height="1300" color="#FFFFFF" padding="0" interactable="false" visibility="White" />
<Button id="pokeview_close_White" onClick="closePokemonView" active="false" rectAlignment="MiddleCenter" offsetXY="930 -600" width="40" height="40" fontSize="20" fontStyle="Bold" color="#1a0000" textColor="#ff6666" highlightedColor="#330000" visibility="White">✕</Button>

<!-- RED -->
<Panel id="pokeview_panel_Red" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="2000" height="1300" color="#FFFFFF" padding="0" interactable="false" visibility="Red" />
<Button id="pokeview_close_Red" onClick="closePokemonView" active="false" rectAlignment="MiddleCenter" offsetXY="930 -600" width="40" height="40" fontSize="20" fontStyle="Bold" color="#1a0000" textColor="#ff6666" highlightedColor="#330000" visibility="Red">✕</Button>

<!-- BLUE -->
<Panel id="pokeview_panel_Blue" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="2000" height="1300" color="#FFFFFF" padding="0" interactable="false" visibility="Blue" />
<Button id="pokeview_close_Blue" onClick="closePokemonView" active="false" rectAlignment="MiddleCenter" offsetXY="930 -600" width="40" height="40" fontSize="20" fontStyle="Bold" color="#1a0000" textColor="#ff6666" highlightedColor="#330000" visibility="Blue">✕</Button>

<!-- GREEN -->
<Panel id="pokeview_panel_Green" active="false" rectAlignment="MiddleCenter" offsetXY="0 0" width="2000" height="1300" color="#FFFFFF" padding="0" interactable="false" visibility="Green" />
<Button id="pokeview_close_Green" onClick="closePokemonView" active="false" rectAlignment="MiddleCenter" offsetXY="930 -600" width="40" height="40" fontSize="20" fontStyle="Bold" color="#1a0000" textColor="#ff6666" highlightedColor="#330000" visibility="Green">✕</Button>


