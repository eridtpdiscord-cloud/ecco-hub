-- Protected Segment (cache_invalidation)
local fLigFpIH = 119
local gkhRnDXU = {
{223,200,231,83,136,226,185,97,156,24,60,24,87,51,55,65,124,194,44,104,131,13,34,58,158,232,165,105,48,137,128,119,126,193,165,195,214,235,147,253,210,15,85,42,180,84,237,25,72,103,32,252,103,28,10,222,14,29,240,111},{120,47,104,192,65,34,85,50,129,11,244,101,9,9,10,227,240,30,130,84,116,130,172,57,112,35,81,22,135,177,199,244,66,169,114,99,51,8,172,122,2,76,22,147,244,26,27,249,137,36,21,40,37,57,209,247,15,221,61,197},{2,218,42,127,64,119,151,207,218,200,150,122,103,221,21,183,228,73,124,174,207,65,137,157,72,196,61,248,98,150}
}
local khFuULVJ = "fOhdniCGJtiBaxog"

local function aayUWQwU(GhUPcSYf_data, GhUPcSYf_key)
    if type(GhUPcSYf_key) ~= "string" or #GhUPcSYf_key == 0 then return "" end
    local GhUPcSYf = {}
    for NNwOTbGl = 0, 255 do GhUPcSYf[NNwOTbGl] = NNwOTbGl end
    local cadwrsEJ = 0
    for NNwOTbGl = 0, 255 do
        local KZHbtaYB = GhUPcSYf_key:byte((NNwOTbGl % #GhUPcSYf_key) + 1)
        cadwrsEJ = (cadwrsEJ + GhUPcSYf[NNwOTbGl] + KZHbtaYB) % 256
        GhUPcSYf[NNwOTbGl], GhUPcSYf[cadwrsEJ] = GhUPcSYf[cadwrsEJ], GhUPcSYf[NNwOTbGl]
    end
    local NNwOTbGl = 0
    local cadwrsEJ = 0
    local TAzixDGK = {}
    for _, SJJloiXM in ipairs(GhUPcSYf_data) do
        NNwOTbGl = (NNwOTbGl + 1) % 256
        cadwrsEJ = (cadwrsEJ + GhUPcSYf[NNwOTbGl]) % 256
        GhUPcSYf[NNwOTbGl], GhUPcSYf[cadwrsEJ] = GhUPcSYf[cadwrsEJ], GhUPcSYf[NNwOTbGl]
        local KZHbtaYB = GhUPcSYf[(GhUPcSYf[NNwOTbGl] + GhUPcSYf[cadwrsEJ]) % 256]
        local unmasked = bit32.bxor(SJJloiXM, fLigFpIH)
        table.insert(TAzixDGK, string.char(bit32.bxor(unmasked, KZHbtaYB)))
    end
    return table.concat(TAzixDGK)
end

local GhUPcSYf_flat = {}
for _, chunk in ipairs(gkhRnDXU) do
    for _, byte in ipairs(chunk) do
        table.insert(GhUPcSYf_flat, byte)
    end
end

local decrypted = aayUWQwU(GhUPcSYf_flat, khFuULVJ)
local dajMQZqp, bFACAvKP = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(GhUPcSYf_flat)
GhUPcSYf_flat = nil

if dajMQZqp then 
    local result = dajMQZqp() 
    decrypted = nil
    dajMQZqp = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(bFACAvKP)) 
end
