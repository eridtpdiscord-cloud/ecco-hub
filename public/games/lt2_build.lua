--[[
    ========================================================================
    AXIOM // LUMBER TYCOON 2 MINIMALIST SIDEBAR BUILD & AUTO-FILL SUITE — V5
    - Minimalist Glassmorphic Sidebar Layout (Side of Screen, Zero Clutter)
    - Toggleable Collapse / Expand (No Intrusive Keybinds)
    - Toggleable Height Offset Feature (ON / OFF + Precision Stepper)
    - Stabilized Placement Raycasting (Zero Blueprint Overlay Glitching / Strobing)
    - Multi-Structure Matrix Painter (Floors, Walls, Ramps, Stairs, House, Text Art)
    - Resizable Dimensions: Length (X), Width (Z), Height (Y)
    - Auto-Fill Blueprint Engine with Wood Type Dropdown (Golden Spruce Default)
    - Rate-Limited Matrix Network Queue (0.52s safe pacing)
    - Anti-Glare Blueprint Drawer with Dimmed Translucent Backdrop
    ========================================================================
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Global Cleanup Handler
if getgenv().EccoBuildSuite_Cleanup then
    pcall(getgenv().EccoBuildSuite_Cleanup)
end

-- Master State Configuration
local Config = {
    Enabled = true,
    GridSnap = 0,               -- 0 = Free / Smooth, 0.1, 0.5, 1, 2, 4
    RotationStep = 15,          -- 1, 5, 15, 45, 90
    FreeRotation = true,
    SmoothGlide = true,         -- Buttery smooth motion interpolation
    SmoothSpeed = 0.35,         -- Lerp alpha
    HeightEnabled = false,      -- TOGGLEABLE HEIGHT FEATURE (Default: OFF)
    HeightOffset = 0,           -- Studs offset when enabled (-20 to +50)
    ContinuousPlace = true,     -- Auto re-trigger next blueprint
    BypassCollision = true,     -- Clip through tight spots & boundary checks
    CurrentBlueprint = nil,
    IsPlacing = false,

    -- Multi-Structure Matrix Settings
    AutoMatrix = false,
    MatrixTemplate = "Floors",  -- "Floors", "Walls", "Ramps", "Stairs", "House", "Text Art"
    MatrixStructure = "Floor1Large",
    MatrixLength = 3,           -- X count (1 to 16)
    MatrixWidth = 3,            -- Z count (1 to 16)
    MatrixHeight = 1,           -- Y layers (1 to 6)
    MatrixAnchor = "Corner",    -- "Corner" or "Center"
    RateLimitDelay = 0.52,      -- Enforced server remote pacing
    IsMatrixPlacing = false,

    -- Auto-Fill Blueprint Settings
    AutoFillEnabled = false,    -- Toggleable auto-fill on placement
    SelectedWoodType = "GoldSwampy", -- Golden Spruce / GoldSwampy by default!
    IsFilling = false,
}

getgenv().BuildMode_Config = Config
getgenv().BuildMode_NoGrid = (Config.GridSnap == 0)
getgenv().BuildMode_FreeRotation = Config.FreeRotation
getgenv().BuildMode_CustomRotation = true
getgenv().BuildMode_RotationStep = Config.RotationStep
getgenv().BuildMode_BypassCollision = Config.BypassCollision

-- Game Remotes & Dragger Instances
local draggerGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("StructureDraggingGUI")
local dragItem = draggerGui:WaitForChild("DragItem")
local placeStructureRemote = ReplicatedStorage:WaitForChild("PlaceStructure"):WaitForChild("ClientPlacedBlueprint")
local canPlaceMod = require(ReplicatedStorage:WaitForChild("Interaction"):WaitForChild("CanPlace"))
local clientIsDraggingRemote = ReplicatedStorage:WaitForChild("Interaction"):WaitForChild("ClientIsDragging")

-- Find closures in GC
local targetRoundCFrame, targetSnapAngle, targetRotateTurn, targetOnInvoke
for _, v in pairs(getgc(false)) do
    if type(v) == "function" and islclosure(v) then
        local src = debug.info(v, "s")
        if src and src:find("StructureDragger") then
            local n = debug.info(v, "n")
            if n == "roundCFrame" then
                targetRoundCFrame = v
            elseif n == "snapAngleToNearestOrthogonal" then
                targetSnapAngle = v
            elseif n == "rotateTurn" then
                targetRotateTurn = v
            elseif n == "OnInvoke" then
                targetOnInvoke = v
            end
        end
    end
end

-- Land Boundary Matcher
local function getMatchingLandOwner(pos)
    local lands = canPlaceMod:GetPlayerLand(LocalPlayer, {"PlaceStructure", "MoveStructure", "Destroy"})
    if not lands or #lands == 0 then return nil end
    for _, l in ipairs(lands) do
        if l.minBounds.X <= pos.X and pos.X <= l.maxBounds.X
           and l.minBounds.Z <= pos.Z and pos.Z <= l.maxBounds.Z
           and l.minBounds.Y <= pos.Y then
            return l.owner
        end
    end
    return lands[1].owner
end

-- Calibrated Non-Trippy Ghost Grid
local ghostFolder = Instance.new("Folder")
ghostFolder.Name = "EccoFloorGhostGrid"
ghostFolder.Parent = workspace:FindFirstChild("Effects") or workspace

local activeGhostParts = {}
local function clearGhostParts()
    for _, p in ipairs(activeGhostParts) do
        if p and p.Parent then p:Destroy() end
    end
    activeGhostParts = {}
end

local function updateGhostGrid(primaryCF, tileSize)
    if not Config.AutoMatrix or (Config.MatrixLength <= 1 and Config.MatrixWidth <= 1 and Config.MatrixHeight <= 1) then
        clearGhostParts()
        return
    end

    local neededCount = (Config.MatrixLength * Config.MatrixWidth * Config.MatrixHeight) - 1
    while #activeGhostParts < neededCount do
        local gp = Instance.new("Part")
        gp.Name = "GhostTile"
        gp.Anchored = true
        gp.CanCollide = false
        gp.CanTouch = false
        gp.CanQuery = false
        gp.CastShadow = false
        gp.Material = Enum.Material.SmoothPlastic
        gp.Color = Color3.fromRGB(0, 160, 245)
        gp.Transparency = 0.58
        gp.Parent = ghostFolder

        local sb = Instance.new("SelectionBox")
        sb.Adornee = gp
        sb.Color3 = Color3.fromRGB(0, 210, 255)
        sb.Transparency = 0.65
        sb.Parent = gp

        table.insert(activeGhostParts, gp)
    end
    while #activeGhostParts > neededCount do
        local p = table.remove(activeGhostParts)
        if p and p.Parent then p:Destroy() end
    end

    local idx = 1
    for gy = 0, Config.MatrixHeight - 1 do
        for gx = 0, Config.MatrixLength - 1 do
            for gz = 0, Config.MatrixWidth - 1 do
                if not (gx == 0 and gz == 0 and gy == 0) then
                    local offsetX = gx * tileSize.X
                    local offsetY = gy * tileSize.Y
                    local offsetZ = gz * tileSize.Z
                    if Config.MatrixAnchor == "Center" then
                        offsetX = (gx - (Config.MatrixLength - 1) / 2) * tileSize.X
                        offsetZ = (gz - (Config.MatrixWidth - 1) / 2) * tileSize.Z
                    end

                    local targetTileCF = primaryCF * CFrame.new(offsetX, offsetY, offsetZ)
                    local gp = activeGhostParts[idx]
                    if gp then
                        gp.Size = tileSize
                        gp.CFrame = targetTileCF
                        idx = idx + 1
                    end
                end
            end
        end
    end
end

-- Stabilized Raycast & Motion Interpolation State
local currentSmoothedCF = nil
local lastTargetCF = nil
local currentPlacingSize = Vector3.new(8, 0.2, 8)

local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude

-- Forward declarations for HUD Banners
local updateMatrixProgressBanner, hideMatrixProgressBanner

-- Hook 1: roundCFrame (Precision Snapping & Anti-Glitch Placement Lock)
if targetRoundCFrame and not getgenv()._Hooked_roundCFrame_V5 then
    local oldRound
    oldRound = hookfunction(targetRoundCFrame, function(a1, a2, a3)
        if not Config.Enabled then
            return oldRound(a1, a2, a3)
        end

        local isConfirming = false
        if targetOnInvoke then
            local uvs = getupvalues(targetOnInvoke)
            if uvs and uvs[2] == "Confirm placement" then
                isConfirming = true
            end
        end

        if a3 and a3.Size then
            currentPlacingSize = a3.Size
        end

        -- Make placing model parts completely uncollidable & unqueryable to eliminate jitter
        if a2 and a2:IsA("Model") then
            for _, p in ipairs(a2:GetDescendants()) do
                if p:IsA("BasePart") then
                    p.CanCollide = false
                    p.CanTouch = false
                    p.CanQuery = false
                end
            end
        end

        local mousePos = UserInputService:GetMouseLocation()
        local ray = Camera:ViewportPointToRay(mousePos.X, mousePos.Y)
        rayParams.FilterDescendantsInstances = {
            LocalPlayer.Character,
            workspace:FindFirstChild("Effects"),
            ghostFolder,
            a2
        }
        local hit = workspace:Raycast(ray.Origin, ray.Direction * 750, rayParams)

        local basePos
        local partHeight = (a3 and a3.Size and a3.Size.Y) or 0.2
        local effectiveHeightOffset = Config.HeightEnabled and Config.HeightOffset or 0

        if hit then
            local norm = hit.Normal
            if norm.Y > 0.35 then
                basePos = hit.Position + Vector3.new(0, (partHeight / 2) + effectiveHeightOffset, 0)
            elseif norm.Y < -0.35 then
                basePos = hit.Position - Vector3.new(0, (partHeight / 2) + effectiveHeightOffset, 0)
            else
                local partDepth = (a3 and a3.Size and a3.Size.Z) or 2
                basePos = hit.Position + (norm * (partDepth / 2)) + Vector3.new(0, effectiveHeightOffset, 0)
            end
        else
            basePos = a1.Position + Vector3.new(0, effectiveHeightOffset, 0)
        end

        -- Grid Snapping
        if Config.GridSnap > 0 then
            local s = Config.GridSnap
            basePos = Vector3.new(
                math.floor(basePos.X / s + 0.5) * s,
                math.floor(basePos.Y / 0.25 + 0.5) * 0.25,
                math.floor(basePos.Z / s + 0.5) * s
            )
        end

        -- Rotation Step
        local rawRot = a1 - a1.Position
        local targetRot = rawRot
        if not Config.FreeRotation and Config.RotationStep and Config.RotationStep > 0 then
            local rx, ry, rz = rawRot:ToOrientation()
            local stepRad = math.rad(Config.RotationStep)
            ry = math.floor(ry / stepRad + 0.5) * stepRad
            targetRot = CFrame.fromOrientation(rx, ry, rz)
        end

        local targetCF = CFrame.new(basePos) * targetRot
        lastTargetCF = targetCF

        -- Exact lock on placement click
        if isConfirming then
            currentSmoothedCF = nil
            clearGhostParts()
            return targetCF
        end

        -- Update Ghost Preview
        if Config.AutoMatrix then
            updateGhostGrid(targetCF, currentPlacingSize)
        else
            clearGhostParts()
        end

        -- Smooth Glide
        if Config.SmoothGlide then
            if not currentSmoothedCF or (currentSmoothedCF.Position - targetCF.Position).Magnitude > 35 then
                currentSmoothedCF = targetCF
            else
                currentSmoothedCF = currentSmoothedCF:Lerp(targetCF, Config.SmoothSpeed or 0.35)
            end
            return currentSmoothedCF
        else
            currentSmoothedCF = targetCF
            return targetCF
        end
    end)
    getgenv()._Hooked_roundCFrame_V5 = true
end

-- Hook 2: snapAngleToNearestOrthogonal
if targetSnapAngle and not getgenv()._Hooked_snapAngle_V5 then
    local oldSnap
    oldSnap = hookfunction(targetSnapAngle, function(cf)
        if Config.Enabled and Config.FreeRotation then
            return cf - cf.Position
        end
        return oldSnap(cf)
    end)
    getgenv()._Hooked_snapAngle_V5 = true
end

-- Hook 3: rotateTurn
if targetRotateTurn and not getgenv()._Hooked_rotateTurn_V5 then
    local oldRotate
    oldRotate = hookfunction(targetRotateTurn, function(a1, a2, a3)
        if Config.Enabled and Config.RotationStep then
            local stepRad = math.rad(Config.RotationStep)
            local uvs = getupvalues(targetRotateTurn)
            local u2 = uvs[6]
            if typeof(u2) == "CFrame" then
                if a2 ~= 0 then
                    u2 = CFrame.Angles(0, 0, stepRad * a2) * u2
                end
                if a1 ~= 0 then
                    u2 = CFrame.Angles(0, stepRad * a1, 0) * u2
                end
                setupvalue(targetRotateTurn, 6, u2)
                setupvalue(targetRotateTurn, 7, true)
                return
            end
        end
        return oldRotate(a1, a2, a3)
    end)
    getgenv()._Hooked_rotateTurn_V5 = true
end

-- Hook 4: CanPlace (No Flickering Overlay)
if canPlaceMod and not getgenv()._Hooked_CanPlace_V5 then
    local oldCanPlace = canPlaceMod.CanPlace
    canPlaceMod.CanPlace = function(self, player, target, options)
        local can, owner = oldCanPlace(self, player, target, options)
        if Config.Enabled and Config.BypassCollision and not can then
            local lands = options and options.Land or canPlaceMod:GetPlayerLand(player, {"PlaceStructure", "MoveStructure", "Destroy"})
            if lands and #lands > 0 then
                return true, lands[1].owner
            end
        end
        return can, owner
    end
    getgenv()._Hooked_CanPlace_V5 = true
end

-- ========================================================================
-- RATE-LIMITED MULTI-STRUCTURE MATRIX PLACER LOOP
-- Supports Length (X), Width (Z), and Height (Y) Layers
-- ========================================================================
local function spawnMatrixPlacements(bpName, primaryCF, tileSize, primaryLand)
    if not Config.AutoMatrix or (Config.MatrixLength <= 1 and Config.MatrixWidth <= 1 and Config.MatrixHeight <= 1) then
        return
    end

    if Config.IsMatrixPlacing then return end
    Config.IsMatrixPlacing = true

    task.spawn(function()
        local totalTiles = Config.MatrixLength * Config.MatrixWidth * Config.MatrixHeight
        local placedCount = 1

        if updateMatrixProgressBanner then
            updateMatrixProgressBanner(placedCount, totalTiles, bpName)
        end

        for gy = 0, Config.MatrixHeight - 1 do
            for gx = 0, Config.MatrixLength - 1 do
                for gz = 0, Config.MatrixWidth - 1 do
                    if not (gx == 0 and gz == 0 and gy == 0) then
                        local offsetX = gx * tileSize.X
                        local offsetY = gy * tileSize.Y
                        local offsetZ = gz * tileSize.Z
                        if Config.MatrixAnchor == "Center" then
                            offsetX = (gx - (Config.MatrixLength - 1) / 2) * tileSize.X
                            offsetZ = (gz - (Config.MatrixWidth - 1) / 2) * tileSize.Z
                        end

                        local tileCF = primaryCF * CFrame.new(offsetX, offsetY, offsetZ)
                        local matchedOwner = getMatchingLandOwner(tileCF.Position) or primaryLand

                        task.wait(Config.RateLimitDelay or 0.52)
                        placeStructureRemote:FireServer(bpName, tileCF, matchedOwner)
                        placedCount = placedCount + 1

                        if updateMatrixProgressBanner then
                            updateMatrixProgressBanner(placedCount, totalTiles, bpName)
                        end
                    end
                end
            end
        end

        Config.IsMatrixPlacing = false

        task.wait(0.8)
        if hideMatrixProgressBanner then hideMatrixProgressBanner() end

        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Matrix Complete",
            Text = "Deployed " .. tostring(placedCount) .. "x " .. bpName .. " structures!",
            Duration = 3.5
        })
    end)
end

-- Forward declaration
local startPlacingBlueprint

startPlacingBlueprint = function(bpName)
    Config.CurrentBlueprint = bpName
    task.spawn(function()
        local itemInfo = ReplicatedStorage.ClientItemInfo:FindFirstChild(bpName)
        if not itemInfo then return end

        local model = (itemInfo:FindFirstChild("PlacingModel") and itemInfo.PlacingModel:Clone()) or (itemInfo:FindFirstChild("Model") and itemInfo.Model:Clone())
        if not model then return end

        local mainPart = model:FindFirstChild("Main") or model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
        local tileSize = (mainPart and mainPart.Size) or model:GetExtentsSize()
        currentPlacingSize = tileSize

        Config.IsPlacing = true
        currentSmoothedCF = nil
        local placedCF, landRef = dragItem:Invoke(model, nil, function() return true end, true)
        Config.IsPlacing = false
        clearGhostParts()

        if placedCF and landRef then
            placeStructureRemote:FireServer(bpName, placedCF, landRef)

            if Config.AutoMatrix then
                spawnMatrixPlacements(bpName, placedCF, tileSize, landRef)
            end

            if Config.ContinuousPlace and Config.Enabled then
                task.wait(0.04)
                startPlacingBlueprint(bpName)
            end
        end
    end)
end

-- ========================================================================
-- AUTO-FILL BLUEPRINT ENGINE
-- Fills placed blueprints using player's planks with chosen wood type
-- ========================================================================
local function fillBlueprintWithPlanks(targetBP, woodTypeFilter)
    local pm = workspace:FindFirstChild("PlayerModels")
    if not pm or not targetBP or not targetBP:FindFirstChild("BuildDependentWood") then
        return false
    end

    local bdw = targetBP.BuildDependentWood
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return false end

    -- Find matching plank owned by player
    local chosenPlank = nil
    for _, c in ipairs(pm:GetChildren()) do
        if c.Name == "Plank" and c:FindFirstChild("WoodSection") and c:FindFirstChild("Owner") and c.Owner.Value == LocalPlayer then
            local tc = c:FindFirstChild("TreeClass") and c.TreeClass.Value
            if not woodTypeFilter or woodTypeFilter == "Any" or tc == woodTypeFilter then
                chosenPlank = c
                break
            end
        end
    end

    if not chosenPlank then
        return false, "No matching planks found for " .. tostring(woodTypeFilter)
    end

    local ws = chosenPlank.WoodSection
    clientIsDraggingRemote:FireServer(chosenPlank)
    clientIsDraggingRemote:FireServer(ws)

    -- Move character close to establish physical replication
    local prevCF = root.CFrame
    root.CFrame = bdw.CFrame * CFrame.new(0, 1.5, 3)
    task.wait(0.08)

    -- Teleport plank into BuildDependentWood bounding volume
    ws.CanCollide = false
    ws.CFrame = bdw.CFrame
    ws.Velocity = Vector3.new(0, -1, 0)

    -- Fire physical touch interest
    firetouchinterest(bdw, ws, 0)
    firetouchinterest(ws, bdw, 0)
    task.wait(0.05)
    firetouchinterest(bdw, ws, 1)
    firetouchinterest(ws, bdw, 1)

    task.wait(0.15)
    root.CFrame = prevCF
    return true
end

local function fillAllBlueprints(woodTypeFilter)
    if Config.IsFilling then return end
    Config.IsFilling = true

    task.spawn(function()
        local pm = workspace:FindFirstChild("PlayerModels")
        if not pm then
            Config.IsFilling = false
            return
        end

        local bpList = {}
        for _, c in ipairs(pm:GetChildren()) do
            if c:FindFirstChild("Type") and c.Type.Value == "Blueprint" and c:FindFirstChild("BuildDependentWood") and c:FindFirstChild("Owner") and c.Owner.Value == LocalPlayer then
                table.insert(bpList, c)
            end
        end

        if #bpList == 0 then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Auto-Fill Engine",
                Text = "No 0% blueprints detected on plot!",
                Duration = 3
            })
            Config.IsFilling = false
            return
        end

        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Auto-Fill Engine",
            Text = string.format("Filling %d blueprints with %s...", #bpList, woodTypeFilter or "GoldSwampy"),
            Duration = 3.5
        })

        local filledCount = 0
        for i, bp in ipairs(bpList) do
            local ok = fillBlueprintWithPlanks(bp, woodTypeFilter)
            if ok then
                filledCount = filledCount + 1
            end
            task.wait(0.35)
        end

        Config.IsFilling = false
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Auto-Fill Complete",
            Text = string.format("Processed %d / %d blueprints!", filledCount, #bpList),
            Duration = 4
        })
    end)
end

-- ========================================================================
-- MINIMALIST SIDEBAR UI (SIDE OF SCREEN, CLEAN GLASSMORPHISM)
-- ========================================================================
local pgui = LocalPlayer:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EccoBuildSuiteV5"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    if gethui then screenGui.Parent = gethui() else screenGui.Parent = pgui end
end)

-- Translucent Anti-Glare Backdrop (Only visible when modals open)
local backdrop = Instance.new("TextButton")
backdrop.Name = "TranslucentBackdrop"
backdrop.Size = UDim2.new(1, 0, 1, 0)
backdrop.BackgroundColor3 = Color3.fromRGB(6, 8, 12)
backdrop.BackgroundTransparency = 0.45
backdrop.Text = ""
backdrop.AutoButtonColor = false
backdrop.Visible = false
backdrop.ZIndex = 20
backdrop.Parent = screenGui

-- Minimalist Floating Toggle Tab (Docked to screen side when collapsed)
local toggleTab = Instance.new("TextButton")
toggleTab.Name = "SidebarToggleTab"
toggleTab.Size = UDim2.new(0, 36, 0, 36)
toggleTab.Position = UDim2.new(1, -44, 0.45, 0)
toggleTab.BackgroundColor3 = Color3.fromRGB(14, 18, 26)
toggleTab.Text = "📐"
toggleTab.TextColor3 = Color3.fromRGB(0, 230, 150)
toggleTab.Font = Enum.Font.GothamBold
toggleTab.TextSize = 16
toggleTab.ZIndex = 90
toggleTab.Parent = screenGui
local ttCorner = Instance.new("UICorner")
ttCorner.CornerRadius = UDim.new(0, 8)
ttCorner.Parent = toggleTab
local ttStroke = Instance.new("UIStroke")
ttStroke.Color = Color3.fromRGB(0, 210, 140)
ttStroke.Thickness = 1.2
ttStroke.Parent = toggleTab

-- Main Sidebar Panel
local sidebar = Instance.new("Frame")
sidebar.Name = "MainSidebar"
sidebar.Size = UDim2.new(0, 240, 0, 520)
sidebar.Position = UDim2.new(1, -252, 0.5, -260)
sidebar.BackgroundColor3 = Color3.fromRGB(13, 16, 23)
sidebar.BackgroundTransparency = 0.12
sidebar.BorderSizePixel = 0
sidebar.ZIndex = 50
sidebar.Parent = screenGui

local sbCorner = Instance.new("UICorner")
sbCorner.CornerRadius = UDim.new(0, 10)
sbCorner.Parent = sidebar

local sbStroke = Instance.new("UIStroke")
sbStroke.Color = Color3.fromRGB(0, 210, 140)
sbStroke.Thickness = 1.2
sbStroke.Transparency = 0.3
sbStroke.Parent = sidebar

toggleTab.MouseButton1Click:Connect(function()
    sidebar.Visible = not sidebar.Visible
end)

-- Sidebar Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 38)
header.BackgroundColor3 = Color3.fromRGB(18, 23, 33)
header.ZIndex = 51
header.Parent = sidebar
local hCorner = Instance.new("UICorner")
hCorner.CornerRadius = UDim.new(0, 10)
hCorner.Parent = header

local titleLbl = Instance.new("TextLabel")
titleLbl.Size = UDim2.new(1, -60, 1, 0)
titleLbl.Position = UDim2.new(0, 12, 0, 0)
titleLbl.BackgroundTransparency = 1
titleLbl.Text = "AXIOM BUILD V5"
titleLbl.TextColor3 = Color3.fromRGB(0, 240, 150)
titleLbl.Font = Enum.Font.GothamBlack
titleLbl.TextSize = 12
titleLbl.TextXAlignment = Enum.TextXAlignment.Left
titleLbl.ZIndex = 52
titleLbl.Parent = header

local collapseBtn = Instance.new("TextButton")
collapseBtn.Size = UDim2.new(0, 26, 0, 26)
collapseBtn.Position = UDim2.new(1, -32, 0.5, -13)
collapseBtn.BackgroundTransparency = 1
collapseBtn.Text = "✕"
collapseBtn.TextColor3 = Color3.fromRGB(160, 175, 195)
collapseBtn.Font = Enum.Font.GothamBold
collapseBtn.TextSize = 13
collapseBtn.ZIndex = 52
collapseBtn.Parent = header
collapseBtn.MouseButton1Click:Connect(function()
    sidebar.Visible = false
end)

-- Sidebar Scroll Container for Settings
local scrollBody = Instance.new("ScrollingFrame")
scrollBody.Size = UDim2.new(1, -12, 1, -44)
scrollBody.Position = UDim2.new(0, 6, 0, 40)
scrollBody.BackgroundTransparency = 1
scrollBody.ScrollBarThickness = 3
scrollBody.ScrollBarImageColor3 = Color3.fromRGB(0, 210, 140)
scrollBody.CanvasSize = UDim2.new(0, 0, 0, 680)
scrollBody.ZIndex = 51
scrollBody.Parent = sidebar

local scrollLayout = Instance.new("UIListLayout")
scrollLayout.Padding = UDim.new(0, 6)
scrollLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
scrollLayout.Parent = scrollBody

local function createSectionTitle(text)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -8, 0, 18)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(130, 145, 170)
    lbl.Font = Enum.Font.GothamBlack
    lbl.TextSize = 9
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 52
    lbl.Parent = scrollBody
    return lbl
end

local function createSidebarPill(name, text, onClick, isAccent)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(1, -8, 0, 28)
    btn.BackgroundColor3 = isAccent and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(22, 27, 38)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(240, 245, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 10
    btn.AutoButtonColor = false
    btn.ZIndex = 52
    btn.Parent = scrollBody

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(36, 46, 66)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        local bg = btn:GetAttribute("Active") and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(22, 27, 38)
        TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = bg}):Play()
    end)

    btn.MouseButton1Click:Connect(function() onClick(btn) end)
    btn:SetAttribute("Active", isAccent or false)
    return btn
end

-- ==================== 1. PRECISION PLACEMENT ====================
createSectionTitle("PRECISION SNAPPING")

local gridModes = {
    {val = 0, label = "FREE"},
    {val = 0.1, label = "0.1 studs"},
    {val = 0.5, label = "0.5 studs"},
    {val = 1, label = "1.0 studs"},
    {val = 2, label = "2.0 studs"},
    {val = 4, label = "4.0 studs"},
}
local curGridIdx = 1
local gridBtn = createSidebarPill("GridBtn", "GRID: FREE", function(btn)
    curGridIdx = (curGridIdx % #gridModes) + 1
    Config.GridSnap = gridModes[curGridIdx].val
    getgenv().BuildMode_NoGrid = (Config.GridSnap == 0)
    btn.Text = "GRID: " .. gridModes[curGridIdx].label
    btn.BackgroundColor3 = (Config.GridSnap == 0) and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(35, 60, 95)
    btn:SetAttribute("Active", Config.GridSnap == 0)
end, true)

local rotModes = {1, 5, 15, 45, 90}
local curRotIdx = 3
local rotBtn = createSidebarPill("RotBtn", "ROTATION: 15°", function(btn)
    curRotIdx = (curRotIdx % #rotModes) + 1
    Config.RotationStep = rotModes[curRotIdx]
    getgenv().BuildMode_RotationStep = Config.RotationStep
    btn.Text = "ROTATION: " .. tostring(Config.RotationStep) .. "°"
end, false)

local glideBtn = createSidebarPill("GlideBtn", "SMOOTH GLIDE: ON", function(btn)
    Config.SmoothGlide = not Config.SmoothGlide
    btn.Text = Config.SmoothGlide and "SMOOTH GLIDE: ON" or "SMOOTH GLIDE: OFF"
    btn.BackgroundColor3 = Config.SmoothGlide and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(22, 27, 38)
    btn:SetAttribute("Active", Config.SmoothGlide)
end, true)

local clipBtn = createSidebarPill("ClipBtn", "COLLISION CLIP: ON", function(btn)
    Config.BypassCollision = not Config.BypassCollision
    getgenv().BuildMode_BypassCollision = Config.BypassCollision
    btn.Text = Config.BypassCollision and "COLLISION CLIP: ON" or "COLLISION CLIP: OFF"
    btn.BackgroundColor3 = Config.BypassCollision and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(22, 27, 38)
    btn:SetAttribute("Active", Config.BypassCollision)
end, true)

local rapidBtn = createSidebarPill("RapidBtn", "RAPID RE-PLACE: ON", function(btn)
    Config.ContinuousPlace = not Config.ContinuousPlace
    btn.Text = Config.ContinuousPlace and "RAPID RE-PLACE: ON" or "RAPID RE-PLACE: OFF"
    btn.BackgroundColor3 = Config.ContinuousPlace and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(22, 27, 38)
    btn:SetAttribute("Active", Config.ContinuousPlace)
end, true)

-- ==================== 2. TOGGLEABLE HEIGHT OFFSET ====================
createSectionTitle("HEIGHT OFFSET (TOGGLEABLE)")

local heightRow = Instance.new("Frame")
heightRow.Size = UDim2.new(1, -8, 0, 30)
heightRow.BackgroundColor3 = Color3.fromRGB(20, 25, 36)
heightRow.ZIndex = 52
heightRow.Parent = scrollBody
local hrCorner = Instance.new("UICorner")
hrCorner.CornerRadius = UDim.new(0, 6)
hrCorner.Parent = heightRow

local heightToggleBtn = Instance.new("TextButton")
heightToggleBtn.Size = UDim2.new(0, 95, 1, 0)
heightToggleBtn.BackgroundColor3 = Color3.fromRGB(28, 36, 50)
heightToggleBtn.Text = "HEIGHT: OFF"
heightToggleBtn.TextColor3 = Color3.fromRGB(220, 230, 240)
heightToggleBtn.Font = Enum.Font.GothamBold
heightToggleBtn.TextSize = 9
heightToggleBtn.ZIndex = 53
heightToggleBtn.Parent = heightRow
local htbCorner = Instance.new("UICorner")
htbCorner.CornerRadius = UDim.new(0, 6)
htbCorner.Parent = heightToggleBtn

local hMinus = Instance.new("TextButton")
hMinus.Size = UDim2.new(0, 24, 1, 0)
hMinus.Position = UDim2.new(0, 100, 0, 0)
hMinus.BackgroundTransparency = 1
hMinus.Text = "−"
hMinus.TextColor3 = Color3.fromRGB(200, 210, 230)
hMinus.Font = Enum.Font.GothamBold
hMinus.TextSize = 13
hMinus.ZIndex = 53
hMinus.Parent = heightRow

local hValText = Instance.new("TextLabel")
hValText.Size = UDim2.new(1, -154, 1, 0)
hValText.Position = UDim2.new(0, 126, 0, 0)
hValText.BackgroundTransparency = 1
hValText.Text = "0.00"
hValText.TextColor3 = Color3.fromRGB(0, 220, 140)
hValText.Font = Enum.Font.GothamBlack
hValText.TextSize = 10
hValText.ZIndex = 53
hValText.Parent = heightRow

local hPlus = Instance.new("TextButton")
hPlus.Size = UDim2.new(0, 24, 1, 0)
hPlus.Position = UDim2.new(1, -26, 0, 0)
hPlus.BackgroundTransparency = 1
hPlus.Text = "+"
hPlus.TextColor3 = Color3.fromRGB(200, 210, 230)
hPlus.Font = Enum.Font.GothamBold
hPlus.TextSize = 13
hPlus.ZIndex = 53
hPlus.Parent = heightRow

heightToggleBtn.MouseButton1Click:Connect(function()
    Config.HeightEnabled = not Config.HeightEnabled
    heightToggleBtn.Text = Config.HeightEnabled and "HEIGHT: ON" or "HEIGHT: OFF"
    heightToggleBtn.BackgroundColor3 = Config.HeightEnabled and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(28, 36, 50)
    hValText.TextColor3 = Config.HeightEnabled and Color3.fromRGB(0, 220, 140) or Color3.fromRGB(120, 130, 145)
end)

hMinus.MouseButton1Click:Connect(function()
    Config.HeightOffset = math.max(-20, Config.HeightOffset - 0.25)
    hValText.Text = string.format("%+.2f", Config.HeightOffset)
end)
hPlus.MouseButton1Click:Connect(function()
    Config.HeightOffset = math.min(50, Config.HeightOffset + 0.25)
    hValText.Text = string.format("%+.2f", Config.HeightOffset)
end)

-- ==================== 3. AUTO-FILL BLUEPRINTS ====================
createSectionTitle("AUTO-FILL BLUEPRINTS")

local woodTypes = {
    {code = "GoldSwampy", name = "🌟 Golden Spruce"},
    {code = "Cherry", name = "🍒 Cherry"},
    {code = "Oak", name = "🌳 Oak"},
    {code = "Frost", name = "❄️ Frost"},
    {code = "Volcano", name = "🌋 Volcano"},
    {code = "SnowGlow", name = "✨ SnowGlow"},
    {code = "SpookyNeon", name = "🎃 SpookyNeon"},
    {code = "Generic", name = "🌲 Generic"},
    {code = "Any", name = "🔄 Any Wood"},
}
local curWoodIdx = 1

local woodDropdownBtn = createSidebarPill("WoodTypeBtn", "WOOD: 🌟 Golden Spruce", function(btn)
    curWoodIdx = (curWoodIdx % #woodTypes) + 1
    Config.SelectedWoodType = woodTypes[curWoodIdx].code
    btn.Text = "WOOD: " .. woodTypes[curWoodIdx].name
end, false)

local fillAllBtn = createSidebarPill("FillAllBtn", "⚡ AUTO-FILL ALL BLUEPRINTS", function(btn)
    fillAllBlueprints(Config.SelectedWoodType)
end, true)

-- ==================== 4. MULTI-STRUCTURE & TEMPLATES ====================
createSectionTitle("MULTI-STRUCTURE & TEMPLATES")

local templates = {
    {name = "Floors", item = "Floor1Large"},
    {name = "Walls", item = "Wall2Tall"},
    {name = "Ramps", item = "Wedge1"},
    {name = "Stairs", item = "Stair1"},
    {name = "House Foundation", item = "Floor1Large"},
    {name = "Text Art Matrix", item = "Floor1Small"},
}
local curTemplateIdx = 1

local templateDropdownBtn = createSidebarPill("TemplateBtn", "TEMPLATE: Floors", function(btn)
    curTemplateIdx = (curTemplateIdx % #templates) + 1
    local t = templates[curTemplateIdx]
    Config.MatrixTemplate = t.name
    Config.MatrixStructure = t.item
    btn.Text = "TEMPLATE: " .. t.name
end, false)

local function createDimensionStepper(label, currentVal, minV, maxV, onUpdate)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, -8, 0, 26)
    row.BackgroundColor3 = Color3.fromRGB(20, 25, 36)
    row.ZIndex = 52
    row.Parent = scrollBody
    local rc = Instance.new("UICorner")
    rc.CornerRadius = UDim.new(0, 6)
    rc.Parent = row

    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(0, 110, 1, 0)
    l.Position = UDim2.new(0, 10, 0, 0)
    l.BackgroundTransparency = 1
    l.Text = label
    l.TextColor3 = Color3.fromRGB(210, 220, 235)
    l.Font = Enum.Font.GothamBold
    l.TextSize = 9
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.ZIndex = 53
    l.Parent = row

    local minus = Instance.new("TextButton")
    minus.Size = UDim2.new(0, 26, 1, 0)
    minus.Position = UDim2.new(1, -84, 0, 0)
    minus.BackgroundTransparency = 1
    minus.Text = "−"
    minus.TextColor3 = Color3.fromRGB(200, 210, 230)
    minus.Font = Enum.Font.GothamBold
    minus.TextSize = 12
    minus.ZIndex = 53
    minus.Parent = row

    local val = Instance.new("TextLabel")
    val.Size = UDim2.new(0, 32, 1, 0)
    val.Position = UDim2.new(1, -58, 0, 0)
    val.BackgroundTransparency = 1
    val.Text = tostring(currentVal)
    val.TextColor3 = Color3.fromRGB(0, 210, 255)
    val.Font = Enum.Font.GothamBlack
    val.TextSize = 10
    val.ZIndex = 53
    val.Parent = row

    local plus = Instance.new("TextButton")
    plus.Size = UDim2.new(0, 26, 1, 0)
    plus.Position = UDim2.new(1, -26, 0, 0)
    plus.BackgroundTransparency = 1
    plus.Text = "+"
    plus.TextColor3 = Color3.fromRGB(200, 210, 230)
    plus.Font = Enum.Font.GothamBold
    plus.TextSize = 12
    plus.ZIndex = 53
    plus.Parent = row

    minus.MouseButton1Click:Connect(function()
        local n = math.max(minV, onUpdate(-1))
        val.Text = tostring(n)
    end)
    plus.MouseButton1Click:Connect(function()
        local n = math.min(maxV, onUpdate(1))
        val.Text = tostring(n)
    end)
end

createDimensionStepper("Length (X Tiles):", Config.MatrixLength, 1, 16, function(delta)
    Config.MatrixLength = math.clamp(Config.MatrixLength + delta, 1, 16)
    return Config.MatrixLength
end)

createDimensionStepper("Width (Z Tiles):", Config.MatrixWidth, 1, 16, function(delta)
    Config.MatrixWidth = math.clamp(Config.MatrixWidth + delta, 1, 16)
    return Config.MatrixWidth
end)

createDimensionStepper("Height (Y Layers):", Config.MatrixHeight, 1, 8, function(delta)
    Config.MatrixHeight = math.clamp(Config.MatrixHeight + delta, 1, 8)
    return Config.MatrixHeight
end)

local anchorBtn = createSidebarPill("AnchorBtn", "ANCHOR: Corner", function(btn)
    Config.MatrixAnchor = (Config.MatrixAnchor == "Corner") and "Center" or "Corner"
    btn.Text = "ANCHOR: " .. Config.MatrixAnchor
end, false)

local deployMatrixBtn = createSidebarPill("DeployBtn", "🚀 DEPLOY MATRIX TEMPLATE", function(btn)
    Config.AutoMatrix = true
    startPlacingBlueprint(Config.MatrixStructure or "Floor1Large")
end, true)

-- ==================== 5. BLUEPRINT PALETTE ====================
createSectionTitle("BLUEPRINT PALETTE")

local pickerFrame
local browseBlueprintsBtn = createSidebarPill("BrowseBpBtn", "📐 BROWSE ALL BLUEPRINTS (69)", function(btn)
    local vis = not pickerFrame.Visible
    pickerFrame.Visible = vis
    backdrop.Visible = vis
end, false)

-- ========================================================================
-- REAL-TIME MATRIX PROGRESS BANNER
-- ========================================================================
local progressBanner = Instance.new("Frame")
progressBanner.Name = "MatrixProgressBanner"
progressBanner.Size = UDim2.new(0, 340, 0, 38)
progressBanner.Position = UDim2.new(0.5, -170, 0, 16)
progressBanner.BackgroundColor3 = Color3.fromRGB(14, 18, 26)
progressBanner.BackgroundTransparency = 0.15
progressBanner.BorderSizePixel = 0
progressBanner.Visible = false
progressBanner.ZIndex = 80
progressBanner.Parent = screenGui

local pbCorner = Instance.new("UICorner")
pbCorner.CornerRadius = UDim.new(0, 8)
pbCorner.Parent = progressBanner

local pbStroke = Instance.new("UIStroke")
pbStroke.Color = Color3.fromRGB(0, 210, 255)
pbStroke.Thickness = 1.2
pbStroke.Parent = progressBanner

local pbLabel = Instance.new("TextLabel")
pbLabel.Size = UDim2.new(1, -20, 0, 20)
pbLabel.Position = UDim2.new(0, 10, 0, 4)
pbLabel.BackgroundTransparency = 1
pbLabel.Text = "🔲 Deploying Matrix..."
pbLabel.TextColor3 = Color3.fromRGB(240, 245, 255)
pbLabel.Font = Enum.Font.GothamBold
pbLabel.TextSize = 10
pbLabel.ZIndex = 81
pbLabel.Parent = progressBanner

local pbTrack = Instance.new("Frame")
pbTrack.Size = UDim2.new(1, -20, 0, 5)
pbTrack.Position = UDim2.new(0, 10, 0, 26)
pbTrack.BackgroundColor3 = Color3.fromRGB(28, 36, 50)
pbTrack.BorderSizePixel = 0
pbTrack.ZIndex = 81
pbTrack.Parent = progressBanner
local pbtCorner = Instance.new("UICorner")
pbtCorner.CornerRadius = UDim.new(1, 0)
pbtCorner.Parent = pbTrack

local pbBar = Instance.new("Frame")
pbBar.Size = UDim2.new(0, 0, 1, 0)
pbBar.BackgroundColor3 = Color3.fromRGB(0, 220, 140)
pbBar.BorderSizePixel = 0
pbBar.ZIndex = 82
pbBar.Parent = pbTrack
local pbbCorner = Instance.new("UICorner")
pbbCorner.CornerRadius = UDim.new(1, 0)
pbbCorner.Parent = pbBar

updateMatrixProgressBanner = function(current, total, bpName)
    progressBanner.Visible = true
    pbLabel.Text = string.format("🔲 Deploying Matrix: %d / %d (%s)", current, total, bpName)
    local pct = math.clamp(current / total, 0, 1)
    TweenService:Create(pbBar, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(pct, 0, 1, 0)
    }):Play()
end

hideMatrixProgressBanner = function()
    TweenService:Create(progressBanner, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    task.wait(0.3)
    progressBanner.Visible = false
    progressBanner.BackgroundTransparency = 0.15
    pbBar.Size = UDim2.new(0, 0, 1, 0)
end

-- ========================================================================
-- MODERN GLASSMORPHIC BLUEPRINT DRAWER
-- ========================================================================
pickerFrame = Instance.new("Frame")
pickerFrame.Name = "ModernBlueprintPicker"
pickerFrame.Size = UDim2.new(0, 540, 0, 480)
pickerFrame.Position = UDim2.new(0.5, -270, 0.5, -240)
pickerFrame.BackgroundColor3 = Color3.fromRGB(14, 18, 26)
pickerFrame.BackgroundTransparency = 0.12
pickerFrame.BorderSizePixel = 0
pickerFrame.Visible = false
pickerFrame.ZIndex = 70
pickerFrame.Parent = screenGui

local pfCorner = Instance.new("UICorner")
pfCorner.CornerRadius = UDim.new(0, 12)
pfCorner.Parent = pickerFrame

local pfStroke = Instance.new("UIStroke")
pfStroke.Color = Color3.fromRGB(0, 200, 140)
pfStroke.Thickness = 1.3
pfStroke.Transparency = 0.35
pfStroke.Parent = pickerFrame

local searchContainer = Instance.new("Frame")
searchContainer.Size = UDim2.new(1, -24, 0, 36)
searchContainer.Position = UDim2.new(0, 12, 0, 12)
searchContainer.BackgroundColor3 = Color3.fromRGB(20, 25, 36)
searchContainer.BorderSizePixel = 0
searchContainer.ZIndex = 71
searchContainer.Parent = pickerFrame
local scCorner = Instance.new("UICorner")
scCorner.CornerRadius = UDim.new(0, 8)
scCorner.Parent = searchContainer

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -34, 1, 0)
searchBox.Position = UDim2.new(0, 12, 0, 0)
searchBox.BackgroundTransparency = 1
searchBox.PlaceholderText = "🔍 Search blueprints (ramp, wedge, floor, stair, door)..."
searchBox.PlaceholderColor3 = Color3.fromRGB(120, 135, 155)
searchBox.Text = ""
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.Font = Enum.Font.GothamMedium
searchBox.TextSize = 12
searchBox.ClearTextOnFocus = false
searchBox.ZIndex = 72
searchBox.Parent = searchContainer

local shelf = Instance.new("Frame")
shelf.Size = UDim2.new(1, -24, 0, 32)
shelf.Position = UDim2.new(0, 12, 0, 54)
shelf.BackgroundColor3 = Color3.fromRGB(18, 23, 33)
shelf.BorderSizePixel = 0
shelf.ZIndex = 71
shelf.Parent = pickerFrame
local shCorner = Instance.new("UICorner")
shCorner.CornerRadius = UDim.new(0, 6)
shCorner.Parent = shelf

local shLayout = Instance.new("UIListLayout")
shLayout.FillDirection = Enum.FillDirection.Horizontal
shLayout.Padding = UDim.new(0, 5)
shLayout.VerticalAlignment = Enum.VerticalAlignment.Center
shLayout.Parent = shelf

local shLabel = Instance.new("TextLabel")
shLabel.Size = UDim2.new(0, 64, 1, 0)
shLabel.BackgroundTransparency = 1
shLabel.Text = "QUICK:"
shLabel.TextColor3 = Color3.fromRGB(0, 220, 140)
shLabel.Font = Enum.Font.GothamBlack
shLabel.TextSize = 9
shLabel.ZIndex = 72
shLabel.Parent = shelf

local quickRamps = {"Wedge1", "Wedge2", "Wedge3", "Stair1", "Floor1Large", "Floor1Small"}
for _, rName in ipairs(quickRamps) do
    local qBtn = Instance.new("TextButton")
    qBtn.Size = UDim2.new(0, 70, 0, 24)
    qBtn.BackgroundColor3 = Color3.fromRGB(28, 36, 50)
    qBtn.Text = rName
    qBtn.TextColor3 = Color3.fromRGB(230, 230, 230)
    qBtn.Font = Enum.Font.GothamBold
    qBtn.TextSize = 9
    qBtn.ZIndex = 72
    qBtn.Parent = shelf
    local qc = Instance.new("UICorner")
    qc.CornerRadius = UDim.new(0, 4)
    qc.Parent = qBtn

    qBtn.MouseButton1Click:Connect(function()
        pickerFrame.Visible = false
        backdrop.Visible = false
        startPlacingBlueprint(rName)
    end)
end

local catRow = Instance.new("ScrollingFrame")
catRow.Name = "CategoryRow"
catRow.Size = UDim2.new(1, -24, 0, 28)
catRow.Position = UDim2.new(0, 12, 0, 92)
catRow.BackgroundTransparency = 1
catRow.ScrollBarThickness = 0
catRow.CanvasSize = UDim2.new(0, 600, 0, 0)
catRow.ZIndex = 71
catRow.Parent = pickerFrame

local catLayout = Instance.new("UIListLayout")
catLayout.FillDirection = Enum.FillDirection.Horizontal
catLayout.Padding = UDim.new(0, 6)
catLayout.Parent = catRow

local cardsScroll = Instance.new("ScrollingFrame")
cardsScroll.Name = "CardsScroll"
cardsScroll.Size = UDim2.new(1, -24, 1, -132)
cardsScroll.Position = UDim2.new(0, 12, 0, 124)
cardsScroll.BackgroundColor3 = Color3.fromRGB(16, 21, 30)
cardsScroll.BackgroundTransparency = 0.2
cardsScroll.BorderSizePixel = 0
cardsScroll.ScrollBarThickness = 4
cardsScroll.ScrollBarImageColor3 = Color3.fromRGB(0, 220, 140)
cardsScroll.ZIndex = 71
cardsScroll.Parent = pickerFrame
local csCorner = Instance.new("UICorner")
csCorner.CornerRadius = UDim.new(0, 8)
csCorner.Parent = cardsScroll

local grid = Instance.new("UIGridLayout")
grid.CellSize = UDim2.new(0, 160, 0, 56)
grid.CellPadding = UDim2.new(0, 8, 0, 8)
grid.SortOrder = Enum.SortOrder.Name
grid.Parent = cardsScroll

local allBlueprints = {}
local selectedCategory = "All"

local function refreshCards()
    for _, child in ipairs(cardsScroll:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end

    local query = searchBox.Text:lower()
    local count = 0

    for _, bp in ipairs(allBlueprints) do
        local catMatch = (selectedCategory == "All")
            or (bp.category == selectedCategory)
            or (selectedCategory == "Ramps & Wedges" and (bp.category == "Wedges" or bp.name:lower():find("wedge") or bp.name:lower():find("stair")))

        local searchMatch = (query == "") or bp.name:lower():find(query) or bp.category:lower():find(query)

        if catMatch and searchMatch then
            count = count + 1
            local card = Instance.new("TextButton")
            card.Name = bp.name
            card.BackgroundColor3 = Color3.fromRGB(24, 31, 44)
            card.BackgroundTransparency = 0.2
            card.Text = ""
            card.AutoButtonColor = false
            card.ZIndex = 72
            card.Parent = cardsScroll

            local cCorner = Instance.new("UICorner")
            cCorner.CornerRadius = UDim.new(0, 6)
            cCorner.Parent = card

            local cStroke = Instance.new("UIStroke")
            cStroke.Color = Color3.fromRGB(38, 48, 68)
            cStroke.Thickness = 1
            cStroke.Parent = card

            local nameLbl = Instance.new("TextLabel")
            nameLbl.Size = UDim2.new(1, -12, 0, 20)
            nameLbl.Position = UDim2.new(0, 8, 0, 6)
            nameLbl.BackgroundTransparency = 1
            nameLbl.Text = bp.name
            nameLbl.TextColor3 = Color3.fromRGB(245, 245, 245)
            nameLbl.Font = Enum.Font.GothamBold
            nameLbl.TextSize = 11
            nameLbl.TextXAlignment = Enum.TextXAlignment.Left
            nameLbl.ZIndex = 73
            nameLbl.Parent = card

            local catLbl = Instance.new("TextLabel")
            catLbl.Size = UDim2.new(1, -12, 0, 16)
            catLbl.Position = UDim2.new(0, 8, 0, 28)
            catLbl.BackgroundTransparency = 1
            catLbl.Text = bp.category
            catLbl.TextColor3 = Color3.fromRGB(0, 220, 140)
            catLbl.Font = Enum.Font.Gotham
            catLbl.TextSize = 9
            catLbl.TextXAlignment = Enum.TextXAlignment.Left
            catLbl.ZIndex = 73
            catLbl.Parent = card

            card.MouseEnter:Connect(function()
                card.BackgroundColor3 = Color3.fromRGB(36, 46, 66)
                cStroke.Color = Color3.fromRGB(0, 220, 140)
            end)
            card.MouseLeave:Connect(function()
                card.BackgroundColor3 = Color3.fromRGB(24, 31, 44)
                cStroke.Color = Color3.fromRGB(38, 48, 68)
            end)

            card.MouseButton1Click:Connect(function()
                pickerFrame.Visible = false
                backdrop.Visible = false
                startPlacingBlueprint(bp.name)
            end)
        end
    end

    local rows = math.ceil(count / 3)
    cardsScroll.CanvasSize = UDim2.new(0, 0, 0, rows * 64 + 16)
end

searchBox:GetPropertyChangedSignal("Text"):Connect(refreshCards)

local categories = {"All", "Floors", "Ramps & Wedges", "Walls", "Doors", "Furniture", "Other"}
for _, cat in ipairs(categories) do
    local catBtn = Instance.new("TextButton")
    catBtn.Size = UDim2.new(0, 84, 0, 24)
    catBtn.BackgroundColor3 = (cat == "All") and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(22, 28, 40)
    catBtn.Text = cat
    catBtn.TextColor3 = Color3.fromRGB(230, 230, 230)
    catBtn.Font = Enum.Font.GothamBold
    catBtn.TextSize = 9
    catBtn.ZIndex = 72
    catBtn.Parent = catRow
    local cbCorner = Instance.new("UICorner")
    cbCorner.CornerRadius = UDim.new(0, 4)
    cbCorner.Parent = catBtn

    catBtn.MouseButton1Click:Connect(function()
        for _, b in ipairs(catRow:GetChildren()) do
            if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(22, 28, 40) end
        end
        catBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 110)
        selectedCategory = cat
        refreshCards()
    end)
end

task.spawn(function()
    local pb = LocalPlayer:WaitForChild("PlayerBlueprints", 10)
    local bpsFolder = pb and pb:WaitForChild("Blueprints", 10)
    if bpsFolder then
        for _, bp in ipairs(bpsFolder:GetChildren()) do
            local cat = bp:FindFirstChild("ItemCategory") and bp.ItemCategory.Value or "Other"
            table.insert(allBlueprints, {name = bp.Name, category = cat})
        end
    end
    table.sort(allBlueprints, function(a, b) return a.name < b.name end)
    refreshCards()
end)

backdrop.MouseButton1Click:Connect(function()
    pickerFrame.Visible = false
    backdrop.Visible = false
end)

-- Global Cleanup Handler
getgenv().EccoBuildSuite_Cleanup = function()
    if screenGui then screenGui:Destroy() end
    clearGhostParts()
    currentSmoothedCF = nil
end

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Axiom Build V5",
    Text = "Minimalist Sidebar & Auto-Fill Suite Live!",
    Duration = 4
})
