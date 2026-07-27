-- Protected Segment (cache_invalidation)
local qXhomqlS = 101
local PKsktUbe = {
{123,248,78,164,4,181,183,215,134,156,72,68,141,212,235,174,115,116,17,143,6,27,159,165,214,22,15,138,123,44,73,17,146,65,148,21,124,67,60,41,247,103,84,238,48,74,102,99,209,127,72,163,168,185,97,238,23,222,126,221},{229,175,72,143,94,212,113,251,74,152,156,79,173,144,200,225,216,81,101,145,10,210,101,124,196,84,48,119,87,25,128,109,44,60,186,14,155,196,107,119,26,49,43,198,169,87,241,134,63,16,26,191,239,166,171,91,178,128,243,37},{255,100,163,126,149,229,216,55,14,215,149,251,57,132,13,248,95,20,49,248,157,80,89,137,181,186,193,223,23,173}
}
local rHDASMQW = "halQCqOIJRgyzoJA"

local function KWfNiyBo(RCFLBpKA_data, RCFLBpKA_key)
    if type(RCFLBpKA_key) ~= "string" or #RCFLBpKA_key == 0 then return "" end
    local RCFLBpKA = {}
    for gSIXbvsU = 0, 255 do RCFLBpKA[gSIXbvsU] = gSIXbvsU end
    local lwFKpMGq = 0
    for gSIXbvsU = 0, 255 do
        local GqWIErMQ = RCFLBpKA_key:byte((gSIXbvsU % #RCFLBpKA_key) + 1)
        lwFKpMGq = (lwFKpMGq + RCFLBpKA[gSIXbvsU] + GqWIErMQ) % 256
        RCFLBpKA[gSIXbvsU], RCFLBpKA[lwFKpMGq] = RCFLBpKA[lwFKpMGq], RCFLBpKA[gSIXbvsU]
    end
    local gSIXbvsU = 0
    local lwFKpMGq = 0
    local QCEfnwoJ = {}
    for _, tNftIVoH in ipairs(RCFLBpKA_data) do
        gSIXbvsU = (gSIXbvsU + 1) % 256
        lwFKpMGq = (lwFKpMGq + RCFLBpKA[gSIXbvsU]) % 256
        RCFLBpKA[gSIXbvsU], RCFLBpKA[lwFKpMGq] = RCFLBpKA[lwFKpMGq], RCFLBpKA[gSIXbvsU]
        local GqWIErMQ = RCFLBpKA[(RCFLBpKA[gSIXbvsU] + RCFLBpKA[lwFKpMGq]) % 256]
        local unmasked = bit32.bxor(tNftIVoH, qXhomqlS)
        table.insert(QCEfnwoJ, string.char(bit32.bxor(unmasked, GqWIErMQ)))
    end
    return table.concat(QCEfnwoJ)
end

local RCFLBpKA_flat = {}
for _, chunk in ipairs(PKsktUbe) do
    for _, byte in ipairs(chunk) do
        table.insert(RCFLBpKA_flat, byte)
    end
end

local decrypted = KWfNiyBo(RCFLBpKA_flat, rHDASMQW)
local FDgnCaGR, LoUwzLCO = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(RCFLBpKA_flat)
RCFLBpKA_flat = nil

if FDgnCaGR then 
    local result = FDgnCaGR() 
    decrypted = nil
    FDgnCaGR = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(LoUwzLCO)) 
end
