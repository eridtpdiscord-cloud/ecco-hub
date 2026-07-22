-- Protected Segment (tween_library)
local cPVtWDec = 194
local jgozqOQc = {
{246,58,27,190,125,118,224,141,145,125,194,183,115,219,155,251,189,53,144,189,102,40,175,180,11,237,27,117,206,99,63,108,171,22,51,168,27,210,160,94,10,37,129,185,253,193,122,50,152,82,68,21,202,86,52,227,202,206,80,250},{17,157,16,150,247,179,78,115,140,131,81,146,141,193,81,41,158,212,236,143,255,18,13,47,236,199,70,134,3,237,115,168,1,66,49,200,19,228,44,42,112,201,170,46,149,71,42,157,24,238,119,75,168,150,77,33,43,35,238,39},{185,33,188,46,234,202,130,248,217,220,5,51,38,140,51,243,55,86,214,182,105,3,59,227,27}
}
local xukLcKkn = "lNyFKxvAOEaAGBNq"

local function yDgDWiol(MEPxpVzZ_data, MEPxpVzZ_key)
    local MEPxpVzZ = {}
    for mIBbCwLC = 0, 255 do MEPxpVzZ[mIBbCwLC] = mIBbCwLC end
    local etOBFJlr = 0
    for mIBbCwLC = 0, 255 do
        local wEXmTyuR = MEPxpVzZ_key:byte((mIBbCwLC % #MEPxpVzZ_key) + 1)
        etOBFJlr = (etOBFJlr + MEPxpVzZ[mIBbCwLC] + wEXmTyuR) % 256
        MEPxpVzZ[mIBbCwLC], MEPxpVzZ[etOBFJlr] = MEPxpVzZ[etOBFJlr], MEPxpVzZ[mIBbCwLC]
    end
    local mIBbCwLC = 0
    local etOBFJlr = 0
    local QrIwrweY = {}
    for _, OoeBpgAC in ipairs(MEPxpVzZ_data) do
        mIBbCwLC = (mIBbCwLC + 1) % 256
        etOBFJlr = (etOBFJlr + MEPxpVzZ[mIBbCwLC]) % 256
        MEPxpVzZ[mIBbCwLC], MEPxpVzZ[etOBFJlr] = MEPxpVzZ[etOBFJlr], MEPxpVzZ[mIBbCwLC]
        local wEXmTyuR = MEPxpVzZ[(MEPxpVzZ[mIBbCwLC] + MEPxpVzZ[etOBFJlr]) % 256]
        local unmasked = bit32.bxor(OoeBpgAC, cPVtWDec)
        table.insert(QrIwrweY, string.char(bit32.bxor(unmasked, wEXmTyuR)))
    end
    return table.concat(QrIwrweY)
end

local MEPxpVzZ_flat = {}
for _, chunk in ipairs(jgozqOQc) do
    for _, byte in ipairs(chunk) do
        table.insert(MEPxpVzZ_flat, byte)
    end
end

local decrypted = yDgDWiol(MEPxpVzZ_flat, xukLcKkn)
local BMWGmamL, rWmRLDBz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(MEPxpVzZ_flat)
MEPxpVzZ_flat = nil

if BMWGmamL then 
    local result = BMWGmamL() 
    decrypted = nil
    BMWGmamL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(rWmRLDBz)) 
end
