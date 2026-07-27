-- Protected Segment (network_optimizer)
local RaUYQjyA = 64
local zqPvbXdv = {
{71,42,121,147,164,57,71,50,186,175,124,252,53,39,206,188,44,148,199,103,145,211,249,189,169,118,136,173,122,145,144,5,12,110,238,18,139,253,231,204,12,118,87,139,28,51,32,21,207,204,215,72,42,79,129,226,175,122,136,149},{20,193,116,38,74,251,228,121,36,227,164,193,14,137,27,159,83,42,240,80,10,229,22,179,224,27,61,63,251,166,52,168,134,148,159,109,133,180,19,47,54,171,144,232,89,75,2,198,124,247,120,221,174,56,248,246,171,180,47,234},{122,86,242,47,206,152,108,102,120,219,153,70,168,234,243,247,170,118,189,47,20,254,255,122,181,145,144,125,101}
}
local YgExEByh = "mTSgakLMGihLZXMm"

local function JUDuACJC(smSKaZck_data, smSKaZck_key)
    if type(smSKaZck_key) ~= "string" or #smSKaZck_key == 0 then return "" end
    local smSKaZck = {}
    for ZzqeYpNy = 0, 255 do smSKaZck[ZzqeYpNy] = ZzqeYpNy end
    local aWuSgqZu = 0
    for ZzqeYpNy = 0, 255 do
        local VvzMKIIT = smSKaZck_key:byte((ZzqeYpNy % #smSKaZck_key) + 1)
        aWuSgqZu = (aWuSgqZu + smSKaZck[ZzqeYpNy] + VvzMKIIT) % 256
        smSKaZck[ZzqeYpNy], smSKaZck[aWuSgqZu] = smSKaZck[aWuSgqZu], smSKaZck[ZzqeYpNy]
    end
    local ZzqeYpNy = 0
    local aWuSgqZu = 0
    local mOBZamIo = {}
    for _, TqPdCChA in ipairs(smSKaZck_data) do
        ZzqeYpNy = (ZzqeYpNy + 1) % 256
        aWuSgqZu = (aWuSgqZu + smSKaZck[ZzqeYpNy]) % 256
        smSKaZck[ZzqeYpNy], smSKaZck[aWuSgqZu] = smSKaZck[aWuSgqZu], smSKaZck[ZzqeYpNy]
        local VvzMKIIT = smSKaZck[(smSKaZck[ZzqeYpNy] + smSKaZck[aWuSgqZu]) % 256]
        local unmasked = bit32.bxor(TqPdCChA, RaUYQjyA)
        table.insert(mOBZamIo, string.char(bit32.bxor(unmasked, VvzMKIIT)))
    end
    return table.concat(mOBZamIo)
end

local smSKaZck_flat = {}
for _, chunk in ipairs(zqPvbXdv) do
    for _, byte in ipairs(chunk) do
        table.insert(smSKaZck_flat, byte)
    end
end

local decrypted = JUDuACJC(smSKaZck_flat, YgExEByh)
local JDHetXKB, hlxrRmvy = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(smSKaZck_flat)
smSKaZck_flat = nil

if JDHetXKB then 
    local result = JDHetXKB() 
    decrypted = nil
    JDHetXKB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(hlxrRmvy)) 
end
