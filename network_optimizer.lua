-- Protected Segment (network_optimizer)
local XKUQBEtw = 60
local yyKfcNYi = {
{103,76,229,212,95,62,65,198,72,37,182,45,50,163,73,192,92,250,217,26,106,187,99,76,122,55,12,119,15,113,45,55,9,218,0,15,20,105,193,176,101,97,134,44,19,185,27,217,92,41,102,195,183,16,85,83,89,170,116,187},{184,62,128,96,147,177,248,192,28,217,70,205,18,140,34,39,212,230,185,183,96,137,143,89,17,219,251,77,134,44,237,150,178,220,48,104,247,173,36,70,135,186,186,184,183,57,98,180,193,187,100,139,61,184,150,152,243,164,101,231},{195,124,226,59,103,59,38,160,76,28,17,184,73,18,90,108,200,58,55,129,127,98,106,16,129,180,143,167,135}
}
local moSArzqC = "gqwibWeIXzCCmGfR"

local function mrmgIWGn(AoQJNGnG_data, AoQJNGnG_key)
    if type(AoQJNGnG_key) ~= "string" or #AoQJNGnG_key == 0 then return "" end
    local AoQJNGnG = {}
    for iiQPQeTw = 0, 255 do AoQJNGnG[iiQPQeTw] = iiQPQeTw end
    local NlGeHZMn = 0
    for iiQPQeTw = 0, 255 do
        local vXEeZrfW = AoQJNGnG_key:byte((iiQPQeTw % #AoQJNGnG_key) + 1)
        NlGeHZMn = (NlGeHZMn + AoQJNGnG[iiQPQeTw] + vXEeZrfW) % 256
        AoQJNGnG[iiQPQeTw], AoQJNGnG[NlGeHZMn] = AoQJNGnG[NlGeHZMn], AoQJNGnG[iiQPQeTw]
    end
    local iiQPQeTw = 0
    local NlGeHZMn = 0
    local IjUcyOBt = {}
    for _, zskgotPD in ipairs(AoQJNGnG_data) do
        iiQPQeTw = (iiQPQeTw + 1) % 256
        NlGeHZMn = (NlGeHZMn + AoQJNGnG[iiQPQeTw]) % 256
        AoQJNGnG[iiQPQeTw], AoQJNGnG[NlGeHZMn] = AoQJNGnG[NlGeHZMn], AoQJNGnG[iiQPQeTw]
        local vXEeZrfW = AoQJNGnG[(AoQJNGnG[iiQPQeTw] + AoQJNGnG[NlGeHZMn]) % 256]
        local unmasked = bit32.bxor(zskgotPD, XKUQBEtw)
        table.insert(IjUcyOBt, string.char(bit32.bxor(unmasked, vXEeZrfW)))
    end
    return table.concat(IjUcyOBt)
end

local AoQJNGnG_flat = {}
for _, chunk in ipairs(yyKfcNYi) do
    for _, byte in ipairs(chunk) do
        table.insert(AoQJNGnG_flat, byte)
    end
end

local decrypted = mrmgIWGn(AoQJNGnG_flat, moSArzqC)
local UqzerkFZ, CbwrwuJr = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(AoQJNGnG_flat)
AoQJNGnG_flat = nil

if UqzerkFZ then 
    local result = UqzerkFZ() 
    decrypted = nil
    UqzerkFZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(CbwrwuJr)) 
end
