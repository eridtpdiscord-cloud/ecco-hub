-- Protected Segment (math_vector_utils)
local PTriZMjU = 130
local DJpkaLNo = {
{116,3,61,147,199,157,207,180,18,125,60,210,101,22,9,159,93,15,161,223,130,65,82,247,254,19,7,253,235,34,94,39,210,245,30,82,190,78,107,164,138,151,251,26,46,108,146,16,57,42,17,190,164,126,135,23,47,32,200,43},{104,248,242,183,246,152,222,116,60,67,169,39,237,87,128,8,74,200,28,13,129,105,67,27,190,137,254,189,184,223,79,3,55,103,119,164,69,76,26,95,204,125,255,51,67,136,200,26,12,217,35,228,119,27,240,250,242,140,118,75},{24,128,101,2,241,106,47,193,127,33,245,26,139,107,203,96,14,149,208,10,136,145,3,98,81,7,83,125,55}
}
local pCbozAOU = "EXrjsAPFWYtENGpW"

local function wujdoUBk(yeYPLykU_data, yeYPLykU_key)
    if type(yeYPLykU_key) ~= "string" or #yeYPLykU_key == 0 then return "" end
    local yeYPLykU = {}
    for yuHMgxEy = 0, 255 do yeYPLykU[yuHMgxEy] = yuHMgxEy end
    local HfnImzXx = 0
    for yuHMgxEy = 0, 255 do
        local AugEnZHj = yeYPLykU_key:byte((yuHMgxEy % #yeYPLykU_key) + 1)
        HfnImzXx = (HfnImzXx + yeYPLykU[yuHMgxEy] + AugEnZHj) % 256
        yeYPLykU[yuHMgxEy], yeYPLykU[HfnImzXx] = yeYPLykU[HfnImzXx], yeYPLykU[yuHMgxEy]
    end
    local yuHMgxEy = 0
    local HfnImzXx = 0
    local HHixrbMX = {}
    for _, qCfYOquu in ipairs(yeYPLykU_data) do
        yuHMgxEy = (yuHMgxEy + 1) % 256
        HfnImzXx = (HfnImzXx + yeYPLykU[yuHMgxEy]) % 256
        yeYPLykU[yuHMgxEy], yeYPLykU[HfnImzXx] = yeYPLykU[HfnImzXx], yeYPLykU[yuHMgxEy]
        local AugEnZHj = yeYPLykU[(yeYPLykU[yuHMgxEy] + yeYPLykU[HfnImzXx]) % 256]
        local unmasked = bit32.bxor(qCfYOquu, PTriZMjU)
        table.insert(HHixrbMX, string.char(bit32.bxor(unmasked, AugEnZHj)))
    end
    return table.concat(HHixrbMX)
end

local yeYPLykU_flat = {}
for _, chunk in ipairs(DJpkaLNo) do
    for _, byte in ipairs(chunk) do
        table.insert(yeYPLykU_flat, byte)
    end
end

local decrypted = wujdoUBk(yeYPLykU_flat, pCbozAOU)
local ZRbcRHAg, LEgHpLVu = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(yeYPLykU_flat)
yeYPLykU_flat = nil

if ZRbcRHAg then 
    local result = ZRbcRHAg() 
    decrypted = nil
    ZRbcRHAg = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(LEgHpLVu)) 
end
