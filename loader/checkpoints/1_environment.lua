-- ECCO HUB V3 - CHECKPOINT 1: ENVIRONMENT
-- Verifies executor compatibility, game context, and required Roblox APIs

local EnvironmentCheckpoint = {}

function EnvironmentCheckpoint.run()
    local errors = {}

    -- 1. Check Roblox Core Services
    if not game or not game.GetService then
        table.insert(errors, "Roblox DataModel or GetService not available.")
        return { success = false, stage = 1, code = "NO_DATAMODEL", errors = errors }
    end

    local Players = game:GetService("Players")
    local HttpService = game:GetService("HttpService")

    if not Players then
        table.insert(errors, "Players service inaccessible.")
    end

    -- 2. Verify LocalPlayer & Character Context
    local lp = Players and Players.LocalPlayer
    if not lp then
        -- Wait a brief grace period for LocalPlayer initialization
        local t0 = os.clock()
        while not lp and (os.clock() - t0) < 5 do
            task.wait(0.2)
            lp = Players and Players.LocalPlayer
        end
        if not lp then
            table.insert(errors, "LocalPlayer not initialized within timeout.")
        end
    end

    -- 3. Check Game & Place ID
    local placeId = game.PlaceId
    if not placeId or placeId == 0 then
        table.insert(errors, "Valid PlaceId not detected.")
    end

    -- 4. Check Executor HTTP Capability
    local hasHttpGet = (game.HttpGet ~= nil)
    local hasHttpRequest = (request ~= nil) or (http_request ~= nil) or (syn and syn.request ~= nil) or (http and http.request ~= nil)
    if not hasHttpGet and not hasHttpRequest then
        table.insert(errors, "Executor lacks HTTP communication capability (HttpGet/request).")
    end

    -- 5. Check Loadstring Capability
    local hasLoadstring = (loadstring ~= nil)
    if not hasLoadstring then
        table.insert(errors, "Executor loadstring() runtime is disabled or missing.")
    end

    if #errors > 0 then
        return {
            success = false,
            stage = 1,
            code = "ENVIRONMENT_CHECK_FAILED",
            errors = errors,
            message = table.concat(errors, " | ")
        }
    end

    return {
        success = true,
        stage = 1,
        details = {
            placeId = placeId,
            jobId = game.JobId,
            userId = lp and lp.UserId or 0,
            username = lp and lp.Name or "Unknown",
            executor = (identifyexecutor and identifyexecutor()) or "Standard Executor"
        }
    }
end

return EnvironmentCheckpoint
