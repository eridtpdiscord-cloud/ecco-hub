-- Protected Segment (db)
local UZDRxHwJ = 120
local gQCQJxSj = {
{22,243,97,247,130,52,26,43,251,137,141,141,197,85,47,180,228,71,75,110,181,243,188,33,122,224,147,22,123,127,118,250,68,129,226,184,84,210,12,242,61,250,137,95,182,164,253,144,217,103,48,95,234,143,229,170,157,74,30,167},{112,64,229,204,242,149,58,236,26,217,40,13,14,164,181,138,175,229,56,219,253,149,221,226,71,38,122,165,164,67,9,254,106,117,135,64,211,144,131,252,242,199,178,68,24,122,49,84,82,106,63,0,73,50,97,128,106,206,84,176},{239,91,10,164,69,250,230,207,153,219,74,205,152,89,161,219,134,206,155,121,95,234,129,167,196,183,114,213,181,177,234,22,222,213,153,47,46,36,151,105,12,244,158,75,6,227,202,51,53,31,57,170,184,77,57,241,180,109,27,185},{170,202,242,53,37,31,153,224,248,157,45,239,193,240,177,236,238,128,6,155,217,220,213,99,20,65,243,136,220,234,240,177,249,72,24,185,80,90,159,102,248,187,116,120,106,170,84,211,177,226,222,224,138,121,144,113,91,246,0,131},{235,68,17,59,136,68,102,34,191,175,34,57,187,63,72,21,55,247,231,183,91,231,63,62,99,249,90,36,155,56,232,252,198,69,210,247,25,132,45,153,189,221,35,246,68,9,88,145,9,147,49,82,30,29,126,46,223,133,250,38},{234,199,105,130,209,103,64,134,132,54,10,72,74,153,68,170,143,79,99,11,88,76,204,42,170,231,174,241,75,169,54,160,130,72,144,3,139,171,124,207,54,186,124,210,249,29,103,40,112,219,105,33,81,25,97,52,201,53,15,84},{129,50,245,68,123,65,93,181,207,45,228,102,164,201,92,198,45,82,11,118,141,195,59,63,180,81,121,56,115,119,128,76,50,21,6,160,210,112,189,85,210,205,184,182,89,22,212,185,255,121,105,174,215,166,27,173,2,208,38,233},{122,43,63,235,25,93,79,141,175,155,129,186,226,124,221,80,115,86,210,127,78,106,249,127,254,182,111,229,129,234,120,107,213,158,188,90,207,63,79,16,7,108,180,43,61,207,18,6,20,95,151,243,242,65,183,134,154,193,109}
}
local rDoMrbKg = "seaCXmkxkydYOHRz"

local function slRRtfdc(dhdabMsJ_data, dhdabMsJ_key)
    if type(dhdabMsJ_key) ~= "string" or #dhdabMsJ_key == 0 then return "" end
    local dhdabMsJ = {}
    for fcReIeZh = 0, 255 do dhdabMsJ[fcReIeZh] = fcReIeZh end
    local oszClkjp = 0
    for fcReIeZh = 0, 255 do
        local fJWNQILz = dhdabMsJ_key:byte((fcReIeZh % #dhdabMsJ_key) + 1)
        oszClkjp = (oszClkjp + dhdabMsJ[fcReIeZh] + fJWNQILz) % 256
        dhdabMsJ[fcReIeZh], dhdabMsJ[oszClkjp] = dhdabMsJ[oszClkjp], dhdabMsJ[fcReIeZh]
    end
    local fcReIeZh = 0
    local oszClkjp = 0
    local OvyPifAX = {}
    for _, WKaiyhsr in ipairs(dhdabMsJ_data) do
        fcReIeZh = (fcReIeZh + 1) % 256
        oszClkjp = (oszClkjp + dhdabMsJ[fcReIeZh]) % 256
        dhdabMsJ[fcReIeZh], dhdabMsJ[oszClkjp] = dhdabMsJ[oszClkjp], dhdabMsJ[fcReIeZh]
        local fJWNQILz = dhdabMsJ[(dhdabMsJ[fcReIeZh] + dhdabMsJ[oszClkjp]) % 256]
        local unmasked = bit32.bxor(WKaiyhsr, UZDRxHwJ)
        table.insert(OvyPifAX, string.char(bit32.bxor(unmasked, fJWNQILz)))
    end
    return table.concat(OvyPifAX)
end

local dhdabMsJ_flat = {}
for _, chunk in ipairs(gQCQJxSj) do
    for _, byte in ipairs(chunk) do
        table.insert(dhdabMsJ_flat, byte)
    end
end

local decrypted = slRRtfdc(dhdabMsJ_flat, rDoMrbKg)
local QjEgdAnE, CXPDcsRX = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(dhdabMsJ_flat)
dhdabMsJ_flat = nil

if QjEgdAnE then 
    local result = QjEgdAnE() 
    decrypted = nil
    QjEgdAnE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(CXPDcsRX)) 
end
