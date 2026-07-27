-- Protected Segment (math_vector_utils)
local SztiHngj = 82
local ihoeIojQ = {
{56,86,148,244,21,70,186,99,85,34,74,14,92,246,38,60,157,151,149,236,13,52,169,145,193,198,136,199,139,36,223,31,227,36,149,113,234,127,79,106,151,22,133,121,10,49,178,163,134,228,204,5,29,29,137,6,124,9,61,6},{16,185,23,133,137,196,39,144,207,61,77,150,162,235,84,55,113,124,82,35,37,129,131,108,107,154,41,43,0,204,222,80,203,162,222,224,129,53,23,61,213,197,239,155,131,18,8,235,197,180,139,216,126,147,116,187,66,169,0,118},{91,22,250,145,50,146,251,114,174,153,188,226,83,28,16,135,68,59,26,93,120,23,11,107,252,30,87,17,26}
}
local wHkxbGPj = "ALsrCICwuRDqFAyO"

local function WwEsRxvb(eLkhYYPJ_data, eLkhYYPJ_key)
    if type(eLkhYYPJ_key) ~= "string" or #eLkhYYPJ_key == 0 then return "" end
    local eLkhYYPJ = {}
    for zuMvtqoC = 0, 255 do eLkhYYPJ[zuMvtqoC] = zuMvtqoC end
    local FwjghiqG = 0
    for zuMvtqoC = 0, 255 do
        local BaRDMIFH = eLkhYYPJ_key:byte((zuMvtqoC % #eLkhYYPJ_key) + 1)
        FwjghiqG = (FwjghiqG + eLkhYYPJ[zuMvtqoC] + BaRDMIFH) % 256
        eLkhYYPJ[zuMvtqoC], eLkhYYPJ[FwjghiqG] = eLkhYYPJ[FwjghiqG], eLkhYYPJ[zuMvtqoC]
    end
    local zuMvtqoC = 0
    local FwjghiqG = 0
    local fZHdIXzK = {}
    for _, rpFZQEPA in ipairs(eLkhYYPJ_data) do
        zuMvtqoC = (zuMvtqoC + 1) % 256
        FwjghiqG = (FwjghiqG + eLkhYYPJ[zuMvtqoC]) % 256
        eLkhYYPJ[zuMvtqoC], eLkhYYPJ[FwjghiqG] = eLkhYYPJ[FwjghiqG], eLkhYYPJ[zuMvtqoC]
        local BaRDMIFH = eLkhYYPJ[(eLkhYYPJ[zuMvtqoC] + eLkhYYPJ[FwjghiqG]) % 256]
        local unmasked = bit32.bxor(rpFZQEPA, SztiHngj)
        table.insert(fZHdIXzK, string.char(bit32.bxor(unmasked, BaRDMIFH)))
    end
    return table.concat(fZHdIXzK)
end

local eLkhYYPJ_flat = {}
for _, chunk in ipairs(ihoeIojQ) do
    for _, byte in ipairs(chunk) do
        table.insert(eLkhYYPJ_flat, byte)
    end
end

local decrypted = WwEsRxvb(eLkhYYPJ_flat, wHkxbGPj)
local sGsgggCj, GhWGbQnL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(eLkhYYPJ_flat)
eLkhYYPJ_flat = nil

if sGsgggCj then 
    local result = sGsgggCj() 
    decrypted = nil
    sGsgggCj = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(GhWGbQnL)) 
end
