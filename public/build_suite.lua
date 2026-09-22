--[[
    ========================================================================
    AXIOM // LUMBER TYCOON 2 CLIENT BUILD SUITE — V3 MATRIX
    - Continuous Precision Glide Placement (Raycast + Lerp)
    - Auto-Floor Matrix / Area Painter with Configurable Length & Width
    - Real-Time Visual Ghost Grid Preview
    - Multi-Plot Boundary Matcher & Collision Bypass
    - Executive Glassmorphic HUD & Blueprint Palette
    ========================================================================
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Cleanup prior instance
if getgenv().EccoBuildSuite_Cleanup then
    pcall(getgenv().EccoBuildSuite_Cleanup)
end

-- Master State
local Config = {
    Enabled = true,
    GridSnap = 0,          -- 0 = Free / Smooth, 0.1, 0.5, 1, 2, 4
    RotationStep = 15,     -- 1, 5, 15, 45, 90
    FreeRotation = true,
    SmoothGlide = true,    -- Buttery smooth motion interpolation
    SmoothSpeed = 0.35,    -- Lerp alpha
    HeightOffset = 0,      -- Studs offset
    ContinuousPlace = true,-- Auto re-trigger next blueprint
    BypassCollision = true,-- Clip through walls/conveyors/tight gaps
    CurrentBlueprint = nil,
    IsPlacing = false,

    -- Auto-Floor Matrix Settings
    AutoFloor = false,     -- Toggleable
    MatrixLength = 3,      -- X count (1 to 12)
    MatrixWidth = 3,       -- Z count (1 to 12)
    MatrixAnchor = "Corner", -- "Corner" or "Center"
}

getgenv().BuildMode_Config = Config
getgenv().BuildMode_NoGrid = (Config.GridSnap == 0)
getgenv().BuildMode_FreeRotation = Config.FreeRotation
getgenv().BuildMode_CustomRotation = true
getgenv().BuildMode_RotationStep = Config.RotationStep
getgenv().BuildMode_BypassCollision = Config.BypassCollision

-- Target Game Instances
local draggerGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("StructureDraggingGUI")
local dragItem = draggerGui:WaitForChild("DragItem")
local placeStructureRemote = ReplicatedStorage:WaitForChild("PlaceStructure"):WaitForChild("ClientPlacedBlueprint")
local canPlaceMod = require(ReplicatedStorage:WaitForChild("Interaction"):WaitForChild("CanPlace"))

-- Find closures in memory
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

-- Helper: Pos is in land
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

-- Visual Ghost Grid for Matrix
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
    if not Config.AutoFloor or (Config.MatrixLength <= 1 and Config.MatrixWidth <= 1) then
        clearGhostParts()
        return
    end

    local neededCount = (Config.MatrixLength * Config.MatrixWidth) - 1
    while #activeGhostParts < neededCount do
        local gp = Instance.new("Part")
        gp.Anchored = true
        gp.CanCollide = false
        gp.CanTouch = false
        gp.CanQuery = false
        gp.Material = Enum.Material.Neon
        gp.Color = Color3.fromRGB(0, 210, 255)
        gp.Transparency = 0.65
        gp.Parent = ghostFolder

        local sb = Instance.new("SelectionBox")
        sb.Adornee = gp
        sb.Color3 = Color3.fromRGB(0, 240, 255)
        sb.Transparency = 0.35
        sb.Parent = gp

        table.insert(activeGhostParts, gp)
    end
    while #activeGhostParts > neededCount do
        local p = table.remove(activeGhostParts)
        if p and p.Parent then p:Destroy() end
    end

    local idx = 1
    for gx = 0, Config.MatrixLength - 1 do
        for gz = 0, Config.MatrixWidth - 1 do
            if not (gx == 0 and gz == 0) then
                local offsetX = gx * tileSize.X
                local offsetZ = gz * tileSize.Z
                if Config.MatrixAnchor == "Center" then
                    offsetX = (gx - (Config.MatrixLength - 1) / 2) * tileSize.X
                    offsetZ = (gz - (Config.MatrixWidth - 1) / 2) * tileSize.Z
                end

                local targetTileCF = primaryCF * CFrame.new(offsetX, 0, offsetZ)
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

-- Smooth CFrame state
local currentSmoothedCF = nil
local lastTargetCF = nil
local currentPlacingSize = Vector3.new(8, 0.2, 8)

-- Raycast filter params
local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude

-- Hook 1: roundCFrame (Precision Grid, Smooth Lerp, Surface Raycasting, Matrix Update)
if targetRoundCFrame and not getgenv()._Hooked_roundCFrame_V3 then
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

        local mousePos = UserInputService:GetMouseLocation()
        local ray = Camera:ViewportPointToRay(mousePos.X, mousePos.Y)
        rayParams.FilterDescendantsInstances = {LocalPlayer.Character, workspace:FindFirstChild("Effects"), a2}
        local hit = workspace:Raycast(ray.Origin, ray.Direction * 750, rayParams)

        local basePos
        local partHeight = (a3 and a3.Size and a3.Size.Y) or 0.2

        if hit then
            local norm = hit.Normal
            if norm.Y > 0.6 then
                basePos = hit.Position + Vector3.new(0, (partHeight / 2) + Config.HeightOffset, 0)
            elseif norm.Y < -0.6 then
                basePos = hit.Position - Vector3.new(0, (partHeight / 2) + Config.HeightOffset, 0)
            else
                local partDepth = (a3 and a3.Size and a3.Size.Z) or 2
                basePos = hit.Position + (norm * (partDepth / 2)) + Vector3.new(0, Config.HeightOffset, 0)
            end
        else
            basePos = a1.Position + Vector3.new(0, Config.HeightOffset, 0)
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

        -- Rotation
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

        -- If confirming final placement, lock to exact target and clear ghost
        if isConfirming then
            currentSmoothedCF = nil
            clearGhostParts()
            return targetCF
        end

        -- Update ghost preview
        if Config.AutoFloor then
            updateGhostGrid(targetCF, currentPlacingSize)
        else
            clearGhostParts()
        end

        -- Smooth motion interpolation
        if Config.SmoothGlide then
            if not currentSmoothedCF or (currentSmoothedCF.Position - targetCF.Position).Magnitude > 40 then
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
    getgenv()._Hooked_roundCFrame_V3 = true
end

-- Hook 2: snapAngleToNearestOrthogonal
if targetSnapAngle and not getgenv()._Hooked_snapAngle_V3 then
    local oldSnap
    oldSnap = hookfunction(targetSnapAngle, function(cf)
        if Config.Enabled and Config.FreeRotation then
            return cf - cf.Position
        end
        return oldSnap(cf)
    end)
    getgenv()._Hooked_snapAngle_V3 = true
end

-- Hook 3: rotateTurn (Precision degree rotation)
if targetRotateTurn and not getgenv()._Hooked_rotateTurn_V3 then
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
    getgenv()._Hooked_rotateTurn_V3 = true
end

-- Hook 4: CanPlace (Collision / Land bypass)
if canPlaceMod and not getgenv()._Hooked_CanPlace_V3 then
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
    getgenv()._Hooked_CanPlace_V3 = true
end

-- Auto-Floor Matrix Placer Loop
local function spawnMatrixPlacements(bpName, primaryCF, tileSize, primaryLand)
    if not Config.AutoFloor or (Config.MatrixLength <= 1 and Config.MatrixWidth <= 1) then
        return
    end

    task.spawn(function()
        local count = 0
        for gx = 0, Config.MatrixLength - 1 do
            for gz = 0, Config.MatrixWidth - 1 do
                if not (gx == 0 and gz == 0) then
                    local offsetX = gx * tileSize.X
                    local offsetZ = gz * tileSize.Z
                    if Config.MatrixAnchor == "Center" then
                        offsetX = (gx - (Config.MatrixLength - 1) / 2) * tileSize.X
                        offsetZ = (gz - (Config.MatrixWidth - 1) / 2) * tileSize.Z
                    end

                    local tileCF = primaryCF * CFrame.new(offsetX, 0, offsetZ)
                    local matchedOwner = getMatchingLandOwner(tileCF.Position) or primaryLand

                    placeStructureRemote:FireServer(bpName, tileCF, matchedOwner)
                    count = count + 1
                    task.wait(0.035)
                end
            end
        end

        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Auto-Floor Matrix",
            Text = "Placed " .. tostring(count + 1) .. "x " .. bpName .. " tiles!",
            Duration = 3
        })
    end)
end

-- Placement trigger function
local function startPlacingBlueprint(bpName)
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

            if Config.AutoFloor then
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
-- EXECUTIVE GLASSMORPHIC UI
-- ========================================================================
local pgui = LocalPlayer:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EccoBuildSuiteV3"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    if gethui then
        screenGui.Parent = gethui()
    else
        screenGui.Parent = pgui
    end
end)

local dock = Instance.new("Frame")
dock.Name = "MasterDock"
dock.Size = UDim2.new(0, 890, 0, 46)
dock.Position = UDim2.new(0.5, -445, 0, 14)
dock.BackgroundColor3 = Color3.fromRGB(14, 16, 22)
dock.BorderSizePixel = 0
dock.ClipsDescendants = false
dock.Parent = screenGui

local dockCorner = Instance.new("UICorner")
dockCorner.CornerRadius = UDim.new(0, 10)
dockCorner.Parent = dock

local dockStroke = Instance.new("UIStroke")
dockStroke.Color = Color3.fromRGB(0, 220, 140)
dockStroke.Thickness = 1.3
dockStroke.Transparency = 0.25
dockStroke.Parent = dock

local dockLayout = Instance.new("UIListLayout")
dockLayout.FillDirection = Enum.FillDirection.Horizontal
dockLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
dockLayout.VerticalAlignment = Enum.VerticalAlignment.Center
dockLayout.Padding = UDim.new(0, 6)
dockLayout.Parent = dock

local function createPill(name, text, width, onClick, isAccent)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, width, 0, 30)
    btn.BackgroundColor3 = isAccent and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(24, 28, 38)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(245, 245, 245)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.AutoButtonColor = false
    btn.Parent = dock

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(40, 48, 65)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        local c = btn:GetAttribute("Active") and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(24, 28, 38)
        TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = c}):Play()
    end)

    btn.MouseButton1Click:Connect(function()
        onClick(btn)
    end)

    btn:SetAttribute("Active", isAccent or false)
    return btn
end

-- 1. Brand Badge
local brand = Instance.new("Frame")
brand.Size = UDim2.new(0, 110, 0, 30)
brand.BackgroundColor3 = Color3.fromRGB(20, 23, 32)
brand.Parent = dock
local bCorner = Instance.new("UICorner")
bCorner.CornerRadius = UDim.new(0, 6)
bCorner.Parent = brand

local dot = Instance.new("Frame")
dot.Size = UDim2.new(0, 8, 0, 8)
dot.Position = UDim2.new(0, 10, 0.5, -4)
dot.BackgroundColor3 = Color3.fromRGB(0, 240, 140)
dot.BorderSizePixel = 0
dot.Parent = brand
local dCorner = Instance.new("UICorner")
dCorner.CornerRadius = UDim.new(1, 0)
dCorner.Parent = dot

local brandText = Instance.new("TextLabel")
brandText.Size = UDim2.new(1, -26, 1, 0)
brandText.Position = UDim2.new(0, 24, 0, 0)
brandText.BackgroundTransparency = 1
brandText.Text = "BUILD PRO"
brandText.TextColor3 = Color3.fromRGB(0, 240, 140)
brandText.Font = Enum.Font.GothamBlack
brandText.TextSize = 11
brandText.TextXAlignment = Enum.TextXAlignment.Left
brandText.Parent = brand

-- 2. Grid Snap Multi-Toggle
local gridModes = {
    {val = 0, label = "FREE"},
    {val = 0.1, label = "0.1s"},
    {val = 0.5, label = "0.5s"},
    {val = 1, label = "1.0s"},
    {val = 2, label = "2.0s"},
    {val = 4, label = "4.0s"},
}
local curGridIdx = 1
local gridPill = createPill("GridPill", "GRID: FREE", 88, function(btn)
    curGridIdx = (curGridIdx % #gridModes) + 1
    Config.GridSnap = gridModes[curGridIdx].val
    getgenv().BuildMode_NoGrid = (Config.GridSnap == 0)
    btn.Text = "GRID: " .. gridModes[curGridIdx].label
    if Config.GridSnap == 0 then
        btn.BackgroundColor3 = Color3.fromRGB(0, 180, 110)
        btn:SetAttribute("Active", true)
    else
        btn.BackgroundColor3 = Color3.fromRGB(35, 60, 95)
        btn:SetAttribute("Active", false)
    end
end, true)

-- 3. Rotation Multi-Toggle
local rotModes = {1, 5, 15, 45, 90}
local curRotIdx = 3
local rotPill = createPill("RotPill", "ROT: 15°", 74, function(btn)
    curRotIdx = (curRotIdx % #rotModes) + 1
    Config.RotationStep = rotModes[curRotIdx]
    getgenv().BuildMode_RotationStep = Config.RotationStep
    btn.Text = "ROT: " .. tostring(Config.RotationStep) .. "°"
end, false)

-- 4. Smooth Glide Motion Toggle
local glidePill = createPill("GlidePill", "GLIDE: ON", 84, function(btn)
    Config.SmoothGlide = not Config.SmoothGlide
    btn.Text = Config.SmoothGlide and "GLIDE: ON" or "GLIDE: OFF"
    btn.BackgroundColor3 = Config.SmoothGlide and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(24, 28, 38)
    btn:SetAttribute("Active", Config.SmoothGlide)
end, true)

-- 5. Height Offset Adjuster
local heightGroup = Instance.new("Frame")
heightGroup.Size = UDim2.new(0, 105, 0, 30)
heightGroup.BackgroundColor3 = Color3.fromRGB(22, 26, 36)
heightGroup.Parent = dock
local hgCorner = Instance.new("UICorner")
hgCorner.CornerRadius = UDim.new(0, 6)
hgCorner.Parent = heightGroup

local hDown = Instance.new("TextButton")
hDown.Size = UDim2.new(0, 24, 1, 0)
hDown.BackgroundTransparency = 1
hDown.Text = "−"
hDown.TextColor3 = Color3.fromRGB(200, 210, 230)
hDown.Font = Enum.Font.GothamBold
hDown.TextSize = 14
hDown.Parent = heightGroup

local hVal = Instance.new("TextLabel")
hVal.Size = UDim2.new(1, -48, 1, 0)
hVal.Position = UDim2.new(0, 24, 0, 0)
hVal.BackgroundTransparency = 1
hVal.Text = "H: 0.0"
hVal.TextColor3 = Color3.fromRGB(255, 255, 255)
hVal.Font = Enum.Font.GothamBold
hVal.TextSize = 10
hVal.Parent = heightGroup

local hUp = Instance.new("TextButton")
hUp.Size = UDim2.new(0, 24, 1, 0)
hUp.Position = UDim2.new(1, -24, 0, 0)
hUp.BackgroundTransparency = 1
hUp.Text = "+"
hUp.TextColor3 = Color3.fromRGB(200, 210, 230)
hUp.Font = Enum.Font.GothamBold
hUp.TextSize = 14
hUp.Parent = heightGroup

hDown.MouseButton1Click:Connect(function()
    Config.HeightOffset = math.max(-20, Config.HeightOffset - 0.25)
    hVal.Text = string.format("H: %+.2f", Config.HeightOffset)
end)
hUp.MouseButton1Click:Connect(function()
    Config.HeightOffset = math.min(50, Config.HeightOffset + 0.25)
    hVal.Text = string.format("H: %+.2f", Config.HeightOffset)
end)

-- 6. Rapid Mode Toggle
local rapidPill = createPill("RapidPill", "RAPID: ON", 80, function(btn)
    Config.ContinuousPlace = not Config.ContinuousPlace
    btn.Text = Config.ContinuousPlace and "RAPID: ON" or "RAPID: OFF"
    btn.BackgroundColor3 = Config.ContinuousPlace and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(24, 28, 38)
    btn:SetAttribute("Active", Config.ContinuousPlace)
end, true)

-- 7. Clip Mode Toggle
local clipPill = createPill("ClipPill", "CLIP: ON", 74, function(btn)
    Config.BypassCollision = not Config.BypassCollision
    getgenv().BuildMode_BypassCollision = Config.BypassCollision
    btn.Text = Config.BypassCollision and "CLIP: ON" or "CLIP: OFF"
    btn.BackgroundColor3 = Config.BypassCollision and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(24, 28, 38)
    btn:SetAttribute("Active", Config.BypassCollision)
end, true)

-- 8. AUTO-FLOOR MATRIX TOGGLE & CONFIG BUTTON
local matrixModal
local autoFloorBtn = createPill("AutoFloorPill", "🔲 MATRIX: OFF", 110, function(btn)
    Config.AutoFloor = not Config.AutoFloor
    if Config.AutoFloor then
        btn.Text = "🔲 MATRIX: " .. tostring(Config.MatrixLength) .. "x" .. tostring(Config.MatrixWidth)
        btn.BackgroundColor3 = Color3.fromRGB(0, 190, 255)
        btn:SetAttribute("Active", true)
        matrixModal.Visible = true
    else
        btn.Text = "🔲 MATRIX: OFF"
        btn.BackgroundColor3 = Color3.fromRGB(24, 28, 38)
        btn:SetAttribute("Active", false)
        clearGhostParts()
    end
end, false)

-- 9. Blueprint Palette Trigger
local pickerFrame
local bpPill = createPill("BpPill", "📐 BLUEPRINTS", 100, function(btn)
    pickerFrame.Visible = not pickerFrame.Visible
end, false)

-- Matrix Config Modal
matrixModal = Instance.new("Frame")
matrixModal.Name = "MatrixConfigModal"
matrixModal.Size = UDim2.new(0, 320, 0, 240)
matrixModal.Position = UDim2.new(0.5, -160, 0, 70)
matrixModal.BackgroundColor3 = Color3.fromRGB(14, 17, 23)
matrixModal.BorderSizePixel = 0
matrixModal.Visible = false
matrixModal.Parent = screenGui

local mmCorner = Instance.new("UICorner")
mmCorner.CornerRadius = UDim.new(0, 10)
mmCorner.Parent = matrixModal

local mmStroke = Instance.new("UIStroke")
mmStroke.Color = Color3.fromRGB(0, 190, 255)
mmStroke.Thickness = 1.3
mmStroke.Parent = matrixModal

local mmTitle = Instance.new("TextLabel")
mmTitle.Size = UDim2.new(1, -20, 0, 26)
mmTitle.Position = UDim2.new(0, 12, 0, 8)
mmTitle.BackgroundTransparency = 1
mmTitle.Text = "🔲 AUTO-FLOOR MATRIX SETUP"
mmTitle.TextColor3 = Color3.fromRGB(0, 210, 255)
mmTitle.Font = Enum.Font.GothamBlack
mmTitle.TextSize = 11
mmTitle.TextXAlignment = Enum.TextXAlignment.Left
mmTitle.Parent = matrixModal

local mmClose = Instance.new("TextButton")
mmClose.Size = UDim2.new(0, 22, 0, 22)
mmClose.Position = UDim2.new(1, -30, 0, 10)
mmClose.BackgroundTransparency = 1
mmClose.Text = "✕"
mmClose.TextColor3 = Color3.fromRGB(160, 170, 190)
mmClose.Font = Enum.Font.GothamBold
mmClose.TextSize = 12
mmClose.Parent = matrixModal
mmClose.MouseButton1Click:Connect(function()
    matrixModal.Visible = false
end)

local function createStepperRow(labelText, currentVal, minV, maxV, yPos, onUpdate)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0, 130, 0, 28)
    lbl.Position = UDim2.new(0, 16, 0, yPos)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = Color3.fromRGB(230, 230, 230)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = matrixModal

    local controlBox = Instance.new("Frame")
    controlBox.Size = UDim2.new(0, 140, 0, 28)
    controlBox.Position = UDim2.new(1, -156, 0, yPos)
    controlBox.BackgroundColor3 = Color3.fromRGB(22, 27, 38)
    controlBox.Parent = matrixModal
    local cbc = Instance.new("UICorner")
    cbc.CornerRadius = UDim.new(0, 6)
    cbc.Parent = controlBox

    local minusBtn = Instance.new("TextButton")
    minusBtn.Size = UDim2.new(0, 32, 1, 0)
    minusBtn.BackgroundTransparency = 1
    minusBtn.Text = "−"
    minusBtn.TextColor3 = Color3.fromRGB(200, 210, 230)
    minusBtn.Font = Enum.Font.GothamBold
    minusBtn.TextSize = 14
    minusBtn.Parent = controlBox

    local valText = Instance.new("TextLabel")
    valText.Size = UDim2.new(1, -64, 1, 0)
    valText.Position = UDim2.new(0, 32, 0, 0)
    valText.BackgroundTransparency = 1
    valText.Text = tostring(currentVal) .. " tiles"
    valText.TextColor3 = Color3.fromRGB(0, 210, 255)
    valText.Font = Enum.Font.GothamBlack
    valText.TextSize = 11
    valText.Parent = controlBox

    local plusBtn = Instance.new("TextButton")
    plusBtn.Size = UDim2.new(0, 32, 1, 0)
    plusBtn.Position = UDim2.new(1, -32, 0, 0)
    plusBtn.BackgroundTransparency = 1
    plusBtn.Text = "+"
    plusBtn.TextColor3 = Color3.fromRGB(200, 210, 230)
    plusBtn.Font = Enum.Font.GothamBold
    plusBtn.TextSize = 14
    plusBtn.Parent = controlBox

    minusBtn.MouseButton1Click:Connect(function()
        local nextV = math.max(minV, onUpdate(-1))
        valText.Text = tostring(nextV) .. " tiles"
    end)
    plusBtn.MouseButton1Click:Connect(function()
        local nextV = math.min(maxV, onUpdate(1))
        valText.Text = tostring(nextV) .. " tiles"
    end)
end

createStepperRow("Length (X Tiles):", Config.MatrixLength, 1, 12, 42, function(delta)
    Config.MatrixLength = math.clamp(Config.MatrixLength + delta, 1, 12)
    if Config.AutoFloor then
        autoFloorBtn.Text = "🔲 MATRIX: " .. tostring(Config.MatrixLength) .. "x" .. tostring(Config.MatrixWidth)
    end
    return Config.MatrixLength
end)

createStepperRow("Width (Z Tiles):", Config.MatrixWidth, 1, 12, 78, function(delta)
    Config.MatrixWidth = math.clamp(Config.MatrixWidth + delta, 1, 12)
    if Config.AutoFloor then
        autoFloorBtn.Text = "🔲 MATRIX: " .. tostring(Config.MatrixLength) .. "x" .. tostring(Config.MatrixWidth)
    end
    return Config.MatrixWidth
end)

local anchorBtn = Instance.new("TextButton")
anchorBtn.Size = UDim2.new(1, -32, 0, 28)
anchorBtn.Position = UDim2.new(0, 16, 0, 116)
anchorBtn.BackgroundColor3 = Color3.fromRGB(24, 30, 42)
anchorBtn.Text = "Anchor: Corner (Click to toggle Center)"
anchorBtn.TextColor3 = Color3.fromRGB(220, 230, 240)
anchorBtn.Font = Enum.Font.GothamBold
anchorBtn.TextSize = 10
anchorBtn.Parent = matrixModal
local abCorner = Instance.new("UICorner")
abCorner.CornerRadius = UDim.new(0, 6)
abCorner.Parent = anchorBtn

anchorBtn.MouseButton1Click:Connect(function()
    Config.MatrixAnchor = (Config.MatrixAnchor == "Corner") and "Center" or "Corner"
    anchorBtn.Text = "Anchor: " .. Config.MatrixAnchor .. " (Click to toggle)"
end)

local presetRow = Instance.new("Frame")
presetRow.Size = UDim2.new(1, -32, 0, 28)
presetRow.Position = UDim2.new(0, 16, 0, 152)
presetRow.BackgroundTransparency = 1
presetRow.Parent = matrixModal
local prLayout = Instance.new("UIListLayout")
prLayout.FillDirection = Enum.FillDirection.Horizontal
prLayout.Padding = UDim.new(0, 6)
prLayout.Parent = presetRow

local floorPresets = {
    {label = "Floor1Large (8x8)", name = "Floor1Large"},
    {label = "Floor1 (4x4)", name = "Floor1"},
    {label = "Floor2 (4x4)", name = "Floor2"},
}
for _, fp in ipairs(floorPresets) do
    local fBtn = Instance.new("TextButton")
    fBtn.Size = UDim2.new(0, 92, 1, 0)
    fBtn.BackgroundColor3 = Color3.fromRGB(28, 36, 52)
    fBtn.Text = fp.label
    fBtn.TextColor3 = Color3.fromRGB(240, 240, 240)
    fBtn.Font = Enum.Font.GothamBold
    fBtn.TextSize = 8
    fBtn.Parent = presetRow
    local fbc = Instance.new("UICorner")
    fbc.CornerRadius = UDim.new(0, 4)
    fbc.Parent = fBtn

    fBtn.MouseButton1Click:Connect(function()
        Config.AutoFloor = true
        autoFloorBtn.Text = "🔲 MATRIX: " .. tostring(Config.MatrixLength) .. "x" .. tostring(Config.MatrixWidth)
        autoFloorBtn.BackgroundColor3 = Color3.fromRGB(0, 190, 255)
        autoFloorBtn:SetAttribute("Active", true)
        matrixModal.Visible = false
        startPlacingBlueprint(fp.name)
    end)
end

local mmConfirm = Instance.new("TextButton")
mmConfirm.Size = UDim2.new(1, -32, 0, 32)
mmConfirm.Position = UDim2.new(0, 16, 0, 190)
mmConfirm.BackgroundColor3 = Color3.fromRGB(0, 180, 110)
mmConfirm.Text = "ENABLE MATRIX & PLACE FLOOR"
mmConfirm.TextColor3 = Color3.fromRGB(255, 255, 255)
mmConfirm.Font = Enum.Font.GothamBlack
mmConfirm.TextSize = 10
mmConfirm.Parent = matrixModal
local mcCorner = Instance.new("UICorner")
mcCorner.CornerRadius = UDim.new(0, 6)
mcCorner.Parent = mmConfirm

mmConfirm.MouseButton1Click:Connect(function()
    Config.AutoFloor = true
    autoFloorBtn.Text = "🔲 MATRIX: " .. tostring(Config.MatrixLength) .. "x" .. tostring(Config.MatrixWidth)
    autoFloorBtn.BackgroundColor3 = Color3.fromRGB(0, 190, 255)
    autoFloorBtn:SetAttribute("Active", true)
    matrixModal.Visible = false
    startPlacingBlueprint("Floor1Large")
end)

-- Blueprint Drawer
pickerFrame = Instance.new("Frame")
pickerFrame.Name = "ModernBlueprintPicker"
pickerFrame.Size = UDim2.new(0, 520, 0, 460)
pickerFrame.Position = UDim2.new(0.5, -260, 0, 70)
pickerFrame.BackgroundColor3 = Color3.fromRGB(13, 15, 20)
pickerFrame.BorderSizePixel = 0
pickerFrame.Visible = false
pickerFrame.Parent = screenGui

local pfCorner = Instance.new("UICorner")
pfCorner.CornerRadius = UDim.new(0, 12)
pfCorner.Parent = pickerFrame

local pfStroke = Instance.new("UIStroke")
pfStroke.Color = Color3.fromRGB(35, 42, 58)
pfStroke.Thickness = 1.5
pfStroke.Parent = pickerFrame

local searchContainer = Instance.new("Frame")
searchContainer.Size = UDim2.new(1, -24, 0, 36)
searchContainer.Position = UDim2.new(0, 12, 0, 12)
searchContainer.BackgroundColor3 = Color3.fromRGB(20, 24, 32)
searchContainer.BorderSizePixel = 0
searchContainer.Parent = pickerFrame
local scCorner = Instance.new("UICorner")
scCorner.CornerRadius = UDim.new(0, 8)
scCorner.Parent = searchContainer

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -34, 1, 0)
searchBox.Position = UDim2.new(0, 12, 0, 0)
searchBox.BackgroundTransparency = 1
searchBox.PlaceholderText = "🔍 Search blueprints (ramp, wedge, floor, stair, door)..."
searchBox.PlaceholderColor3 = Color3.fromRGB(110, 120, 140)
searchBox.Text = ""
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.Font = Enum.Font.GothamMedium
searchBox.TextSize = 12
searchBox.ClearTextOnFocus = false
searchBox.Parent = searchContainer

local shelf = Instance.new("Frame")
shelf.Size = UDim2.new(1, -24, 0, 32)
shelf.Position = UDim2.new(0, 12, 0, 54)
shelf.BackgroundColor3 = Color3.fromRGB(18, 22, 30)
shelf.BorderSizePixel = 0
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
shLabel.Text = "RAMPS:"
shLabel.TextColor3 = Color3.fromRGB(0, 220, 140)
shLabel.Font = Enum.Font.GothamBlack
shLabel.TextSize = 9
shLabel.Parent = shelf

local quickRamps = {"Wedge1", "Wedge2", "Wedge3", "Stair1", "Floor1Large", "Floor1Small"}
for _, rName in ipairs(quickRamps) do
    local qBtn = Instance.new("TextButton")
    qBtn.Size = UDim2.new(0, 68, 0, 24)
    qBtn.BackgroundColor3 = Color3.fromRGB(28, 34, 46)
    qBtn.Text = rName
    qBtn.TextColor3 = Color3.fromRGB(230, 230, 230)
    qBtn.Font = Enum.Font.GothamBold
    qBtn.TextSize = 9
    qBtn.Parent = shelf
    local qc = Instance.new("UICorner")
    qc.CornerRadius = UDim.new(0, 4)
    qc.Parent = qBtn

    qBtn.MouseButton1Click:Connect(function()
        pickerFrame.Visible = false
        startPlacingBlueprint(rName)
    end)
end

local catRow = Instance.new("ScrollingFrame")
catRow.Size = UDim2.new(1, -24, 0, 28)
catRow.Position = UDim2.new(0, 12, 0, 92)
catRow.BackgroundTransparency = 1
catRow.ScrollBarThickness = 0
catRow.CanvasSize = UDim2.new(0, 580, 0, 0)
catRow.Parent = pickerFrame

local catLayout = Instance.new("UIListLayout")
catLayout.FillDirection = Enum.FillDirection.Horizontal
catLayout.Padding = UDim.new(0, 6)
catLayout.Parent = catRow

local cardsScroll = Instance.new("ScrollingFrame")
cardsScroll.Size = UDim2.new(1, -24, 1, -132)
cardsScroll.Position = UDim2.new(0, 12, 0, 124)
cardsScroll.BackgroundColor3 = Color3.fromRGB(16, 19, 26)
cardsScroll.BorderSizePixel = 0
cardsScroll.ScrollBarThickness = 4
cardsScroll.ScrollBarImageColor3 = Color3.fromRGB(0, 220, 140)
cardsScroll.Parent = pickerFrame
local csCorner = Instance.new("UICorner")
csCorner.CornerRadius = UDim.new(0, 8)
csCorner.Parent = cardsScroll

local grid = Instance.new("UIGridLayout")
grid.CellSize = UDim2.new(0, 154, 0, 54)
grid.CellPadding = UDim2.new(0, 6, 0, 6)
grid.SortOrder = Enum.SortOrder.Name
grid.Parent = cardsScroll

local allBlueprints = {}
local selectedCategory = "All"

local function refreshCards()
    for _, child in ipairs(cardsScroll:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
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
            card.BackgroundColor3 = Color3.fromRGB(24, 29, 39)
            card.Text = ""
            card.AutoButtonColor = false
            card.Parent = cardsScroll

            local cCorner = Instance.new("UICorner")
            cCorner.CornerRadius = UDim.new(0, 6)
            cCorner.Parent = card

            local cStroke = Instance.new("UIStroke")
            cStroke.Color = Color3.fromRGB(38, 46, 62)
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
            catLbl.Parent = card

            card.MouseEnter:Connect(function()
                card.BackgroundColor3 = Color3.fromRGB(36, 44, 60)
                cStroke.Color = Color3.fromRGB(0, 220, 140)
            end)
            card.MouseLeave:Connect(function()
                card.BackgroundColor3 = Color3.fromRGB(24, 29, 39)
                cStroke.Color = Color3.fromRGB(38, 46, 62)
            end)

            card.MouseButton1Click:Connect(function()
                pickerFrame.Visible = false
                startPlacingBlueprint(bp.name)
            end)
        end
    end

    local rows = math.ceil(count / 3)
    cardsScroll.CanvasSize = UDim2.new(0, 0, 0, rows * 60 + 10)
end

searchBox:GetPropertyChangedSignal("Text"):Connect(refreshCards)

local categories = {"All", "Ramps & Wedges", "Floors", "Walls", "Doors", "Furniture", "Other"}
for _, cat in ipairs(categories) do
    local catBtn = Instance.new("TextButton")
    catBtn.Size = UDim2.new(0, 80, 0, 24)
    catBtn.BackgroundColor3 = (cat == "All") and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(22, 26, 36)
    catBtn.Text = cat
    catBtn.TextColor3 = Color3.fromRGB(230, 230, 230)
    catBtn.Font = Enum.Font.GothamBold
    catBtn.TextSize = 9
    catBtn.Parent = catRow
    local cbCorner = Instance.new("UICorner")
    cbCorner.CornerRadius = UDim.new(0, 4)
    cbCorner.Parent = catBtn

    catBtn.MouseButton1Click:Connect(function()
        for _, b in ipairs(catRow:GetChildren()) do
            if b:IsA("TextButton") then
                b.BackgroundColor3 = Color3.fromRGB(22, 26, 36)
            end
        end
        catBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 110)
        selectedCategory = cat
        refreshCards()
    end)
end

local pb = LocalPlayer:FindFirstChild("PlayerBlueprints")
if pb and pb:FindFirstChild("Blueprints") then
    for _, bp in ipairs(pb.Blueprints:GetChildren()) do
        local cat = bp:FindFirstChild("ItemCategory") and bp.ItemCategory.Value or "Other"
        table.insert(allBlueprints, {name = bp.Name, category = cat})
    end
end
table.sort(allBlueprints, function(a, b) return a.name < b.name end)
refreshCards()

-- Dock Dragging
local dragging, dragStart, startPos
dock.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = dock.Position
    end
end)
dock.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        dock.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        pickerFrame.Position = UDim2.new(dock.Position.X.Scale, dock.Position.X.Offset + 180, dock.Position.Y.Scale, dock.Position.Y.Offset + 54)
        matrixModal.Position = UDim2.new(dock.Position.X.Scale, dock.Position.X.Offset + 280, dock.Position.Y.Scale, dock.Position.Y.Offset + 54)
    end
end)

-- Keybinds
local inputConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed and input.KeyCode ~= Enum.KeyCode.Q and input.KeyCode ~= Enum.KeyCode.E and input.KeyCode ~= Enum.KeyCode.X then
        return
    end

    if input.KeyCode == Enum.KeyCode.B and not UserInputService:GetFocusedTextBox() then
        dock.Visible = not dock.Visible
        if not dock.Visible then
            pickerFrame.Visible = false
            matrixModal.Visible = false
        end
    end

    if input.KeyCode == Enum.KeyCode.Q and not UserInputService:GetFocusedTextBox() then
        Config.HeightOffset = math.max(-20, Config.HeightOffset - 0.25)
        hVal.Text = string.format("H: %+.2f", Config.HeightOffset)
    end

    if input.KeyCode == Enum.KeyCode.E and not UserInputService:GetFocusedTextBox() then
        Config.HeightOffset = math.min(50, Config.HeightOffset + 0.25)
        hVal.Text = string.format("H: %+.2f", Config.HeightOffset)
    end

    if input.KeyCode == Enum.KeyCode.G and not UserInputService:GetFocusedTextBox() then
        curGridIdx = (curGridIdx % #gridModes) + 1
        Config.GridSnap = gridModes[curGridIdx].val
        getgenv().BuildMode_NoGrid = (Config.GridSnap == 0)
        gridPill.Text = "GRID: " .. gridModes[curGridIdx].label
        if Config.GridSnap == 0 then
            gridPill.BackgroundColor3 = Color3.fromRGB(0, 180, 110)
        else
            gridPill.BackgroundColor3 = Color3.fromRGB(35, 60, 95)
        end
    end

    if input.KeyCode == Enum.KeyCode.X and not UserInputService:GetFocusedTextBox() then
        clearGhostParts()
        Config.IsPlacing = false
    end
end)

-- Cleanup Handler
getgenv().EccoBuildSuite_Cleanup = function()
    if inputConn then inputConn:Disconnect() end
    if screenGui then screenGui:Destroy() end
    clearGhostParts()
    currentSmoothedCF = nil
end

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Build Suite V3 Matrix",
    Text = "Auto-Floor Matrix & Length/Width controls live!",
    Duration = 4
})