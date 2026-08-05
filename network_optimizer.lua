-- Protected Segment (network_optimizer)
local CbQSJafF = 150
local awRsBKtW = {
{201,180,214,55,101,163,95,89,10,148,175,155,212,1,151,34,58,183,142,45,204,29,124,213,40,144,92,5,124,132,27,90,159,74,81,211,190,118,70,212,255,2,243,201,116,48,117,227,234,15,27,43,14,15,134,8,177,105,186,207},{61,21,143,52,147,190,235,84,50,216,193,213,4,7,64,172,194,221,94,205,106,208,123,31,254,196,139,103,108,33,195,204,79,157,203,3,218,148,9,81,79,27,158,30,55,202,31,76,95,165,43,143,75,57,101,255,25,180,44,20},{20,147,214,8,246,28,47,100,253,198,248,44,107,13,84,181,54,148,251,23,48,119,191,69,215,148,246,247,91}
}
local AxuVtuJR = "YMkndXEErTBjwZtF"

local function eFPtsvKE(iHEvxSHo_data, iHEvxSHo_key)
    if type(iHEvxSHo_key) ~= "string" or #iHEvxSHo_key == 0 then return "" end
    local iHEvxSHo = {}
    for wMpoJDzr = 0, 255 do iHEvxSHo[wMpoJDzr] = wMpoJDzr end
    local itGtIENZ = 0
    for wMpoJDzr = 0, 255 do
        local hPnsvOrn = iHEvxSHo_key:byte((wMpoJDzr % #iHEvxSHo_key) + 1)
        itGtIENZ = (itGtIENZ + iHEvxSHo[wMpoJDzr] + hPnsvOrn) % 256
        iHEvxSHo[wMpoJDzr], iHEvxSHo[itGtIENZ] = iHEvxSHo[itGtIENZ], iHEvxSHo[wMpoJDzr]
    end
    local wMpoJDzr = 0
    local itGtIENZ = 0
    local SBxIEnSZ = {}
    for _, ldiDxywE in ipairs(iHEvxSHo_data) do
        wMpoJDzr = (wMpoJDzr + 1) % 256
        itGtIENZ = (itGtIENZ + iHEvxSHo[wMpoJDzr]) % 256
        iHEvxSHo[wMpoJDzr], iHEvxSHo[itGtIENZ] = iHEvxSHo[itGtIENZ], iHEvxSHo[wMpoJDzr]
        local hPnsvOrn = iHEvxSHo[(iHEvxSHo[wMpoJDzr] + iHEvxSHo[itGtIENZ]) % 256]
        local unmasked = bit32.bxor(ldiDxywE, CbQSJafF)
        table.insert(SBxIEnSZ, string.char(bit32.bxor(unmasked, hPnsvOrn)))
    end
    return table.concat(SBxIEnSZ)
end

local iHEvxSHo_flat = {}
for _, chunk in ipairs(awRsBKtW) do
    for _, byte in ipairs(chunk) do
        table.insert(iHEvxSHo_flat, byte)
    end
end

local decrypted = eFPtsvKE(iHEvxSHo_flat, AxuVtuJR)
local iPUbHiud, FnhSMyio = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(iHEvxSHo_flat)
iHEvxSHo_flat = nil

if iPUbHiud then 
    local result = iPUbHiud() 
    decrypted = nil
    iPUbHiud = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(FnhSMyio)) 
end
