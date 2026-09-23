--[[
    ========================================================================
    AXIOM // LUMBER TYCOON 2 MINIMALIST SIDEBAR BUILD & RESIZE SUITE — V7
    - Minimalist Glassmorphic Sidebar Layout (Left Dock, Zero Clutter)
    - Zero Intrusive Keybinds (Full Player Movement & Chat Freedom)
    - 🔒 Rotation Lock Toggle (Freezes Rotation Angle Completely)
    - 🧲 Snap On Engine (Magnetic Edge & Level Height Snapping for Floors/Walls)
    - Pixel-Perfect Placement Overlay Calibration (Zero Visualization Offset)
    - Universal Regular Blueprint Resizing & Multi-Axis Matrix Placer
    - True Height Lock (Absolute Mathematical Horizontal Plane Lock)
    - Crisp Instant Grid Snapping (Free, 0.5, 1.0, 2.0, 4.0 studs)
    - Auto-Fill Blueprint Engine with Golden Spruce Default
    - Quick Dimension Presets (1x1, 3x3, 5x5, 10x10) + Steppers
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

    -- Precision Snapping & Rotation
    GridSnap = 0,               -- 0 = Free / Smooth, 0.5, 1.0, 2.0, 4.0
    RotationStep = 90,          -- 90, 45, 15, 5, 1
    FreeRotation = false,       -- Aligned to grid rotation
    LockRotation = false,       -- TOGGLE TO STOP ROTATIONS (Freeze angle)
    LockedRotationCFrame = nil,
    SmoothGlide = true,         -- Interpolation for free mode
    SmoothSpeed = 0.35,         -- Lerp alpha
    BypassCollision = true,     -- Clip through tight spots & boundary checks
    ContinuousPlace = true,     -- Auto re-trigger next blueprint

    -- 🧲 Snap On (Even Floors & Walls)
    SnapOn = true,              -- AUTO SNAP ON FOR FLOORS & WALLS
    SnapThreshold = 7.0,        -- Maximum distance in studs to trigger magnetic snap

    -- True Height Lock (Absolute Plane Lock)
    HeightLock = false,         -- True = blueprint is locked to horizontal plane
    LockedHeight = 20.0,        -- Target Y coordinate for Height Lock
    HeightEnabled = false,      -- Relative height offset toggle (when HeightLock is OFF)
    HeightOffset = 0,           -- Relative offset in studs (-20 to +50)

    -- Resizing & Matrix Multiplier (Works for ANY Blueprint)
    AutoMatrix = true,          -- MASTER RESIZING TOGGLE (Applies to regular blueprints!)
    MatrixLength = 3,           -- Length X (1 to 25)
    MatrixWidth = 3,            -- Width Z (1 to 25)
    MatrixHeight = 1,           -- Height Y layers (1 to 10)
    MatrixAnchor = "Corner",    -- "Corner" or "Center"
    MatrixTemplate = "Floors",  -- "Floors", "Walls", "Ramps", "Stairs", "House Foundation", "Text Art"
    MatrixStructure = "Floor1Large",
    RateLimitDelay = 0.52,      -- Safe server remote pacing
    IsMatrixPlacing = false,

    -- Auto-Fill Blueprint Engine
    AutoFillEnabled = false,
    SelectedWoodType = "GoldSwampy", -- Golden Spruce by default!
    IsFilling = false,

    CurrentBlueprint = nil,
    IsPlacing = false,
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

-- Ghost Grid Folder
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
        gp.Color = Color3.fromRGB(0, 200, 255)
        gp.Transparency = 0.65
        gp.Parent = ghostFolder

        local sb = Instance.new("SelectionBox")
        sb.Adornee = gp
        sb.Color3 = Color3.fromRGB(0, 230, 160)
        sb.Transparency = 0.50
        sb.LineThickness = 0.05
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

-- ========================================================================
-- 🧲 SNAP ON ENGINE (EVEN FLOORS & WALL CONNECTIONS)
-- ========================================================================
local function getSnapOnCFrame(rawPos, currentSize, placingModel)
    if not Config.SnapOn then return nil end
    local pm = workspace:FindFirstChild("PlayerModels")
    if not pm or not placingModel then return nil end

    local bpLower = placingModel.Name:lower()
    local isFloor = bpLower:find("floor") ~= nil
    local isWall = bpLower:find("wall") ~= nil
    if not isFloor and not isWall then return nil end

    local bestDist = Config.SnapThreshold or 7.0
    local bestCF = nil

    for _, c in ipairs(pm:GetChildren()) do
        if c:FindFirstChild("Owner") and c.Owner.Value == LocalPlayer and c ~= placingModel then
            local cLower = c.Name:lower()
            local cIsFloor = cLower:find("floor") ~= nil
            local cIsWall = cLower:find("wall") ~= nil

            local canSnap = false
            if isFloor and cIsFloor then
                canSnap = true
            elseif isWall and (cIsWall or cIsFloor) then
                canSnap = true
            end

            if canSnap then
                local main = c:FindFirstChild("Main") or c.PrimaryPart or c:FindFirstChildWhichIsA("BasePart")
                if main then
                    local dist = (main.Position - rawPos).Magnitude
                    if dist < (bestDist + 18) then
                        local existCF = main.CFrame
                        local existSize = main.Size
                        local existPos = existCF.Position
                        local rightVec = existCF.RightVector
                        local lookVec = existCF.LookVector

                        if isFloor and cIsFloor then
                            -- Adjacent floor edge points (Ensure identical Y so floors are 100% even!)
                            local stepX = (existSize.X / 2) + (currentSize.X / 2)
                            local stepZ = (existSize.Z / 2) + (currentSize.Z / 2)
                            local candidates = {
                                existPos + (rightVec * stepX),
                                existPos - (rightVec * stepX),
                                existPos + (lookVec * stepZ),
                                existPos - (lookVec * stepZ),
                            }
                            for _, candPos in ipairs(candidates) do
                                local candPosEvenY = Vector3.new(candPos.X, existPos.Y, candPos.Z)
                                local d = (Vector3.new(rawPos.X, existPos.Y, rawPos.Z) - candPosEvenY).Magnitude
                                if d < bestDist then
                                    bestDist = d
                                    bestCF = CFrame.new(candPosEvenY) * (existCF - existPos)
                                end
                            end
                        elseif isWall and cIsWall then
                            -- Wall-to-wall connection
                            local stepX = (existSize.X / 2) + (currentSize.X / 2)
                            local candidates = {
                                existPos + (rightVec * stepX),
                                existPos - (rightVec * stepX),
                            }
                            for _, candPos in ipairs(candidates) do
                                local candPosEvenY = Vector3.new(candPos.X, existPos.Y, candPos.Z)
                                local d = (rawPos - candPosEvenY).Magnitude
                                if d < bestDist then
                                    bestDist = d
                                    bestCF = CFrame.new(candPosEvenY) * (existCF - existPos)
                                end
                            end
                        elseif isWall and cIsFloor then
                            -- Wall placed on floor perimeter edge
                            local halfFloorX = existSize.X / 2
                            local halfFloorZ = existSize.Z / 2
                            local wallY = existPos.Y + (existSize.Y / 2) + (currentSize.Y / 2)
                            local wallCandidates = {
                                {pos = existPos + (lookVec * halfFloorZ), rot = existCF - existPos},
                                {pos = existPos - (lookVec * halfFloorZ), rot = existCF - existPos},
                                {pos = existPos + (rightVec * halfFloorX), rot = (existCF * CFrame.Angles(0, math.rad(90), 0)) - existPos},
                                {pos = existPos - (rightVec * halfFloorX), rot = (existCF * CFrame.Angles(0, math.rad(90), 0)) - existPos},
                            }
                            for _, cand in ipairs(wallCandidates) do
                                local candPos = Vector3.new(cand.pos.X, wallY, cand.pos.Z)
                                local d = (rawPos - candPos).Magnitude
                                if d < bestDist then
                                    bestDist = d
                                    bestCF = CFrame.new(candPos) * cand.rot
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    return bestCF
end

-- Placement State
local currentSmoothedCF = nil
local lastTargetCF = nil
local currentPlacingSize = Vector3.new(8, 0.2, 8)

local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude

-- Forward declarations for HUD Banners
local updateMatrixProgressBanner, hideMatrixProgressBanner

-- Hook 1: roundCFrame (Precision Snapping, Height Lock, Snap On & Calibrated Overlay)
if targetRoundCFrame and not getgenv()._Hooked_roundCFrame_V7 then
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

        local mainPart = (a2 and a2:IsA("Model")) and (a2:FindFirstChild("Main") or a2.PrimaryPart or a2:FindFirstChildWhichIsA("BasePart"))
        if mainPart then
            currentPlacingSize = mainPart.Size
        elseif a3 and a3.Size then
            currentPlacingSize = a3.Size
        end

        -- Eliminate placing model self-collision & flicker
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
        local hit = workspace:Raycast(ray.Origin, ray.Direction * 850, rayParams)

        local partHeight = (mainPart and mainPart.Size.Y) or (currentPlacingSize and currentPlacingSize.Y) or 0.2
        local basePos

        -- TRUE HEIGHT LOCK (Absolute Horizontal Plane Lock)
        if Config.HeightLock then
            local lockedY = Config.LockedHeight or 20.0
            local planeTargetY = lockedY + (partHeight / 2)
            if math.abs(ray.Direction.Y) > 0.0001 then
                local t = (planeTargetY - ray.Origin.Y) / ray.Direction.Y
                if t > 0 and t < 1500 then
                    local planeHit = ray.Origin + ray.Direction * t
                    basePos = Vector3.new(planeHit.X, planeTargetY, planeHit.Z)
                else
                    basePos = Vector3.new(hit and hit.Position.X or a1.Position.X, planeTargetY, hit and hit.Position.Z or a1.Position.Z)
                end
            else
                basePos = Vector3.new(hit and hit.Position.X or a1.Position.X, planeTargetY, hit and hit.Position.Z or a1.Position.Z)
            end
        else
            -- Normal surface snapping with optional relative height offset
            local effectiveHeightOffset = Config.HeightEnabled and Config.HeightOffset or 0
            if hit then
                local norm = hit.Normal
                if norm.Y > 0.35 then
                    basePos = hit.Position + Vector3.new(0, (partHeight / 2) + effectiveHeightOffset, 0)
                elseif norm.Y < -0.35 then
                    basePos = hit.Position - Vector3.new(0, (partHeight / 2) + effectiveHeightOffset, 0)
                else
                    local partDepth = (mainPart and mainPart.Size.Z) or (currentPlacingSize and currentPlacingSize.Z) or 2
                    basePos = hit.Position + (norm * (partDepth / 2)) + Vector3.new(0, effectiveHeightOffset, 0)
                end
            else
                basePos = a1.Position + Vector3.new(0, effectiveHeightOffset, 0)
            end
        end

        -- 🧲 Snap On Evaluation
        local snapCF = nil
        if Config.SnapOn and a2 and not Config.HeightLock then
            snapCF = getSnapOnCFrame(basePos, currentPlacingSize, a2)
        end

        -- Rotation Handling (Supports Rotation Lock)
        local targetRot
        if Config.LockRotation and Config.LockedRotationCFrame then
            targetRot = Config.LockedRotationCFrame
        else
            local rawRot = a1 - a1.Position
            targetRot = rawRot
            if not Config.FreeRotation and Config.RotationStep and Config.RotationStep > 0 then
                local rx, ry, rz = rawRot:ToOrientation()
                local stepRad = math.rad(Config.RotationStep)
                ry = math.floor(ry / stepRad + 0.5) * stepRad
                targetRot = CFrame.fromOrientation(rx, ry, rz)
            end
        end

        local targetCF
        if snapCF then
            -- Snap On override
            targetCF = snapCF
        else
            -- Crisp Grid Snapping
            if Config.GridSnap > 0 then
                local s = Config.GridSnap
                if Config.HeightLock then
                    basePos = Vector3.new(
                        math.floor(basePos.X / s + 0.5) * s,
                        basePos.Y,
                        math.floor(basePos.Z / s + 0.5) * s
                    )
                else
                    basePos = Vector3.new(
                        math.floor(basePos.X / s + 0.5) * s,
                        math.floor(basePos.Y / 0.25 + 0.5) * 0.25,
                        math.floor(basePos.Z / s + 0.5) * s
                    )
                end
            end
            targetCF = CFrame.new(basePos) * targetRot
        end

        lastTargetCF = targetCF

        -- Real-Time Ghost Grid Preview (Matches exact placing model CFrame)
        if Config.AutoMatrix then
            updateGhostGrid(targetCF, currentPlacingSize)
        else
            clearGhostParts()
        end

        -- Exact lock on placement click
        local draggerPart = a3 or (mainPart or a1)
        local draggerPartHeight = (draggerPart and draggerPart.Size and draggerPart.Size.Y) or partHeight
        local mainPartHeight = (mainPart and mainPart.Size.Y) or partHeight
        -- Mathematical cancellation of StructureDragger's post-multiplication
        local draggerCompensation = CFrame.new(0, (draggerPartHeight / 2) - (mainPartHeight / 2), 0)
        local roundReturnCF = targetCF * draggerCompensation

        if isConfirming then
            currentSmoothedCF = nil
            clearGhostParts()
            return roundReturnCF
        end

        -- Snappy Grid vs Smooth Glide
        if Config.GridSnap > 0 or snapCF or Config.HeightLock then
            -- Instant crisp click with zero lag
            currentSmoothedCF = roundReturnCF
            return roundReturnCF
        elseif Config.SmoothGlide then
            if not currentSmoothedCF or (currentSmoothedCF.Position - roundReturnCF.Position).Magnitude > 35 then
                currentSmoothedCF = roundReturnCF
            else
                currentSmoothedCF = currentSmoothedCF:Lerp(roundReturnCF, Config.SmoothSpeed or 0.35)
            end
            return currentSmoothedCF
        else
            currentSmoothedCF = roundReturnCF
            return roundReturnCF
        end
    end)
    getgenv()._Hooked_roundCFrame_V7 = true
end

-- Hook 2: snapAngleToNearestOrthogonal
if targetSnapAngle and not getgenv()._Hooked_snapAngle_V7 then
    local oldSnap
    oldSnap = hookfunction(targetSnapAngle, function(cf)
        if Config.Enabled and Config.LockRotation and Config.LockedRotationCFrame then
            return Config.LockedRotationCFrame
        end
        if Config.Enabled and Config.FreeRotation then
            return cf - cf.Position
        end
        return oldSnap(cf)
    end)
    getgenv()._Hooked_snapAngle_V7 = true
end

-- Hook 3: rotateTurn (Blocks rotation input when Rotation Lock is ON)
if targetRotateTurn and not getgenv()._Hooked_rotateTurn_V7 then
    local oldRotate
    oldRotate = hookfunction(targetRotateTurn, function(a1, a2, a3)
        if Config.Enabled and Config.LockRotation then
            -- Block all rotation keystrokes / mobile turns
            return
        end
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
    getgenv()._Hooked_rotateTurn_V7 = true
end

-- Hook 4: CanPlace (No Collision Boundary Blocking)
if canPlaceMod and not getgenv()._Hooked_CanPlace_V7 then
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
    getgenv()._Hooked_CanPlace_V7 = true
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
            Title = "Matrix Resized & Placed",
            Text = string.format("Deployed %dx %s (%dx%dx%d)!", placedCount, bpName, Config.MatrixLength, Config.MatrixWidth, Config.MatrixHeight),
            Duration = 3.5
        })
    end)
end

-- Hook 5: Intercept Blueprint Placement for ALL Regular Blueprints
if not getgenv()._Hooked_placeStructureRemote_V7 then
    local rawFire = placeStructureRemote.FireServer
    local oldFire
    oldFire = hookfunction(rawFire, function(self, bpName, placedCF, landRef, ...)
        if self == placeStructureRemote and Config.Enabled and Config.AutoMatrix and not Config.IsMatrixPlacing then
            task.spawn(function()
                local itemInfo = ReplicatedStorage.ClientItemInfo:FindFirstChild(bpName)
                local tileSize = currentPlacingSize or Vector3.new(8, 0.2, 8)
                if itemInfo then
                    local model = itemInfo:FindFirstChild("PlacingModel") or itemInfo:FindFirstChild("Model")
                    if model then
                        local mainPart = model:FindFirstChild("Main") or model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
                        tileSize = (mainPart and mainPart.Size) or model:GetExtentsSize()
                    end
                end
                spawnMatrixPlacements(bpName, placedCF, tileSize, landRef)
            end)
        end
        return oldFire(self, bpName, placedCF, landRef, ...)
    end)
    getgenv()._Hooked_placeStructureRemote_V7 = true
end

-- Palette Placement Launcher
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

            if Config.ContinuousPlace and Config.Enabled then
                task.wait(0.05)
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

    local prevCF = root.CFrame
    root.CFrame = bdw.CFrame * CFrame.new(0, 1.5, 3)
    task.wait(0.08)

    ws.CanCollide = false
    ws.CFrame = bdw.CFrame
    ws.Velocity = Vector3.new(0, -1, 0)

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
            if bp and bp.Parent and bp:FindFirstChild("BuildDependentWood") then
                local ok = fillBlueprintWithPlanks(bp, woodTypeFilter)
                if ok then
                    filledCount = filledCount + 1
                end
                task.wait(0.35)
            end
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
-- MINIMALIST SIDEBAR UI (LEFT DOCKED, SLEEK OBSIDIAN GLASS)
-- ========================================================================
local pgui = LocalPlayer:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EccoBuildSuiteV7"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 9999
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    screenGui.Parent = pgui
end)
if not screenGui.Parent then
    pcall(function()
        if gethui then screenGui.Parent = gethui() else screenGui.Parent = game:GetService("CoreGui") end
    end)
end

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
toggleTab.Position = UDim2.new(0, 18, 0.5, -294)
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
sidebar.Size = UDim2.new(0, 244, 0, 500)
sidebar.Position = UDim2.new(0, 18, 0.5, -250)
sidebar.BackgroundColor3 = Color3.fromRGB(13, 16, 23)
sidebar.BackgroundTransparency = 0.10
sidebar.BorderSizePixel = 0
sidebar.ZIndex = 50
sidebar.Parent = screenGui

local sbCorner = Instance.new("UICorner")
sbCorner.CornerRadius = UDim.new(0, 10)
sbCorner.Parent = sidebar

local sbStroke = Instance.new("UIStroke")
sbStroke.Color = Color3.fromRGB(0, 210, 140)
sbStroke.Thickness = 1.2
sbStroke.Transparency = 0.25
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
titleLbl.Text = "AXIOM BUILD V7"
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
scrollBody.CanvasSize = UDim2.new(0, 0, 0, 940)
scrollBody.ZIndex = 51
scrollBody.Parent = sidebar

local scrollLayout = Instance.new("UIListLayout")
scrollLayout.Padding = UDim.new(0, 6)
scrollLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
scrollLayout.SortOrder = Enum.SortOrder.LayoutOrder
scrollLayout.Parent = scrollBody

local layoutOrderIdx = 0
local function nextOrder()
    layoutOrderIdx = layoutOrderIdx + 1
    return layoutOrderIdx
end

local function createSectionTitle(text)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -8, 0, 18)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(130, 145, 170)
    lbl.Font = Enum.Font.GothamBlack
    lbl.TextSize = 9
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.LayoutOrder = nextOrder()
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
    btn.LayoutOrder = nextOrder()
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

-- ==================== 1. PRECISION SNAPPING & ORIENTATION ====================
createSectionTitle("PRECISION SNAPPING & ORIENTATION")

local gridModes = {
    {val = 0, label = "FREE (Smooth)"},
    {val = 0.5, label = "0.5 studs (Micro)"},
    {val = 1, label = "1.0 studs (Fine)"},
    {val = 2, label = "2.0 studs (Standard LT2)"},
    {val = 4, label = "4.0 studs (Large Tile)"},
}
local curGridIdx = 1
local gridBtn = createSidebarPill("GridBtn", "GRID: FREE (Smooth)", function(btn)
    curGridIdx = (curGridIdx % #gridModes) + 1
    Config.GridSnap = gridModes[curGridIdx].val
    getgenv().BuildMode_NoGrid = (Config.GridSnap == 0)
    btn.Text = "GRID: " .. gridModes[curGridIdx].label
    btn.BackgroundColor3 = (Config.GridSnap == 0) and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(35, 60, 95)
    btn:SetAttribute("Active", Config.GridSnap == 0)
end, true)

-- 🔒 1. TOGGLE TO STOP ROTATIONS
local lockRotBtn = createSidebarPill("LockRotBtn", "🔒 LOCK ROTATION: OFF", function(btn)
    Config.LockRotation = not Config.LockRotation
    btn.Text = Config.LockRotation and "🔒 LOCK ROTATION: ON" or "🔒 LOCK ROTATION: OFF"
    btn.BackgroundColor3 = Config.LockRotation and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(22, 27, 38)
    btn:SetAttribute("Active", Config.LockRotation)

    if Config.LockRotation then
        if lastTargetCF then
            Config.LockedRotationCFrame = lastTargetCF - lastTargetCF.Position
        else
            Config.LockedRotationCFrame = CFrame.new()
        end
    else
        Config.LockedRotationCFrame = nil
    end
end, false)

local rotModes = {90, 45, 15, 5, 1}
local curRotIdx = 1
local rotBtn = createSidebarPill("RotBtn", "ROTATION: 90°", function(btn)
    curRotIdx = (curRotIdx % #rotModes) + 1
    Config.RotationStep = rotModes[curRotIdx]
    getgenv().BuildMode_RotationStep = Config.RotationStep
    btn.Text = "ROTATION: " .. tostring(Config.RotationStep) .. "°"
end, false)

-- 🧲 2. SNAP ON (EVEN FLOORS & WALLS)
local snapOnBtn = createSidebarPill("SnapOnBtn", "🧲 SNAP ON (EVEN FLOORS): ON", function(btn)
    Config.SnapOn = not Config.SnapOn
    btn.Text = Config.SnapOn and "🧲 SNAP ON (EVEN FLOORS): ON" or "🧲 SNAP ON: OFF"
    btn.BackgroundColor3 = Config.SnapOn and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(22, 27, 38)
    btn:SetAttribute("Active", Config.SnapOn)
end, true)

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

-- ==================== 2. TRUE HEIGHT LOCK & ELEVATION ====================
createSectionTitle("HEIGHT LOCK (STAY AT HEIGHT)")

-- Initialize locked height to current player ground
task.spawn(function()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart", 5)
    if root then
        Config.LockedHeight = math.floor(root.Position.Y - 2.5 + 0.5)
    end
end)

local heightLockBtn = createSidebarPill("HeightLockBtn", "HEIGHT LOCK: OFF", function(btn)
    Config.HeightLock = not Config.HeightLock
    btn.Text = Config.HeightLock and "HEIGHT LOCK: ON" or "HEIGHT LOCK: OFF"
    btn.BackgroundColor3 = Config.HeightLock and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(22, 27, 38)
    btn:SetAttribute("Active", Config.HeightLock)

    if Config.HeightLock then
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root and (not Config.LockedHeight or Config.LockedHeight == 20.0) then
            Config.LockedHeight = math.floor(root.Position.Y - 2.5 + 0.5)
        end
    end
end, false)

local lockRow = Instance.new("Frame")
lockRow.Size = UDim2.new(1, -8, 0, 28)
lockRow.BackgroundColor3 = Color3.fromRGB(20, 25, 36)
lockRow.LayoutOrder = nextOrder()
lockRow.ZIndex = 52
lockRow.Parent = scrollBody
local lrCorner = Instance.new("UICorner")
lrCorner.CornerRadius = UDim.new(0, 6)
lrCorner.Parent = lockRow

local lrLabel = Instance.new("TextLabel")
lrLabel.Size = UDim2.new(0, 75, 1, 0)
lrLabel.Position = UDim2.new(0, 8, 0, 0)
lrLabel.BackgroundTransparency = 1
lrLabel.Text = "PLANE Y:"
lrLabel.TextColor3 = Color3.fromRGB(210, 220, 235)
lrLabel.Font = Enum.Font.GothamBold
lrLabel.TextSize = 9
lrLabel.TextXAlignment = Enum.TextXAlignment.Left
lrLabel.ZIndex = 53
lrLabel.Parent = lockRow

local lrMinus = Instance.new("TextButton")
lrMinus.Size = UDim2.new(0, 26, 1, 0)
lrMinus.Position = UDim2.new(1, -84, 0, 0)
lrMinus.BackgroundTransparency = 1
lrMinus.Text = "−"
lrMinus.TextColor3 = Color3.fromRGB(200, 210, 230)
lrMinus.Font = Enum.Font.GothamBold
lrMinus.TextSize = 13
lrMinus.ZIndex = 53
lrMinus.Parent = lockRow

local lrValText = Instance.new("TextLabel")
lrValText.Size = UDim2.new(0, 32, 1, 0)
lrValText.Position = UDim2.new(1, -58, 0, 0)
lrValText.BackgroundTransparency = 1
lrValText.Text = string.format("%.1f", Config.LockedHeight)
lrValText.TextColor3 = Color3.fromRGB(0, 220, 140)
lrValText.Font = Enum.Font.GothamBlack
lrValText.TextSize = 10
lrValText.ZIndex = 53
lrValText.Parent = lockRow

local lrPlus = Instance.new("TextButton")
lrPlus.Size = UDim2.new(0, 26, 1, 0)
lrPlus.Position = UDim2.new(1, -26, 0, 0)
lrPlus.BackgroundTransparency = 1
lrPlus.Text = "+"
lrPlus.TextColor3 = Color3.fromRGB(200, 210, 230)
lrPlus.Font = Enum.Font.GothamBold
lrPlus.TextSize = 13
lrPlus.ZIndex = 53
lrPlus.Parent = lockRow

lrMinus.MouseButton1Click:Connect(function()
    Config.LockedHeight = Config.LockedHeight - 0.5
    lrValText.Text = string.format("%.1f", Config.LockedHeight)
end)
lrPlus.MouseButton1Click:Connect(function()
    Config.LockedHeight = Config.LockedHeight + 0.5
    lrValText.Text = string.format("%.1f", Config.LockedHeight)
end)

local snapHeightBtn = createSidebarPill("SnapHeightBtn", "📍 LOCK TO PLAYER FEET", function(btn)
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        Config.LockedHeight = math.floor((root.Position.Y - 2.8) * 2 + 0.5) / 2
        Config.HeightLock = true
        heightLockBtn.Text = "HEIGHT LOCK: ON"
        heightLockBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 110)
        heightLockBtn:SetAttribute("Active", true)
        lrValText.Text = string.format("%.1f", Config.LockedHeight)
    end
end, false)

-- Relative Height Offset Row (Secondary)
local heightRow = Instance.new("Frame")
heightRow.Size = UDim2.new(1, -8, 0, 28)
heightRow.BackgroundColor3 = Color3.fromRGB(20, 25, 36)
heightRow.LayoutOrder = nextOrder()
heightRow.ZIndex = 52
heightRow.Parent = scrollBody
local hrCorner = Instance.new("UICorner")
hrCorner.CornerRadius = UDim.new(0, 6)
hrCorner.Parent = heightRow

local heightToggleBtn = Instance.new("TextButton")
heightToggleBtn.Size = UDim2.new(0, 95, 1, 0)
heightToggleBtn.BackgroundColor3 = Color3.fromRGB(28, 36, 50)
heightToggleBtn.Text = "OFFSET: OFF"
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
    heightToggleBtn.Text = Config.HeightEnabled and "OFFSET: ON" or "OFFSET: OFF"
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

-- ==================== 4. RESIZING & MATRIX MULTIPLIER ====================
createSectionTitle("RESIZING & MATRIX MULTIPLIER")

local matrixMasterBtn = createSidebarPill("MatrixMasterBtn", "MATRIX RESIZE: ON", function(btn)
    Config.AutoMatrix = not Config.AutoMatrix
    btn.Text = Config.AutoMatrix and "MATRIX RESIZE: ON" or "MATRIX RESIZE: OFF"
    btn.BackgroundColor3 = Config.AutoMatrix and Color3.fromRGB(0, 180, 110) or Color3.fromRGB(22, 27, 38)
    btn:SetAttribute("Active", Config.AutoMatrix)
    if not Config.AutoMatrix then clearGhostParts() end
end, true)

-- Quick Presets Row
local presetRow = Instance.new("Frame")
presetRow.Size = UDim2.new(1, -8, 0, 26)
presetRow.BackgroundColor3 = Color3.fromRGB(20, 25, 36)
presetRow.LayoutOrder = nextOrder()
presetRow.ZIndex = 52
presetRow.Parent = scrollBody
local prCorner = Instance.new("UICorner")
prCorner.CornerRadius = UDim.new(0, 6)
prCorner.Parent = presetRow

local prLayout = Instance.new("UIListLayout")
prLayout.FillDirection = Enum.FillDirection.Horizontal
prLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
prLayout.VerticalAlignment = Enum.VerticalAlignment.Center
prLayout.Padding = UDim.new(0, 4)
prLayout.Parent = presetRow

local lenLabel, widLabel, hgtLabel

local function createPresetBtn(text, len, wid, hgt)
    local pb = Instance.new("TextButton")
    pb.Size = UDim2.new(0, 52, 0, 20)
    pb.BackgroundColor3 = Color3.fromRGB(28, 36, 50)
    pb.Text = text
    pb.TextColor3 = Color3.fromRGB(220, 235, 250)
    pb.Font = Enum.Font.GothamBold
    pb.TextSize = 9
    pb.ZIndex = 53
    pb.Parent = presetRow
    local pbc = Instance.new("UICorner")
    pbc.CornerRadius = UDim.new(0, 4)
    pbc.Parent = pb

    pb.MouseButton1Click:Connect(function()
        Config.MatrixLength = len
        Config.MatrixWidth = wid
        Config.MatrixHeight = hgt or 1
        Config.AutoMatrix = true
        matrixMasterBtn.Text = "MATRIX RESIZE: ON"
        matrixMasterBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 110)
        matrixMasterBtn:SetAttribute("Active", true)
        if lenLabel then lenLabel.Text = tostring(len) end
        if widLabel then widLabel.Text = tostring(wid) end
        if hgtLabel then hgtLabel.Text = tostring(hgt or 1) end
    end)
end

createPresetBtn("1x1", 1, 1, 1)
createPresetBtn("3x3", 3, 3, 1)
createPresetBtn("5x5", 5, 5, 1)
createPresetBtn("10x10", 10, 10, 1)

local function createDimensionStepper(label, currentVal, minV, maxV, onUpdate)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, -8, 0, 26)
    row.BackgroundColor3 = Color3.fromRGB(20, 25, 36)
    row.LayoutOrder = nextOrder()
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

    return val
end

lenLabel = createDimensionStepper("Length (X Tiles):", Config.MatrixLength, 1, 25, function(delta)
    Config.MatrixLength = math.clamp(Config.MatrixLength + delta, 1, 25)
    return Config.MatrixLength
end)

widLabel = createDimensionStepper("Width (Z Tiles):", Config.MatrixWidth, 1, 25, function(delta)
    Config.MatrixWidth = math.clamp(Config.MatrixWidth + delta, 1, 25)
    return Config.MatrixWidth
end)

hgtLabel = createDimensionStepper("Height (Y Layers):", Config.MatrixHeight, 1, 10, function(delta)
    Config.MatrixHeight = math.clamp(Config.MatrixHeight + delta, 1, 10)
    return Config.MatrixHeight
end)

local anchorBtn = createSidebarPill("AnchorBtn", "ANCHOR: Corner", function(btn)
    Config.MatrixAnchor = (Config.MatrixAnchor == "Corner") and "Center" or "Corner"
    btn.Text = "ANCHOR: " .. Config.MatrixAnchor
end, false)

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
pbLabel.TextSize = 11
pbLabel.ZIndex = 81
pbLabel.Parent = progressBanner

local pbTrack = Instance.new("Frame")
pbTrack.Size = UDim2.new(1, -20, 0, 6)
pbTrack.Position = UDim2.new(0, 10, 0, 26)
pbTrack.BackgroundColor3 = Color3.fromRGB(24, 30, 42)
pbTrack.BorderSizePixel = 0
pbTrack.ZIndex = 81
pbTrack.Parent = progressBanner
local pbtCorner = Instance.new("UICorner")
pbtCorner.CornerRadius = UDim.new(0, 3)
pbtCorner.Parent = pbTrack

local pbBar = Instance.new("Frame")
pbBar.Size = UDim2.new(0, 0, 1, 0)
pbBar.BackgroundColor3 = Color3.fromRGB(0, 220, 140)
pbBar.BorderSizePixel = 0
pbBar.ZIndex = 82
pbBar.Parent = pbTrack
local pbbCorner = Instance.new("UICorner")
pbbCorner.CornerRadius = UDim.new(0, 3)
pbbCorner.Parent = pbBar

updateMatrixProgressBanner = function(current, total, bpName)
    progressBanner.Visible = true
    pbLabel.Text = string.format("🔲 Placing %s: %d / %d", bpName, current, total)
    local pct = math.clamp(current / total, 0, 1)
    TweenService:Create(pbBar, TweenInfo.new(0.2), {Size = UDim2.new(pct, 0, 1, 0)}):Play()
end

hideMatrixProgressBanner = function()
    progressBanner.Visible = false
    pbBar.Size = UDim2.new(0, 0, 1, 0)
end

-- ========================================================================
-- 69-BLUEPRINT SEARCHABLE PALETTE DRAWER
-- ========================================================================
pickerFrame = Instance.new("Frame")
pickerFrame.Name = "ModernBlueprintPicker"
pickerFrame.Size = UDim2.new(0, 540, 0, 480)
pickerFrame.Position = UDim2.new(0.5, -270, 0.5, -240)
pickerFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 28)
pickerFrame.BackgroundTransparency = 0.05
pickerFrame.BorderSizePixel = 0
pickerFrame.Visible = false
pickerFrame.ZIndex = 70
pickerFrame.Parent = screenGui

local pfCorner = Instance.new("UICorner")
pfCorner.CornerRadius = UDim.new(0, 12)
pfCorner.Parent = pickerFrame

local pfStroke = Instance.new("UIStroke")
pfStroke.Color = Color3.fromRGB(0, 210, 140)
pfStroke.Thickness = 1.4
pfStroke.Transparency = 0.2
pfStroke.Parent = pickerFrame

local pfHeader = Instance.new("Frame")
pfHeader.Size = UDim2.new(1, 0, 0, 44)
pfHeader.BackgroundColor3 = Color3.fromRGB(20, 26, 38)
pfHeader.ZIndex = 71
pfHeader.Parent = pickerFrame
local pfhCorner = Instance.new("UICorner")
pfhCorner.CornerRadius = UDim.new(0, 12)
pfhCorner.Parent = pfHeader

local pfTitle = Instance.new("TextLabel")
pfTitle.Size = UDim2.new(1, -60, 1, 0)
pfTitle.Position = UDim2.new(0, 16, 0, 0)
pfTitle.BackgroundTransparency = 1
pfTitle.Text = "BLUEPRINT PALETTE CATALOG"
pfTitle.TextColor3 = Color3.fromRGB(0, 230, 140)
pfTitle.Font = Enum.Font.GothamBlack
pfTitle.TextSize = 13
pfTitle.TextXAlignment = Enum.TextXAlignment.Left
pfTitle.ZIndex = 72
pfTitle.Parent = pfHeader

local pfClose = Instance.new("TextButton")
pfClose.Size = UDim2.new(0, 28, 0, 28)
pfClose.Position = UDim2.new(1, -36, 0.5, -14)
pfClose.BackgroundTransparency = 1
pfClose.Text = "✕"
pfClose.TextColor3 = Color3.fromRGB(160, 175, 195)
pfClose.Font = Enum.Font.GothamBold
pfClose.TextSize = 14
pfClose.ZIndex = 72
pfClose.Parent = pfHeader
pfClose.MouseButton1Click:Connect(function()
    pickerFrame.Visible = false
    backdrop.Visible = false
end)

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -28, 0, 32)
searchBox.Position = UDim2.new(0, 14, 0, 50)
searchBox.BackgroundColor3 = Color3.fromRGB(22, 28, 40)
searchBox.PlaceholderText = "🔍 Filter blueprints..."
searchBox.PlaceholderColor3 = Color3.fromRGB(100, 115, 135)
searchBox.Text = ""
searchBox.TextColor3 = Color3.fromRGB(240, 245, 255)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 11
searchBox.ZIndex = 71
searchBox.Parent = pickerFrame
local sbCorner2 = Instance.new("UICorner")
sbCorner2.CornerRadius = UDim.new(0, 6)
sbCorner2.Parent = searchBox

local catRow = Instance.new("ScrollingFrame")
catRow.Size = UDim2.new(1, -28, 0, 28)
catRow.Position = UDim2.new(0, 14, 0, 88)
catRow.BackgroundTransparency = 1
catRow.ScrollBarThickness = 0
catRow.CanvasSize = UDim2.new(0, 640, 0, 0)
catRow.ZIndex = 71
catRow.Parent = pickerFrame

local catLayout = Instance.new("UIListLayout")
catLayout.FillDirection = Enum.FillDirection.Horizontal
catLayout.Padding = UDim.new(0, 6)
catLayout.Parent = catRow

local cardsScroll = Instance.new("ScrollingFrame")
cardsScroll.Size = UDim2.new(1, -28, 1, -130)
cardsScroll.Position = UDim2.new(0, 14, 0, 122)
cardsScroll.BackgroundTransparency = 1
cardsScroll.ScrollBarThickness = 4
cardsScroll.ScrollBarImageColor3 = Color3.fromRGB(0, 210, 140)
cardsScroll.ZIndex = 71
cardsScroll.Parent = pickerFrame

local cardsLayout = Instance.new("UIGridLayout")
cardsLayout.CellSize = UDim2.new(0, 160, 0, 56)
cardsLayout.CellPadding = UDim2.new(0, 8, 0, 8)
cardsLayout.Parent = cardsScroll

local allBlueprints = {}
local selectedCategory = "All"

local function refreshCards()
    for _, c in ipairs(cardsScroll:GetChildren()) do
        if c:IsA("TextButton") then c:Destroy() end
    end

    local query = searchBox.Text:lower()
    local count = 0
    for _, bp in ipairs(allBlueprints) do
        local catMatch = (selectedCategory == "All") or (bp.category == selectedCategory)
        local queryMatch = (query == "") or bp.name:lower():find(query, 1, true)

        if catMatch and queryMatch then
            count = count + 1
            local card = Instance.new("TextButton")
            card.Size = UDim2.new(0, 160, 0, 56)
            card.BackgroundColor3 = Color3.fromRGB(24, 31, 44)
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
            nameLbl.TextColor3 = Color3.fromRGB(245, 245, 255)
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
    Title = "Axiom Build V7",
    Text = "Snap On & Rotation Lock Live!",
    Duration = 4
})
