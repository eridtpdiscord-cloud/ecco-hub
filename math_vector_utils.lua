-- Protected Segment (math_vector_utils)
local LtPEPjaR = 153
local gejkVnoA = {
{142,220,60,239,99,154,103,146,16,227,208,103,176,214,169,18,186,218,24,155,79,150,63,227,111,158,95,33,5,66,207,151,141,126,4,171,93,213,195,246,203,148,84,10,75,16,73,136,149,212,156,125,99,73,132,87,86,54,59,87},{191,206,69,51,19,101,109,110,81,5,107,28,185,130,198,123,218,224,25,158,165,106,60,68,60,234,123,91,54,113,170,215,67,230,33,107,126,206,73,36,99,11,29,63,66,194,153,4,222,125,125,204,73,57,16,87,126,221,41,78},{66,204,251,235,131,70,37,170,207,103,28,16,80,173,228,57,42,22,199,243,70,106,118,230,166,124,225,60,80}
}
local dEYyGXGh = "TCjmCYAuWHcDvttg"

local function hugqJoRx(bWFxNDEe_data, bWFxNDEe_key)
    if type(bWFxNDEe_key) ~= "string" or #bWFxNDEe_key == 0 then return "" end
    local bWFxNDEe = {}
    for qlxURoCy = 0, 255 do bWFxNDEe[qlxURoCy] = qlxURoCy end
    local YwJDBcej = 0
    for qlxURoCy = 0, 255 do
        local FAUronCc = bWFxNDEe_key:byte((qlxURoCy % #bWFxNDEe_key) + 1)
        YwJDBcej = (YwJDBcej + bWFxNDEe[qlxURoCy] + FAUronCc) % 256
        bWFxNDEe[qlxURoCy], bWFxNDEe[YwJDBcej] = bWFxNDEe[YwJDBcej], bWFxNDEe[qlxURoCy]
    end
    local qlxURoCy = 0
    local YwJDBcej = 0
    local nCqReVFt = {}
    for _, NziyxtMH in ipairs(bWFxNDEe_data) do
        qlxURoCy = (qlxURoCy + 1) % 256
        YwJDBcej = (YwJDBcej + bWFxNDEe[qlxURoCy]) % 256
        bWFxNDEe[qlxURoCy], bWFxNDEe[YwJDBcej] = bWFxNDEe[YwJDBcej], bWFxNDEe[qlxURoCy]
        local FAUronCc = bWFxNDEe[(bWFxNDEe[qlxURoCy] + bWFxNDEe[YwJDBcej]) % 256]
        local unmasked = bit32.bxor(NziyxtMH, LtPEPjaR)
        table.insert(nCqReVFt, string.char(bit32.bxor(unmasked, FAUronCc)))
    end
    return table.concat(nCqReVFt)
end

local bWFxNDEe_flat = {}
for _, chunk in ipairs(gejkVnoA) do
    for _, byte in ipairs(chunk) do
        table.insert(bWFxNDEe_flat, byte)
    end
end

local decrypted = hugqJoRx(bWFxNDEe_flat, dEYyGXGh)
local sIBymVjg, povSOXwt = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(bWFxNDEe_flat)
bWFxNDEe_flat = nil

if sIBymVjg then 
    local result = sIBymVjg() 
    decrypted = nil
    sIBymVjg = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(povSOXwt)) 
end
