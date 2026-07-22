-- Protected Segment (ui_themes)
local UdfOgiUy = 140
local YFTCCGLi = {
{75,105,235,65,1,249,201,18,185,121,20,128,25,120,83,34,77,210,27,41,140,150,167,74,228,242,50,14,218,212,114,199,108,40,27,190,153,149,224,127,30,81,121,139,147,202,205,207,233,179,227,193,91,116,138,128,64,44,191,99},{7,240,101,99,4,30,94,187,35,17,230,138,33,251,140,207,119,47,8,26,232,110,101,213,130,124,142,8,216,122,29,212,138,5,138,28,207,103,124,15,168,231,113,158,214,27,150,252,216,37,21,89,185,249,84,186,247,3,255,151},{43,248,81,185,160,12,219,246,155,85,140,71,245,183,133,71,20,35,91,253,129}
}
local acLrtoMR = "oUpVIKpdcOgwEfIC"

local function vZBxxaKW(qBOXRUHY_data, qBOXRUHY_key)
    local qBOXRUHY = {}
    for NOodfGqo = 0, 255 do qBOXRUHY[NOodfGqo] = NOodfGqo end
    local hhLPHHyi = 0
    for NOodfGqo = 0, 255 do
        local BZwIFXgt = qBOXRUHY_key:byte((NOodfGqo % #qBOXRUHY_key) + 1)
        hhLPHHyi = (hhLPHHyi + qBOXRUHY[NOodfGqo] + BZwIFXgt) % 256
        qBOXRUHY[NOodfGqo], qBOXRUHY[hhLPHHyi] = qBOXRUHY[hhLPHHyi], qBOXRUHY[NOodfGqo]
    end
    local NOodfGqo = 0
    local hhLPHHyi = 0
    local RXqJSttk = {}
    for _, SuDxqoxh in ipairs(qBOXRUHY_data) do
        NOodfGqo = (NOodfGqo + 1) % 256
        hhLPHHyi = (hhLPHHyi + qBOXRUHY[NOodfGqo]) % 256
        qBOXRUHY[NOodfGqo], qBOXRUHY[hhLPHHyi] = qBOXRUHY[hhLPHHyi], qBOXRUHY[NOodfGqo]
        local BZwIFXgt = qBOXRUHY[(qBOXRUHY[NOodfGqo] + qBOXRUHY[hhLPHHyi]) % 256]
        local unmasked = bit32.bxor(SuDxqoxh, UdfOgiUy)
        table.insert(RXqJSttk, string.char(bit32.bxor(unmasked, BZwIFXgt)))
    end
    return table.concat(RXqJSttk)
end

local qBOXRUHY_flat = {}
for _, chunk in ipairs(YFTCCGLi) do
    for _, byte in ipairs(chunk) do
        table.insert(qBOXRUHY_flat, byte)
    end
end

local decrypted = vZBxxaKW(qBOXRUHY_flat, acLrtoMR)
local rRFwUlqJ, lVDMneRf = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(qBOXRUHY_flat)
qBOXRUHY_flat = nil

if rRFwUlqJ then 
    local result = rRFwUlqJ() 
    decrypted = nil
    rRFwUlqJ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(lVDMneRf)) 
end
