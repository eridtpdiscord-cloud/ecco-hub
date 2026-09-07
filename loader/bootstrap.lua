--[[
    💎 ECCO HUB V3 — REMOTE BOOTSTRAP LOADER
    Minimal, modular, five-checkpoint execution pipeline
--]]

local EccoLoader = {
    VERSION = "3.0.0",
    DEFAULT_BACKEND = "https://eccohub.xyz"
}

function EccoLoader.init(overrides)
    local cfg = overrides or {}
    local backend = cfg.backend_url or EccoLoader.DEFAULT_BACKEND

    local function notify(title, msg, isError)
        local prefix = isError and "[Ecco Hub V3 Error] " or "[Ecco Hub V3] "
        warn(prefix .. title .. ": " .. tostring(msg))
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = title,
                Text = tostring(msg),
                Duration = 6
            })
        end)
    end

    -- Sequential Checkpoint Pipeline
    local cp1 = loadstring(game:HttpGet(backend .. "/loader/checkpoints/1_environment.lua", true))()
    local envRes = cp1.run()
    if not envRes.success then
        return notify("Checkpoint 1: Environment Failed", envRes.message, true)
    end

    local cp2 = loadstring(game:HttpGet(backend .. "/loader/checkpoints/2_configuration.lua", true))()
    local cfgRes = cp2.run(envRes.details, cfg)
    if not cfgRes.success then
        return notify("Checkpoint 2: Configuration Failed", cfgRes.message, true)
    end

    local cp3 = loadstring(game:HttpGet(backend .. "/loader/checkpoints/3_access.lua", true))()
    local authRes = cp3.run(cfgRes.config)
    if not authRes.success then
        return notify("Checkpoint 3: Access Denied", authRes.message, true)
    end

    local cp4 = loadstring(game:HttpGet(backend .. "/loader/checkpoints/4_integrity.lua", true))()
    local integRes = cp4.run(authRes.auth)
    if not integRes.success then
        return notify("Checkpoint 4: Integrity Violation", integRes.message, true)
    end

    local cp5 = loadstring(game:HttpGet(backend .. "/loader/checkpoints/5_payload.lua", true))()
    local payloadRes = cp5.run(cfgRes.config, integRes.verifiedSession)
    if not payloadRes.success then
        return notify("Checkpoint 5: Payload Boot Failed", payloadRes.message, true)
    end

    notify("Initialized Successfully", payloadRes.product.name .. " (v" .. payloadRes.product.version .. ") loaded.", false)
    return payloadRes
end

-- Self-boot if loaded standalone
if getgenv and not getgenv().ECCO_MANUAL_BOOT then
    return EccoLoader.init()
end

return EccoLoader
