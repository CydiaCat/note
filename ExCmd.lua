local a, b, c, d = GetBuildInfo()
if a == "3.4.4" then return end; local e = LibStub("AceEvent-3.0")
local f = LibStub("LibAsync"):GetHandler({ type = "everyFrame", maxTime = 40, maxTimeCombat = 8, errorHandler = function(
    g, h, i) print("ThirkOnekey 发生错误", g, h, i) end })
local j = { "ALT-CTRL-", "CTRL-SHIFT-", "ALT-SHIFT-", "ALT-CTRL-SHIFT-", "CTRL-", "ALT-", "SHIFT-" }
local k = { "=", "-", "0", "9", "8", "7", "6", "\\", "]", "[", "'", ";", "/", ".", ",", "F12", "F11", "F10", "F9" }
local l = { "", "CTRL-", "ALT-" }
local m = { "NUMPAD0", "NUMPAD1", "NUMPAD2", "NUMPAD3", "NUMPAD4", "NUMPAD5", "NUMPAD6", "NUMPAD7", "NUMPAD8", "NUMPAD9" }
local n = "Troublemaker"
local o; local p; local q = false; local r; local s; local t; local u = 0; local v = { 2, 9, 11, 12, 13, 14, 15, 16, 17 }
local w = { [56222] = true, [185245] = true, [195072] = true, [6795] = true, [115546] = true, [62124] = true, [355] = true }
local x = { [315584] = true, [8679] = true, [3408] = true, [381637] = true, [115191] = true, [1784] = true, [381664] = true,
    [2823] = true, [5215] = true, [21562] = true, [121536] = true, [1126] = true, [-105001] = true }
local y = ThirkOnekey:GenerateColors(163)
local z = { [47758] = true, [421434] = true, [373129] = true, [263165] = true, [443028] = true, [257044] = true, [212084] = true,
    [452486] = true, [113656] = true, [740] = true, [64843] = true, [391528] = true, [194308] = true, [198013] = true,
    [452497] = true, [-191] = true, [-192] = true, [-193] = true, [-202] = true, [-203] = true, [-118] = true, [-215] = true,
    [-286] = true, [-318] = true, [-319] = true, [394927] = true, [12051] = true, [382440] = true, [191837] = true,
    [117952] = true, [205021] = true, [471214] = true }
local A = false; local B = ThirkOnekey['State']
local C = {}
local D = { [229739] = true, [219250] = true, [225978] = true, [225985] = true, [231839] = true, [231935] = true,
    [233623] = true, [213751] = true, [65310] = true, [189632] = true, [189617] = true, [4952] = "Theramore Combat Dummy",
    [5652] = "Undercity Combat Dummy", [25225] = "Practice Dummy", [25297] = "Drill Dummy", [31144] = "Training Dummy",
    [31146] = "Raider's Training Dummy", [32541] = "Initiate's Training Dummy", [32543] = "Veteran's Training Dummy",
    [32546] = "Ebon Knight's Training Dummy", [32542] = "Disciple's Training Dummy", [32545] = "Training Dummy", [32666] =
"Training Dummy", [32667] = "Training Dummy", [44171] = "Training Dummy", [44548] = "Training Dummy", [44389] =
"Training Dummy", [44614] = "Training Dummy", [44703] = "Training Dummy", [44794] = "Training Dummy", [44820] =
"Training Dummy", [44848] = "Training Dummy", [44937] = "Training Dummy", [46647] = "Training Dummy", [48304] =
"Training Dummy", [60197] = "Training Dummy", [64446] = "Training Dummy", [67127] = "Training Dummy", [70245] =
"Training Dummy", [79414] = "Training Dummy", [87317] = "Training Dummy", [87318] = "Dungeoneer's Training Dummy",
    [87320] = "Raider's Training Dummy", [87322] = "Dungeoneer's Training Dummy", [87329] = "Raider's Training Dummy",
    [87760] = "Training Dummy", [87761] = "Dungeoneer's Training Dummy", [87762] = "Raider's Training Dummy", [88288] =
"Dungeoneer's Training Dummy", [88314] = "Dungeoneer's Training Dummy", [88836] = "Dungeoneer's Training Dummy", [88837] =
"Raider's Training Dummy", [88906] = "Combat Dummy", [89078] = "Training Dummy", [92164] = "Training Dummy", [92165] =
"Dungeoneer's Training Dummy", [92166] = "Raider's Training Dummy", [92168] = "Dungeoneer's Training Dummy", [92169] =
"Raider's Training Dummy", [93828] = "Training Dummy", [97668] = "Boxer's Training Dummy", [98581] =
"Prepfoot Training Dummy", [107104] = "Target Dummy", [108420] = "Training Dummy", [109066] = "Dungeon Damage Dummy",
    [109096] = "Normal Tanking Dummy", [111824] = "Training Dummy", [113858] = "Training Dummy", [113859] =
"Dungeoneer's Training Dummy", [113860] = "Raider's Training Dummy", [113862] = "Training Dummy", [113863] =
"Dungeoneer's Training Dummy", [113864] = "Raider's Training Dummy", [113871] = "Bombardier's Training Dummy", [126712] =
"Training Dummy", [126781] = "Training Dummy", [127019] = "Training Dummy", [131983] = "Raider's Training Dummy",
    [131989] = "Training Dummy", [131990] = "Raider's Training Dummy", [131992] = "Dungeoneer's Training Dummy", [132976] =
"Training Dummy", [134324] = "Training Dummy", [138048] = "Training Dummy", [143119] = "Gnoll Target Dummy", [143509] =
"Training Dummy", [144073] = "Dungeoneer's Training Dummy", [144077] = "Training Dummy", [144081] = "Training Dummy",
    [144085] = "Training Dummy", [144086] = "Raider's Training Dummy", [153285] = "Training Dummy", [153292] =
"Training Dummy", [172452] = "Raider's Tanking Dummy", [173942] = "Training Dummy", [174565] = "Raider's Tanking Dummy",
    [174566] = "Dungeoneer's Tanking Dummy", [174567] = "Raider's Tanking Dummy", [174568] = "Dungeoneer's Tanking Dummy",
    [175449] = "Dungeoneer's Training Dummy", [175450] = "Raider's Training Dummy", [175451] =
"Dungeoneer's Training Dummy", [194643] = "Dungeoneer's Training Dummy", [194644] = "Dungeoneer's Training Dummy",
    [194648] = "Training Dummy", [194649] = "Normal Tank Dummy", [193394] = "Tuskarr Training Dummy", [193563] =
"Training Dummy", [198594] = "Cleave Training Dummy", [199057] = "Black Dragon's Challenge Dummy", [216458] =
"Sparring Dummy", [222275] = "Training Dummy", [225976] = "Normal Tank Dummy", [225977] = "Dungeoneer's Training Dummy",
    [225982] = "Cleave Training Dummy", [225983] = "Dungeoneer's Training Dummy", [225984] = "Training Dummy", [235830] =
"Training Dummy" }
local E = { [33702] = true, [202719] = true, [80483] = true, [260364] = true, [232633] = true, [129597] = true, [265221] = true,
    [33697] = true, [255647] = true, [274738] = true, [26297] = true, [25046] = true, [58984] = true, [50613] = true,
    [155145] = true, [20572] = true, [312411] = true, [69179] = true }
local F = { [212265] = true, [212263] = true, [212264] = true }
local G = { [212262] = true, [262261] = true, [212260] = true }
local H = { abilities = {} }
local I = {}
local J = 0; local K = 0; local M = 1; local N = { unti = "none", pct = 100, alive_players = 0, role = "DPS", class =
"none", setting = { combat_value = 95, out_combat_value = 95 } }
ThirkOnekey['gseUp'] = false; local O = function()
    if ThirkOnekey['DB']['profile']['toggles']['gseMode']['value'] then return not ThirkOnekey['gseUp'] end; return
    ThirkOnekey['Pause']
end; local P = function(Q)
    local R = C_Spell.GetSpellCharges(Q)
    if R then return R['currentCharges'], R['maxCharges'], R['cooldownStartTime'], R['cooldownDuration'],
            R['chargeModRate'] end
end; local S = { atonement = { totalCount = 0, remains_min = 0, remains_min_unti = "none", fucos_remains = 0, hp_offset = 3, id = 194384 }, light_of_the_martyr_dot = { hp_offset = -20, id = 448005 }, beacon_of_light = { hp_offset = 3, id = 156910 }, earth_shield = { hp_offset = -3, id = 974 }, riptide = { totalCount = 0, remains_min = 0, id = 61295 }, rejuvenation = { id = 774, totalCount = 0, remains_min = 0, remains_min_unti = "none", fucos_remains = 0, hp_offset = 3 }, lifebloom_2 = { id = 188550, totalCount = 0, remains_min = 0, remains_min_unti = "none", fucos_remains = 0, hp_offset = 3 }, rejuvenation_germination = { id = 155777, totalCount = 0, remains_min = 0, remains_min_unti = "none", fucos_remains = 0, hp_offset = 3 }, spring_blossoms = { id = 207386, totalCount = 0, remains_min = 0, remains_min_unti = "none", fucos_remains = 0, hp_offset = 3 }, regrowth = { id = 8936, totalCount = 0, remains_min = 0, remains_min_unti = "none", fucos_remains = 0, hp_offset = 3 }, wild_growth = { id = 48438, totalCount = 0, remains_min = 0, remains_min_unti = "none", fucos_remains = 0, hp_offset = 3 }, renewing_mist = { totalCount = 0, id = 119611, hp_offset = 3 } }
local T = { jianci = { hp_offset = -20 }, aoe = { hp_offset = -20 } }
local U = {}
local V = {}
local W = 1; local X = 0.05; local Y = X; local function Z()
    if UnitAffectingCombat("player") then Y = math.min(X * 0.5, 0.15) else Y = 0.05 end; local _ = GetFramerate() or 60; if _ < 60 then Y =
        Y * 1.3 elseif _ > 70 then Y = math.max(0.1, Y * 0.8) end; local a0 = GetNumGroupMembers()
    if a0 > 10 then Y = math.min(Y * a0, 0.2) end; return Y
end; H.RegisterEvent = function()
    ThirkOnekey['Pause'] = true; NSLog("ThirkOnekey 加载中...")
    if A == true then return end; A = true; if ThirkOnekey['DB'] == nil then NSLog("ThirkOnekey 未加载 请确认后 /RL 一下") end; t =
    ThirkOnekey:CreatAmiFrame()
    ThirkOnekey:CreatLJCMD()
    ThirkOnekey.MakeSnapshot = function() end; SetCVar("Sound_EnableErrorSpeech", 0)
    if InCombatLockdown() ~= true then
        SetCVar("nameplateShowAll", "1")
        SetCVar("nameplateShowEnemies", "1")
        SetCVar("Brightness", 50)
        SetCVar("Contrast", 50)
        SetCVar("Gamma", 1)
        if C_AddOnProfiler.IsEnabled() then
            RegisterCVar("addonProfilerEnabled", "1")
            SetCVar("addonProfilerEnabled", "0")
        end; RemoveAllMarco()
    end; ThirkOnekey.CheakTargetIsJiaRen = function(a1, a2, a3)
        if a2 == nil then return false end; if a3 == true and B['target']['npcid'] ~= -1 then if D[B['target']['npcid']] then return true end end; local a4 =
        UnitGUID(a2)
        local a5 = a4:match("(%d+)-%x-$")
        a5 = tonumber(a5)
        if a5 ~= -1 then if D[a5] then return true end end; if UnitAffectingCombat("player") == true and B['target']['distance'] < 10 and a5 ~= -1 then return true end; return false
    end; o = CreateFrame("Frame", nil, UIParent)
    o:SetFrameStrata("TOOLTIP")
    o:SetFrameLevel(100)
    o:SetSize(300, 8)
    o:ClearAllPoints()
    o:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, 0)
    p = o:CreateTexture(nil, "BACKGROUND")
    p:SetAllPoints(o)
    o['texture'] = p; p:SetColorTexture(0, 0, 0, 1)
    o:RegisterEvent("PLAYER_ENTERING_WORLD")
    o:RegisterEvent("DISPLAY_SIZE_CHANGED")
    o:RegisterEvent("UI_SCALE_CHANGED")
    o:SetScript("OnEvent",
        function(a6, a7)
            o:SetScale(1)
            o:SetSize(300, 8)
            o:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, 0)
        end)
    r = CreateFrame("Frame", nil, UIParent)
    r:SetFrameStrata("TOOLTIP")
    r:SetFrameLevel(100)
    r:SetSize(300, 8)
    r:ClearAllPoints()
    r:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
    s = r:CreateTexture(nil, "BACKGROUND")
    s:SetAllPoints(r)
    r['texture'] = s; s:SetColorTexture(8 / 255, 21 / 255, 29 / 255, 1)
    r:RegisterEvent("PLAYER_ENTERING_WORLD")
    r:RegisterEvent("DISPLAY_SIZE_CHANGED")
    r:RegisterEvent("UI_SCALE_CHANGED")
    r:RegisterEvent("PLAYER_REGEN_ENABLED")
    r:SetScript("OnEvent",
        function(a8, a9)
            r:SetScale(1)
            r:SetSize(300, 8)
            r:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
        end)
    local aa = 0; local ab = 0; local ac = 0.3; local ad = 0; local ae = 0; e:RegisterMessage(
    "ThirkOnekey-EVENT-UPDATE-HP",
        function(af, ag)
            u = GetSpellCD(61304)
            if ThirkOnekey['DB']['profile']['toggles']['mouseAmi']['value'] then if t and not t:IsShown() then t:Show() end elseif t and t:IsShown() then
                t:Hide() end; if IsKeyDown(ThirkOnekey['DB']['profile']['toggles']['pause'].key) then ThirkOnekey['gseUp'] = true else ThirkOnekey['gseUp'] = false end; if O() then if o:IsShown() then
                    o:Hide()
                    r:Hide()
                end elseif not o:IsShown() then
                o:Show()
                r:Show()
            end
        end)
    e:RegisterMessage("ThirkOnekey-EVENT-UPDATE",
        function(ah, ai)
            ac = ThirkOnekey['DB']['profile']['specs'][B['spec']['id']]['GCDThoredValue'] or 0.3; local aj = ThirkOnekey
            ['DB']['profile']
            local ak = aj['specs'][B['spec']['id']]
            local al = aj['toggles']['debugMode']['value']
            ad = GetTime()
            local am = select(9, UnitCastingInfo("player")) or select(8, UnitChannelInfo("player"))
            if am ~= nil then
                if al then NSLog("当前引导技能ID(不是技能ID)" .. am) end; q = z[am]
            else q = false end; if O() then
                if al then NSLog("Pause") end; SetBlank()
                return
            end; if UnitIsDead("player") or UntiHasBuff("player", 27827) or q then
                SetBlank()
                return
            end; if IsMounted() then
                SetBlank()
                return
            end; if GetCurrentKeyBoardFocus() ~= nil then
                SetBlank()
                return
            end; if aj['toggles']['visCombat']['value'] and not InCombatLockdown() then
                if al then NSLog("仅战斗中生效") end; SetBlank()
                return
            end; if not ai['Ability'] then
                if al then NSLog("message 爲空") end; SetBlank()
                return
            end; if enabled_Hp() then
                if al then NSLog("message hp 藥水") end; p:SetColorTexture(ThirkOnekey:ColorOffSet(H['abilities']['hp'].qr))
                return
            end; if enabled_mp() then
                if al then NSLog("message mp 藥水") end; p:SetColorTexture(ThirkOnekey:ColorOffSet(H['abilities']['mp'].qr))
                return
            end; if rebackInFighting_enable() then
                if al then NSLog("message 战复") end; p:SetColorTexture(ThirkOnekey:ColorOffSet(H['abilities']
                ['rebackInFighting'].qr))
                return
            end; if ak['settings']['autofoucus_enable'] then if N['unti'] ~= "none" or #C > 0 then if needTabNeedHelpPlayer(ai) then
                        if al then NSLog("目标切换逻辑 - " .. N['unti']) end; return
                    end elseif UnitGUID("focus") and #C == 0 and N['unti'] == "none" then
                    p:SetColorTexture(ThirkOnekey:ColorOffSet(H['abilities']['clearFocus'].qr))
                    return
                end end; if enableBoomHit() then
                if al then NSLog("message 打球") end; p:SetColorTexture(ThirkOnekey:ColorOffSet(H['abilities']['bitBoom']
                .qr))
                return
            end; if not ai['Ability']['item'] then
                if not AutoEnabled(ai) then
                    if al then NSLog("message 暂停逻辑") end; return
                end; if tabEnemies(ai) then
                    if al then NSLog("message 切換目標") end; return
                end; if E[ai['Ability']['id']] then
                    p:SetColorTexture(ThirkOnekey:ColorOffSet(H['abilities']['racial'].qr))
                    if al then NSLog("message 种族技能" .. ai['Ability']['id']) end; return
                end; local an = ai['ex_duration'] - (ad - ab)
                if ai['Ability']['cast'] == 0 and ai['ExactTime'] - GetTime() < 1 then an = u end; if an - ac <= 0 or ai['Ability']['gcd'] == "off" or ai['Ability']['id'] == 124682 or ai['Ability']['id'] == 116670 or ai['Recommendation']['actionName'] == "soothing_mist" or ai['Recommendation']['actionName'] == "slicing_winds" then if H['abilities'][ai['Action']] then
                        if al then NSLog("message 技能存在" .. ai['Ability']['id'] .. ai['Action']) end; p:SetColorTexture(
                        ThirkOnekey:ColorOffSet(H['abilities'][ai['Action']].qr))
                        ab = ad
                    else
                        if al then NSLog("message 技能空" .. ai['Ability']['id']) end; SetBlank()
                    end else
                    if al then NSLog("message 技能等待" .. ai['Ability']['id']) end; SetBlank()
                end
            else
                if not AutoEnabled(ai) then
                    if al then NSLog("message 暂停逻辑 message.Ability.item") end; return
                end; if tabEnemies(ai) then
                    if al then NSLog("message 切換目標 message.Ability.item") end; return
                end; for ao, ap in ipairs(v) do
                    local aq = GetInventoryItemID("player", ap)
                    if (aq == ai['Ability']['item'] or (ai['Ability']['item'] == 232805 or ai['Ability']['item'] == 232526) and (aq == 232526 or aq == 232805)) and H['abilities']["item" .. ap] then
                        if al then NSLog("message SP " .. aq) end; p:SetColorTexture(ThirkOnekey:ColorOffSet(H
                        ['abilities']["item" .. ap].qr))
                        return
                    end
                end; if ai['Ability']['item'] == 224464 or ai['Ability']['item'] == 5512 and H['abilities']['healthstone'] then
                    if al then NSLog("message SP " .. "healthstone") end; p:SetColorTexture(ThirkOnekey:ColorOffSet(H
                    ['abilities']['healthstone'].qr))
                    return
                end; if F[ai['Ability']['item']] and H['abilities']['tempered_potion'] then
                    if al then NSLog("message SP " .. "淬火") end; p:SetColorTexture(ThirkOnekey:ColorOffSet(H
                    ['abilities']['tempered_potion'].qr))
                    return
                elseif G[ai['Ability']['item']] and H['abilities']['frontline_potion'] then
                    if al then NSLog("message SP " .. "前线") end; p:SetColorTexture(ThirkOnekey:ColorOffSet(H
                    ['abilities']['frontline_potion'].qr))
                    return
                end; if al then NSLog("message SP " .. "blank") end; SetBlank()
            end
        end)
    if InCombatLockdown() == false then
        V = {}
        Keys_HP = {}
        U = {}
        W = 1; for ar, as in ipairs(j) do for at, au in ipairs(k) do table.insert(V, as .. au) end end; for av, aw in ipairs(l) do for ax, ay in ipairs(m) do
                table.insert(Keys_HP, aw .. ay) end end
    end; e:RegisterMessage("asoidhawnc!@#",
        function(az, aA)
            if ThirkOnekey['DB']['profile']['specs'][B['spec']['id']]['qu_shan_mouse_enable'] == nil then ThirkOnekey['DB']['profile']['specs'][B['spec']['id']]['qu_shan_mouse_enable'] = true end; for aB, aC in pairs(aA) do if U[aC['key']] == nil and not w[aC['id']] then
                    U[aC['key']] = true; if not H['abilities'][aC['key']] then H['abilities'][aC['key']] = {} end; H['abilities'][aC['key']]['id'] =
                    aC['id']
                    H['abilities'][aC['key']]['qr'] = y[W]
                    if aC['id'] == 100 then H['abilities'][aC['key']]['qr'] = { 0, 0, 0, 1 } end; if aC['key'] == "soothing_mist_cancel" then
                        CreatMarco(aC.key, 9999999, V[W], "/stopcasting " .. GetSpellName(115175))
                        W = W + 1
                    elseif aC['key'] == "mana_tea_cancel" then
                        CreatMarco(aC.key, 9999998, V[W], "/stopcasting " .. GetSpellName(115294))
                        W = W + 1
                    elseif aC['key'] == "premonition_ex" then
                        CreatMarco(aC.key, 9999997, V[W],
                            "/cast " ..
                            GetSpellName(428933) ..
                            ";\n" ..
                            "/cast " ..
                            GetSpellName(428930) ..
                            ";\n" .. "/cast " .. GetSpellName(428934) .. ";\n" .. "/cast " .. GetSpellName(440725) .. ";")
                        W = W + 1
                    elseif aC['key'] == "lifebloom_self" then
                        CreatMarco(aC.key, 9999996, V[W], "/cast [@player] " .. GetSpellName(33763))
                        W = W + 1
                    else
                        CreatMarco(aC.key, aC.id, V[W], nil)
                        W = W + 1
                    end
                end end; if not U['cancelaura1'] then
                U['cancelaura1'] = true; H['abilities']['cancelaura1'] = {}
                CreatNormalMarco("cancelaura1", V[W], "/cancelaura " .. GetSpellName(279709))
                H['abilities']['cancelaura1']['id'] = "cancelaura" .. 279709; H['abilities']['cancelaura1']['qr'] = y[W]
                W = W + 1
            end; if not U['cancelaura2'] then
                U['cancelaura2'] = true; H['abilities']['cancelaura2'] = {}
                CreatNormalMarco("cancelaura2", V[W], "/stopcasting\n/cancelaura " .. GetSpellName(187827))
                H['abilities']['cancelaura2']['id'] = "cancelaura" .. 187827; H['abilities']['cancelaura2']['qr'] = y[W]
                W = W + 1
            end; if not U['cancelaura3'] then
                U['cancelaura3'] = true; H['abilities']['cancelaura3'] = {}
                CreatNormalMarco("cancelaura3", V[W],
                    "/stopcasting\n/cancelaura " ..
                    GetSpellName(426897) ..
                    ";" .. "\n/cancelaura " .. GetSpellName(383886) .. ";" .. "\n/cancelaura " .. GetSpellName(205025))
                H['abilities']['cancelaura3']['id'] = "cancelaura" .. 426897; H['abilities']['cancelaura3']['qr'] = y[W]
                W = W + 1
            end; if not U['cancelaura4'] then
                U['cancelaura4'] = true; H['abilities']['cancelaura4'] = {}
                CreatNormalMarco("cancelaura4", V[W], "/cancelaura " .. GetSpellName(59052))
                H['abilities']['cancelaura4']['id'] = "cancelaura" .. 59052; H['abilities']['cancelaura4']['qr'] = y[W]
                W = W + 1
            end; for aD, aE in ipairs(v) do if not U["item" .. aE] then
                    U["item" .. aE] = true; H['abilities']["item" .. aE] = {}
                    CreatNormalMarco("item" .. aE, V[W], ItemMarco(aE))
                    H['abilities']["item" .. aE]['id'] = "item" .. (GetInventoryItemID("player", aE) or "null")
                    H['abilities']["item" .. aE]['qr'] = y[W]
                    W = W + 1
                end end; if not U['hp'] then
                U['hp'] = true; H['abilities']['hp'] = {}
                CreatNormalMarco("hp", V[W], "/use item:211880;\n/use item:211879;\n/use item:211878")
                H['abilities']['hp']['id'] = "hp" .. 211880; H['abilities']['hp']['qr'] = y[W]
                W = W + 1
            end; if not U['mp'] then
                U['mp'] = true; H['abilities']['mp'] = {}
                CreatNormalMarco("mp", V[W], "/use item:212241;\n/use item:212239;\n/use item:212240")
                H['abilities']['mp']['id'] = "mp" .. 212241; H['abilities']['mp']['qr'] = y[W]
                W = W + 1
            end; if not U['frontline_potion'] then
                U['frontline_potion'] = true; H['abilities']['frontline_potion'] = {}
                CreatNormalMarco("frontline_potion", V[W], "/use item:212262;\n/use item:262261;\n/use item:212260")
                H['abilities']['frontline_potion']['id'] = "frontline_potion" .. 212262; H['abilities']['frontline_potion']['qr'] =
                y[W]
                W = W + 1
            end; if not U['tempered_potion'] then
                U['tempered_potion'] = true; H['abilities']['tempered_potion'] = {}
                CreatNormalMarco("tempered_potion", V[W], "/use item:212265;\n/use item:212263;\n/use item:212264")
                H['abilities']['tempered_potion']['id'] = "tempered_potion" .. 212241; H['abilities']['tempered_potion']['qr'] =
                y[W]
                W = W + 1
            end; if not U['healthstone'] then
                U['healthstone'] = true; H['abilities']['healthstone'] = {}
                CreatNormalMarco("healthstone", V[W], "/use item:224464;\n/use item:5512;")
                H['abilities']['healthstone']['id'] = "healthstone" .. 224464; H['abilities']['healthstone']['qr'] = y
                [W]
                W = W + 1
            end; local aF = "/cast " ..
            GetSpellName(26297) ..
            L['zztc'] ..
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
            "\n/cast " .. GetSpellName(255647) .. "\n/cast " .. GetSpellName(265221) .. "\n/cast " ..
            GetSpellName(260364)
            if not U['racial'] then
                U['racial'] = true; H['abilities']['racial'] = {}
                CreatNormalMarco("racial", V[W], aF)
                H['abilities']['racial']['id'] = "racial" .. 26297; H['abilities']['racial']['qr'] = y[W]
                W = W + 1
            end; if UnitClassBase("player") == "PALADIN" or UnitClassBase("player") == "DRUID" or UnitClassBase("player") == "WARLOCK" or UnitClassBase("player") == "DEATHKNIGHT" then
                local aG = ""
                if UnitClassBase("player") == "PALADIN" then aG = "/cast [@mouseover] " .. GetSpellName(391054) end; if UnitClassBase("player") == "DRUID" then aG =
                    "/cast [@mouseover] " .. GetSpellName(20484) end; if UnitClassBase("player") == "WARLOCK" then aG =
                    "/cast [@mouseover] " .. GetSpellName(20707) end; if UnitClassBase("player") == "DEATHKNIGHT" then aG =
                    "/cast [@mouseover] " .. GetSpellName(61999) end; if not U['rebackInFighting'] then
                    U['rebackInFighting'] = true; H['abilities']['rebackInFighting'] = {}
                    CreatNormalMarco("rebackInFighting", V[W], aG)
                    H['abilities']['rebackInFighting']['id'] = "rebackInFighting" .. 26297; H['abilities']['rebackInFighting']['qr'] =
                    y[W]
                    W = W + 1
                end
            end; if not U['clearFocus'] then
                U['clearFocus'] = true; H['abilities']['clearFocus'] = {}
                CreatNormalMarco("clearFocus", V[W], "/clearfocus")
                H['abilities']['clearFocus']['id'] = "clearFocus"
                H['abilities']['clearFocus']['qr'] = y[W]
                W = W + 1
            end; if ThirkOnekey['DB']['profile']['specs'][ThirkOnekey['State']['spec']['id']]['bitBoomSpecData'] and ThirkOnekey['DB']['profile']['specs'][ThirkOnekey['State']['spec']['id']]['MouseHitBoomSpell'] then if not U['bitBoom'] then
                    U['bitBoom'] = true; H['abilities']['bitBoom'] = {}
                    CreatNormalMarco("bitBoom", V[W],
                        ThirkOnekey['DB']['profile']['specs'][ThirkOnekey['State']['spec']['id']].bitBoomSpecData)
                    H['abilities']['bitBoom']['id'] = "bitBoom" .. 224464; H['abilities']['bitBoom']['qr'] = y[W]
                    W = W + 1; NSLog("已编辑特殊目标焦点技能: - " ..
                    ThirkOnekey['DB']['profile']['specs'][ThirkOnekey['State']['spec']['id']]['bitBoomSpecData'])
                end end; for aH, aI in ipairs({ "player", "party1", "party2", "party3", "party4" }) do if not U[aI] then
                    U[aI] = true; H['abilities'][aI] = {}
                    CreatNormalMarco(aI, V[W], "/focus " .. aI)
                    H['abilities'][aI]['id'] = "focus_" .. 224464; H['abilities'][aI]['qr'] = y[W]
                    W = W + 1
                end end; if not U['tab'] then
                U['tab'] = true; H['abilities']['tab'] = {}
                CreatNormalMarco("tab", V[W], "/targetenemy")
                H['abilities']['tab']['id'] = "tab" .. 212241; H['abilities']['tab']['qr'] = y[W]
                W = W + 1
            end; for aJ, aK in ipairs(Keys_HP) do
                local aL = "raid" .. aJ; if not U[aL] then
                    U[aL] = true; if not H['abilities'][aL] then H['abilities'][aL] = {} end; H['abilities'][aL]['id'] =
                    aL; H['abilities'][aL]['qr'] = y[133 + aJ]
                    CreatNormalMarco(aL, aK, "/focus raid" .. aJ)
                end
            end; BuffInit()
        end)
    addStateExt()
    C_Timer.After(5,
        function()
            C_Timer.NewTicker(0.02, function() AutoCoolDown() end)
            C_Timer.NewTicker(Z(), checkPlayersHp)
            NSLog("初始化完成")
            ThirkOnekey:UpdateDisplayVisibility()
            ThirkOnekey:ForceUpdate("Thirk_TOGGLE", true)
        end)
end; function AutoEnabled(aM)
    if x[aM['Ability']['id']] then
        if in_array(B['spec'].id, { 260, 261, 259, 103 }) then
            if ThirkOnekey['DB']['profile']['specs'][B['spec']['id']]['settings']['autohid'] then return true end; return false
        end; return true
    end; local aN = ThirkOnekey['DB']['profile']['specs'][B['spec']['id']]['nameplateRange'] or 0; if aN > 0 and (B['target']['distance'] or 0) > aN and ThirkOnekey['DB']['profile']['toggles']['target_distance_check']['value'] == true then
        SetBlank()
        return false
    end; if B['target']['npcid'] ~= -1 then if ThirkOnekey:CheakTargetIsJiaRen("target", true) == false and UnitAffectingCombat("target") == false and ThirkOnekey['DB']['profile']['toggles']['crazyDog']['value'] == false and UnitHealth("target") ~= 0 and N['unti'] == "none" and #C == 0 then
            SetBlank()
            return false
        end end; if (B['target']['npcid'] == -1 or not UnitExists("target") or UnitIsDead("target")) and UnitAffectingCombat("player") == false and (ThirkOnekey['DB']['profile']['specs'][B['spec']['id']]['settings']['autofoucus_enable'] == false or #C == 0 and N['unti'] == "none") then if ThirkOnekey['DB']['profile']['toggles']['targetSelect']['autoSelec_force'] == false then
            SetBlank()
            return false
        end end; if N['unti'] == "none" and UnitIsFriend("target", "player") and UnitAffectingCombat("player") == false and #C == 0 then
        SetBlank()
        return false
    end; if B['empowerment']['hold'] > 0 then
        if aM['EarliestTime'] == 0 or aM['Action'] == "slicing_winds" then return true end; SetBlank()
        return false
    end; return true
end; function enabled_Hp()
    local aO = false; for aP, aQ in ipairs({ 211880, 211878, 211879 }) do if C_Item.GetItemCount(aQ, false) > 0 then
            aO = true; break
        end end; if (UnitLevel("player") or 0) < 71 or InCombatLockdown() == false then return false end; if aO == false or not ThirkOnekey['DB']['profile']['toggles']['potions_hp']['value'] then return false end; if aO == false or not ThirkOnekey['DB']['profile']['toggles']['potions_hp']['value'] then return false end; if UnitHealth("player") > ThirkOnekey['DB']['profile']['toggles']['potions_hp']['threshold'] / 100 * UnitHealthMax("player") then return false end; local aR =
    getItemCD(211878) <= 0 or getItemCD(211879) <= 0 or getItemCD(211880) <= 0; return aR
end; function enabled_mp()
    local aS = false; for aT, aU in ipairs({ 212239, 212240, 212241 }) do if C_Item.GetItemCount(aU, false) > 0 then
            aS = true; break
        end end; if (UnitLevel("player") or 0) < 71 or InCombatLockdown() == false then return false end; if aS == false or not ThirkOnekey['DB']['profile']['toggles']['potions_mp']['value'] or UnitPowerMax("player", Enum['PowerType'].Mana) <= 0 then return false end; if UnitPower("player", Enum['PowerType'].Mana) > ThirkOnekey['DB']['profile']['toggles']['potions_mp']['threshold'] / 100 * UnitPowerMax("player", Enum['PowerType'].Mana) then return false end; local aV =
    getItemCD(212239) <= 0 or getItemCD(212240) <= 0 or getItemCD(212241) <= 0; return aV
end; function rebackInFighting_enable()
    local aW = UnitClassBase("player")
    if UnitIsDead("mouseover") == true and UnitIsVisible("mouseover") == true and UnitIsFriend("mouseover", "player") == true and ThirkOnekey['DB']['profile']['toggles']['FastRestOnFighting']['value'] == true then
        if aW == "DEATHKNIGHT" then
            local aX = UnitPower("player", 6)
            if aX >= 30 then return true end
        end; if aW == "DRUID" then return true end; if aW == "PALADIN" then
            local aY = UnitPower("player", 9)
            if aY >= 3 then return true end
        end; if aW == "WARLOCK" then return true end
    end; return false
end; function enableBoomHit()
    local aZ = ThirkOnekey['DB']['profile']['specs'][ThirkOnekey['State']['spec']['id']]
    if aZ['bitBoomSpecData'] and aZ['MouseHitBoomSpell'] and U['bitBoom'] then
        local a_ = { UnitName("mouseover"), UnitName("target") }
        for b0, b1 in ipairs(a_) do if aZ['MouseHitBoomSpell'] ~= "" and b1 and string.match(b1, aZ.MouseHitBoomSpell) == aZ['MouseHitBoomSpell'] then return true end end
    end; return false
end; function SetBlank() p:SetColorTexture(0, 0, 0, 1) end; function tabEnemies(b2)
    if H['abilities']['tab'] == nil then
        p:SetColorTexture(0, 0, 0, 1)
        return false
    end; if b2['Recommendation']['indicator'] == "cycle" and b2['Ability']['id'] ~= 80240 and ThirkOnekey['DB']['profile']['toggles']['targetSelect']['value'] == true or (UnitHealth("target") == 0 or UnitIsFriend("target", "player") == true and UnitCanAttack("player", "target") == false and UnitAffectingCombat("player") == true) and ThirkOnekey['DB']['profile']['toggles']['targetSelect']['value'] == true then if UnitAffectingCombat("player") == true and ThirkOnekey['enemiesTotalHP'] > 0 and ThirkOnekey['DB']['profile']['toggles']['targetSelect']['value'] == true and N['unti'] ~= "target" then
            p:SetColorTexture(ThirkOnekey:ColorOffSet(H['abilities']['tab'].qr))
            return true
        end end; if (B['target']['npcid'] == -1 or UnitIsFriend("target", "player") == true and UnitCanAttack("player", "target") == false or b2['outOfRange']) and UnitAffectingCombat("player") == false then if ThirkOnekey['DB']['profile']['toggles']['targetSelect']['value'] and ThirkOnekey['DB']['profile']['toggles']['targetSelect']['autoSelec_force'] then
            p:SetColorTexture(ThirkOnekey:ColorOffSet(H['abilities']['tab'].qr))
            return true
        end end; return false
end; function AutoCoolDown()
    if ThirkOnekey['DB']['profile']['toggles']['cooldown_safe']['value'] then
        if InCombatLockdown() then
            local b3 = UnitHealthMax("player")
            if b3 == 0 then return end; if ThirkOnekey['enemiesTotalHP'] / b3 <= (ThirkOnekey['DB']['profile']['specs'][B['spec']['id']]['autoCooldown_closeTime'] or 0.3) then ThirkOnekey['DB']['profile']['toggles']['cooldowns']['value'] = false end
        end; return
    end; if ThirkOnekey['DB']['profile']['toggles']['autoCooldown']['value'] then
        local b4 = UnitHealthMax("player")
        if b4 == 0 then return end; if ThirkOnekey['enemiesTotalHP'] / b4 <= (ThirkOnekey['DB']['profile']['specs'][B['spec']['id']]['autoCooldown_closeTime'] or 0.3) then ThirkOnekey['DB']['profile']['toggles']['cooldowns']['value'] = false else ThirkOnekey['DB']['profile']['toggles']['cooldowns']['value'] = true end
    end
end; function RemoveAllMarco() if InCombatLockdown() ~= true then for b5, b6 in ipairs(j) do for b7, b8 in ipairs(k) do
                SetBinding(b6 .. b8, nil) end end end end; function getItemCD(b9)
    local ba, bb, bc = C_Item.GetItemCooldown(b9)
    CDTime = ba + bb - GetTime()
    if CDTime <= 0 or CDTime >= 1000 then CDTime = 0 end; return CDTime
end; local bd = true; function CreatMarco(be, bf, bg, bh)
    if GetSpellName(bf) == nil and bf ~= 9999999 and bf ~= 9999997 and bf ~= 9999998 and bf ~= 9999996 then return end; local bi =
    bh or "/cast " .. FixMarco(bf) .. GetSpellName(bf) .. ";"
    if 326059 == bf or 428332 == bf then bi = "/cast [@focus,help,nodead] [nodead] [@player] " ..
        GetSpellName(428332) .. ";\n" .. "/cast [@focus,help,nodead] [nodead] [@player] " ..
        GetSpellName(428332) .. "(暗影国度)" end; if 432472 == bf or 432459 == bf then bi = "/cast [known:" ..
        432459 ..
        ",@focus,help,nodead] [known:" ..
        432459 ..
        ",help,nodead] [known:" ..
        432459 .. "]" .. GetSpellName(432459) .. ";\n" .. "/cast [known:" .. 432472 .. ",@player] " ..
        GetSpellName(432472) end; if 80240 == bf then bi = "/tar player\n" ..
        "/targetlasttarget\n" ..
        "/targetenemy\n" ..
        "/targetlasttarget\n" ..
        "/targetlasttarget [harm]/\n" ..
        "/cast " ..
        GetSpellName(80240) .. "\n" .. "/targetlasttarget [harm]\n" .. "/cleartarget [harm]\n" .. "/targetlasttarget\n" end; if 133 == bf or 431044 == bf then bi =
        "/cast [known:" .. 431044 .. "]" .. GetSpellName(431044) .. ";\n" .. "/cast " .. GetSpellName(133) end; if 433895 == bf or 55090 == bf or 206930 == bf or 207311 == bf then bi =
        "/cast [known:" ..
        207311 ..
        "] " ..
        GetSpellName(207311) ..
        ";\n" ..
        "/cast [known:" ..
        55090 .. "] " .. GetSpellName(55090) .. ";\n" .. "/cast [known:" .. 206930 .. "] " .. GetSpellName(206930) ..
        ";\n" end; if 33891 == bf or 390414 == bf or 102560 == bf or 102543 == bf or 102558 == bf then bi =
        "/cast [known:" ..
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
        "/cast [known:" .. 102543 ..
        "]" .. GetSpellName(102543) .. ";\n" .. "/cast [known:" .. 102558 .. "]" .. GetSpellName(102558) end; if 389539 == bf or 31884 == bf then bi =
        "/cast [known:389539] " .. GetSpellName(389539) .. ";" .. "/cast [known:31884] " .. GetSpellName(31884) .. ";" end; if 427453 == bf then bi =
        "/cast [spec:2] " .. GetSpellName(387174) .. ";" .. "/cast [spec:3] " .. GetSpellName(255937) .. ";" end; if 982 == bf then bi =
        "/cast [@pet,dead]" .. GetSpellName(982) end; if 883 == bf then bi = "/castsequence [@pet,dead] " ..
        GetSpellName(982) .. ";[nopet]reset=2 " .. GetSpellName(883) .. "," .. GetSpellName(982) end; if 452487 == bf or 258920 == bf then bi =
        "/cast [known:452487] " .. GetSpellName(452487) .. ";" .. "/cast [known:258920] " .. GetSpellName(258920) .. ";" end; if 452490 == bf then
        bi = "/castsequence [known:452490] [@player] " ..
        "," .. "[known: 389799] " .. GetSpellName(204596) .. ";\n" .. "/cast [@player] " .. GetSpellName(204596)
        GetSpellName(452490)
    end; if 451235 == bf or 123040 == bf or 200174 == bf or 34433 == bf then bi = "/cast [known:" ..
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
        200174 .. "]" .. GetSpellName(200174) .. ";\n" .. "/cast [known:" .. 34433 .. "]" .. GetSpellName(34433) .. ";" end; if 1214467 == bf or 5740 == bf then bi =
        "/cast [known:" .. 1214467 .. "]" .. GetSpellName(5740) .. ";\n" .. "/cast [@cursor] " .. GetSpellName(5740) end; if 108853 == bf then bi =
        "/castsequence reset=0.5 " .. GetSpellName(108853) .. ", nil" end; if 376079 == bf or 307865 == bf then bi =
        "/cast [@player]" .. GetSpellName(376079) end; if 388193 == bf or 327104 == bf then bi = "/cast [known:" ..
        388193 .. "]" .. GetSpellName(388193) .. ";\n" .. "/cast " .. GetSpellName(327104) end; if 373481 == bf or 440678 == bf then bi =
        "/cast [known:" ..
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
        ",@focus,help,nodead] [known:" .. 373481 .. ",help,nodead] [known:" .. 373481 .. "]" ..
        GetSpellName(373481) .. ";\n" end; if 1217413 == bf then bi = "/castsequence reset=0.5 " ..
        GetSpellName(1217413) .. ", " .. GetSpellName(1217413) end; if 115450 == bf or 218164 == bf then bi =
        "/cast [@mouseover,help,nodead] [help,nodead] [@player] " .. GetSpellName(218164) end; if 441776 == bf or 2098 == bf or 196819 == bf then bi =
        "/cast [spec:2] " .. GetSpellName(2098) .. ";\n" .. "/cast [spec:3] " .. GetSpellName(196819) end; if 378081 == bf then bi =
        "/cast [known:" .. 443454 .. "]" .. GetSpellName(443454) .. ";\n" .. "/cast " .. GetSpellName(378081) end; if 444995 == bf then bi =
        "/cast [spec:2, @cursor] " .. GetSpellName(444995) .. ";\n" .. "/cast [spec:3, @cursor] " .. GetSpellName(73920) end; if 85948 == bf or 458128 == bf then bi =
        "/cast " .. GetSpellName(85948) end; if 455476 == bf or 455465 == bf or 264119 == bf then bi = "/cast [known:" ..
        455476 ..
        "]" ..
        GetSpellName(455476) ..
        ";\n" .. "/cast [known:" .. 455465 .. "]" .. GetSpellName(455465) .. ";\n" .. "/cast " .. GetSpellName(264119) end; local bj =
    CreateFrame("Button", be, UIParent, "SecureActionButtonTemplate")
    if not bj and bd then
        NSLog("初始化失败, 请重载游戏一下 (/RL)")
        bd = false; return nil
    end; bj:RegisterForClicks("AnyUp", "AnyDown")
    bj:SetAttribute("type", "macro")
    bj:SetAttribute("macrotext", bi)
    if InCombatLockdown() ~= true then
        SetBinding(bg, nil)
        SetOverrideBindingClick(bj, true, bg, bj:GetName())
    elseif bd then
        NSLog("初始化失败, 请重载游戏一下 (/RL)")
        bd = false
    end; return bj
end; function CreatNormalMarco(bk, bl, bm)
    local bn = CreateFrame("Button", bk, UIParent, "SecureActionButtonTemplate")
    if not bn and bd then
        NSLog("初始化失败, 请重载游戏一下 (/RL)")
        bd = false; return nil
    end; bn:RegisterForClicks("AnyUp", "AnyDown")
    bn:SetAttribute("type", "macro")
    bn:SetAttribute("macrotext", bm)
    if InCombatLockdown() ~= true then
        SetBinding(bl, nil)
        SetOverrideBindingClick(bn, true, bl, bn:GetName())
    elseif bd then
        NSLog("初始化失败, 请重载游戏一下 (/RL)")
        bd = false
    end; return bn
end; function ItemMarco(bo)
    local bp = GetInventoryItemID("player", bo)
    local bq = "/use " .. bo; if bp then
        if bp == 443536 or bp == 190958 or bp == 159611 or bp == 219301 or bp == 219320 or bp == 219310 then bq =
            "/use [@cursor] " .. bo end; if bp == 193718 or bp == 194307 then bq = "/use [@mouseover] " .. bo end; if bp == 193678 or bp == 219303 or trinker1 == 225654 or bp == 220118 or bp == 232486 then bq =
            "/use [@player] " .. bo end; if bp == 232542 then bq = "/use [@focus,help,nodead] [help,nodead] [@player] " ..
            bo end
    end; return bq
end; local br = { 697, 386256, 152108, 5740, 386833, 267211, 278350, 1122, 265187, 205180, 114158, 194223, 145205, 205636, 34861, 187650, 187698, 1543, 260243, 108287, 192222, 198838, 73920, 444995, 190356, 2120, 153561, 33395, 368847, 403631, 236776 }
local bs = { 85673, 633, 19750, 1022, 432459, 33076, 139, 17, 2061, 373481, 8004, 1064, 974, 115175, 116670, 360995, 355913, 20473, 156910, 223306, 200025, 148039, 82326, 48438, 18562, 33206, 47788, 194509, 774, 116849, 203651, 102351, 392160, 102342, 50464, 33763, 188550, 204883, 2060, 596, 2050, 61295, 73685, 77472, 124682, 115151, 399491, 124081, 367226, 364343, 366155, 357170, 408233, 360827, 8936, 388010, 388007, 388013 }
local bt = { 4987, 2782, 88423, 10060, 527, 77130, 218164, 409311, 412710, 360823, 374251 }
local bu = { 121536, 43265, 152280, 343721, 1126, 452490, 29166, 115313, 187827, 189110, 376079, 307865, 228920, 191427, 325153, 388011, 62618 }
local bv = { 152279, 740, 45438, 391054, 5215 }
function FixMarco(bw)
    if in_array(bw, br) then return "[@cursor] " end; if in_array(bw, bs) then return
        "[@focus,help,nodead] [help,nodead] [@player] " end; if in_array(bw, { 102560 }) then return
        "[known:390378, @cursor] " end; if in_array(bw, { 205385 }) then return
        "[known:205385, @cursor] [known:457042, @target] " end; if in_array(bw, { 61882 }) then return
        "[@cursor, known:61882] [known:462620, @target] " end; if in_array(bw, { 6940 }) then return
        "[@focus,help,nodead] [help,nodead] [@mouseover,help, nodead] [@player, nodead] " end; if in_array(bw, bt) then return
        "[@mouseover,help,nodead] [help,nodead] [@player] " end; if in_array(bw, { 3411 }) then return
        "[@mouseover,help,nodead] [help,nodead] " end; if in_array(bw, { 361469 }) then return
        "[@focus,help,nodead] [help,nodead] [harm,nodead] [@player] " end; if in_array(bw, bu) then return "[@player] " end; if in_array(bw, bv) then return
        "!" end; if in_array(bw, { 204596, 207684, 202138, 202137, 390163 }) then return "[known: 389799] " ..
        GetSpellName(bw) .. ";\n" .. "/cast [@player] " end; return ""
end; function GetSpellName(bx)
    local by = ""
    if C_Spell and C_Spell['GetSpellName'] then by = C_Spell.GetSpellName(bx) end; return by
end; local bz = function(bA)
    local bB = C_Spell.GetSpellCooldown(bA)
    if bB then return bB['startTime'], bB['duration'], bB['isEnabled'], bB['modRate'] end; return 0, 0, false, 0
end; function GetSpellCD(bC)
    local bD, bE, bF = bz(bC)
    CDTime = bD + bE - GetTime()
    if CDTime <= 0 or CDTime >= 1000 then CDTime = 0 end; return CDTime
end; function in_array(bG, bH)
    if not bH then return false end; for bI, bJ in pairs(bH) do if bJ == bG then return true end end; return false
end; function needTabNeedHelpPlayer(bK)
    local bL = N['unti']
    if not ThirkOnekey['DB']['profile']['specs'][B['spec']['id']]['settings']['autofoucus_enable'] or UnitIsDead("player") then return false end; local bM =
    UnitGUID("focus")
    if #C > 0 and bL == "none" then
        if bM ~= UnitGUID(C[1]) and H['abilities'][C[1]] then
            p:SetColorTexture(ThirkOnekey:ColorOffSet(H['abilities'][C[1]].qr))
            return true
        end; return false
    end; if H['abilities'][bL] ~= nil then if bL ~= "none" and bL ~= "target" and (bM == nil or bM ~= UnitGUID(bL)) then
            p:SetColorTexture(ThirkOnekey:ColorOffSet(H['abilities'][bL].qr))
            return true
        end end; return false
end; local bN, bO, bP, bQ, bR, bS, bT = wipe, UnitExists, UnitIsDead, UnitIsVisible, UnitInRange, UnitHealth,
    UnitHealthMax; local bU, bV, bW, bX, bY = UnitInRaid, IsInRaid, GetNumGroupMembers, UnitInParty, UnitAffectingCombat; local bZ =
UnitIsFriend; local b_ = { "player", "party1", "party2", "party3", "party4" }
local c0 = { "player" }
local c1 = "raid"
local c2 = {}
local c3 = {}
local c4 = 27827; local c5, c6 = 0, 0.1; local c7, c8 = 5, 0.005; local c9 = c7; local function ca(cb) return not cb
    ['dead'] and not cb['hasBuff'] and cb['visible'] and cb['inRange'] end; local function cc()
    BuffInit()
    bN(c2)
    if bV() then
        local cd = bW()
        for ce = 1, cd do c3[ce] = c1 .. ce end
    elseif bX("player") then for cf = 1, #b_ do c3[cf] = b_[cf] end else c3[1] = c0[1] end; for cg = 1, #c3 do
        local ch = c3[cg]
        if bO(ch) then
            c2[ch] = { dead = bP(ch), exists = true, hasBuff = UntiHasBuff(ch, c4), visible = bQ(ch), inRange = ch ==
            "player" or bR(ch), hp = bS(ch) / bT(ch) }
            N['alive_players'] = N['alive_players'] + (ca(c2[ch]) and 1 or 0)
        end; c3[cg] = nil
    end; if bO("target") and bZ("target", "player") then c2['target'] = { dead = bP("target"), exists = true, hasBuff =
        UntiHasBuff("target", c4), visible = bQ("target"), inRange = true, hp = bS("target") / bT("target") } end
end; function checkPlayersHp()
    local ci = GetTime()
    if ci - c5 < c6 then return end; c5 = ci; f:Async(
    function()
        cc()
        local cj = GetTime()
        local ck = 0; for cl, cm in pairs(c2) do if ca(cm) then
                CheckPlayer(cl)
                ck = ck + 1; if ck >= c9 or GetTime() - cj > c8 then
                    local cn = GetTime() - cj; if cn < c8 * 0.6 then c9 = math.min(c9 + 2, 15) elseif cn > c8 * 0.9 then c9 =
                        math.max(c9 - 1, 3) end; coroutine.yield()
                    cj = GetTime()
                end
            end end
    end, "ContinuousHealthCheck", true)
end; function CheckPlayer(co)
    local cp = B['spec']['id']
    local cq = ThirkOnekey['DB']['profile']['specs'][cp]
    local cr = bY("player") and cq['HeplerConfig_normalMode'] or cq['HeplerConfig_outFightMode'] or 95; local cs = cq
    ['HeplerConfig_AOEBigHurtMode'] or 85; local ct = cq['HeplerConfig_AOEHurtMode'] or 85; BuffCheck(co)
    CheckUnit(co, cr, cs, ct)
end; local function cu(cv, cw, cx)
    local cy = ThirkOnekey['State']['spec']['id']
    if cy == 256 then
        if bX("player") and not bV() then if UntiNoBuff(cv, 194384) and min(N.alive_players, ThirkOnekey['DB']['profile']['specs'][cy]['settings']['jiushu_count_party'] or 5) > S['atonement']['totalCount'] then
                table.insert(C, 1, cv) end end; if bU("player") and bV() then if UntiNoBuff(cv, 194384) and min(N.alive_players, ThirkOnekey['DB']['profile']['specs'][cy]['settings']['jiushu_count_raid'] or 7) > S['atonement']['totalCount'] then
                table.insert(C, cv) end end; cw = cw + (UntiNoBuff(cv, 194384) and S['atonement']['hp_offset'] or 0)
    end; if cy == 65 and cv == "player" and UntiHasDeBuff(cv, 448005) then cw = cw -
        (100 - cx - S['light_of_the_martyr_dot']['hp_offset']) end; if cy == 65 and (UntiHasBuff(cv, 156910) or UntiHasBuff(cv, 53563)) then cw =
        cw + S['beacon_of_light']['hp_offset'] end; if cy == 270 then
        if bX("player") and not bV() or bU("player") and bV() then if P(115151) > 0 then if S['renewing_mist']['totalCount'] < N['alive_players'] and UntiNoBuff(cv, S['renewing_mist'].id) and ThirkOnekey['DB']['profile']['specs'][B['spec']['id']]['settings']['renewing_mist_pre'] - (100 - N['pct']) >= 0 then
                    table.insert(C, cv) end end end; cw = cw +
        (UntiHasBuff(cv, S['renewing_mist'].id) and S['renewing_mist']['hp_offset'] or 0)
    end; if cy == 264 and UnitGroupRolesAssigned(cv) == "TANK" and UntiNoBuff(cv, 974) and UntiNoBuff(cv, 383648) then cw =
        cw - (100 - cx - S['earth_shield']['hp_offset']) end; if cy == 105 then
        if bX("player") and not bV() and B['mana']['pct'] > 65 and cw >= 70 then if UntiNoBuff(cv, S['rejuvenation'].id) and min(N.alive_players, ThirkOnekey['DB']['profile']['specs'][cy]['settings']['huichun_count_party'] or 5) > S['rejuvenation']['totalCount'] then
                table.insert(C, 1, cv) end end; if bU("player") and bV() and B['mana']['pct'] > 65 and cw >= 70 then if UntiNoBuff(cv, S['rejuvenation'].id) and min(N.alive_players, ThirkOnekey['DB']['profile']['specs'][cy]['settings']['huichun_count_raid'] or 8) > S['rejuvenation']['totalCount'] then
                table.insert(C, cv) end end; cw = cw +
        (UntiHasDeBuff(cv, S['rejuvenation'].id) and S['rejuvenation']['hp_offset'] or 0)
    end; if UntiHasDeBuff(cv, 460164) or UntiHasDeBuff(cv, 465830) or UntiHasDeBuff(cv, 1220761) or UntiHasDeBuff(cv, 469043) then cw =
        cw * 0.5 end; return cw
end; function CheckUnit(cz, cA, cB, cC)
    if cz == "target" or cz == "player" then if not bO(cz) or bP(cz) or not bQ(cz) or UntiHasBuff(cz, 27827) then return end elseif not bO(cz) or bP(cz) or not bQ(cz) or not bR(cz) or UntiHasBuff(cz, 27827) then return end; local cD =
    bS(cz)
    local cE = bT(cz)
    local cF = cD / cE * 100; cF = cu(cz, cF, cA)
    if cF <= cB then K = K + 1 end; if cF <= cC then J = J + 1 end; if cF < N['pct'] - 2 and cF < cA then
        N['pct'] = cF; N['unti'] = cz; N['role'] = UnitGroupRolesAssigned(cz)
        N['class'] = UnitClassBase(cz)
    end
end; local cG = AuraUtil['ForEachAura']
function BuffCheck(cH)
    if ThirkOnekey['State']['spec']['id'] == 256 then
        if bO(cH) and not bP(cH) then cG(cH, "HELPFUL", nil,
                function(cI) if cI['sourceUnit'] == "player" then
                        cI['remainingTime'] = cI['expirationTime'] - GetTime()
                        if cI['spellId'] == S['atonement']['id'] then
                            S['atonement']['totalCount'] = S['atonement']['totalCount'] + 1; S['atonement']['remains_min'] =
                            min(S['atonement'].remains_min, cI.remainingTime)
                            S['atonement']['remains_min_unti'] = cH
                        end
                    end end, true) end; if bO("focus") and not bP("focus") then cG("focus", "HELPFUL", nil,
                function(cJ) if cJ['sourceUnit'] == "player" then
                        cJ['remainingTime'] = cJ['expirationTime'] - GetTime()
                        if cJ['spellId'] == S['atonement']['id'] then S['atonement']['fucos_remains'] = cJ
                            ['remainingTime'] end
                    end end, true) end
    end; if ThirkOnekey['State']['spec']['id'] == 264 then if bO(cH) and not bP(cH) then
            local cK, cL = ThirkOnekey:getUntiHasBuff(S['riptide'].id, cH, true)
            if cK then S['riptide']['totalCount'] = S['riptide']['totalCount'] + 1 end; if S['riptide']['remains_min'] > cL then S['riptide']['remains_min'] =
                cL end
        end end; if ThirkOnekey['State']['spec']['id'] == 105 then
        if bO(cH) and not bP(cH) then cG(cH, "HELPFUL", nil,
                function(cM) if cM['sourceUnit'] == "player" then
                        cM['remainingTime'] = cM['expirationTime'] - GetTime()
                        if cM['spellId'] == S['rejuvenation']['id'] then
                            S['rejuvenation']['totalCount'] = S['rejuvenation']['totalCount'] + 1; S['rejuvenation']['remains_min'] =
                            min(S['rejuvenation'].remains_min, cM.remainingTime)
                            S['rejuvenation']['remains_min_unti'] = cH
                        end; if cM['spellId'] == S['lifebloom_2']['id'] then
                            S['lifebloom_2']['totalCount'] = S['lifebloom_2']['totalCount'] + 1; S['lifebloom_2']['remains_min'] =
                            min(S['lifebloom_2'].remains_min, cM.remainingTime)
                            S['lifebloom_2']['remains_min_unti'] = cH
                        end; if cM['spellId'] == S['rejuvenation_germination']['id'] then
                            S['rejuvenation_germination']['totalCount'] = S['rejuvenation_germination']['totalCount'] + 1; S['rejuvenation_germination']['remains_min'] =
                            min(S['rejuvenation_germination'].remains_min, cM.remainingTime)
                            S['rejuvenation_germination']['remains_min_unti'] = cH
                        end; if cM['spellId'] == S['spring_blossoms']['id'] then
                            S['spring_blossoms']['totalCount'] = S['spring_blossoms']['totalCount'] + 1; S['spring_blossoms']['remains_min'] =
                            min(S['spring_blossoms'].remains_min, cM.remainingTime)
                            S['spring_blossoms']['remains_min_unti'] = cH
                        end; if cM['spellId'] == S['regrowth']['id'] then
                            S['regrowth']['totalCount'] = S['regrowth']['totalCount'] + 1; S['regrowth']['remains_min'] =
                            min(S['regrowth'].remains_min, cM.remainingTime)
                            S['regrowth']['remains_min_unti'] = cH
                        end; if cM['spellId'] == S['wild_growth']['id'] then
                            S['wild_growth']['totalCount'] = S['wild_growth']['totalCount'] + 1; S['wild_growth']['remains_min'] =
                            min(S['wild_growth'].remains_min, cM.remainingTime)
                            S['wild_growth']['remains_min_unti'] = cH
                        end
                    end end, true) end; if bO("focus") and not bP("focus") then cG("focus", "HELPFUL", nil,
                function(cN) if cN['sourceUnit'] == "player" then
                        cN['remainingTime'] = cN['expirationTime'] - GetTime()
                        if cN['spellId'] == S['rejuvenation']['id'] then S['rejuvenation']['fucos_remains'] = cN
                            ['remainingTime'] end; if cN['spellId'] == S['lifebloom_2']['id'] then S['lifebloom_2']['fucos_remains'] =
                            cN['remainingTime'] end; if cN['spellId'] == S['rejuvenation_germination']['id'] then S['rejuvenation_germination']['fucos_remains'] =
                            cN['remainingTime'] end; if cN['spellId'] == S['spring_blossoms']['id'] then S['spring_blossoms']['fucos_remains'] =
                            cN['remainingTime'] end; if cN['spellId'] == S['regrowth']['id'] then S['regrowth']['fucos_remains'] =
                            cN['remainingTime'] end; if cN['spellId'] == S['wild_growth']['id'] then S['wild_growth']['fucos_remains'] =
                            cN['remainingTime'] end
                    end end, true) end
    end; if ThirkOnekey['State']['spec']['id'] == 270 then if bO(cH) and not bP(cH) then
            local cO, cP = ThirkOnekey:getUntiHasBuff(S['renewing_mist'].id, cH, true)
            if cO then S['renewing_mist']['totalCount'] = S['renewing_mist']['totalCount'] + 1 end
        end end
end; function UntiNoBuff(cQ, cR)
    local cS, cT = ThirkOnekey:getUntiHasBuff(cR, cQ, true)
    return not cS
end; function UntiHasBuff(cU, cV)
    local cW, cX = ThirkOnekey:getUntiHasBuff(cV, cU, true)
    return cW
end; function UntiHasDeBuff(cY, cZ)
    local c_, d0 = ThirkOnekey:getUntiHasDebuff(cZ, cY)
    return c_
end; function BuffInit()
    C = {}
    N['class'] = "none"
    N['unti'] = "none"
    N['pct'] = 100; N['role'] = "none"
    N['setting']['combat_value'] = ThirkOnekey['DB']['profile']['specs'][B['spec']['id']]['HeplerConfig_normalMode'] or
    95; N['setting']['out_combat_value'] = ThirkOnekey['DB']['profile']['specs'][B['spec']['id']]
    ['HeplerConfig_outFightMode'] or 95; J = 0; K = 0; M = ThirkOnekey['DB']['profile']['specs'][B['spec']['id']]
    ['HeplerConfig_enable_damageSpell_value'] or 1; S['atonement']['totalCount'] = 0; S['atonement']['remains_min'] = 9999; S['atonement']['remains_min_unti'] =
    "none"
    S['atonement']['fucos_remains'] = 0; S['riptide']['totalCount'] = 0; S['riptide']['remains_min'] = 9999; S['rejuvenation']['totalCount'] = 0; S['rejuvenation']['remains_min'] = 9999; S['rejuvenation']['remains_min_unti'] =
    "none"
    S['rejuvenation']['fucos_remains'] = 0; S['lifebloom_2']['totalCount'] = 0; S['lifebloom_2']['remains_min'] = 9999; S['lifebloom_2']['remains_min_unti'] =
    "none"
    S['lifebloom_2']['fucos_remains'] = 0; S['rejuvenation_germination']['totalCount'] = 0; S['rejuvenation_germination']['remains_min'] = 9999; S['rejuvenation_germination']['remains_min_unti'] =
    "none"
    S['rejuvenation_germination']['fucos_remains'] = 0; S['spring_blossoms']['totalCount'] = 0; S['spring_blossoms']['remains_min'] = 9999; S['spring_blossoms']['remains_min_unti'] =
    "none"
    S['spring_blossoms']['fucos_remains'] = 0; S['regrowth']['totalCount'] = 0; S['regrowth']['remains_min'] = 9999; S['regrowth']['remains_min_unti'] =
    "none"
    S['regrowth']['fucos_remains'] = 0; S['wild_growth']['totalCount'] = 0; S['wild_growth']['remains_min'] = 9999; S['wild_growth']['remains_min_unti'] =
    "none"
    S['wild_growth']['fucos_remains'] = 0; S['renewing_mist']['totalCount'] = 0; N['alive_players'] = 0
end; function addStateExt()
    local d1 = ThirkOnekey['Class']['specs'][0]
    d1:RegisterStateTable("find",
        setmetatable({},
            { __index = function(d2, d3)
                if d3 == "buff" then return S end; if d3 == "lowest_hp" then return N end; if d3 == "hurt_num" then return
                    J end; if d3 == "hurt_num_big" then return K end; if d3 == "needFocusHot" then return #C > 0 and C
                    [1] or "none" end; return false
            end }))
    d1:RegisterStateExpr("enable_health",
        function()
            local d4 = UnitGUID("focus") or UnitGUID("target") or "none1"
            local d5 = UnitGUID(N.unti) or "none2"
            return d4 == d5
        end)
    d1:RegisterStateExpr("enable_hot",
        function()
            if #C > 0 then
                local d6 = UnitGUID("focus") or UnitGUID("target") or "none2"
                local d7 = UnitGUID(C[1]) or "none2"
                return d6 == d7
            end; return false
        end)
    d1:RegisterStateExpr("alive_players", function() return N['alive_players'] end)
    d1:RegisterStateExpr("target_is_enemie", function() return UnitCanAttack("player", "target") end)
    d1:RegisterStateExpr("enemies_totalHP", function() return ThirkOnekey['enemiesTotalHP'] end)
    d1:RegisterStateExpr("damageSpell_mana", function() return M end)
    d1:RegisterStateExpr("needHealth", function() return N['unti'] ~= "none" end)
    d1:RegisterStateExpr("cooldown_on", function() return ThirkOnekey['DB']['profile']['toggles']['cooldowns']['value'] end)
    d1:RegisterStateExpr("essences_on", function() return ThirkOnekey['DB']['profile']['toggles']['essences']['value'] end)
    d1:RegisterAbility("empty_icon",
        { texture = 134400, name = "空白占位", listName = "|T136243:0|t |cff00ccff[空白占位]|r", cast = 0, cooldown = 0, gcd =
        "off" })
end; function NSLog(d8) print("|cffff0000" .. n .. ": |r" .. d8) end; _G['TroublemakerCore'] = H
