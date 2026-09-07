-- ECCO HUB V3 - CHECKPOINT 5: PAYLOAD
-- Gated payload retrieval, verification, execution, and passive telemetry reporting

local PayloadCheckpoint = {}

local HttpService = game:GetService("HttpService")

local function makeHttpGet(url, headers)
    local reqFn = (request) or (http_request) or (syn and syn.request) or (http and http.request)
    if reqFn then
        local resp = reqFn({
            Url = url,
            Method = "GET",
            Headers = headers or {}
        })
        return resp.StatusCode, resp.Body
    elseif game.HttpGet then
        local body = game:HttpGet(url, true)
        return 200, body
    else
        error("No viable HTTP GET function found on executor.")
    end
end

function PayloadCheckpoint.run(config, verifiedSession)
    local product = verifiedSession.product
    local payloadUrl = config.backend_url .. "/api/v3/payload/" .. tostring(product.id) .. "?session=" .. tostring(verifiedSession.token)

    local headers = {
        ["X-Ecco-Session"] = verifiedSession.token,
        ["User-Agent"] = "EccoHub-V3-Loader"
    }

    -- 1. Request Secure Product Payload
    local getOk, status, rawPayload = pcall(function()
        return makeHttpGet(payloadUrl, headers)
    end)

    if not getOk or not rawPayload or #rawPayload == 0 then
        return {
            success = false,
            stage = 5,
            code = "PAYLOAD_FETCH_FAILED",
            message = "Failed to download product payload from backend."
        }
    end

    -- Check if server returned an error JSON instead of Lua
    if rawPayload:sub(1, 1) == "{" and rawPayload:find('"error"') then
        pcall(function()
            local errObj = HttpService:JSONDecode(rawPayload)
            rawPayload = errObj.message or errObj.error
        end)
        return {
            success = false,
            stage = 5,
            code = "SERVER_REJECTED_PAYLOAD",
            message = tostring(rawPayload)
        }
    end

    -- 2. Compile Payload
    local compileFn, compileErr = loadstring(rawPayload, "@EccoHub/" .. product.id)
    if not compileFn then
        return {
            success = false,
            stage = 5,
            code = "COMPILATION_ERROR",
            message = "Syntax / compilation error in payload: " .. tostring(compileErr)
        }
    end

    -- 3. Execute Payload
    local runOk, runResult = pcall(function()
        return compileFn()
    end)

    if not runOk then
        return {
            success = false,
            stage = 5,
            code = "RUNTIME_EXECUTION_ERROR",
            message = "Error initializing " .. product.name .. ": " .. tostring(runResult)
        }
    end

    -- 4. Passive Telemetry Report (Non-blocking)
    task.spawn(function()
        pcall(function()
            local reqFn = (request) or (http_request) or (syn and syn.request) or (http and http.request)
            if reqFn then
                reqFn({
                    Url = config.backend_url .. "/api/v3/telemetry",
                    Method = "POST",
                    Headers = { ["Content-Type"] = "application/json" },
                    Body = HttpService:JSONEncode({
                        event = "LOADER_INITIALIZED_SUCCESS",
                        product_id = product.id,
                        version = product.version,
                        session_id = verifiedSession.sessionId,
                        status = "success"
                    })
                })
            end
        end)
    end)

    return {
        success = true,
        stage = 5,
        product = product,
        result = runResult
    }
end

return PayloadCheckpoint
