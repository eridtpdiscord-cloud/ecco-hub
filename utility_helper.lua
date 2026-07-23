-- Protected Segment (utility_helper)
local UFcJjVBB = 84
local DsYaoYrR = {
{65,195,105,88,7,204,12,162,171,170,163,45,8,146,112,89,37,180,97,171,7,199,173,152,62,136,114,223,184,38,67,43,40,123,195,56,4,16,167,142,168,86,117,227,212,3,122,212,123,141,141,121,37,238,189,161,88,60,75,17},{38,64,142,36,88,45,94,193,134,30,73,86,142,4,175,177,107,181,112,166,42,158,100,74,15,202,158,33,115,251,175,120,167,91,140,181,242,26,84,244,21,180,150,44,162,181,47,175,212,78,93,49,73,215,8,138,60,177,238,100},{202,3,72,147,200,231,188,217,188,211,15,0,34,59,22,153,119,14,168,74,127,115,242,222,225,233}
}
local ZInzctbX = "PsrdYcasrxxBxbsw"

local function SiTaMmxY(COSCSrDg_data, COSCSrDg_key)
    if type(COSCSrDg_key) ~= "string" or #COSCSrDg_key == 0 then return "" end
    local COSCSrDg = {}
    for OmEjugin = 0, 255 do COSCSrDg[OmEjugin] = OmEjugin end
    local RRashBvz = 0
    for OmEjugin = 0, 255 do
        local ceFMHkGj = COSCSrDg_key:byte((OmEjugin % #COSCSrDg_key) + 1)
        RRashBvz = (RRashBvz + COSCSrDg[OmEjugin] + ceFMHkGj) % 256
        COSCSrDg[OmEjugin], COSCSrDg[RRashBvz] = COSCSrDg[RRashBvz], COSCSrDg[OmEjugin]
    end
    local OmEjugin = 0
    local RRashBvz = 0
    local oAIFpqMO = {}
    for _, IcDOVfhL in ipairs(COSCSrDg_data) do
        OmEjugin = (OmEjugin + 1) % 256
        RRashBvz = (RRashBvz + COSCSrDg[OmEjugin]) % 256
        COSCSrDg[OmEjugin], COSCSrDg[RRashBvz] = COSCSrDg[RRashBvz], COSCSrDg[OmEjugin]
        local ceFMHkGj = COSCSrDg[(COSCSrDg[OmEjugin] + COSCSrDg[RRashBvz]) % 256]
        local unmasked = bit32.bxor(IcDOVfhL, UFcJjVBB)
        table.insert(oAIFpqMO, string.char(bit32.bxor(unmasked, ceFMHkGj)))
    end
    return table.concat(oAIFpqMO)
end

local COSCSrDg_flat = {}
for _, chunk in ipairs(DsYaoYrR) do
    for _, byte in ipairs(chunk) do
        table.insert(COSCSrDg_flat, byte)
    end
end

local decrypted = SiTaMmxY(COSCSrDg_flat, ZInzctbX)
local FjxuvlYp, jTLklZpu = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(COSCSrDg_flat)
COSCSrDg_flat = nil

if FjxuvlYp then 
    local result = FjxuvlYp() 
    decrypted = nil
    FjxuvlYp = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(jTLklZpu)) 
end
