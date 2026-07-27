-- Protected Segment (teleport_handler)
local QJkprVUC = 183
local NsIenYlq = {
{115,228,185,54,190,157,37,213,124,33,220,20,52,237,157,202,182,253,138,51,9,92,100,146,66,85,210,75,205,54,67,148,17,163,162,10,26,9,33,62,218,79,38,138,34,212,41,210,219,144,28,120,157,133,77,150,46,206,235,94},{37,13,251,242,41,22,216,150,43,26,9,66,230,125,62,213,227,174,129,94,168,192,78,16,34,220,56,45,243,109,23,55,249,118,206,112,65,30,183,165,111,44,105,40,39,100,121,80,72,35,145,97,249,202,75,90,229,172,37,109},{228,182,171,10,199,48,86,177,15,56,85,37,80,163,93,241,197,32,187,59,180,178,135,239,57,32,231,199}
}
local zSXWHWId = "YCfOCKLsjyoppIdR"

local function NQWxZvWT(EpQqdvHv_data, EpQqdvHv_key)
    if type(EpQqdvHv_key) ~= "string" or #EpQqdvHv_key == 0 then return "" end
    local EpQqdvHv = {}
    for onVwawiS = 0, 255 do EpQqdvHv[onVwawiS] = onVwawiS end
    local oZqLXYRK = 0
    for onVwawiS = 0, 255 do
        local kFubwzHP = EpQqdvHv_key:byte((onVwawiS % #EpQqdvHv_key) + 1)
        oZqLXYRK = (oZqLXYRK + EpQqdvHv[onVwawiS] + kFubwzHP) % 256
        EpQqdvHv[onVwawiS], EpQqdvHv[oZqLXYRK] = EpQqdvHv[oZqLXYRK], EpQqdvHv[onVwawiS]
    end
    local onVwawiS = 0
    local oZqLXYRK = 0
    local fBMFAiLY = {}
    for _, xuPnlOWL in ipairs(EpQqdvHv_data) do
        onVwawiS = (onVwawiS + 1) % 256
        oZqLXYRK = (oZqLXYRK + EpQqdvHv[onVwawiS]) % 256
        EpQqdvHv[onVwawiS], EpQqdvHv[oZqLXYRK] = EpQqdvHv[oZqLXYRK], EpQqdvHv[onVwawiS]
        local kFubwzHP = EpQqdvHv[(EpQqdvHv[onVwawiS] + EpQqdvHv[oZqLXYRK]) % 256]
        local unmasked = bit32.bxor(xuPnlOWL, QJkprVUC)
        table.insert(fBMFAiLY, string.char(bit32.bxor(unmasked, kFubwzHP)))
    end
    return table.concat(fBMFAiLY)
end

local EpQqdvHv_flat = {}
for _, chunk in ipairs(NsIenYlq) do
    for _, byte in ipairs(chunk) do
        table.insert(EpQqdvHv_flat, byte)
    end
end

local decrypted = NQWxZvWT(EpQqdvHv_flat, zSXWHWId)
local fMDgYnxA, YYZeLsLU = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(EpQqdvHv_flat)
EpQqdvHv_flat = nil

if fMDgYnxA then 
    local result = fMDgYnxA() 
    decrypted = nil
    fMDgYnxA = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(YYZeLsLU)) 
end
