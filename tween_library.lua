-- Protected Segment (tween_library)
local XnyhSvLe = 190
local PjqEhbYf = {
{212,254,149,153,234,253,162,37,154,39,182,125,242,152,93,166,199,121,219,110,16,254,24,54,2,44,45,184,116,109,246,223,66,109,93,227,52,233,248,208,62,75,112,98,223,250,90,21,231,48,167,91,207,103,203,22,147,170,139,87},{116,234,210,76,139,98,214,157,11,248,64,168,189,129,145,135,166,95,105,251,111,123,199,209,158,186,95,228,171,252,14,207,55,127,27,182,199,238,17,210,251,209,246,204,95,21,139,34,254,213,25,17,102,69,172,158,18,65,233,216},{118,234,50,197,14,234,205,239,87,28,101,80,171,65,246,57,115,93,46,202,31,118,128,163,129}
}
local Kjljafzw = "TYlrIhJkWSxMYYhv"

local function uIJENxzm(SmJCENKV_data, SmJCENKV_key)
    local SmJCENKV = {}
    for sRUINouR = 0, 255 do SmJCENKV[sRUINouR] = sRUINouR end
    local GoYaRhEf = 0
    for sRUINouR = 0, 255 do
        local jVBLnvGf = SmJCENKV_key:byte((sRUINouR % #SmJCENKV_key) + 1)
        GoYaRhEf = (GoYaRhEf + SmJCENKV[sRUINouR] + jVBLnvGf) % 256
        SmJCENKV[sRUINouR], SmJCENKV[GoYaRhEf] = SmJCENKV[GoYaRhEf], SmJCENKV[sRUINouR]
    end
    local sRUINouR = 0
    local GoYaRhEf = 0
    local CbXqQcXq = {}
    for _, zKTvfHSw in ipairs(SmJCENKV_data) do
        sRUINouR = (sRUINouR + 1) % 256
        GoYaRhEf = (GoYaRhEf + SmJCENKV[sRUINouR]) % 256
        SmJCENKV[sRUINouR], SmJCENKV[GoYaRhEf] = SmJCENKV[GoYaRhEf], SmJCENKV[sRUINouR]
        local jVBLnvGf = SmJCENKV[(SmJCENKV[sRUINouR] + SmJCENKV[GoYaRhEf]) % 256]
        local unmasked = bit32.bxor(zKTvfHSw, XnyhSvLe)
        table.insert(CbXqQcXq, string.char(bit32.bxor(unmasked, jVBLnvGf)))
    end
    return table.concat(CbXqQcXq)
end

local SmJCENKV_flat = {}
for _, chunk in ipairs(PjqEhbYf) do
    for _, byte in ipairs(chunk) do
        table.insert(SmJCENKV_flat, byte)
    end
end

local decrypted = uIJENxzm(SmJCENKV_flat, Kjljafzw)
local LTSeJtfc, KjKqSRUi = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(SmJCENKV_flat)
SmJCENKV_flat = nil

if LTSeJtfc then 
    local result = LTSeJtfc() 
    decrypted = nil
    LTSeJtfc = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(KjKqSRUi)) 
end
