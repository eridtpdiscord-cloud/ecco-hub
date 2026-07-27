-- Protected Segment (ui_themes)
local DPKyVIcy = 99
local bqjiPQeZ = {
{156,184,147,199,146,186,187,246,143,99,12,125,11,85,102,85,101,21,140,106,43,131,157,225,172,17,242,46,241,12,144,217,98,33,163,159,65,217,35,85,60,247,202,144,21,117,251,241,255,196,146,151,99,148,94,149,59,114,81,13},{177,127,197,131,202,223,90,128,138,235,89,236,163,67,58,19,148,66,73,50,225,3,32,192,76,152,5,176,230,118,144,31,152,148,207,36,3,159,130,185,226,102,128,49,196,62,42,108,214,97,0,214,242,215,150,45,213,103,38,194},{181,189,134,244,24,138,89,71,121,248,33,238,8,219,124,192,29,158,211,189,42}
}
local LatYOUTr = "RjaSpzIZRZNPfrGK"

local function lLhySxpX(ZktjUuyT_data, ZktjUuyT_key)
    if type(ZktjUuyT_key) ~= "string" or #ZktjUuyT_key == 0 then return "" end
    local ZktjUuyT = {}
    for qkPjzwBw = 0, 255 do ZktjUuyT[qkPjzwBw] = qkPjzwBw end
    local TQzndmss = 0
    for qkPjzwBw = 0, 255 do
        local fFRhYYKd = ZktjUuyT_key:byte((qkPjzwBw % #ZktjUuyT_key) + 1)
        TQzndmss = (TQzndmss + ZktjUuyT[qkPjzwBw] + fFRhYYKd) % 256
        ZktjUuyT[qkPjzwBw], ZktjUuyT[TQzndmss] = ZktjUuyT[TQzndmss], ZktjUuyT[qkPjzwBw]
    end
    local qkPjzwBw = 0
    local TQzndmss = 0
    local droYPjQp = {}
    for _, ClbLTRlN in ipairs(ZktjUuyT_data) do
        qkPjzwBw = (qkPjzwBw + 1) % 256
        TQzndmss = (TQzndmss + ZktjUuyT[qkPjzwBw]) % 256
        ZktjUuyT[qkPjzwBw], ZktjUuyT[TQzndmss] = ZktjUuyT[TQzndmss], ZktjUuyT[qkPjzwBw]
        local fFRhYYKd = ZktjUuyT[(ZktjUuyT[qkPjzwBw] + ZktjUuyT[TQzndmss]) % 256]
        local unmasked = bit32.bxor(ClbLTRlN, DPKyVIcy)
        table.insert(droYPjQp, string.char(bit32.bxor(unmasked, fFRhYYKd)))
    end
    return table.concat(droYPjQp)
end

local ZktjUuyT_flat = {}
for _, chunk in ipairs(bqjiPQeZ) do
    for _, byte in ipairs(chunk) do
        table.insert(ZktjUuyT_flat, byte)
    end
end

local decrypted = lLhySxpX(ZktjUuyT_flat, LatYOUTr)
local PVchgKZK, ChooHabH = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ZktjUuyT_flat)
ZktjUuyT_flat = nil

if PVchgKZK then 
    local result = PVchgKZK() 
    decrypted = nil
    PVchgKZK = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(ChooHabH)) 
end
