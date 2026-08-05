-- Protected Segment (utility_helper)
local sOYJOofi = 43
local orVMMDYe = {
{38,73,229,124,183,55,90,233,52,185,226,16,209,16,134,186,16,73,108,172,6,77,147,17,64,172,114,79,183,132,190,163,158,178,61,254,120,243,119,38,136,122,230,8,213,62,19,136,36,170,129,201,76,57,89,99,176,68,129,142},{12,15,173,154,190,201,87,168,204,148,182,201,40,91,248,131,211,224,82,123,59,155,253,183,226,48,34,219,233,101,93,241,196,169,112,175,193,243,70,172,105,46,196,205,59,210,31,178,182,210,0,231,207,25,210,172,65,230,211,2},{147,232,28,119,93,250,196,99,108,186,170,180,24,8,215,104,62,65,119,242,215,114,8,91,214,187}
}
local JYoxjNRL = "wDbzqRPyFCKbEyGe"

local function zXXpYwyy(FVoEbTfv_data, FVoEbTfv_key)
    if type(FVoEbTfv_key) ~= "string" or #FVoEbTfv_key == 0 then return "" end
    local FVoEbTfv = {}
    for kZDraSuL = 0, 255 do FVoEbTfv[kZDraSuL] = kZDraSuL end
    local ATERvohf = 0
    for kZDraSuL = 0, 255 do
        local KXbbnKvF = FVoEbTfv_key:byte((kZDraSuL % #FVoEbTfv_key) + 1)
        ATERvohf = (ATERvohf + FVoEbTfv[kZDraSuL] + KXbbnKvF) % 256
        FVoEbTfv[kZDraSuL], FVoEbTfv[ATERvohf] = FVoEbTfv[ATERvohf], FVoEbTfv[kZDraSuL]
    end
    local kZDraSuL = 0
    local ATERvohf = 0
    local IvmVWMiM = {}
    for _, EswIpESo in ipairs(FVoEbTfv_data) do
        kZDraSuL = (kZDraSuL + 1) % 256
        ATERvohf = (ATERvohf + FVoEbTfv[kZDraSuL]) % 256
        FVoEbTfv[kZDraSuL], FVoEbTfv[ATERvohf] = FVoEbTfv[ATERvohf], FVoEbTfv[kZDraSuL]
        local KXbbnKvF = FVoEbTfv[(FVoEbTfv[kZDraSuL] + FVoEbTfv[ATERvohf]) % 256]
        local unmasked = bit32.bxor(EswIpESo, sOYJOofi)
        table.insert(IvmVWMiM, string.char(bit32.bxor(unmasked, KXbbnKvF)))
    end
    return table.concat(IvmVWMiM)
end

local FVoEbTfv_flat = {}
for _, chunk in ipairs(orVMMDYe) do
    for _, byte in ipairs(chunk) do
        table.insert(FVoEbTfv_flat, byte)
    end
end

local decrypted = zXXpYwyy(FVoEbTfv_flat, JYoxjNRL)
local yDAfptKS, oFeHyaeZ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(FVoEbTfv_flat)
FVoEbTfv_flat = nil

if yDAfptKS then 
    local result = yDAfptKS() 
    decrypted = nil
    yDAfptKS = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(oFeHyaeZ)) 
end
