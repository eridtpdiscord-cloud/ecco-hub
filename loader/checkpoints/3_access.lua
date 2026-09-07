-- ECCO HUB V3 - CHECKPOINT 3: ACCESS
-- Handles server-side license verification, product entitlement, and session establishment

local AccessCheckpoint = {}

local HttpService = game:GetService("HttpService")

local function makeHttpPost(url, payloadJson)
    local reqFn = (request) or (http_request) or (syn and syn.request) or (http and http.request)
    if reqFn then
        local resp = reqFn({
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = payloadJson
        })
        return resp.StatusCode, resp.Body
    elseif game.HttpPost then
        local body = game:HttpPost(url, payloadJson, "application/json")
        return 200, body
    else
        error("No viable HTTP POST function found on executor.")
    end
end

function AccessCheckpoint.run(config)
    local authUrl = config.backend_url .. "/api/v3/auth/validate"

    local requestPayload = {
        key = config.key,
        place_id = tostring(config.place_id),
        loader_version = config.loader_version,
        hwid = config.hwid,
        user_id = tostring(config.user_id),
        username = config.username
    }

    local payloadJson = HttpService:JSONEncode(requestPayload)
    local ok, statusCode, responseBody = pcall(function()
        return makeHttpPost(authUrl, payloadJson)
    end)

    if not ok then
        return {
            success = false,
            stage = 3,
            code = "NETWORK_ERROR",
            message = "Failed to communicate with Ecco Hub backend: " .. tostring(statusCode)
        }
    end

    local decodeOk, res = pcall(function()
        return HttpService:JSONDecode(responseBody)
    end)

    if not decodeOk or not res then
        return {
            success = false,
            stage = 3,
            code = "MALFORMED_SERVER_RESPONSE",
            message = "Server returned non-JSON response."
        }
    end

    if not res.success then
        return {
            success = false,
            stage = 3,
            code = res.error or "AUTH_FAILED",
            message = res.message or "Access validation denied by server."
        }
    end

    return {
        success = true,
        stage = 3,
        auth = res
    }
end

return AccessCheckpoint
