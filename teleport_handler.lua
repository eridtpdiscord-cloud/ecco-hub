-- Protected Segment (teleport_handler)
local SuMfZont = 167
local KhUtLDST = {
{176,114,97,164,248,242,198,2,219,44,247,77,107,119,248,79,236,72,49,66,182,246,185,215,184,14,44,179,56,85,96,176,76,151,36,195,180,17,5,11,73,185,182,9,121,19,137,179,168,196,102,112,255,164,7,143,82,172,160,64},{197,113,235,58,207,158,238,61,154,53,156,216,224,164,208,42,72,75,223,112,129,87,170,141,94,252,145,125,128,215,102,171,50,244,234,203,165,33,195,47,54,57,231,89,73,251,241,11,76,213,78,247,153,141,65,232,15,96,162,173},{60,166,29,9,178,146,94,153,48,19,27,60,67,49,86,30,140,73,114,214,155,125,55,146,176,17,77,157}
}
local RLsoGcqX = "EpOWMVfCMwVGCuzX"

local function VOJFMlzb(ZrbPOptE_data, ZrbPOptE_key)
    if type(ZrbPOptE_key) ~= "string" or #ZrbPOptE_key == 0 then return "" end
    local ZrbPOptE = {}
    for UcDPHRAX = 0, 255 do ZrbPOptE[UcDPHRAX] = UcDPHRAX end
    local YDFlebkG = 0
    for UcDPHRAX = 0, 255 do
        local EKoxiufW = ZrbPOptE_key:byte((UcDPHRAX % #ZrbPOptE_key) + 1)
        YDFlebkG = (YDFlebkG + ZrbPOptE[UcDPHRAX] + EKoxiufW) % 256
        ZrbPOptE[UcDPHRAX], ZrbPOptE[YDFlebkG] = ZrbPOptE[YDFlebkG], ZrbPOptE[UcDPHRAX]
    end
    local UcDPHRAX = 0
    local YDFlebkG = 0
    local nBWaudbj = {}
    for _, INBOxrSQ in ipairs(ZrbPOptE_data) do
        UcDPHRAX = (UcDPHRAX + 1) % 256
        YDFlebkG = (YDFlebkG + ZrbPOptE[UcDPHRAX]) % 256
        ZrbPOptE[UcDPHRAX], ZrbPOptE[YDFlebkG] = ZrbPOptE[YDFlebkG], ZrbPOptE[UcDPHRAX]
        local EKoxiufW = ZrbPOptE[(ZrbPOptE[UcDPHRAX] + ZrbPOptE[YDFlebkG]) % 256]
        local unmasked = bit32.bxor(INBOxrSQ, SuMfZont)
        table.insert(nBWaudbj, string.char(bit32.bxor(unmasked, EKoxiufW)))
    end
    return table.concat(nBWaudbj)
end

local ZrbPOptE_flat = {}
for _, chunk in ipairs(KhUtLDST) do
    for _, byte in ipairs(chunk) do
        table.insert(ZrbPOptE_flat, byte)
    end
end

local decrypted = VOJFMlzb(ZrbPOptE_flat, RLsoGcqX)
local azZPkokC, WRUZIiiL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ZrbPOptE_flat)
ZrbPOptE_flat = nil

if azZPkokC then 
    local result = azZPkokC() 
    decrypted = nil
    azZPkokC = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(WRUZIiiL)) 
end
