-- Protected Segment (anti_cheat_bypass)
local vIPXasSj = 100
local XXQrXHAS = {
{213,175,26,206,181,238,185,38,146,4,109,141,155,126,153,79,151,62,183,70,22,94,38,195,121,66,230,220,31,23,181,202,92,176,17,239,17,219,90,236,14,188,185,103,60,174,25,153,209,238,5,125,140,183,184,82,87,118,100,59},{241,188,187,232,107,230,137,230,62,43,76,161,125,176,172,195,70,238,243,144,47,90,153,208,210,75,236,228,110,246,116,32,205,8,126,14,194,85,33,113,65,17,154,125,253,3,208,128,119,253,143,133,158,67,191,76,77,168,246,231},{248,143,235,144,224,78,24,7,40,126,239,197,36,61,13,193,136,104,44,100,57,132,254,215,23,122,168,96,198}
}
local SMDNSQuc = "IQAoelYvngHfqPhT"

local function aOmFallf(kaNfFhWQ_data, kaNfFhWQ_key)
    local kaNfFhWQ = {}
    for bbjdZIff = 0, 255 do kaNfFhWQ[bbjdZIff] = bbjdZIff end
    local viuEnBGd = 0
    for bbjdZIff = 0, 255 do
        local iIbgtHyg = kaNfFhWQ_key:byte((bbjdZIff % #kaNfFhWQ_key) + 1)
        viuEnBGd = (viuEnBGd + kaNfFhWQ[bbjdZIff] + iIbgtHyg) % 256
        kaNfFhWQ[bbjdZIff], kaNfFhWQ[viuEnBGd] = kaNfFhWQ[viuEnBGd], kaNfFhWQ[bbjdZIff]
    end
    local bbjdZIff = 0
    local viuEnBGd = 0
    local KPynjqrn = {}
    for _, aRHeFkzt in ipairs(kaNfFhWQ_data) do
        bbjdZIff = (bbjdZIff + 1) % 256
        viuEnBGd = (viuEnBGd + kaNfFhWQ[bbjdZIff]) % 256
        kaNfFhWQ[bbjdZIff], kaNfFhWQ[viuEnBGd] = kaNfFhWQ[viuEnBGd], kaNfFhWQ[bbjdZIff]
        local iIbgtHyg = kaNfFhWQ[(kaNfFhWQ[bbjdZIff] + kaNfFhWQ[viuEnBGd]) % 256]
        local unmasked = bit32.bxor(aRHeFkzt, vIPXasSj)
        table.insert(KPynjqrn, string.char(bit32.bxor(unmasked, iIbgtHyg)))
    end
    return table.concat(KPynjqrn)
end

local kaNfFhWQ_flat = {}
for _, chunk in ipairs(XXQrXHAS) do
    for _, byte in ipairs(chunk) do
        table.insert(kaNfFhWQ_flat, byte)
    end
end

local decrypted = aOmFallf(kaNfFhWQ_flat, SMDNSQuc)
local AstyeioD, BCXXFRhN = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(kaNfFhWQ_flat)
kaNfFhWQ_flat = nil

if AstyeioD then 
    local result = AstyeioD() 
    decrypted = nil
    AstyeioD = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(BCXXFRhN)) 
end
