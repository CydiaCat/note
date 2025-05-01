local version, build, date, tocversion = GetBuildInfo()
if version == "3.4.4" then return end
local AceEvent = LibStub("AceEvent-3.0")
local healthCheckHandler = LibStub("LibAsync"):GetHandler({ type = "everyFrame", maxTime = 40, maxTimeCombat = 8, errorHandler = function(
    msg, stack, name) print("ThirkOnekey 发生错误", msg, stack, name) end })
local MODIFIERS = { "ALT-CTRL-", "CTRL-SHIFT-", "ALT-SHIFT-", "ALT-CTRL-SHIFT-", "CTRL-", "ALT-", "SHIFT-" }
local NUMPAD_KEYS = { "=", "-", "0", "9", "8", "7", "6", "\\", "]", "[", "'", ";", "/", ".", ",", "F12", "F11", "F10",
    "F9" }
local MODIFIERS_HP = { "", "CTRL-", "ALT-", }
local NUMPAD_KEYS_HP = { "NUMPAD0", "NUMPAD1", "NUMPAD2", "NUMPAD3", "NUMPAD4", "NUMPAD5", "NUMPAD6", "NUMPAD7",
    "NUMPAD8", "NUMPAD9" }
local addOnsName = "Troublemaker"
local imageFrame
local texture
local casttingSafeSpell = false
local imageFrame_r
local texture_r
local aimiFrame
local gcd = 0
local items = { 2, 9, 11, 12, 13, 14, 15, 16, 17 }
local excludSpells = { [56222] = true, [185245] = true, [195072] = true, [6795] = true, [115546] = true, [62124] = true,
    [355] = true, }
local outCombatSpells = { [315584] = true, [8679] = true, [3408] = true, [381637] = true, [115191] = true, [1784] = true,
    [381664] = true, [2823] = true, [5215] = true, [21562] = true, [121536] = true, [1126] = true, [224464] = true,
    [5512] = true, [-105001] = true, }
local colors_act = ThirkOnekey:GenerateColors(163)
local safeCannelSpellIDs = { [47758] = true, [421434] = true, [373129] = true, [263165] = true, [443028] = true, [257044] = true,
    [212084] = true, [452486] = true, [113656] = true, [740] = true, [64843] = true, [391528] = true, [194308] = true,
    [198013] = true, [452497] = true, [-191] = true, [-192] = true, [-193] = true, [-202] = true, [-203] = true, [-118] = true,
    [-215] = true, [-286] = true, [-318] = true, [-319] = true, [394927] = true, [12051] = true, [382440] = true,
    [191837] = true, [117952] = true, [205021] = true, [471214] = true }
local hasInit = false
local state = ThirkOnekey.State
local needFocusHot = {}
local jiarens = { [223724] = true, [219250] = true, [225978] = true, [225985] = true, [231839] = true, [231935] = true,
    [233623] = true, [213751] = true, [65310] = true, [189632] = true, [189617] = true, [4952] = "Theramore Combat Dummy",
    [5652] = "Undercity Combat Dummy", [25225] = "Practice Dummy", [25297] = "Drill Dummy", [31144] = "Training Dummy",
    [31146] = "Raider's Training Dummy", [32541] = "Initiate's Training Dummy", [32543] = "Veteran's Training Dummy",
    [32546] = "Ebon Knight's Training Dummy", [32542] = "Disciple's Training Dummy", [32545] = "Training Dummy",
    [32666] = "Training Dummy", [32667] = "Training Dummy", [44171] = "Training Dummy", [44548] = "Training Dummy",
    [44389] = "Training Dummy", [44614] = "Training Dummy", [44703] = "Training Dummy", [44794] = "Training Dummy",
    [44820] = "Training Dummy", [44848] = "Training Dummy", [44937] = "Training Dummy", [46647] = "Training Dummy",
    [48304] = "Training Dummy", [60197] = "Training Dummy", [64446] = "Training Dummy", [67127] = "Training Dummy",
    [70245] = "Training Dummy", [79414] = "Training Dummy", [87317] = "Training Dummy", [87318] =
"Dungeoneer's Training Dummy", [87320] = "Raider's Training Dummy", [87322] = "Dungeoneer's Training Dummy", [87329] =
"Raider's Training Dummy", [87760] = "Training Dummy", [87761] = "Dungeoneer's Training Dummy", [87762] =
"Raider's Training Dummy", [88288] = "Dungeoneer's Training Dummy", [88314] = "Dungeoneer's Training Dummy", [88836] =
"Dungeoneer's Training Dummy", [88837] = "Raider's Training Dummy", [88906] = "Combat Dummy", [89078] = "Training Dummy",
    [92164] = "Training Dummy", [92165] = "Dungeoneer's Training Dummy", [92166] = "Raider's Training Dummy", [92168] =
"Dungeoneer's Training Dummy", [92169] = "Raider's Training Dummy", [93828] = "Training Dummy", [97668] =
"Boxer's Training Dummy", [98581] = "Prepfoot Training Dummy", [107104] = "Target Dummy", [108420] = "Training Dummy",
    [109066] = "Dungeon Damage Dummy", [109096] = "Normal Tanking Dummy", [111824] = "Training Dummy", [113858] =
"Training Dummy", [113859] = "Dungeoneer's Training Dummy", [113860] = "Raider's Training Dummy", [113862] =
"Training Dummy", [113863] = "Dungeoneer's Training Dummy", [113864] = "Raider's Training Dummy", [113871] =
"Bombardier's Training Dummy", [126712] = "Training Dummy", [126781] = "Training Dummy", [127019] = "Training Dummy",
    [131983] = "Raider's Training Dummy", [131989] = "Training Dummy", [131990] = "Raider's Training Dummy", [131992] =
"Dungeoneer's Training Dummy", [132976] = "Training Dummy", [134324] = "Training Dummy", [138048] = "Training Dummy",
    [143119] = "Gnoll Target Dummy", [143509] = "Training Dummy", [144073] = "Dungeoneer's Training Dummy", [144077] =
"Training Dummy", [144081] = "Training Dummy", [144085] = "Training Dummy", [144086] = "Raider's Training Dummy",
    [153285] = "Training Dummy", [153292] = "Training Dummy", [172452] = "Raider's Tanking Dummy", [173942] =
"Training Dummy", [174565] = "Raider's Tanking Dummy", [174566] = "Dungeoneer's Tanking Dummy", [174567] =
"Raider's Tanking Dummy", [174568] = "Dungeoneer's Tanking Dummy", [175449] = "Dungeoneer's Training Dummy", [175450] =
"Raider's Training Dummy", [175451] = "Dungeoneer's Training Dummy", [194643] = "Dungeoneer's Training Dummy", [194644] =
"Dungeoneer's Training Dummy", [194648] = "Training Dummy", [194649] = "Normal Tank Dummy", [193394] =
"Tuskarr Training Dummy", [193563] = "Training Dummy", [198594] = "Cleave Training Dummy", [199057] =
"Black Dragon's Challenge Dummy", [216458] = "Sparring Dummy", [222275] = "Training Dummy", [225976] =
"Normal Tank Dummy", [225977] = "Dungeoneer's Training Dummy", [225982] = "Cleave Training Dummy", [225983] =
"Dungeoneer's Training Dummy", [225984] = "Training Dummy", [235830] = "Training Dummy", }
local racialSkills = { [33702] = true, [202719] = true, [80483] = true, [260364] = true, [232633] = true, [129597] = true,
    [265221] = true, [33697] = true, [255647] = true, [274738] = true, [26297] = true, [25046] = true, [58984] = true,
    [50613] = true, [155145] = true, [20572] = true, [312411] = true, [69179] = true }
local temperedPotions = { [212265] = true, [212263] = true, [212264] = true }
local frontlinePotions = { [212262] = true, [262261] = true, [212260] = true }
local Core = { abilities = {} }
local preHots = {}
local hurtNum = 0
local bigHurtNum = 0
local damageSpell_mana = 1
local lowest_hp_Tab = { unti = "none", pct = 100, alive_players = 0, role = "DPS", class = "none", setting = { combat_value = 95, out_combat_value = 95 } }
ThirkOnekey.gseUp = false
local RealPause = function()
    if ThirkOnekey.DB.profile.toggles.gseMode.value then return (not ThirkOnekey.gseUp) end
    return ThirkOnekey.Pause
end
local GetSpellCharges = function(spellID)
    local spellChargeInfo = C_Spell.GetSpellCharges(spellID); if spellChargeInfo then return
        spellChargeInfo.currentCharges, spellChargeInfo.maxCharges, spellChargeInfo.cooldownStartTime,
            spellChargeInfo.cooldownDuration, spellChargeInfo.chargeModRate; end
end
local buff = { atonement = { totalCount = 0, remains_min = 0, remains_min_unti = "none", fucos_remains = 0, hp_offset = 3, id = 194384 }, light_of_the_martyr_dot = { hp_offset = -20, id = 448005 }, beacon_of_light = { hp_offset = 3, id = 156910 }, earth_shield = { hp_offset = -3, id = 974 }, riptide = { totalCount = 0, remains_min = 0, id = 61295 }, rejuvenation = { id = 774, totalCount = 0, remains_min = 0, remains_min_unti = "none", fucos_remains = 0, hp_offset = 3, }, lifebloom_2 = { id = 188550, totalCount = 0, remains_min = 0, remains_min_unti = "none", fucos_remains = 0, hp_offset = 3, }, rejuvenation_germination = { id = 155777, totalCount = 0, remains_min = 0, remains_min_unti = "none", fucos_remains = 0, hp_offset = 3, }, spring_blossoms = { id = 207386, totalCount = 0, remains_min = 0, remains_min_unti = "none", fucos_remains = 0, hp_offset = 3, }, regrowth = { id = 8936, totalCount = 0, remains_min = 0, remains_min_unti = "none", fucos_remains = 0, hp_offset = 3, }, wild_growth = { id = 48438, totalCount = 0, remains_min = 0, remains_min_unti = "none", fucos_remains = 0, hp_offset = 3, }, renewing_mist = { totalCount = 0, id = 119611, hp_offset = 3, } }
local jst = { jianci = { hp_offset = -20, }, aoe = { hp_offset = -20, } }
local printedKeys = {}
local Keys = {}
local KeyIdx = 1
function Core.RegisterEvent()
    ThirkOnekey.Pause = true
    NSLog("ThirkOnekey 加载中...")
    if hasInit == true then return end
    hasInit = true
    if ThirkOnekey.DB == nil then NSLog("ThirkOnekey 未加载 请确认后 /RL 一下") end
    aimiFrame = ThirkOnekey:CreatAmiFrame()
    ThirkOnekey:CreatLJCMD()
    ThirkOnekey.MakeSnapshot = function() end
    SetCVar("Sound_EnableErrorSpeech", 0)
    if InCombatLockdown() ~= true then
        SetCVar("nameplateShowAll", "1")
        SetCVar("nameplateShowEnemies", "1")
        SetCVar("Brightness", 50)
        SetCVar("Contrast", 50)
        SetCVar("Gamma", 1)
        if C_AddOnProfiler.IsEnabled() then
            RegisterCVar("addonProfilerEnabled", "1")
            SetCVar("addonProfilerEnabled", "0")
        end
        RemoveAllMarco()
    end
    function ThirkOnekey:CheakTargetIsJiaRen(unti, currentTarget)
        if unti == nil then return false end
        if currentTarget == true and state.target.npcid ~= -1 then if jiarens[state.target.npcid] then return true end end
        local guid = UnitGUID(unti)
        local npcid = guid:match("(%d+)-%x-$")
        npcid = tonumber(npcid)
        if npcid ~= -1 then if jiarens[npcid] then return true end end
        if UnitAffectingCombat("player") == true and state.target.distance < 10 and npcid ~= -1 then return true end
        return false
    end

    imageFrame = CreateFrame("Frame", nil, UIParent)
    imageFrame:SetFrameStrata("TOOLTIP")
    imageFrame:SetFrameLevel(100)
    imageFrame:SetSize(300, 8)
    imageFrame:ClearAllPoints()
    imageFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, 0)
    texture = imageFrame:CreateTexture(nil, "BACKGROUND")
    texture:SetAllPoints(imageFrame)
    imageFrame.texture = texture
    texture:SetColorTexture(0, 0, 0, 1)
    imageFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
    imageFrame:RegisterEvent("DISPLAY_SIZE_CHANGED")
    imageFrame:RegisterEvent("UI_SCALE_CHANGED")
    imageFrame:SetScript("OnEvent",
        function(self, event)
            imageFrame:SetScale(1)
            imageFrame:SetSize(300, 8)
            imageFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, 0)
        end)
    imageFrame_r = CreateFrame("Frame", nil, UIParent)
    imageFrame_r:SetFrameStrata("TOOLTIP")
    imageFrame_r:SetFrameLevel(100)
    imageFrame_r:SetSize(300, 8)
    imageFrame_r:ClearAllPoints()
    imageFrame_r:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
    texture_r = imageFrame_r:CreateTexture(nil, "BACKGROUND")
    texture_r:SetAllPoints(imageFrame_r)
    imageFrame_r.texture = texture_r
    texture_r:SetColorTexture(8 / 255, 21 / 255, 29 / 255, 1)
    imageFrame_r:RegisterEvent("PLAYER_ENTERING_WORLD")
    imageFrame_r:RegisterEvent("DISPLAY_SIZE_CHANGED")
    imageFrame_r:RegisterEvent("UI_SCALE_CHANGED")
    imageFrame_r:RegisterEvent("PLAYER_REGEN_ENABLED")
    imageFrame_r:SetScript("OnEvent",
        function(self, event)
            imageFrame_r:SetScale(1)
            imageFrame_r:SetSize(300, 8)
            imageFrame_r:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
        end)
    local lastSwitchTime = 0
    local lastActTime = 0
    local switchCooldown = 0.3
    local currentTime = 0
    local MaxFPS = 30
    local tempFPS = 1
    AceEvent:RegisterMessage("ThirkOnekey-EVENT-UPDATE-HP",
        function(event, message)
            gcd = GetSpellCD(61304)
            if ThirkOnekey.DB.profile.toggles.mouseAmi.value then if aimiFrame and not aimiFrame:IsShown() then aimiFrame
                        :Show() end else if aimiFrame and aimiFrame:IsShown() then aimiFrame:Hide() end end
            if IsKeyDown(ThirkOnekey.DB.profile.toggles.pause.key) then ThirkOnekey.gseUp = true else ThirkOnekey.gseUp = false end
            if RealPause() then if imageFrame:IsShown() then
                    imageFrame:Hide()
                    imageFrame_r:Hide()
                end else if not imageFrame:IsShown() then
                    imageFrame:Show()
                    imageFrame_r:Show()
                end end
        end)
    AceEvent:RegisterMessage("ThirkOnekey-EVENT-UPDATE",
        function(event, message)
            switchCooldown = (ThirkOnekey.DB.profile.specs[state.spec.id].GCDThoredValue or 0.3)
            local dbProfile = ThirkOnekey.DB.profile
            local specProfile = dbProfile.specs[state.spec.id]
            local debugMode = dbProfile.toggles.debugMode.value
            currentTime = GetTime()
            local spellID = select(9, UnitCastingInfo("player")) or select(8, UnitChannelInfo("player"))
            if spellID ~= nil then
                if debugMode then NSLog("当前引导技能ID(不是技能ID)" .. spellID) end
                casttingSafeSpell = safeCannelSpellIDs[spellID]
            else casttingSafeSpell = false end
            if RealPause() then
                if debugMode then NSLog("Pause") end
                SetBlank()
                return
            end
            if UnitIsDead("player") or UntiHasBuff("player", 27827) or casttingSafeSpell then
                SetBlank()
                return
            end
            if IsMounted() then
                SetBlank()
                return
            end
            if GetCurrentKeyBoardFocus() ~= nil then
                SetBlank()
                return
            end
            if dbProfile.toggles.visCombat.value and not InCombatLockdown() then
                if debugMode then NSLog("仅战斗中生效") end
                SetBlank()
                return
            end
            if not message.Ability then
                if debugMode then NSLog("message 爲空") end
                SetBlank()
                return
            end
            if enabled_Hp() then
                if debugMode then NSLog("message hp 藥水") end
                texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities["hp"].qr))
                return
            end
            if enabled_mp() then
                if debugMode then NSLog("message mp 藥水") end
                texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities["mp"].qr))
                return
            end
            if rebackInFighting_enable() then
                if debugMode then NSLog("message 战复") end
                texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities["rebackInFighting"].qr))
                return
            end
            if specProfile.settings.autofoucus_enable then if lowest_hp_Tab.unti ~= "none" or #needFocusHot > 0 then if needTabNeedHelpPlayer(message) then
                        if debugMode then NSLog("目标切换逻辑 - " .. lowest_hp_Tab.unti) end
                        return
                    end elseif UnitGUID("focus") and (#needFocusHot == 0 and lowest_hp_Tab.unti == "none") then
                    texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities["clearFocus"].qr))
                    return
                end end
            if enableBoomHit() then
                if debugMode then NSLog("message 打球") end
                texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities["bitBoom"].qr))
                return
            end
            if not message.Ability.item then
                if not AutoEnabled(message) then
                    if debugMode then NSLog("message 暂停逻辑") end
                    return
                end
                if tabEnemies(message) then
                    if debugMode then NSLog("message 切換目標") end
                    return
                end
                if racialSkills[message.Ability.id] then
                    texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities["racial"].qr))
                    if debugMode then NSLog("message 种族技能" .. message.Ability.id) end
                    return
                end
                local offset = message.ex_duration - (currentTime - lastActTime)
                if message.Ability.cast == 0 and (message.ExactTime - GetTime()) < 1 then offset = gcd end
                if (offset - switchCooldown <= 0 or message.Ability.gcd == "off" or message.Ability.id == 124682 or message.Ability.id == 116670 or message.Recommendation.actionName == "soothing_mist" or message.Recommendation.actionName == "slicing_winds") then if Core.abilities[message.Action] then
                        if debugMode then NSLog("message 技能存在" .. message.Ability.id .. message.Action) end
                        texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities[message.Action].qr))
                        lastActTime = currentTime
                    else
                        if debugMode then NSLog("message 技能空" .. message.Ability.id) end
                        SetBlank()
                    end else
                    if debugMode then NSLog("message 技能等待" .. message.Ability.id) end
                    SetBlank()
                end
            else
                if not AutoEnabled(message) then
                    if debugMode then NSLog("message 暂停逻辑 message.Ability.item") end
                    return
                end
                if tabEnemies(message) then
                    if debugMode then NSLog("message 切換目標 message.Ability.item") end
                    return
                end
                for index, value in ipairs(items) do
                    local itemID = GetInventoryItemID("player", value)
                    if (itemID == message.Ability.item or ((message.Ability.item == 232805 or message.Ability.item == 232526) and (itemID == 232526 or itemID == 232805))) and Core.abilities["item" .. value] then
                        if debugMode then NSLog("message SP " .. itemID) end
                        texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities["item" .. value].qr))
                        return
                    end
                end
                if message.Ability.item == 224464 or message.Ability.item == 5512 and Core.abilities["healthstone"] then
                    if debugMode then NSLog("message SP " .. "healthstone") end
                    texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities["healthstone"].qr))
                    return
                end
                if temperedPotions[message.Ability.item] and Core.abilities["tempered_potion"] then
                    if debugMode then NSLog("message SP " .. "淬火") end
                    texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities["tempered_potion"].qr))
                    return
                elseif frontlinePotions[message.Ability.item] and Core.abilities["frontline_potion"] then
                    if debugMode then NSLog("message SP " .. "前线") end
                    texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities["frontline_potion"].qr))
                    return
                end
                if debugMode then NSLog("message SP " .. "blank") end
                SetBlank()
            end
        end)
    if InCombatLockdown() == false then
        Keys = {}
        Keys_HP = {}
        printedKeys = {}
        KeyIdx = 1
        for index, value in ipairs(MODIFIERS) do for index_k, value_k in ipairs(NUMPAD_KEYS) do table.insert(Keys,
                    value .. value_k) end end
        for index_hp, value_hp in ipairs(MODIFIERS_HP) do for index_k_hp, value_k_hp in ipairs(NUMPAD_KEYS_HP) do table
                    .insert(Keys_HP, value_hp .. value_k_hp) end end
    end
    AceEvent:RegisterMessage("asoidhawnc!@#",
        function(event, message)
            if ThirkOnekey.DB.profile.specs[state.spec.id].qu_shan_mouse_enable == nil then ThirkOnekey.DB.profile.specs[state.spec.id].qu_shan_mouse_enable = true end
            for key, value in pairs(message) do if printedKeys[value.key] == nil and not excludSpells[value.id] then
                    printedKeys[value.key] = true
                    if not Core.abilities[value.key] then Core.abilities[value.key] = {} end
                    Core.abilities[value.key].id = value.id
                    Core.abilities[value.key].qr = colors_act[KeyIdx]
                    if value.id == 100 then Core.abilities[value.key].qr = { 0, 0, 0, 1 } end
                    if value.key == "soothing_mist_cancel" then
                        CreatMarco(value.key, 9999999, Keys[KeyIdx], "/stopcasting " .. GetSpellName(115175))
                        KeyIdx = (KeyIdx + 1)
                    elseif value.key == "mana_tea_cancel" then
                        CreatMarco(value.key, 9999998, Keys[KeyIdx], "/stopcasting " .. GetSpellName(115294))
                        KeyIdx = (KeyIdx + 1)
                    elseif value.key == "premonition_ex" then
                        CreatMarco(value.key, 9999997, Keys[KeyIdx],
                            "/cast " ..
                            GetSpellName(428933) ..
                            ";\n" ..
                            "/cast " ..
                            GetSpellName(428930) ..
                            ";\n" .. "/cast " .. GetSpellName(428934) .. ";\n" .. "/cast " .. GetSpellName(440725) .. ";")
                        KeyIdx = (KeyIdx + 1)
                    elseif value.key == "lifebloom_self" then
                        CreatMarco(value.key, 9999996, Keys[KeyIdx], "/cast [@player] " .. GetSpellName(33763))
                        KeyIdx = (KeyIdx + 1)
                    else
                        CreatMarco(value.key, value.id, Keys[KeyIdx], nil)
                        KeyIdx = (KeyIdx + 1)
                    end
                end end
            if not printedKeys["cancelaura1"] then
                printedKeys["cancelaura1"] = true
                Core.abilities["cancelaura1"] = {}
                CreatNormalMarco("cancelaura1", Keys[KeyIdx], "/cancelaura " .. GetSpellName(279709))
                Core.abilities["cancelaura1"].id = 'cancelaura' .. 279709
                Core.abilities["cancelaura1"].qr = colors_act[KeyIdx]
                KeyIdx = (KeyIdx + 1)
            end
            if not printedKeys["cancelaura2"] then
                printedKeys["cancelaura2"] = true
                Core.abilities["cancelaura2"] = {}
                CreatNormalMarco("cancelaura2", Keys[KeyIdx], "/stopcasting\n/cancelaura " .. GetSpellName(187827))
                Core.abilities["cancelaura2"].id = 'cancelaura' .. 187827
                Core.abilities["cancelaura2"].qr = colors_act[KeyIdx]
                KeyIdx = (KeyIdx + 1)
            end
            if not printedKeys["cancelaura3"] then
                printedKeys["cancelaura3"] = true
                Core.abilities["cancelaura3"] = {}
                CreatNormalMarco("cancelaura3", Keys[KeyIdx],
                    "/stopcasting\n/cancelaura " ..
                    GetSpellName(426897) ..
                    ";" .. "\n/cancelaura " .. GetSpellName(383886) .. ";" .. "\n/cancelaura " .. GetSpellName(205025))
                Core.abilities["cancelaura3"].id = 'cancelaura' .. 426897
                Core.abilities["cancelaura3"].qr = colors_act[KeyIdx]
                KeyIdx = (KeyIdx + 1)
            end
            if not printedKeys["cancelaura4"] then
                printedKeys["cancelaura4"] = true
                Core.abilities["cancelaura4"] = {}
                CreatNormalMarco("cancelaura4", Keys[KeyIdx], "/cancelaura " .. GetSpellName(59052))
                Core.abilities["cancelaura4"].id = 'cancelaura' .. 59052
                Core.abilities["cancelaura4"].qr = colors_act[KeyIdx]
                KeyIdx = (KeyIdx + 1)
            end
            for index, value in ipairs(items) do if not printedKeys["item" .. value] then
                    printedKeys["item" .. value] = true
                    Core.abilities["item" .. value] = {}
                    CreatNormalMarco("item" .. value, Keys[KeyIdx], ItemMarco(value))
                    Core.abilities["item" .. value].id = 'item' .. (GetInventoryItemID("player", value) or "null")
                    Core.abilities["item" .. value].qr = colors_act[KeyIdx]
                    KeyIdx = (KeyIdx + 1)
                end end
            if not printedKeys["hp"] then
                printedKeys["hp"] = true
                Core.abilities["hp"] = {}
                CreatNormalMarco("hp", Keys[KeyIdx], "/use item:211880;\n/use item:211879;\n/use item:211878")
                Core.abilities["hp"].id = 'hp' .. 211880
                Core.abilities["hp"].qr = colors_act[KeyIdx]
                KeyIdx = (KeyIdx + 1)
            end
            if not printedKeys["mp"] then
                printedKeys["mp"] = true
                Core.abilities["mp"] = {}
                CreatNormalMarco("mp", Keys[KeyIdx], "/use item:212241;\n/use item:212239;\n/use item:212240")
                Core.abilities["mp"].id = 'mp' .. 212241
                Core.abilities["mp"].qr = colors_act[KeyIdx]
                KeyIdx = (KeyIdx + 1)
            end
            if not printedKeys["frontline_potion"] then
                printedKeys["frontline_potion"] = true
                Core.abilities["frontline_potion"] = {}
                CreatNormalMarco("frontline_potion", Keys[KeyIdx],
                    "/use item:212262;\n/use item:262261;\n/use item:212260")
                Core.abilities["frontline_potion"].id = 'frontline_potion' .. 212262
                Core.abilities["frontline_potion"].qr = colors_act[KeyIdx]
                KeyIdx = (KeyIdx + 1)
            end
            if not printedKeys["tempered_potion"] then
                printedKeys["tempered_potion"] = true
                Core.abilities["tempered_potion"] = {}
                CreatNormalMarco("tempered_potion", Keys[KeyIdx],
                    "/use item:212265;\n/use item:212263;\n/use item:212264")
                Core.abilities["tempered_potion"].id = 'tempered_potion' .. 212241
                Core.abilities["tempered_potion"].qr = colors_act[KeyIdx]
                KeyIdx = (KeyIdx + 1)
            end
            if not printedKeys["healthstone"] then
                printedKeys["healthstone"] = true
                Core.abilities["healthstone"] = {}
                CreatNormalMarco("healthstone", Keys[KeyIdx], "/use item:224464;\n/use item:5512;")
                Core.abilities["healthstone"].id = 'healthstone' .. 224464
                Core.abilities["healthstone"].qr = colors_act[KeyIdx]
                KeyIdx = (KeyIdx + 1)
            end
            local racialmStr = "/cast " ..
            GetSpellName(26297) ..
            L["zztc"] ..
            "\n/cast " ..
            GetSpellName(155145) ..
            "\n/cast " ..
            GetSpellName(58984) ..
            "\n/cast " ..
            GetSpellName(20572) ..
            "\n/cast " ..
            GetSpellName(312411) ..
            "\n/cast " ..
            GetSpellName(274738) ..
            "\n/cast " ..
            GetSpellName(255647) .. "\n/cast " .. GetSpellName(265221) .. "\n/cast " .. GetSpellName(260364)
            if not printedKeys["racial"] then
                printedKeys["racial"] = true
                Core.abilities["racial"] = {}
                CreatNormalMarco("racial", Keys[KeyIdx], racialmStr)
                Core.abilities["racial"].id = 'racial' .. 26297
                Core.abilities["racial"].qr = colors_act[KeyIdx]
                KeyIdx = (KeyIdx + 1)
            end
            if UnitClassBase("player") == "PALADIN" or UnitClassBase("player") == "DRUID" or UnitClassBase("player") == "WARLOCK" or UnitClassBase("player") == "DEATHKNIGHT" then
                local zhanfuStr = ""
                if UnitClassBase("player") == "PALADIN" then zhanfuStr = "/cast [@mouseover] " .. GetSpellName(391054) end
                if UnitClassBase("player") == "DRUID" then zhanfuStr = "/cast [@mouseover] " .. GetSpellName(20484) end
                if UnitClassBase("player") == "WARLOCK" then zhanfuStr = "/cast [@mouseover] " .. GetSpellName(20707) end
                if UnitClassBase("player") == "DEATHKNIGHT" then zhanfuStr = "/cast [@mouseover] " .. GetSpellName(61999) end
                if not printedKeys["rebackInFighting"] then
                    printedKeys["rebackInFighting"] = true
                    Core.abilities["rebackInFighting"] = {}
                    CreatNormalMarco("rebackInFighting", Keys[KeyIdx], zhanfuStr)
                    Core.abilities["rebackInFighting"].id = 'rebackInFighting' .. 26297
                    Core.abilities["rebackInFighting"].qr = colors_act[KeyIdx]
                    KeyIdx = (KeyIdx + 1)
                end
            end
            if not printedKeys["clearFocus"] then
                printedKeys["clearFocus"] = true
                Core.abilities["clearFocus"] = {}
                CreatNormalMarco("clearFocus", Keys[KeyIdx], "/clearfocus")
                Core.abilities["clearFocus"].id = 'clearFocus'
                Core.abilities["clearFocus"].qr = colors_act[KeyIdx]
                KeyIdx = (KeyIdx + 1)
            end
            if ThirkOnekey.DB.profile.specs[ThirkOnekey.State.spec.id].bitBoomSpecData and ThirkOnekey.DB.profile.specs[ThirkOnekey.State.spec.id].MouseHitBoomSpell then if not printedKeys["bitBoom"] then
                    printedKeys["bitBoom"] = true
                    Core.abilities["bitBoom"] = {}
                    CreatNormalMarco("bitBoom", Keys[KeyIdx],
                        ThirkOnekey.DB.profile.specs[ThirkOnekey.State.spec.id].bitBoomSpecData)
                    Core.abilities["bitBoom"].id = 'bitBoom' .. 224464
                    Core.abilities["bitBoom"].qr = colors_act[KeyIdx]
                    KeyIdx = (KeyIdx + 1)
                    NSLog("已编辑特殊目标焦点技能: - " .. ThirkOnekey.DB.profile.specs[ThirkOnekey.State.spec.id].bitBoomSpecData)
                end end
            for i, untiName in ipairs({ "player", "party1", "party2", "party3", "party4" }) do if not printedKeys[untiName] then
                    printedKeys[untiName] = true
                    Core.abilities[untiName] = {}
                    CreatNormalMarco(untiName, Keys[KeyIdx], "/focus " .. untiName)
                    Core.abilities[untiName].id = 'focus_' .. 224464
                    Core.abilities[untiName].qr = colors_act[KeyIdx]
                    KeyIdx = (KeyIdx + 1)
                end end
            if not printedKeys["tab"] then
                printedKeys["tab"] = true
                Core.abilities["tab"] = {}
                CreatNormalMarco("tab", Keys[KeyIdx], "/targetenemy")
                Core.abilities["tab"].id = 'tab' .. 212241
                Core.abilities["tab"].qr = colors_act[KeyIdx]
                KeyIdx = (KeyIdx + 1)
            end
            for index, value in ipairs(Keys_HP) do
                local k = "raid" .. index
                if not printedKeys[k] then
                    printedKeys[k] = true
                    if not Core.abilities[k] then Core.abilities[k] = {} end
                    Core.abilities[k].id = k
                    Core.abilities[k].qr = colors_act[133 + index]
                    CreatNormalMarco(k, value, "/focus raid" .. index)
                end
            end
            BuffInit()
        end)
    addStateExt()
    C_Timer.After(5,
        function()
            C_Timer.NewTicker(0.02, function() AutoCoolDown() end)
            C_Timer.NewTicker(0.05,
                function()
                    MaxFPS = 25 - (ThirkOnekey.DB.profile.specs[state.spec.id].HeplerConfig_hp_checkSpeed or 20)
                    if tempFPS > MaxFPS then
                        checkPlayersHp()
                        tempFPS = 0
                    end
                    tempFPS = tempFPS + 1
                end)
            NSLog("初始化完成")
            ThirkOnekey:UpdateDisplayVisibility()
            ThirkOnekey:ForceUpdate("Thirk_TOGGLE", true)
        end)
end

function AutoEnabled(message)
    if outCombatSpells[message.Ability.id] then
        if in_array(state.spec.id, { 260, 261, 259, 103 }) then
            if ThirkOnekey.DB.profile.specs[state.spec.id].settings.autohid then return true end
            return false
        end
        return true
    end
    local distance_force = (ThirkOnekey.DB.profile.specs[state.spec.id].nameplateRange or 0)
    if (distance_force > 0) and ((state.target.distance or 0) > distance_force) and ThirkOnekey.DB.profile.toggles.target_distance_check.value == true then
        SetBlank()
        return false
    end
    if state.target.npcid ~= -1 then if ThirkOnekey:CheakTargetIsJiaRen("target", true) == false and UnitAffectingCombat("target") == false and ThirkOnekey.DB.profile.toggles.crazyDog.value == false and UnitHealth("target") ~= 0 and lowest_hp_Tab.unti == "none" and #needFocusHot == 0 then
            SetBlank()
            return false
        end end
    if (state.target.npcid == -1 or (not UnitExists("target") or UnitIsDead("target"))) and UnitAffectingCombat("player") == false and (ThirkOnekey.DB.profile.specs[state.spec.id].settings.autofoucus_enable == false or (#needFocusHot == 0 and lowest_hp_Tab.unti == "none")) then if ThirkOnekey.DB.profile.toggles.targetSelect.autoSelec_force == false then
            SetBlank()
            return false
        end end
    if lowest_hp_Tab.unti == "none" and UnitIsFriend("target", "player") and UnitAffectingCombat("player") == false and #needFocusHot == 0 then
        SetBlank()
        return false
    end
    if state.empowerment.hold > 0 then
        if message.EarliestTime == 0 or message.Action == "slicing_winds" then return true end
        SetBlank()
        return false
    end
    return true
end

function enabled_Hp()
    local tempHasPos = false
    for _, potion in ipairs({ 211880, 211878, 211879 }) do if C_Item.GetItemCount(potion, false) > 0 then
            tempHasPos = true
            break
        end end
    if (UnitLevel('player') or 0) < 71 or InCombatLockdown() == false then return false end
    if (tempHasPos == false or (not ThirkOnekey.DB.profile.toggles.potions_hp.value)) then return false end
    if (tempHasPos == false or (not ThirkOnekey.DB.profile.toggles.potions_hp.value)) then return false end
    if UnitHealth("player") > (ThirkOnekey.DB.profile.toggles.potions_hp.threshold / 100 * UnitHealthMax("player")) then return false end
    local cdDone = (getItemCD(211878) <= 0 or getItemCD(211879) <= 0 or getItemCD(211880) <= 0)
    return cdDone
end

function enabled_mp()
    local tempHasPos = false
    for _, potion in ipairs({ 212239, 212240, 212241 }) do if C_Item.GetItemCount(potion, false) > 0 then
            tempHasPos = true
            break
        end end
    if (UnitLevel('player') or 0) < 71 or InCombatLockdown() == false then return false end
    if (tempHasPos == false or not ThirkOnekey.DB.profile.toggles.potions_mp.value) or UnitPowerMax("player", Enum.PowerType.Mana) <= 0 then return false end
    if UnitPower("player", Enum.PowerType.Mana) > (ThirkOnekey.DB.profile.toggles.potions_mp.threshold / 100 * UnitPowerMax("player", Enum.PowerType.Mana)) then return false end
    local cdDone = (getItemCD(212239) <= 0 or getItemCD(212240) <= 0 or getItemCD(212241) <= 0)
    return cdDone
end

function rebackInFighting_enable()
    local className = UnitClassBase("player")
    if UnitIsDead("mouseover") == true and UnitIsVisible("mouseover") == true and UnitIsFriend("mouseover", "player") == true and ThirkOnekey.DB.profile.toggles.FastRestOnFighting.value == true then
        if className == "DEATHKNIGHT" then
            local currentPwDk = UnitPower("player", 6)
            if currentPwDk >= 30 then return true end
        end
        if className == "DRUID" then return true end
        if className == "PALADIN" then
            local currentPw = UnitPower("player", 9)
            if currentPw >= 3 then return true end
        end
        if className == "WARLOCK" then return true end
    end
    return false
end

function enableBoomHit()
    local specData = ThirkOnekey.DB.profile.specs[ThirkOnekey.State.spec.id]
    if specData.bitBoomSpecData and specData.MouseHitBoomSpell and printedKeys["bitBoom"] then
        local targetNames = { UnitName("mouseover"), UnitName("target") }
        for _, name in ipairs(targetNames) do if specData.MouseHitBoomSpell ~= "" and name and string.match(name, specData.MouseHitBoomSpell) == specData.MouseHitBoomSpell then return true end end
    end
    return false
end

function SetBlank() texture:SetColorTexture(0, 0, 0, 1) end

function tabEnemies(message)
    if Core.abilities["tab"] == nil then
        texture:SetColorTexture(0, 0, 0, 1)
        return false
    end
    if (message.Recommendation.indicator == "cycle" and message.Ability.id ~= 80240 and ThirkOnekey.DB.profile.toggles.targetSelect.value == true) or (UnitHealth("target") == 0 or ((UnitIsFriend("target", "player") == true and UnitCanAttack("player", "target") == false) and UnitAffectingCombat("player") == true)) and ThirkOnekey.DB.profile.toggles.targetSelect.value == true then if UnitAffectingCombat("player") == true and ThirkOnekey.enemiesTotalHP > 0 and ThirkOnekey.DB.profile.toggles.targetSelect.value == true and lowest_hp_Tab.unti ~= "target" then
            texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities["tab"].qr))
            return true
        end end
    if (state.target.npcid == -1 or (UnitIsFriend("target", "player") == true and UnitCanAttack("player", "target") == false) or message.outOfRange) and UnitAffectingCombat("player") == false then if ThirkOnekey.DB.profile.toggles.targetSelect.value and ThirkOnekey.DB.profile.toggles.targetSelect.autoSelec_force then
            texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities["tab"].qr))
            return true
        end end
    return false
end

function AutoCoolDown()
    if ThirkOnekey.DB.profile.toggles.cooldown_safe.value then
        if InCombatLockdown() then
            local playerhpMax = UnitHealthMax("player")
            if playerhpMax == 0 then return end
            if (ThirkOnekey.enemiesTotalHP / playerhpMax) <= (ThirkOnekey.DB.profile.specs[state.spec.id].autoCooldown_closeTime or 0.3) then ThirkOnekey.DB.profile.toggles.cooldowns.value = false end
        end
        return
    end
    if ThirkOnekey.DB.profile.toggles.autoCooldown.value then
        local playerhpMax = UnitHealthMax("player")
        if playerhpMax == 0 then return end
        if (ThirkOnekey.enemiesTotalHP / playerhpMax) <= (ThirkOnekey.DB.profile.specs[state.spec.id].autoCooldown_closeTime or 0.3) then ThirkOnekey.DB.profile.toggles.cooldowns.value = false else ThirkOnekey.DB.profile.toggles.cooldowns.value = true end
    end
end

function RemoveAllMarco() if InCombatLockdown() ~= true then for _, modifier in ipairs(MODIFIERS) do for _, key in ipairs(NUMPAD_KEYS) do
                SetBinding(modifier .. key, nil) end end end end

function getItemCD(itemId)
    local start, duration, enabled = C_Item.GetItemCooldown(itemId); CDTime = start + duration - GetTime()
    if CDTime <= 0 or CDTime >= 1000 then CDTime = 0 end
    return CDTime
end

local tempV = true
function CreatMarco(marcoid, id, key, customMarco)
    if GetSpellName(id) == nil and id ~= 9999999 and id ~= 9999997 and id ~= 9999998 and id ~= 9999996 then return end
    local mmStr = customMarco or ("/cast " .. FixMarco(id) .. GetSpellName(id) .. ";")
    if 326059 == id or 428332 == id then mmStr = "/cast [@focus,help,nodead] [nodead] [@player] " ..
        GetSpellName(428332) ..
        ";\n" .. "/cast [@focus,help,nodead] [nodead] [@player] " .. GetSpellName(428332) .. "(暗影国度)" end
    if 47540 == id or 186720 == id or 400169 == id then mmStr = "/cast " .. GetSpellName(47540) end
    if 432472 == id or 432459 == id then mmStr = "/cast [known:" ..
        432459 ..
        ",@focus,help,nodead] [known:" ..
        432459 ..
        ",help,nodead] [known:" ..
        432459 ..
        "]" .. GetSpellName(432459) .. ";\n" .. "/cast [known:" .. 432472 .. ",@player] " .. GetSpellName(432472) end
    if 80240 == id then mmStr = "/tar player\n" ..
        "/targetlasttarget\n" ..
        "/targetenemy\n" ..
        "/targetlasttarget\n" ..
        "/targetlasttarget [harm]/\n" ..
        "/cast " ..
        GetSpellName(80240) .. "\n" .. "/targetlasttarget [harm]\n" .. "/cleartarget [harm]\n" .. "/targetlasttarget\n" end
    if 133 == id or 431044 == id then mmStr = "/cast [known:" ..
        431044 .. "]" .. GetSpellName(431044) .. ";\n" .. "/cast " .. GetSpellName(133) end
    if 433895 == id or 55090 == id or 206930 == id or 207311 == id then mmStr = "/cast [known:" ..
        207311 ..
        "] " ..
        GetSpellName(207311) ..
        ";\n" ..
        "/cast [known:" ..
        55090 ..
        "] " .. GetSpellName(55090) .. ";\n" .. "/cast [known:" .. 206930 .. "] " .. GetSpellName(206930) .. ";\n" end
    if 33891 == id or 390414 == id or 102560 == id or 102543 == id or 102558 == id then mmStr = "/cast [known:" ..
        33891 ..
        "]" ..
        GetSpellName(33891) ..
        ";\n" ..
        "/cast [known:" ..
        390414 ..
        "] [@cursor]" ..
        GetSpellName(390414) ..
        ";\n" ..
        "/cast [known:" ..
        102560 ..
        "]" ..
        GetSpellName(102560) ..
        ";\n" ..
        "/cast [known:" ..
        102543 .. "]" .. GetSpellName(102543) .. ";\n" .. "/cast [known:" .. 102558 .. "]" .. GetSpellName(102558) end
    if 389539 == id or 31884 == id then mmStr = "/cast [known:389539] " ..
        GetSpellName(389539) .. ";" .. "/cast [known:31884] " .. GetSpellName(31884) .. ";" end
    if 427453 == id then mmStr = "/cast [spec:2] " ..
        GetSpellName(387174) .. ";" .. "/cast [spec:3] " .. GetSpellName(255937) .. ";" end
    if 982 == id then mmStr = "/cast [@pet,dead]" .. GetSpellName(982) end
    if 883 == id then mmStr = "/castsequence [@pet,dead] " ..
        GetSpellName(982) .. ";[nopet]reset=2 " .. GetSpellName(883) .. "," .. GetSpellName(982) end
    if 452487 == id or 258920 == id then mmStr = "/cast [known:452487] " ..
        GetSpellName(452487) .. ";" .. "/cast [known:258920] " .. GetSpellName(258920) .. ";" end
    if 452490 == id then
        mmStr = "/castsequence [known:452490] [@player] " ..
        "," .. "[known: 389799] " .. GetSpellName(204596) .. ";\n" .. "/cast [@player] " .. GetSpellName(204596)
        GetSpellName(452490)
    end
    if 451235 == id or 123040 == id or 200174 == id or 34433 == id then mmStr = "/cast [known:" ..
        451235 ..
        "]" ..
        GetSpellName(451235) ..
        ";\n" ..
        "/cast [known:" ..
        123040 ..
        "] [@cursor]" ..
        GetSpellName(123040) ..
        ";\n" ..
        "/cast [known:" ..
        200174 .. "]" .. GetSpellName(200174) .. ";\n" .. "/cast [known:" .. 34433 .. "]" .. GetSpellName(34433) .. ";" end
    if 1214467 == id or 5740 == id then mmStr = "/cast [known:" ..
        1214467 .. "]" .. GetSpellName(5740) .. ";\n" .. "/cast [@cursor] " .. GetSpellName(5740) end
    if 108853 == id then mmStr = "/castsequence reset=0.5 " .. GetSpellName(108853) .. ", nil" end
    if 376079 == id or 307865 == id then mmStr = "/cast [@player]" .. GetSpellName(376079) end
    if 388193 == id or 327104 == id then mmStr = "/cast [known:" ..
        388193 .. "]" .. GetSpellName(388193) .. ";\n" .. "/cast " .. GetSpellName(327104) end
    if 373481 == id or 440678 == id then mmStr = "/cast [known:" ..
        440678 ..
        ",@focus,help,nodead] [known:" ..
        440678 ..
        ",help,nodead] [known:" ..
        440678 ..
        "]" ..
        GetSpellName(440678) ..
        ";\n" ..
        "/cast [known:" ..
        373481 ..
        ",@focus,help,nodead] [known:" ..
        373481 .. ",help,nodead] [known:" .. 373481 .. "]" .. GetSpellName(373481) .. ";\n" end
    if 1217413 == id then mmStr = "/castsequence reset=0.5 " .. GetSpellName(1217413) .. ", " .. GetSpellName(1217413) end
    if 115450 == id or 218164 == id then mmStr = "/cast [@mouseover,help,nodead] [help,nodead] [@player] " ..
        GetSpellName(218164) end
    if 441776 == id or 2098 == id or 196819 == id then mmStr = "/cast [spec:2] " ..
        GetSpellName(2098) .. ";\n" .. "/cast [spec:3] " .. GetSpellName(196819) end
    if 378081 == id then mmStr = "/cast [known:" ..
        443454 .. "]" .. GetSpellName(443454) .. ";\n" .. "/cast " .. GetSpellName(378081) end
    if 444995 == id then mmStr = "/cast [spec:2, @cursor] " ..
        GetSpellName(444995) .. ";\n" .. "/cast [spec:3, @cursor] " .. GetSpellName(73920) end
    if 85948 == id or 458128 == id then mmStr = "/cast " .. GetSpellName(85948) end
    if 455476 == id or 455465 == id or 264119 == id then mmStr = "/cast [known:" ..
        455476 ..
        "]" ..
        GetSpellName(455476) ..
        ";\n" .. "/cast [known:" .. 455465 .. "]" .. GetSpellName(455465) .. ";\n" .. "/cast " .. GetSpellName(264119) end
    local bts = CreateFrame("Button", marcoid, UIParent, "SecureActionButtonTemplate")
    if not bts and tempV then
        NSLog("初始化失败, 请脱战后重载游戏一下 (/RL)")
        tempV = false
        return nil
    end
    bts:RegisterForClicks("AnyUp", "AnyDown")
    bts:SetAttribute("type", "macro")
    bts:SetAttribute("macrotext", mmStr)
    if InCombatLockdown() ~= true then
        SetBinding(key, nil)
        SetOverrideBindingClick(bts, true, key, bts:GetName())
    elseif tempV then
        NSLog("初始化失败, 请脱战后重载游戏一下 (/RL)")
        tempV = false
       
    end
    print(marcoid .. "===" .. key .. "   " ..string.format("%02X", KeyIdx)..string.format("%02X", KeyIdx)..string.format("%02X", KeyIdx))
    return bts
end

function CreatNormalMarco(marcoid, key, mmStr)
    local bts = CreateFrame("Button", marcoid, UIParent, "SecureActionButtonTemplate")
    if not bts and tempV then
        NSLog("初始化失败, 请脱战后重载游戏一下 (/RL)")
        tempV = false
        return nil
    end
    bts:RegisterForClicks("AnyUp", "AnyDown")
    bts:SetAttribute("type", "macro")
    bts:SetAttribute("macrotext", mmStr)
    if InCombatLockdown() ~= true then
        SetBinding(key, nil)
        SetOverrideBindingClick(bts, true, key, bts:GetName())
    elseif tempV then
        NSLog("初始化失败, 请脱战后重载游戏一下 (/RL)")
        tempV = false
    end

    print(marcoid .. "===" .. key .. "   " ..string.format("%02X", KeyIdx)..string.format("%02X", KeyIdx)..string.format("%02X", KeyIdx))
    return bts
end

function ItemMarco(itemNum)
    local trinket1 = GetInventoryItemID("player", itemNum)
    local itemMarco = "/use " .. itemNum
    if trinket1 then
        if trinket1 == 443536 or trinket1 == 190958 or trinket1 == 159611 or trinket1 == 219301 or trinket1 == 219320 or trinket1 == 219310 then itemMarco =
            "/use [@cursor] " .. itemNum end
        if trinket1 == 193718 or trinket1 == 194307 then itemMarco = "/use [@mouseover] " .. itemNum end
        if trinket1 == 193678 or trinket1 == 219303 or trinker1 == 225654 or trinket1 == 220118 or trinket1 == 232486 then itemMarco =
            "/use [@player] " .. itemNum end
        if trinket1 == 232542 then itemMarco = "/use [@focus,help,nodead] [help,nodead] [@player] " .. itemNum end
    end
    return itemMarco
end

local aoeSpells = { 697, 386256, 152108, 5740, 386833, 267211, 278350, 1122, 265187, 205180, 114158, 194223, 145205, 205636, 34861, 187650, 187698, 1543, 260243, 108287, 192222, 198838, 73920, 444995, 190356, 2120, 153561, 33395, 368847, 403631, 236776 }
local health_Spells1 = { 85673, 633, 19750, 1022, 432459, 33076, 139, 17, 2061, 373481, 8004, 1064, 974, 115175, 116670, 360995, 355913, 20473, 156910, 223306, 200025, 148039, 82326, 48438, 18562, 33206, 47788, 194509, 774, 116849, 203651, 102351, 392160, 102342, 50464, 33763, 188550, 204883, 2060, 596, 2050, 61295, 73685, 77472, 124682, 115151, 399491, 124081, 367226, 364343, 366155, 357170, 408233, 360827, 8936, 388010, 388007, 388013 }
local qusanSpell = { 4987, 2782, 88423, 10060, 527, 77130, 218164, 409311, 412710, 360823, 374251 }
local playerSpell = { 121536, 43265, 152280, 343721, 1126, 452490, 29166, 115313, 187827, 189110, 376079, 307865, 228920, 191427, 325153, 388011, 62618 }
local lockSafeSpell = { 152279, 740, 45438, 391054, 5215 }
function FixMarco(spellId)
    if in_array(spellId, aoeSpells) then return "[@cursor] " end
    if in_array(spellId, health_Spells1) then return "[@focus,help,nodead] [help,nodead] [@player] " end
    if in_array(spellId, { 102560 }) then return "[known:390378, @cursor] " end
    if in_array(spellId, { 205385 }) then return "[known:205385, @cursor] [known:457042, @target] " end
    if in_array(spellId, { 61882 }) then return "[@cursor, known:61882] [known:462620, @target] " end
    if in_array(spellId, { 6940 }) then return
        "[@focus,help,nodead] [help,nodead] [@mouseover,help, nodead] [@player, nodead] " end
    if in_array(spellId, qusanSpell) then return "[@mouseover,help,nodead] [help,nodead] [@player] " end
    if in_array(spellId, { 3411 }) then return "[@mouseover,help,nodead] [help,nodead] " end
    if in_array(spellId, { 361469 }) then return "[@focus,help,nodead] [help,nodead] [harm,nodead] [@player] " end
    if in_array(spellId, playerSpell) then return "[@player] " end
    if in_array(spellId, lockSafeSpell) then return "!" end
    if in_array(spellId, { 204596, 207684, 202138, 202137, 390163 }) then return "[known: 389799] " ..
        GetSpellName(spellId) .. ";\n" .. "/cast [@player] " end
    return ""
end

function GetSpellName(id)
    local name = ""
    if C_Spell and C_Spell.GetSpellName then name = C_Spell.GetSpellName(id) end
    return name
end

local GetSpellCooldown = function(spellID)
    local spellCooldownInfo = C_Spell.GetSpellCooldown(spellID)
    if spellCooldownInfo then return spellCooldownInfo.startTime, spellCooldownInfo.duration, spellCooldownInfo
        .isEnabled, spellCooldownInfo.modRate end
    return 0, 0, false, 0
end
function GetSpellCD(spellId)
    local start, duration, enabled = GetSpellCooldown(spellId); CDTime = start + duration - GetTime()
    if CDTime <= 0 or CDTime >= 1000 then CDTime = 0 end
    return CDTime
end

function in_array(b, list)
    if not list then return false end
    for k, v in pairs(list) do if v == b then return true end end
    return false
end

function needTabNeedHelpPlayer(message)
    local currentUnti = lowest_hp_Tab.unti
    if not ThirkOnekey.DB.profile.specs[state.spec.id].settings.autofoucus_enable or UnitIsDead("player") then return false end
    local cu = UnitGUID("focus")
    if #needFocusHot > 0 and currentUnti == "none" then
        if cu ~= UnitGUID(needFocusHot[1]) and Core.abilities[needFocusHot[1]] then
            texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities[needFocusHot[1]].qr))
            return true
        end
        return false
    end
    if Core.abilities[currentUnti] ~= nil then if (currentUnti ~= "none" and currentUnti ~= "target") and (cu == nil or cu ~= UnitGUID(currentUnti)) then
            texture:SetColorTexture(ThirkOnekey:ColorOffSet(Core.abilities[currentUnti].qr))
            return true
        end end
    return false
end

local wipe, UnitExists, UnitIsDead, UnitIsVisible, UnitInRange, UnitHealth, UnitHealthMax = wipe, UnitExists, UnitIsDead,
    UnitIsVisible, UnitInRange, UnitHealth, UnitHealthMax
local UnitInRaid, IsInRaid, GetNumGroupMembers, UnitInParty, UnitAffectingCombat = UnitInRaid, IsInRaid,
    GetNumGroupMembers, UnitInParty, UnitAffectingCombat
local UnitIsFriend = UnitIsFriend
local PARTY_UNITS = { "player", "party1", "party2", "party3", "party4" }
local SOLO_UNITS = { "player" }
local RAID_PREFIX = "raid"
local playerStateCache = {}
local unitList = {}
local buffCheckID = 27827
local lastRunTime, minInterval = 0, 0.1
local BATCH_SIZE, MAX_BATCH_TIME = 5, 0.005
local dynamicBatchSize = BATCH_SIZE
local function ShouldProcess(state_player) return not state_player.dead and not state_player.hasBuff and
    state_player.visible and state_player.inRange end
local function updatePlayerStateCache()
    BuffInit()
    wipe(playerStateCache)
    if IsInRaid() then
        local num = GetNumGroupMembers()
        for i = 1, num do unitList[i] = RAID_PREFIX .. i end
    elseif UnitInParty("player") then for i = 1, #PARTY_UNITS do unitList[i] = PARTY_UNITS[i] end else unitList[1] =
        SOLO_UNITS[1] end
    for i = 1, #unitList do
        local unit = unitList[i]
        if UnitExists(unit) then
            playerStateCache[unit] = { dead = UnitIsDead(unit), exists = true, hasBuff = UntiHasBuff(unit, buffCheckID), visible =
            UnitIsVisible(unit), inRange = (unit == "player") or UnitInRange(unit), hp = UnitHealth(unit) /
            UnitHealthMax(unit) }
            lowest_hp_Tab.alive_players = (lowest_hp_Tab.alive_players + (ShouldProcess(playerStateCache[unit]) and 1 or 0))
        end
        unitList[i] = nil
    end
    if UnitExists("target") and UnitIsFriend("target", "player") then playerStateCache.target = { dead = UnitIsDead(
        "target"), exists = true, hasBuff = UntiHasBuff("target", buffCheckID), visible = UnitIsVisible("target"), inRange = true, hp =
        UnitHealth("target") / UnitHealthMax("target") } end
end
function checkPlayersHp()
    local currentTime = GetTime()
    if currentTime - lastRunTime < minInterval then return end
    lastRunTime = currentTime
    healthCheckHandler:Async(
    function()
        updatePlayerStateCache()
        local startTime = GetTime()
        local processed = 0
        for unit, state_player in pairs(playerStateCache) do if ShouldProcess(state_player) then
                CheckPlayer(unit)
                processed = processed + 1
                if processed >= dynamicBatchSize or (GetTime() - startTime) > MAX_BATCH_TIME then
                    local elapsed = GetTime() - startTime
                    if elapsed < MAX_BATCH_TIME * 0.6 then dynamicBatchSize = math.min(dynamicBatchSize + 2, 15) elseif elapsed > MAX_BATCH_TIME * 0.9 then dynamicBatchSize =
                        math.max(dynamicBatchSize - 1, 3) end
                    coroutine.yield()
                    startTime = GetTime()
                end
            end end
    end, "ContinuousHealthCheck", true)
end

function CheckPlayer(unit)
    local spec = state.spec.id
    local profile = ThirkOnekey.DB.profile.specs[spec]
    local hp_threshold = UnitAffectingCombat("player") and profile.HeplerConfig_normalMode or
    profile.HeplerConfig_outFightMode or 95
    local bigHurtThreshold = profile.HeplerConfig_AOEBigHurtMode or 85
    local normalHurtThreshold = profile.HeplerConfig_AOEHurtMode or 85
    BuffCheck(unit)
    CheckUnit(unit, hp_threshold, bigHurtThreshold, normalHurtThreshold)
end

local function adjustHealthPct(unit, health_pct, hp_threshold)
    local specId = ThirkOnekey.State.spec.id
    if specId == 256 then
        if UnitInParty("player") and not IsInRaid() then if UntiNoBuff(unit, 194384) and min(lowest_hp_Tab.alive_players, (ThirkOnekey.DB.profile.specs[specId].settings.jiushu_count_party or 5)) > buff.atonement.totalCount then
                table.insert(needFocusHot, 1, unit) end end
        if UnitInRaid("player") and IsInRaid() then if UntiNoBuff(unit, 194384) and min(lowest_hp_Tab.alive_players, (ThirkOnekey.DB.profile.specs[specId].settings.jiushu_count_raid or 7)) > buff.atonement.totalCount then
                table.insert(needFocusHot, unit) end end
        health_pct = health_pct + (UntiNoBuff(unit, 194384) and buff.atonement.hp_offset or 0)
    end
    if specId == 65 and unit == "player" and UntiHasDeBuff(unit, 448005) then health_pct = health_pct -
        (100 - hp_threshold - buff.light_of_the_martyr_dot.hp_offset) end
    if specId == 65 and (UntiHasBuff(unit, 156910) or UntiHasBuff(unit, 53563)) then health_pct = health_pct +
        buff.beacon_of_light.hp_offset end
    if specId == 270 then
        if (UnitInParty("player") and not IsInRaid()) or (UnitInRaid("player") and IsInRaid()) then if GetSpellCharges(115151) > 0 then if buff.renewing_mist.totalCount < lowest_hp_Tab.alive_players and UntiNoBuff(unit, buff.renewing_mist.id) and ThirkOnekey.DB.profile.specs[state.spec.id].settings.renewing_mist_pre - (100 - lowest_hp_Tab.pct) >= 0 then
                    table.insert(needFocusHot, unit) end end end
        health_pct = health_pct + (UntiHasBuff(unit, buff.renewing_mist.id) and buff.renewing_mist.hp_offset or 0)
    end
    if specId == 264 and UnitGroupRolesAssigned(unit) == "TANK" and (UntiNoBuff(unit, 974) and UntiNoBuff(unit, 383648)) then health_pct =
        health_pct - (100 - hp_threshold - buff.earth_shield.hp_offset) end
    if specId == 105 then
        if UnitInParty("player") and not IsInRaid() and state.mana.pct > 65 and health_pct >= 70 then if UntiNoBuff(unit, buff.rejuvenation.id) and min(lowest_hp_Tab.alive_players, (ThirkOnekey.DB.profile.specs[specId].settings.huichun_count_party or 5)) > buff.rejuvenation.totalCount then
                table.insert(needFocusHot, 1, unit) end end
        if UnitInRaid("player") and IsInRaid() and state.mana.pct > 65 and health_pct >= 70 then if UntiNoBuff(unit, buff.rejuvenation.id) and min(lowest_hp_Tab.alive_players, (ThirkOnekey.DB.profile.specs[specId].settings.huichun_count_raid or 8)) > buff.rejuvenation.totalCount then
                table.insert(needFocusHot, unit) end end
        health_pct = health_pct + (UntiHasDeBuff(unit, buff.rejuvenation.id) and buff.rejuvenation.hp_offset or 0)
    end
    if UntiHasDeBuff(unit, 460164) or UntiHasDeBuff(unit, 465830) or UntiHasDeBuff(unit, 1220761) or UntiHasDeBuff(unit, 469043) then health_pct =
        health_pct * 0.5 end
    return health_pct
end
function CheckUnit(unit, hp_threshold, bigHurtThreshold, normalHurtThreshold)
    if unit == "target" or unit == "player" then if not UnitExists(unit) or UnitIsDead(unit) or not UnitIsVisible(unit) or UntiHasBuff(unit, 27827) then return end else if not UnitExists(unit) or UnitIsDead(unit) or not UnitIsVisible(unit) or not UnitInRange(unit) or UntiHasBuff(unit, 27827) then return end end
    local health = UnitHealth(unit)
    local maxHealth = UnitHealthMax(unit)
    local health_pct = (health / maxHealth) * 100
    health_pct = adjustHealthPct(unit, health_pct, hp_threshold)
    if health_pct <= bigHurtThreshold then bigHurtNum = bigHurtNum + 1 end
    if health_pct <= normalHurtThreshold then hurtNum = hurtNum + 1 end
    if health_pct < lowest_hp_Tab.pct - 5 and health_pct < hp_threshold then
        lowest_hp_Tab.pct = health_pct
        lowest_hp_Tab.unti = unit
        lowest_hp_Tab.role = UnitGroupRolesAssigned(unit)
        lowest_hp_Tab.class = UnitClassBase(unit)
    end
end

local FindAuras = AuraUtil.ForEachAura
local buffsToTrack = { { id = buff.rejuvenation.id, key = "rejuvenation" }, { id = buff.lifebloom_2.id, key = "lifebloom_2" }, { id = buff.rejuvenation_germination.id, key = "rejuvenation_germination" }, { id = buff.spring_blossoms.id, key = "spring_blossoms" }, { id = buff.regrowth.id, key = "regrowth" }, { id = buff.wild_growth.id, key = "wild_growth" } }
function BuffCheck(unit)
    if ThirkOnekey.State.spec.id == 256 then
        if UnitExists(unit) and not UnitIsDead(unit) then FindAuras(unit, "HELPFUL", nil,
                function(aura) if aura.sourceUnit == "player" then
                        aura.remainingTime = aura.expirationTime - GetTime()
                        if aura.spellId == buff.atonement.id then
                            buff.atonement.totalCount = (buff.atonement.totalCount + 1)
                            buff.atonement.remains_min = min(buff.atonement.remains_min, aura.remainingTime)
                            buff.atonement.remains_min_unti = unit
                        end
                    end end, true) end
        if UnitExists("focus") and not UnitIsDead("focus") then FindAuras("focus", "HELPFUL", nil,
                function(aura) if aura.sourceUnit == "player" then
                        aura.remainingTime = aura.expirationTime - GetTime()
                        if aura.spellId == buff.atonement.id then buff.atonement.fucos_remains = aura.remainingTime end
                    end end, true) end
    end
    if ThirkOnekey.State.spec.id == 264 then if UnitExists(unit) and not UnitIsDead(unit) then
            local ext, dur = ThirkOnekey:getUntiHasBuff(buff.riptide.id, unit, true)
            if ext then buff.riptide.totalCount = (buff.riptide.totalCount + 1) end
            if buff.riptide.remains_min > dur then buff.riptide.remains_min = dur end
        end end
    if ThirkOnekey.State.spec.id == 105 then
        if UnitExists(unit) and not UnitIsDead(unit) then FindAuras(unit, "HELPFUL", nil,
                function(aura) if aura.sourceUnit == "player" then
                        aura.remainingTime = aura.expirationTime - GetTime()
                        for _, buffInfo in ipairs(buffsToTrack) do if aura.spellId == buffInfo.id then
                                local buffKey = buffInfo.key
                                buff[buffKey].totalCount = (buff[buffKey].totalCount + 1)
                                buff[buffKey].remains_min = min(buff[buffKey].remains_min, aura.remainingTime)
                                buff[buffKey].remains_min_unti = unit
                                break
                            end end
                    end end, true) end
        if UnitExists("focus") and not UnitIsDead("focus") then FindAuras("focus", "HELPFUL", nil,
                function(aura) if aura.sourceUnit == "player" then
                        aura.remainingTime = aura.expirationTime - GetTime()
                        for _, buffInfo in ipairs(buffsToTrack) do if aura.spellId == buffInfo.id then
                                buff[buffInfo.key].fucos_remains = aura.remainingTime
                                break
                            end end
                    end end, true) end
    end
    if ThirkOnekey.State.spec.id == 270 then if UnitExists(unit) and not UnitIsDead(unit) then
            local ext, dur = ThirkOnekey:getUntiHasBuff(buff.renewing_mist.id, unit, true)
            if ext then buff.renewing_mist.totalCount = (buff.renewing_mist.totalCount + 1) end
        end end
end

function UntiNoBuff(unit, id)
    local ext, dur = ThirkOnekey:getUntiHasBuff(id, unit, true)
    return not ext
end

function UntiHasBuff(unit, id)
    local ext, dur = ThirkOnekey:getUntiHasBuff(id, unit, true)
    return ext
end

function UntiHasDeBuff(unit, id)
    local ext, dur = ThirkOnekey:getUntiHasDebuff(id, unit)
    return ext
end

function BuffInit()
    needFocusHot = {}
    lowest_hp_Tab.class = "none"
    lowest_hp_Tab.unti = "none"
    lowest_hp_Tab.pct = 100
    lowest_hp_Tab.role = "none"
    lowest_hp_Tab.setting.combat_value = (ThirkOnekey.DB.profile.specs[state.spec.id].HeplerConfig_normalMode or 95)
    lowest_hp_Tab.setting.out_combat_value = (ThirkOnekey.DB.profile.specs[state.spec.id].HeplerConfig_outFightMode or 95)
    hurtNum = 0
    bigHurtNum = 0
    damageSpell_mana = (ThirkOnekey.DB.profile.specs[state.spec.id].HeplerConfig_enable_damageSpell_value or 1)
    buff.atonement.totalCount = 0
    buff.atonement.remains_min = 9999
    buff.atonement.remains_min_unti = "none"
    buff.atonement.fucos_remains = 0
    buff.riptide.totalCount = 0
    buff.riptide.remains_min = 9999
    buff.rejuvenation.totalCount = 0
    buff.rejuvenation.remains_min = 9999
    buff.rejuvenation.remains_min_unti = "none"
    buff.rejuvenation.fucos_remains = 0
    buff.lifebloom_2.totalCount = 0
    buff.lifebloom_2.remains_min = 9999
    buff.lifebloom_2.remains_min_unti = "none"
    buff.lifebloom_2.fucos_remains = 0
    buff.rejuvenation_germination.totalCount = 0
    buff.rejuvenation_germination.remains_min = 9999
    buff.rejuvenation_germination.remains_min_unti = "none"
    buff.rejuvenation_germination.fucos_remains = 0
    buff.spring_blossoms.totalCount = 0
    buff.spring_blossoms.remains_min = 9999
    buff.spring_blossoms.remains_min_unti = "none"
    buff.spring_blossoms.fucos_remains = 0
    buff.regrowth.totalCount = 0
    buff.regrowth.remains_min = 9999
    buff.regrowth.remains_min_unti = "none"
    buff.regrowth.fucos_remains = 0
    buff.wild_growth.totalCount = 0
    buff.wild_growth.remains_min = 9999
    buff.wild_growth.remains_min_unti = "none"
    buff.wild_growth.fucos_remains = 0
    buff.renewing_mist.totalCount = 0
    lowest_hp_Tab.alive_players = 0
end

function addStateExt()
    local all = ThirkOnekey.Class.specs[0]
    all:RegisterStateTable("find",
        setmetatable({},
            { __index = function(t, k)
                if k == "buff" then return buff end
                if k == "lowest_hp" then return lowest_hp_Tab end
                if k == "hurt_num" then return hurtNum end
                if k == "hurt_num_big" then return bigHurtNum end
                if k == "needFocusHot" then return #needFocusHot > 0 and needFocusHot[1] or "none" end
                return false
            end, }))
    all:RegisterStateExpr("enable_health",
        function()
            local cu = UnitGUID("focus") or UnitGUID("target") or "none1"
            local guid = UnitGUID(lowest_hp_Tab.unti) or "none2"
            return (cu == guid)
        end)
    all:RegisterStateExpr("enable_hot",
        function()
            if #needFocusHot > 0 then
                local cu = UnitGUID("focus") or UnitGUID("target") or "none2"
                local guid = UnitGUID(needFocusHot[1]) or "none2"
                return (cu == guid)
            end
            return false
        end)
    all:RegisterStateExpr("alive_players", function() return lowest_hp_Tab.alive_players end)
    all:RegisterStateExpr("target_is_enemie", function() return UnitCanAttack("player", "target") end)
    all:RegisterStateExpr("enemies_totalHP", function() return ThirkOnekey.enemiesTotalHP end)
    all:RegisterStateExpr("damageSpell_mana", function() return damageSpell_mana end)
    all:RegisterStateExpr("needHealth", function() return (lowest_hp_Tab.unti ~= "none") end)
    all:RegisterStateExpr("cooldown_on", function() return ThirkOnekey.DB.profile.toggles.cooldowns.value end)
    all:RegisterStateExpr("essences_on", function() return ThirkOnekey.DB.profile.toggles.essences.value end)
    all:RegisterAbility("empty_icon",
        { texture = 134400, name = "空白占位", listName = '|T136243:0|t |cff00ccff[空白占位]|r', cast = 0, cooldown = 0, gcd =
        "off", })
end

function NSLog(msg) print("|cffff0000" .. addOnsName .. ": |r" .. msg) end

_G.TroublemakerCore = Core
