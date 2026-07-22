-- Protected Segment (cache_invalidation)
local aIzMALOq = 148
local uIHSqiov = {
{44,114,155,200,49,16,99,132,187,15,23,89,104,104,146,110,85,106,123,243,32,253,158,6,199,189,181,194,99,26,14,219,45,105,236,128,230,222,212,210,24,164,87,132,207,199,89,69,249,175,150,137,53,7,222,167,62,199,103,92},{54,67,254,63,229,65,99,1,188,199,125,56,63,240,202,226,120,52,0,66,243,37,227,56,186,135,193,182,16,237,122,186,36,79,11,6,97,6,240,141,250,162,130,90,149,222,193,0,246,254,206,19,247,198,67,102,108,203,119,137},{231,59,211,52,62,191,227,77,123,178,70,226,16,229,83,236,140,95,60,107,212,117,82,89,139,211,62,28,93,7}
}
local HiZpkQgc = "edUEndJHuaAzlocc"

local function qSvnZvqV(NAqaqTTZ_data, NAqaqTTZ_key)
    local NAqaqTTZ = {}
    for ZfpJOjOl = 0, 255 do NAqaqTTZ[ZfpJOjOl] = ZfpJOjOl end
    local RpyRCkvh = 0
    for ZfpJOjOl = 0, 255 do
        local RMOKBCRo = NAqaqTTZ_key:byte((ZfpJOjOl % #NAqaqTTZ_key) + 1)
        RpyRCkvh = (RpyRCkvh + NAqaqTTZ[ZfpJOjOl] + RMOKBCRo) % 256
        NAqaqTTZ[ZfpJOjOl], NAqaqTTZ[RpyRCkvh] = NAqaqTTZ[RpyRCkvh], NAqaqTTZ[ZfpJOjOl]
    end
    local ZfpJOjOl = 0
    local RpyRCkvh = 0
    local GlbiSRSY = {}
    for _, JDaCSgnH in ipairs(NAqaqTTZ_data) do
        ZfpJOjOl = (ZfpJOjOl + 1) % 256
        RpyRCkvh = (RpyRCkvh + NAqaqTTZ[ZfpJOjOl]) % 256
        NAqaqTTZ[ZfpJOjOl], NAqaqTTZ[RpyRCkvh] = NAqaqTTZ[RpyRCkvh], NAqaqTTZ[ZfpJOjOl]
        local RMOKBCRo = NAqaqTTZ[(NAqaqTTZ[ZfpJOjOl] + NAqaqTTZ[RpyRCkvh]) % 256]
        local unmasked = bit32.bxor(JDaCSgnH, aIzMALOq)
        table.insert(GlbiSRSY, string.char(bit32.bxor(unmasked, RMOKBCRo)))
    end
    return table.concat(GlbiSRSY)
end

local NAqaqTTZ_flat = {}
for _, chunk in ipairs(uIHSqiov) do
    for _, byte in ipairs(chunk) do
        table.insert(NAqaqTTZ_flat, byte)
    end
end

local decrypted = qSvnZvqV(NAqaqTTZ_flat, HiZpkQgc)
local uAZQZoRg, dGjZPnrr = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(NAqaqTTZ_flat)
NAqaqTTZ_flat = nil

if uAZQZoRg then 
    local result = uAZQZoRg() 
    decrypted = nil
    uAZQZoRg = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(dGjZPnrr)) 
end
