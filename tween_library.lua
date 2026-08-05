-- Protected Segment (tween_library)
local LqkxnNFV = 213
local WfDvzlGP = {
{232,204,89,44,122,103,65,4,215,5,225,184,129,155,244,203,106,63,53,254,214,55,139,52,123,73,186,93,80,97,232,50,175,223,66,251,209,65,204,44,164,186,91,115,223,28,8,66,17,223,72,11,213,69,204,180,171,122,14,186},{154,71,124,47,106,90,66,182,48,88,212,67,149,93,252,202,170,247,222,221,184,218,164,141,56,85,70,225,196,31,236,200,35,182,225,26,59,12,13,143,204,231,198,177,180,19,6,40,11,218,164,44,31,233,219,215,125,253,153,188},{181,103,190,160,12,231,68,139,115,70,196,60,70,75,178,32,116,223,175,220,72,76,17,219,226}
}
local iydVRivj = "zdvkqJarNpmvqXbM"

local function MWaRkGFC(pgddZshC_data, pgddZshC_key)
    if type(pgddZshC_key) ~= "string" or #pgddZshC_key == 0 then return "" end
    local pgddZshC = {}
    for yFgPNNmQ = 0, 255 do pgddZshC[yFgPNNmQ] = yFgPNNmQ end
    local WXJJGGJL = 0
    for yFgPNNmQ = 0, 255 do
        local OOxdiwaj = pgddZshC_key:byte((yFgPNNmQ % #pgddZshC_key) + 1)
        WXJJGGJL = (WXJJGGJL + pgddZshC[yFgPNNmQ] + OOxdiwaj) % 256
        pgddZshC[yFgPNNmQ], pgddZshC[WXJJGGJL] = pgddZshC[WXJJGGJL], pgddZshC[yFgPNNmQ]
    end
    local yFgPNNmQ = 0
    local WXJJGGJL = 0
    local YgNVOycg = {}
    for _, IgajggYZ in ipairs(pgddZshC_data) do
        yFgPNNmQ = (yFgPNNmQ + 1) % 256
        WXJJGGJL = (WXJJGGJL + pgddZshC[yFgPNNmQ]) % 256
        pgddZshC[yFgPNNmQ], pgddZshC[WXJJGGJL] = pgddZshC[WXJJGGJL], pgddZshC[yFgPNNmQ]
        local OOxdiwaj = pgddZshC[(pgddZshC[yFgPNNmQ] + pgddZshC[WXJJGGJL]) % 256]
        local unmasked = bit32.bxor(IgajggYZ, LqkxnNFV)
        table.insert(YgNVOycg, string.char(bit32.bxor(unmasked, OOxdiwaj)))
    end
    return table.concat(YgNVOycg)
end

local pgddZshC_flat = {}
for _, chunk in ipairs(WfDvzlGP) do
    for _, byte in ipairs(chunk) do
        table.insert(pgddZshC_flat, byte)
    end
end

local decrypted = MWaRkGFC(pgddZshC_flat, iydVRivj)
local qZSOdeNZ, VJPhLgDE = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(pgddZshC_flat)
pgddZshC_flat = nil

if qZSOdeNZ then 
    local result = qZSOdeNZ() 
    decrypted = nil
    qZSOdeNZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(VJPhLgDE)) 
end
