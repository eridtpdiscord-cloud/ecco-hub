-- Protected Segment (math_vector_utils)
local ibKriiWK = 244
local JrqGsRWo = {
{221,234,128,72,107,203,24,35,16,183,172,72,238,44,14,112,187,160,144,24,121,79,253,201,162,103,181,217,237,220,206,13,8,167,161,216,154,219,1,107,130,155,98,79,207,103,120,68,79,51,66,220,52,208,158,139,144,219,168,90},{243,2,170,185,107,49,62,144,145,168,20,86,179,18,93,238,233,34,204,170,58,139,182,172,63,82,101,133,43,2,191,242,244,212,141,148,173,221,98,219,2,213,170,58,75,181,34,131,23,126,212,62,155,133,205,13,55,109,150,238},{197,255,76,188,91,147,233,237,169,139,58,174,124,118,52,229,26,133,175,138,178,113,201,175,92,173,224,20,213}
}
local uCkUPyDS = "IlLcWOsOvzLqbiDp"

local function xczyyOKD(ooAJHNpY_data, ooAJHNpY_key)
    if type(ooAJHNpY_key) ~= "string" or #ooAJHNpY_key == 0 then return "" end
    local ooAJHNpY = {}
    for mkWgcNaZ = 0, 255 do ooAJHNpY[mkWgcNaZ] = mkWgcNaZ end
    local aWBDQgkD = 0
    for mkWgcNaZ = 0, 255 do
        local eUVRdsjc = ooAJHNpY_key:byte((mkWgcNaZ % #ooAJHNpY_key) + 1)
        aWBDQgkD = (aWBDQgkD + ooAJHNpY[mkWgcNaZ] + eUVRdsjc) % 256
        ooAJHNpY[mkWgcNaZ], ooAJHNpY[aWBDQgkD] = ooAJHNpY[aWBDQgkD], ooAJHNpY[mkWgcNaZ]
    end
    local mkWgcNaZ = 0
    local aWBDQgkD = 0
    local vHPuPuSC = {}
    for _, knXnIcYX in ipairs(ooAJHNpY_data) do
        mkWgcNaZ = (mkWgcNaZ + 1) % 256
        aWBDQgkD = (aWBDQgkD + ooAJHNpY[mkWgcNaZ]) % 256
        ooAJHNpY[mkWgcNaZ], ooAJHNpY[aWBDQgkD] = ooAJHNpY[aWBDQgkD], ooAJHNpY[mkWgcNaZ]
        local eUVRdsjc = ooAJHNpY[(ooAJHNpY[mkWgcNaZ] + ooAJHNpY[aWBDQgkD]) % 256]
        local unmasked = bit32.bxor(knXnIcYX, ibKriiWK)
        table.insert(vHPuPuSC, string.char(bit32.bxor(unmasked, eUVRdsjc)))
    end
    return table.concat(vHPuPuSC)
end

local ooAJHNpY_flat = {}
for _, chunk in ipairs(JrqGsRWo) do
    for _, byte in ipairs(chunk) do
        table.insert(ooAJHNpY_flat, byte)
    end
end

local decrypted = xczyyOKD(ooAJHNpY_flat, uCkUPyDS)
local xFrLrYzp, puaZBCvr = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ooAJHNpY_flat)
ooAJHNpY_flat = nil

if xFrLrYzp then 
    local result = xFrLrYzp() 
    decrypted = nil
    xFrLrYzp = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(puaZBCvr)) 
end
