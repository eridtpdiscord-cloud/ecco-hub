-- ECCO HUB V3 - CHECKPOINT 2: CONFIGURATION
-- Validates loader configuration, parameters, target backend, and key acquisition

local ConfigCheckpoint = {}

ConfigCheckpoint.LOADER_VERSION = "3.0.0"
ConfigCheckpoint.DEFAULT_BACKEND = "https://eccohub.xyz"

function ConfigCheckpoint.run(envDetails, userOverrides)
    local cfg = userOverrides or {}
    local errors = {}

    -- 1. Validate Loader Version
    local loaderVersion = cfg.loader_version or ConfigCheckpoint.LOADER_VERSION
    if not loaderVersion:match("^%d+%.%d+%.%d+$") then
        table.insert(errors, "Malformed loader version string: " .. tostring(loaderVersion))
    end

    -- 2. Validate Target Backend URL
    local backendUrl = cfg.backend_url or ConfigCheckpoint.DEFAULT_BACKEND
    if not backendUrl:match("^https?://") then
        table.insert(errors, "Invalid backend URL scheme: " .. tostring(backendUrl))
    end
    -- Strip trailing slash
    backendUrl = backendUrl:gsub("/+$", "")

    -- 3. Resolve License Key
    local key = cfg.key
    if not key or key == "" then
        -- Attempt reading from getgenv or workspace file
        local genv = (getgenv and getgenv()) or _G
        if genv and genv.ECCO_KEY then
            key = tostring(genv.ECCO_KEY)
        elseif isfile and readfile and isfile("ecco_key.txt") then
            pcall(function()
                key = readfile("ecco_key.txt"):gsub("%s+", "")
            end)
        end
    end

    if not key or key == "" then
        table.insert(errors, "License Key missing. Provide via getgenv().ECCO_KEY = '...' or ecco_key.txt")
    end

    -- 4. Validate Place ID
    local placeId = envDetails and envDetails.placeId
    if not placeId or placeId == 0 then
        table.insert(errors, "Missing or invalid PlaceId.")
    end

    -- 5. Resolve HWID
    local hwid = "HWID_FALLBACK"
    pcall(function()
        local rbxAnalytics = game:GetService("RbxAnalyticsService")
        if rbxAnalytics and rbxAnalytics.GetClientId then
            hwid = rbxAnalytics:GetClientId()
        end
    end)

    if #errors > 0 then
        return {
            success = false,
            stage = 2,
            code = "CONFIG_CHECK_FAILED",
            errors = errors,
            message = table.concat(errors, " | ")
        }
    end

    return {
        success = true,
        stage = 2,
        config = {
            loader_version = loaderVersion,
            backend_url = backendUrl,
            key = key,
            hwid = hwid,
            place_id = tostring(placeId),
            user_id = envDetails and envDetails.userId or 0,
            username = envDetails and envDetails.username or "RobloxUser"
        }
    }
end

return ConfigCheckpoint
