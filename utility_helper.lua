-- Protected Segment (utility_helper)
local aqfCzYke = 4
local KFVmkghe = {
{28,160,96,146,18,30,225,122,233,85,176,140,9,66,59,50,52,4,77,97,121,104,40,148,248,186,30,147,16,238,42,188,250,23,54,195,127,20,109,138,32,213,194,229,190,99,218,185,115,3,218,215,41,214,203,196,183,152,160,154},{86,126,24,57,4,207,42,73,9,107,72,17,127,63,239,211,142,216,171,190,255,106,126,9,213,39,23,136,252,39,248,135,92,114,206,71,135,34,71,151,244,49,48,61,100,227,230,66,9,159,132,39,205,42,176,128,44,133,118,235},{86,22,235,206,33,245,160,56,94,11,127,58,237,229,229,171,213,134,166,83,201,204,253,226,123,227}
}
local dRZrXDKB = "dLBCDPzLEYXZawFB"

local function ioQCDGUA(samBylTP_data, samBylTP_key)
    if type(samBylTP_key) ~= "string" or #samBylTP_key == 0 then return "" end
    local samBylTP = {}
    for OHCtPsHl = 0, 255 do samBylTP[OHCtPsHl] = OHCtPsHl end
    local QFnVaUeh = 0
    for OHCtPsHl = 0, 255 do
        local TMADFMng = samBylTP_key:byte((OHCtPsHl % #samBylTP_key) + 1)
        QFnVaUeh = (QFnVaUeh + samBylTP[OHCtPsHl] + TMADFMng) % 256
        samBylTP[OHCtPsHl], samBylTP[QFnVaUeh] = samBylTP[QFnVaUeh], samBylTP[OHCtPsHl]
    end
    local OHCtPsHl = 0
    local QFnVaUeh = 0
    local ScvwbicB = {}
    for _, HGoFfvcL in ipairs(samBylTP_data) do
        OHCtPsHl = (OHCtPsHl + 1) % 256
        QFnVaUeh = (QFnVaUeh + samBylTP[OHCtPsHl]) % 256
        samBylTP[OHCtPsHl], samBylTP[QFnVaUeh] = samBylTP[QFnVaUeh], samBylTP[OHCtPsHl]
        local TMADFMng = samBylTP[(samBylTP[OHCtPsHl] + samBylTP[QFnVaUeh]) % 256]
        local unmasked = bit32.bxor(HGoFfvcL, aqfCzYke)
        table.insert(ScvwbicB, string.char(bit32.bxor(unmasked, TMADFMng)))
    end
    return table.concat(ScvwbicB)
end

local samBylTP_flat = {}
for _, chunk in ipairs(KFVmkghe) do
    for _, byte in ipairs(chunk) do
        table.insert(samBylTP_flat, byte)
    end
end

local decrypted = ioQCDGUA(samBylTP_flat, dRZrXDKB)
local tqPnHCxu, FlpGsiek = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(samBylTP_flat)
samBylTP_flat = nil

if tqPnHCxu then 
    local result = tqPnHCxu() 
    decrypted = nil
    tqPnHCxu = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(FlpGsiek)) 
end
