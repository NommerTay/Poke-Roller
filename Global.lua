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

-- ── INIT ────────────────────────────────────────────────────

function onLoad()
    -- Register custom UI assets after a delay so UI is ready
    Wait.frames(function()
        UI.setCustomAssets({
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
            { name = "breederPerksEncyclopedia", url = "https://tmpfiles.org/dl/wLwvJLY6Hn1x/encyclopedia_cropped.png" },
        })

        -- Force Tabletop Simulator to refresh and bind the registered images to the XML UI elements
        Wait.time(function()
            UI.setXml(UI.getXml())
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
    print("toggleCategoryPanel: "..category.." "..color.." - not yet implemented")
    broadcastToColor(category.." panel coming soon!", color, {0.8,0.8,0.8})
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
        UI.setAttribute("encyclopedia_panel_"..color, "image", "breederPerksEncyclopedia")
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
