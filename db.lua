-- Protected Segment (db)
local JRQUmPgH = 176
local jLvylEaw = {
{123,152,110,130,79,184,224,1,201,58,64,236,210,201,55,123,195,9,220,179,136,174,43,168,156,97,77,148,22,217,125,85,103,97,126,105,179,158,215,111,60,103,75,135,52,135,36,254,186,98,12,143,102,175,224,199,233,131,76,103},{76,17,110,215,113,34,172,105,193,124,246,85,88,1,69,187,71,103,230,43,66,37,88,162,182,69,92,192,254,231,41,219,223,146,28,76,230,89,52,227,88,211,51,108,80,154,170,7,115,96,156,151,173,25,230,105,215,30,214,142},{84,51,59,113,182,42,101,27,146,250,212,158,137,61,20,61,58,172,90,26,190,7,95,102,37,255,6,192,29,46,66,15,142,85,71,126,224,24,254,144,155,185,53,48,61,169,141,160,231,99,207,235,235,7,209,1,239,104,36,170},{134,160,151,109,9,55,228,38,204,144,44,123,60,244,112,129,153,122,50,165,105,200,165,37,56,76,234,144,101,59,248,202,184,217,152,188,229,108,252,223,27,36,178,238,183,82,154,20,81,143,98,180,155,85,180,44,26,135,170,42},{188,56,141,105,180,67,152,65,242,101,32,240,196,165,192,158,222,97,7,86,201,191,130,188,21,107,176,45,61,110,83,147,115,211,65,126,188,143,145,82,254,30,254,163,31,50,169,46,146,14,56,37,228,129,152,229,180,53,75,158},{236,151,158,62,97,209,243,208,151,216,79,5,81,2,182,122,249,37,230,253,66,85,6,114,214,26,72,156,32,243,61,72,135,250,81,112,131,196,150,20,66,100,164,152,66,64,15,254,98,232,119,34,209,111,78,153,191,184,83,10},{22,164,20,129,11,86,140,157,167,171,222,109,211,223,105,57,248,9,142,188,114,148,221,145,240,233,37,86,78,55,35,55,51,154,114,233,55,128,108,146,43,42,63,52,178,74,155,236,1,232,211,173,73,191,154,220,235,93,70,100},{177,173,194,43,161,32,204,117,85,166,11,59,64,196,85,173,0,158,42,147,149,221,126,98,239,107,90,70,65,150,12,94,143,245,163,58,110,249,51,168,116,86,154,74,44,152,75,10,27,205,108,118,86,86,200,21,206,207,200}
}
local RwSxpjjz = "RdoqOcbfNXkfnHsI"

local function kxhXiunA(KXwgPlXS_data, KXwgPlXS_key)
    if type(KXwgPlXS_key) ~= "string" or #KXwgPlXS_key == 0 then return "" end
    local KXwgPlXS = {}
    for XnExKxVb = 0, 255 do KXwgPlXS[XnExKxVb] = XnExKxVb end
    local RnujbZog = 0
    for XnExKxVb = 0, 255 do
        local yLEfyPGW = KXwgPlXS_key:byte((XnExKxVb % #KXwgPlXS_key) + 1)
        RnujbZog = (RnujbZog + KXwgPlXS[XnExKxVb] + yLEfyPGW) % 256
        KXwgPlXS[XnExKxVb], KXwgPlXS[RnujbZog] = KXwgPlXS[RnujbZog], KXwgPlXS[XnExKxVb]
    end
    local XnExKxVb = 0
    local RnujbZog = 0
    local bIaHEtYz = {}
    for _, aLxCZpCq in ipairs(KXwgPlXS_data) do
        XnExKxVb = (XnExKxVb + 1) % 256
        RnujbZog = (RnujbZog + KXwgPlXS[XnExKxVb]) % 256
        KXwgPlXS[XnExKxVb], KXwgPlXS[RnujbZog] = KXwgPlXS[RnujbZog], KXwgPlXS[XnExKxVb]
        local yLEfyPGW = KXwgPlXS[(KXwgPlXS[XnExKxVb] + KXwgPlXS[RnujbZog]) % 256]
        local unmasked = bit32.bxor(aLxCZpCq, JRQUmPgH)
        table.insert(bIaHEtYz, string.char(bit32.bxor(unmasked, yLEfyPGW)))
    end
    return table.concat(bIaHEtYz)
end

local KXwgPlXS_flat = {}
for _, chunk in ipairs(jLvylEaw) do
    for _, byte in ipairs(chunk) do
        table.insert(KXwgPlXS_flat, byte)
    end
end

local decrypted = kxhXiunA(KXwgPlXS_flat, RwSxpjjz)
local MHATTMEx, fySlkBMO = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(KXwgPlXS_flat)
KXwgPlXS_flat = nil

if MHATTMEx then 
    local result = MHATTMEx() 
    decrypted = nil
    MHATTMEx = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(fySlkBMO)) 
end
