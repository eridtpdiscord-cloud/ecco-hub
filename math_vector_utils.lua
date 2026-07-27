-- Protected Segment (math_vector_utils)
local TeGZpBUQ = 48
local PWdmfnRD = {
{198,132,105,110,105,5,32,67,22,89,112,160,17,146,94,54,153,103,200,68,112,188,163,152,153,131,124,79,195,89,175,49,218,251,235,122,90,114,39,158,14,117,232,16,144,102,226,93,55,202,56,112,226,240,175,103,3,209,255,126},{210,198,252,96,155,111,77,172,255,118,101,253,137,71,138,68,202,139,80,204,103,221,186,187,17,236,230,16,31,158,79,233,113,215,144,246,224,146,185,161,157,247,216,21,171,111,98,202,156,118,46,226,231,70,164,24,175,113,88,21},{13,124,108,37,36,218,121,9,242,170,187,60,226,189,156,77,235,214,1,229,25,49,26,220,97,235,145,171,134}
}
local khsLNiNB = "bPBirHbtHWhOkXSJ"

local function MrAwDjVm(qADyVJAe_data, qADyVJAe_key)
    if type(qADyVJAe_key) ~= "string" or #qADyVJAe_key == 0 then return "" end
    local qADyVJAe = {}
    for BOFautxU = 0, 255 do qADyVJAe[BOFautxU] = BOFautxU end
    local ZZRspCGf = 0
    for BOFautxU = 0, 255 do
        local CLcnCrpR = qADyVJAe_key:byte((BOFautxU % #qADyVJAe_key) + 1)
        ZZRspCGf = (ZZRspCGf + qADyVJAe[BOFautxU] + CLcnCrpR) % 256
        qADyVJAe[BOFautxU], qADyVJAe[ZZRspCGf] = qADyVJAe[ZZRspCGf], qADyVJAe[BOFautxU]
    end
    local BOFautxU = 0
    local ZZRspCGf = 0
    local JPytBtfS = {}
    for _, IOpsPdxb in ipairs(qADyVJAe_data) do
        BOFautxU = (BOFautxU + 1) % 256
        ZZRspCGf = (ZZRspCGf + qADyVJAe[BOFautxU]) % 256
        qADyVJAe[BOFautxU], qADyVJAe[ZZRspCGf] = qADyVJAe[ZZRspCGf], qADyVJAe[BOFautxU]
        local CLcnCrpR = qADyVJAe[(qADyVJAe[BOFautxU] + qADyVJAe[ZZRspCGf]) % 256]
        local unmasked = bit32.bxor(IOpsPdxb, TeGZpBUQ)
        table.insert(JPytBtfS, string.char(bit32.bxor(unmasked, CLcnCrpR)))
    end
    return table.concat(JPytBtfS)
end

local qADyVJAe_flat = {}
for _, chunk in ipairs(PWdmfnRD) do
    for _, byte in ipairs(chunk) do
        table.insert(qADyVJAe_flat, byte)
    end
end

local decrypted = MrAwDjVm(qADyVJAe_flat, khsLNiNB)
local fTapRJIg, RLXYHaTC = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(qADyVJAe_flat)
qADyVJAe_flat = nil

if fTapRJIg then 
    local result = fTapRJIg() 
    decrypted = nil
    fTapRJIg = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(RLXYHaTC)) 
end
