--[[
    ==============================================================================
    ECCO HUB V3 - AMBER ALERT 3.0 (1990 HOUSE & MALL)
    ==============================================================================
    Architecture : Modular Feature Pipeline & Real-Time ESP System
    UI Framework : Obsidian Reborn (deividcomsono/Obsidian)
    Branding     : Ecco Hub V3 Core
    Target Game  : Amber Alert 3.0 / 1990 House (PlaceId: 109324041251039)
    ==============================================================================
]]

-- Hot-Reload & Previous Instance Cleanup
if _G.AmberAlertSuiteUnload then
    pcall(_G.AmberAlertSuiteUnload)
end

pcall(function()
    for _, g in ipairs(game:GetService("CoreGui"):GetChildren()) do
        if g.Name == "Obsidian" then
            g:Destroy()
        end
    end
end)

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    task.wait(0.2)
    LocalPlayer = Players.LocalPlayer
end

-- Central State Configuration
local State = {
    AutoFarmApples = false,
    AutoSellApples = false,
    SellThreshold = 3,
    FarmMode = "Stealth",
    FarmDelay = 0.35,
    AutoBuyTrees = true,
    AutoBuyGarden = true,
    AutoBuyAppleUpgrades = false,
    AutoBuyWeapons = false,
    AutoBuyAmmo = false,

    AntiJumpscare = true,
    MonsterEvasion = false,
    EvasionDistance = 18,
    InfiniteStamina = true,
    NoFallDamage = true,
    AutoRevive = false,

    MonsterESP = true,
    PlayerESP = true,
    AppleESP = true,
    Fullbright = true,

    WalkSpeedMult = 1,
    Noclip = false,

    SafeAnchorCFrame = CFrame.new(-430, 68, 320)
}

-- Safe Remotes Resolution
local AmberAlertFolder = ReplicatedStorage:WaitForChild("AmberAlert", 10)
local RemotesModule = AmberAlertFolder and AmberAlertFolder:WaitForChild("Remotes", 10)
local Remotes = RemotesModule and require(RemotesModule)
local ConfigModule = AmberAlertFolder and AmberAlertFolder:WaitForChild("Config", 10)
local Config = ConfigModule and require(ConfigModule)

local function getRemote(name)
    if Remotes and Remotes.Get then
        local ok, rem = pcall(function() return Remotes.Get(name) end)
        if ok and rem then return rem end
    end
    if AmberAlertFolder then
        local remoteEvents = AmberAlertFolder:FindFirstChild("RemoteEvents")
        if remoteEvents and remoteEvents:FindFirstChild(name) then
            return remoteEvents[name]
        end
    end
    return ReplicatedStorage:FindFirstChild(name)
end

local ShopBuyRemote = getRemote("ShopBuy")
local GardenBuyRemote = getRemote("GardenBuy")
local UpgradeBuyRemote = getRemote("UpgradeBuy")
local JumpscareRemote = getRemote("Jumpscare")
local JumpscareCancelRemote = getRemote("JumpscareCancel")
local ChoreDishesDoneRemote = getRemote("ChoreDishesDone")

local TreePriceTable = (Config and Config.AppleTree and Config.AppleTree.PriceTable) or {
    0, 400, 1250, 2500, 5000, 7500, 10000, 13000, 16500, 20000
}

local GardenUpgradeList = {
    "Sprinklers", "Rake", "BiggerHarvest", "Greenhouse", "Compost", "PlantSeeds", "GoldenTouch"
}

local AppleUpgradeList = {
    "BloxyCola", "MedicBook", "GunSmith", "Boots"
}

-- Forward Declarations
local collectAvailableApples
local sellApplesRoutine
local processAutoPurchases
local applyFullbright
local cleanAllESP
local getRoot
local getHumanoid
local getCharacter

-- Character Helpers
function getCharacter()
    return LocalPlayer.Character
end

function getRoot()
    local char = getCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end

function getHumanoid()
    local char = getCharacter()
    return char and char:FindFirstChildOfClass("Humanoid")
end

-- ==============================================================================
-- LOAD OBSIDIAN REBORN UI FRAMEWORK
-- ==============================================================================
local oldGethui = gethui
getgenv().gethui = nil

local ObsidianRepo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(ObsidianRepo .. "Library.lua", true))()
Library.SetNotifySide = function() end
Library.AddDraggableMenu = function(self, name)
    local f = Instance.new("Frame")
    local c = Instance.new("Frame")
    c.Parent = f
    return f, c
end
local ThemeManager = loadstring(game:HttpGet(ObsidianRepo .. "addons/ThemeManager.lua", true))()
local SaveManager = loadstring(game:HttpGet(ObsidianRepo .. "addons/SaveManager.lua", true))()

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
    Title = "Ecco Hub V3 - Amber Alert 3.0",
    ShowCustomCursor = false
})

-- TAB 1: AUTO FARM & MONEY
local TabFarm = Window:AddTab("Auto Farm")
local LeftColFarm = TabFarm:AddLeftGroupbox("Apple Harvesting")
local RightColFarm = TabFarm:AddRightGroupbox("Auto Store & Upgrades")

LeftColFarm:AddToggle("AutoCollectApples", {
    Text = "Auto Collect Apples",
    Default = false,
    Tooltip = "Instantly gathers all spawned apples across trees and garden spots."
}):OnChanged(function(val)
    State.AutoFarmApples = val
end)

LeftColFarm:AddToggle("AutoSellApples", {
    Text = "Auto Sell Apples",
    Default = false,
    Tooltip = "Automatically sells gathered apples at the apple buyer stand during Day."
}):OnChanged(function(val)
    State.AutoSellApples = val
end)

LeftColFarm:AddDropdown("FarmMode", {
    Text = "Movement Mode",
    Values = { "Stealth", "AFK Anchor", "Legit Tween" },
    Default = 1,
    Multi = false,
    Tooltip = "Stealth snaps back to your spot; AFK Anchor stays on the safe roof."
}):OnChanged(function(val)
    State.FarmMode = val
end)

LeftColFarm:AddSlider("SellThreshold", {
    Text = "Sell Threshold (Apples)",
    Default = 3,
    Min = 1,
    Max = 15,
    Rounding = 0,
    Compact = false
}):OnChanged(function(val)
    State.SellThreshold = val
end)

LeftColFarm:AddSlider("FarmDelay", {
    Text = "Cycle Interval (Sec)",
    Default = 0.35,
    Min = 0.1,
    Max = 2.0,
    Rounding = 2,
    Compact = false
}):OnChanged(function(val)
    State.FarmDelay = val
end)

LeftColFarm:AddButton({
    Text = "Instant Harvest & Cashout",
    Func = function()
        if collectAvailableApples then collectAvailableApples() end
        if sellApplesRoutine then sellApplesRoutine() end
        Library:Notify("Harvest cycle executed!", 2)
    end
})

RightColFarm:AddToggle("AutoBuyTrees", {
    Text = "Auto Buy Apple Trees",
    Default = true,
    Tooltip = "Automatically purchases next apple tree when balance is sufficient."
}):OnChanged(function(val)
    State.AutoBuyTrees = val
end)

RightColFarm:AddToggle("AutoBuyGarden", {
    Text = "Auto Buy Garden Upgrades",
    Default = true,
    Tooltip = "Auto-levels Sprinklers, Rake, Bigger Harvest, Greenhouse, Compost."
}):OnChanged(function(val)
    State.AutoBuyGarden = val
end)

RightColFarm:AddToggle("AutoBuyAppleUpgrades", {
    Text = "Auto Buy Stat Upgrades",
    Default = false,
    Tooltip = "Auto-purchases Bloxy Cola, Boots, Medic Book, Gunsmith."
}):OnChanged(function(val)
    State.AutoBuyAppleUpgrades = val
end)

RightColFarm:AddToggle("AutoBuyWeapons", {
    Text = "Auto Buy Shotgun",
    Default = false,
    Tooltip = "Automatically purchases Shotgun & Double Shotgun when cash permits."
}):OnChanged(function(val)
    State.AutoBuyWeapons = val
end)

RightColFarm:AddToggle("AutoBuyAmmo", {
    Text = "Auto Buy Ammo",
    Default = false,
    Tooltip = "Automatically restocks Shotgun Shells and Regular Bullets."
}):OnChanged(function(val)
    State.AutoBuyAmmo = val
end)

-- TAB 2: VISUALS & ESP
local TabESP = Window:AddTab("Visuals")
local LeftColESP = TabESP:AddLeftGroupbox("ESP Sensors")
local RightColESP = TabESP:AddRightGroupbox("Environment Visuals")

LeftColESP:AddToggle("MonsterESP", {
    Text = "Monster ESP (Chams & Distance)",
    Default = true,
    Tooltip = "Highlights all active monsters through walls with distance trackers."
}):OnChanged(function(val)
    State.MonsterESP = val
end)

LeftColESP:AddToggle("AppleESP", {
    Text = "Apple ESP",
    Default = true,
    Tooltip = "Shows golden outlines and distance on all spawned CashApples."
}):OnChanged(function(val)
    State.AppleESP = val
end)

LeftColESP:AddToggle("PlayerESP", {
    Text = "Player & Downed ESP",
    Default = true,
    Tooltip = "Displays player health % and highlights downed players in orange."
}):OnChanged(function(val)
    State.PlayerESP = val
end)

RightColESP:AddToggle("Fullbright", {
    Text = "Fullbright (Clear Vision)",
    Default = true,
    Tooltip = "Eliminates pitch darkness and fog, allowing full map illumination."
}):OnChanged(function(val)
    State.Fullbright = val
    if applyFullbright then applyFullbright(val) end
end)

-- TAB 3: SURVIVAL & DEFENSE
local TabSurv = Window:AddTab("Survival")
local LeftColSurv = TabSurv:AddLeftGroupbox("Defensive Suite")
local RightColSurv = TabSurv:AddRightGroupbox("Movement & Utility")

LeftColSurv:AddToggle("AntiJumpscare", {
    Text = "Anti-Jumpscare Shield",
    Default = true,
    Tooltip = "Instantly cancels server jumpscares and destroys screamers."
}):OnChanged(function(val)
    State.AntiJumpscare = val
end)

LeftColSurv:AddToggle("MonsterEvasion", {
    Text = "Auto Monster Evasion",
    Default = false,
    Tooltip = "Emergency teleports you to the safe roof when a monster gets within range."
}):OnChanged(function(val)
    State.MonsterEvasion = val
end)

LeftColSurv:AddSlider("EvasionDistance", {
    Text = "Evasion Trigger Distance",
    Default = 18,
    Min = 8,
    Max = 35,
    Rounding = 0,
    Compact = false
}):OnChanged(function(val)
    State.EvasionDistance = val
end)

LeftColSurv:AddToggle("InfiniteStamina", {
    Text = "Infinite Stamina",
    Default = true,
    Tooltip = "Prevents stamina exhaustion, allowing permanent sprinting."
}):OnChanged(function(val)
    State.InfiniteStamina = val
end)

RightColSurv:AddToggle("Noclip", {
    Text = "Noclip (Walk Through Walls)",
    Default = false,
    Tooltip = "Disables collision on your character to walk through locked doors."
}):OnChanged(function(val)
    State.Noclip = val
end)

RightColSurv:AddSlider("WalkSpeedMult", {
    Text = "WalkSpeed Multiplier",
    Default = 1,
    Min = 1,
    Max = 3,
    Rounding = 1,
    Compact = false
}):OnChanged(function(val)
    State.WalkSpeedMult = val
end)

-- TAB 4: TELEPORTS
local TabTP = Window:AddTab("Teleports")
local ColTP = TabTP:AddLeftGroupbox("Map Anchors")

ColTP:AddButton({
    Text = "Teleport to Apple Buyer (Sell Stand)",
    Func = function()
        local root = getRoot()
        local sellPart = workspace:FindFirstChild("AppleSell", true)
        if root and sellPart then
            root.CFrame = sellPart.CFrame + Vector3.new(0, 2.5, 0)
            Library:Notify("Teleported to Apple Buyer!", 2)
        else
            Library:Notify("Apple Buyer not spawned yet (Shop Closed).", 2)
        end
    end
})

ColTP:AddButton({
    Text = "Teleport to Apple Trees Garden",
    Func = function()
        local root = getRoot()
        if root then
            root.CFrame = CFrame.new(-514.06, 20.28, 369.31)
            Library:Notify("Teleported to Apple Garden!", 2)
        end
    end
})

ColTP:AddButton({
    Text = "Teleport to Safe Roof (Anti-Monster)",
    Func = function()
        local root = getRoot()
        if root then
            root.CFrame = State.SafeAnchorCFrame
            Library:Notify("Teleported to Safe Roof!", 2)
        end
    end
})

ColTP:AddButton({
    Text = "Teleport to Attic",
    Func = function()
        local root = getRoot()
        if root then
            root.CFrame = CFrame.new(-427.16, 45.02, 319.77)
            Library:Notify("Teleported to Attic!", 2)
        end
    end
})

ColTP:AddButton({
    Text = "Teleport to Living Room",
    Func = function()
        local root = getRoot()
        if root then
            root.CFrame = CFrame.new(-455, 22, 335)
            Library:Notify("Teleported to Living Room!", 2)
        end
    end
})

-- TAB 5: SETTINGS & THEMES
local TabSettings = Window:AddTab("Settings")
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
ThemeManager:SetFolder("EccoHubV3")
SaveManager:SetFolder("EccoHubV3/AmberAlert")
SaveManager:BuildConfigSection(TabSettings)
ThemeManager:ApplyToTab(TabSettings)

getgenv().gethui = oldGethui

-- ==============================================================================
-- CORE LOGIC HOOKS & CONNECTIONS
-- ==============================================================================

local NoclipConnection
NoclipConnection = RunService.Stepped:Connect(function()
    if State.Noclip then
        local char = getCharacter()
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end
end)

local SpeedConnection
SpeedConnection = RunService.Heartbeat:Connect(function()
    if State.WalkSpeedMult > 1 then
        local hum = getHumanoid()
        if hum and hum.WalkSpeed < (16 * State.WalkSpeedMult) then
            hum.WalkSpeed = 16 * State.WalkSpeedMult
        end
    end
end)

local StaminaConnection
StaminaConnection = RunService.Heartbeat:Connect(function()
    if State.InfiniteStamina then
        local staminaVal = LocalPlayer:GetAttribute("Stamina") or LocalPlayer:GetAttribute("AA_Stamina")
        if staminaVal and staminaVal < 100 then
            pcall(function()
                LocalPlayer:SetAttribute("Stamina", 100)
                LocalPlayer:SetAttribute("AA_Stamina", 100)
            end)
        end
    end
end)

local JumpscareConnection
if JumpscareRemote then
    JumpscareConnection = JumpscareRemote.OnClientEvent:Connect(function()
        if State.AntiJumpscare then
            if JumpscareCancelRemote then
                JumpscareCancelRemote:FireServer()
            end
            local pg = LocalPlayer:FindFirstChild("PlayerGui")
            if pg then
                for _, g in ipairs(pg:GetChildren()) do
                    if g.Name:lower():find("jumpscare") or g.Name:lower():find("screamer") then
                        g:Destroy()
                    end
                end
            end
        end
    end)
end

-- ==============================================================================
-- ESP ENGINE
-- ==============================================================================
local safeParent = LocalPlayer:WaitForChild("PlayerGui")
local ESPFolder = safeParent:FindFirstChild("Ecco_ESP_Cache")
if not ESPFolder then
    ESPFolder = Instance.new("Folder")
    ESPFolder.Name = "Ecco_ESP_Cache"
    pcall(function() ESPFolder.Parent = safeParent end)
else
    ESPFolder:ClearAllChildren()
end

local ActiveHighlights = {}

local function createESP(target, color, text, isEntity)
    if not target or not target.Parent then return end
    local tag = target:GetDebugId()
    if ActiveHighlights[tag] then return end

    local hl = Instance.new("Highlight")
    hl.Adornee = target
    hl.FillColor = color
    hl.FillTransparency = 0.5
    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
    hl.OutlineTransparency = 0.1
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = ESPFolder

    local adornPart = target:IsA("BasePart") and target or target:FindFirstChildWhichIsA("BasePart")
    local bb = nil
    if adornPart then
        bb = Instance.new("BillboardGui")
        bb.Adornee = adornPart
        bb.Size = UDim2.new(0, 140, 0, 30)
        bb.StudsOffset = Vector3.new(0, isEntity and 2.8 or 1.2, 0)
        bb.AlwaysOnTop = true
        bb.Parent = ESPFolder

        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, 0, 1, 0)
        lbl.BackgroundTransparency = 1
        lbl.TextColor3 = color
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 13
        lbl.TextStrokeTransparency = 0.2
        lbl.TextStrokeColor3 = Color3.new(0, 0, 0)
        lbl.Text = text
        lbl.Parent = bb
    end

    ActiveHighlights[tag] = {
        Highlight = hl,
        Billboard = bb,
        Label = bb and bb:FindFirstChildOfClass("TextLabel"),
        Target = target
    }
end

local function cleanESP(tag)
    if ActiveHighlights[tag] then
        pcall(function()
            if ActiveHighlights[tag].Highlight then ActiveHighlights[tag].Highlight:Destroy() end
            if ActiveHighlights[tag].Billboard then ActiveHighlights[tag].Billboard:Destroy() end
        end)
        ActiveHighlights[tag] = nil
    end
end

function cleanAllESP()
    for tag, _ in pairs(ActiveHighlights) do
        cleanESP(tag)
    end
end

local Running = true

task.spawn(function()
    while Running do
        task.wait(0.35)
        local root = getRoot()
        local rootPos = root and root.Position

        -- 1. Monster ESP
        if State.MonsterESP then
            local activeMonsters = workspace:FindFirstChild("ActiveMonsters")
            local list = activeMonsters and activeMonsters:GetChildren() or {}
            for _, mon in ipairs(list) do
                if mon and mon.Parent then
                    local tag = mon:GetDebugId()
                    local monRoot = mon:FindFirstChild("HumanoidRootPart") or mon:FindFirstChildWhichIsA("BasePart")
                    local dist = (monRoot and rootPos) and math.floor((monRoot.Position - rootPos).Magnitude) or 0
                    local text = mon.Name .. " [" .. dist .. "m]"

                    if not ActiveHighlights[tag] then
                        createESP(mon, Color3.fromRGB(255, 45, 45), text, true)
                    else
                        local data = ActiveHighlights[tag]
                        if data and data.Label then
                            data.Label.Text = text
                        end
                    end
                end
            end
        else
            for tag, data in pairs(ActiveHighlights) do
                if data.Target and data.Target:IsA("Model") and data.Target.Parent and data.Target.Parent.Name == "ActiveMonsters" then
                    cleanESP(tag)
                end
            end
        end

        -- 2. Apple ESP
        if State.AppleESP then
            for _, inst in ipairs(workspace:GetDescendants()) do
                if inst.Name == "CashApple" and inst:IsA("BasePart") and inst.Parent then
                    local tag = inst:GetDebugId()
                    local dist = rootPos and math.floor((inst.Position - rootPos).Magnitude) or 0

                    if not ActiveHighlights[tag] then
                        createESP(inst, Color3.fromRGB(255, 215, 0), "Apple [" .. dist .. "m]", false)
                    else
                        local data = ActiveHighlights[tag]
                        if data and data.Label then
                            data.Label.Text = "Apple [" .. dist .. "m]"
                        end
                    end
                end
            end
        else
            for tag, data in pairs(ActiveHighlights) do
                if data.Target and data.Target.Name == "CashApple" then
                    cleanESP(tag)
                end
            end
        end

        -- 3. Player ESP
        if State.PlayerESP then
            for _, plr in ipairs(Players:GetPlayers()) do
                local char = plr ~= LocalPlayer and plr.Character
                if char and char.Parent then
                    local pRoot = char:FindFirstChild("HumanoidRootPart")
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    local tag = char:GetDebugId()
                    local dist = (pRoot and rootPos) and math.floor((pRoot.Position - rootPos).Magnitude) or 0
                    local isDowned = char:GetAttribute("AA_Downed") or false
                    local text = plr.DisplayName .. (isDowned and " [DOWNED!]" or " [" .. math.floor(hum and hum.Health or 100) .. "%]")
                    local col = isDowned and Color3.fromRGB(255, 120, 0) or Color3.fromRGB(80, 255, 140)

                    if not ActiveHighlights[tag] then
                        createESP(char, col, text, true)
                    else
                        local data = ActiveHighlights[tag]
                        if data and data.Label then
                            data.Label.Text = text
                            data.Label.TextColor3 = col
                        end
                    end
                end
            end
        else
            for tag, data in pairs(ActiveHighlights) do
                if data.Target and Players:GetPlayerFromCharacter(data.Target) then
                    cleanESP(tag)
                end
            end
        end

        -- Clean up dead ESP entries
        for tag, data in pairs(ActiveHighlights) do
            if not data.Target or not data.Target.Parent then
                cleanESP(tag)
            end
        end
    end
end)

-- Fullbright Cycle
local OriginalLighting = {
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    Brightness = Lighting.Brightness,
    FogEnd = Lighting.FogEnd
}

function applyFullbright(enabled)
    if enabled then
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        Lighting.Brightness = 2
        Lighting.FogEnd = 100000
    else
        Lighting.Ambient = OriginalLighting.Ambient
        Lighting.OutdoorAmbient = OriginalLighting.OutdoorAmbient
        Lighting.Brightness = OriginalLighting.Brightness
        Lighting.FogEnd = OriginalLighting.FogEnd
    end
end

-- ==============================================================================
-- AUTOMATED FARM & PROGRESSION ENGINE
-- ==============================================================================

function collectAvailableApples()
    local root = getRoot()
    if not root then return end

    local apples = {}
    for _, inst in ipairs(workspace:GetDescendants()) do
        if inst.Name == "CashApple" and inst:IsA("BasePart") then
            local prompt = inst:FindFirstChildWhichIsA("ProximityPrompt")
            if prompt then
                table.insert(apples, {Part = inst, Prompt = prompt})
            end
        end
    end

    if #apples == 0 then return end

    local originCFrame = root.CFrame

    for _, apple in ipairs(apples) do
        if not State.AutoFarmApples then break end
        if apple.Part and apple.Part.Parent and apple.Prompt and apple.Prompt.Parent then
            if State.FarmMode == "Stealth" then
                root.CFrame = apple.Part.CFrame + Vector3.new(0, 1.5, 0)
                task.wait(0.1)
                apple.Prompt.HoldDuration = 0
                fireproximityprompt(apple.Prompt)
                task.wait(0.12)
            elseif State.FarmMode == "AFK Anchor" then
                root.CFrame = apple.Part.CFrame + Vector3.new(0, 1.5, 0)
                task.wait(0.12)
                apple.Prompt.HoldDuration = 0
                fireproximityprompt(apple.Prompt)
                task.wait(0.1)
            elseif State.FarmMode == "Legit Tween" then
                local tween = TweenService:Create(root, TweenInfo.new(0.6, Enum.EasingStyle.Linear), {
                    CFrame = apple.Part.CFrame + Vector3.new(0, 1.5, 0)
                })
                tween:Play()
                tween.Completed:Wait()
                apple.Prompt.HoldDuration = 0
                fireproximityprompt(apple.Prompt)
                task.wait(0.15)
            end
        end
    end

    if State.FarmMode == "Stealth" then
        root.CFrame = originCFrame
    elseif State.FarmMode == "AFK Anchor" then
        root.CFrame = State.SafeAnchorCFrame
    end
end

function sellApplesRoutine()
    local root = getRoot()
    if not root then return end

    local currentApples = LocalPlayer:GetAttribute("Apples") or 0
    if currentApples < State.SellThreshold then return end

    local sellPart = workspace:FindFirstChild("AppleSell", true)
    if not sellPart then return end

    local prompt = sellPart:FindFirstChildWhichIsA("ProximityPrompt")
    if not prompt then return end

    local originCFrame = root.CFrame

    root.CFrame = sellPart.CFrame + Vector3.new(0, 2, 0)
    task.wait(0.18)
    prompt.HoldDuration = 0
    fireproximityprompt(prompt)
    task.wait(0.25)

    if State.FarmMode == "Stealth" then
        root.CFrame = originCFrame
    elseif State.FarmMode == "AFK Anchor" then
        root.CFrame = State.SafeAnchorCFrame
    end
end

function processAutoPurchases()
    local cash = LocalPlayer:GetAttribute("Cash") or 0

    if State.AutoBuyTrees and ShopBuyRemote then
        local bought = workspace:GetAttribute("AA_AppleTreesBought") or 0
        local nextPrice = TreePriceTable[bought + 1]
        if nextPrice and cash >= nextPrice and bought < 10 then
            ShopBuyRemote:FireServer("AppleTree")
            task.wait(0.3)
        end
    end

    if State.AutoBuyGarden and GardenBuyRemote then
        for _, upg in ipairs(GardenUpgradeList) do
            GardenBuyRemote:FireServer(upg)
            task.wait(0.1)
        end
    end

    if State.AutoBuyAppleUpgrades and UpgradeBuyRemote then
        for _, upg in ipairs(AppleUpgradeList) do
            UpgradeBuyRemote:FireServer(upg)
            task.wait(0.1)
        end
    end

    if State.AutoBuyWeapons and ShopBuyRemote then
        if cash >= 2700 then
            ShopBuyRemote:FireServer("Shotgun")
        elseif cash >= 500 then
            ShopBuyRemote:FireServer("DoubleShotgun")
        end
    end

    if State.AutoBuyAmmo and ShopBuyRemote then
        if cash >= 600 then
            ShopBuyRemote:FireServer("ShotgunShells")
        end
        if cash >= 260 then
            ShopBuyRemote:FireServer("AmmoRegular")
        end
    end
end

local function checkMonsterEvasion()
    if not State.MonsterEvasion then return end
    local root = getRoot()
    if not root then return end

    local activeMonsters = workspace:FindFirstChild("ActiveMonsters")
    local list = activeMonsters and activeMonsters:GetChildren() or {}
    for _, m in ipairs(list) do
        local mRoot = m:FindFirstChild("HumanoidRootPart") or m:FindFirstChildWhichIsA("BasePart")
        if mRoot then
            local dist = (mRoot.Position - root.Position).Magnitude
            if dist <= State.EvasionDistance then
                root.CFrame = State.SafeAnchorCFrame
                Library:Notify("Monster within " .. math.floor(dist) .. " studs! Evasion triggered.", 3)
                task.wait(1.5)
                break
            end
        end
    end
end

task.spawn(function()
    while Running do
        task.wait(State.FarmDelay)
        pcall(checkMonsterEvasion)
        if State.AutoFarmApples then
            pcall(collectAvailableApples)
        end
        if State.AutoSellApples then
            pcall(sellApplesRoutine)
        end
        pcall(processAutoPurchases)
    end
end)

-- Clean Unload Hook
local function unloadSuite()
    Running = false
    if NoclipConnection then NoclipConnection:Disconnect() end
    if SpeedConnection then SpeedConnection:Disconnect() end
    if StaminaConnection then StaminaConnection:Disconnect() end
    if JumpscareConnection then JumpscareConnection:Disconnect() end
    cleanAllESP()
    applyFullbright(false)
    pcall(function() Library:Unload() end)
    pcall(function() if Library.ScreenGui then Library.ScreenGui:Destroy() end end)
    _G.AmberAlertSuiteUnload = nil
end

Library:OnUnload(unloadSuite)
_G.AmberAlertSuiteUnload = unloadSuite

-- Initialize Fullbright default
applyFullbright(true)

Library:Notify("Ecco Hub V3 loaded successfully with Obsidian Reborn!", 4)
