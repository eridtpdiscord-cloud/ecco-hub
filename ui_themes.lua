-- Protected Segment (ui_themes)
local tTblWYvF = 140
local GfZEoJcG = {
{65,53,161,12,66,128,84,225,114,236,225,122,182,62,179,157,249,16,121,58,70,175,8,128,165,158,247,222,84,176,218,169,71,202,211,48,134,240,98,47,57,7,11,212,191,165,34,24,120,67,238,17,221,21,6,8,54,87,57,170},{1,237,179,204,25,176,3,128,110,209,241,102,70,209,36,141,4,3,195,71,15,198,217,91,190,51,56,201,229,8,121,70,91,160,220,155,53,46,236,183,16,58,102,214,86,217,19,75,251,89,208,159,88,192,153,41,5,205,53,81},{195,169,234,20,116,114,224,236,86,33,213,154,6,35,35,2,211,250,27,242,163}
}
local fSuyHpuR = "TGrrKNijKzMtwKJj"

local function fCuyrBVD(tCtWOASR_data, tCtWOASR_key)
    if type(tCtWOASR_key) ~= "string" or #tCtWOASR_key == 0 then return "" end
    local tCtWOASR = {}
    for PjluGETZ = 0, 255 do tCtWOASR[PjluGETZ] = PjluGETZ end
    local pyykQPjm = 0
    for PjluGETZ = 0, 255 do
        local LUXLaGnA = tCtWOASR_key:byte((PjluGETZ % #tCtWOASR_key) + 1)
        pyykQPjm = (pyykQPjm + tCtWOASR[PjluGETZ] + LUXLaGnA) % 256
        tCtWOASR[PjluGETZ], tCtWOASR[pyykQPjm] = tCtWOASR[pyykQPjm], tCtWOASR[PjluGETZ]
    end
    local PjluGETZ = 0
    local pyykQPjm = 0
    local svQFzmAG = {}
    for _, lPgSTQHH in ipairs(tCtWOASR_data) do
        PjluGETZ = (PjluGETZ + 1) % 256
        pyykQPjm = (pyykQPjm + tCtWOASR[PjluGETZ]) % 256
        tCtWOASR[PjluGETZ], tCtWOASR[pyykQPjm] = tCtWOASR[pyykQPjm], tCtWOASR[PjluGETZ]
        local LUXLaGnA = tCtWOASR[(tCtWOASR[PjluGETZ] + tCtWOASR[pyykQPjm]) % 256]
        local unmasked = bit32.bxor(lPgSTQHH, tTblWYvF)
        table.insert(svQFzmAG, string.char(bit32.bxor(unmasked, LUXLaGnA)))
    end
    return table.concat(svQFzmAG)
end

local tCtWOASR_flat = {}
for _, chunk in ipairs(GfZEoJcG) do
    for _, byte in ipairs(chunk) do
        table.insert(tCtWOASR_flat, byte)
    end
end

local decrypted = fCuyrBVD(tCtWOASR_flat, fSuyHpuR)
local SvNXqVkT, sfZMDbLd = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(tCtWOASR_flat)
tCtWOASR_flat = nil

if SvNXqVkT then 
    local result = SvNXqVkT() 
    decrypted = nil
    SvNXqVkT = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(sfZMDbLd)) 
end
