-- Protected Segment (ui_themes)
local dDIXwkjX = 127
local OjCNAcXI = {
{27,136,84,206,52,234,96,145,16,220,56,112,215,146,14,45,66,108,40,84,71,244,5,186,106,231,77,218,199,180,119,197,24,152,180,208,205,56,99,113,91,79,49,17,80,167,59,61,225,11,130,204,53,87,152,18,123,52,190,7},{78,29,143,195,111,60,193,127,107,62,254,241,68,242,124,133,10,24,9,16,92,111,178,107,132,185,227,52,227,3,6,234,153,192,155,170,94,81,0,90,181,92,138,10,62,17,97,88,5,244,37,187,252,240,147,12,233,92,31,90},{154,189,220,57,17,1,167,191,60,188,246,235,138,110,136,90,6,105,255,189,142}
}
local uISnzijj = "PcNKvdGNPESXjfsW"

local function TZHJpFjS(uaDuwcOs_data, uaDuwcOs_key)
    if type(uaDuwcOs_key) ~= "string" or #uaDuwcOs_key == 0 then return "" end
    local uaDuwcOs = {}
    for aSjiCXbC = 0, 255 do uaDuwcOs[aSjiCXbC] = aSjiCXbC end
    local aCZKufrh = 0
    for aSjiCXbC = 0, 255 do
        local TwitTgrM = uaDuwcOs_key:byte((aSjiCXbC % #uaDuwcOs_key) + 1)
        aCZKufrh = (aCZKufrh + uaDuwcOs[aSjiCXbC] + TwitTgrM) % 256
        uaDuwcOs[aSjiCXbC], uaDuwcOs[aCZKufrh] = uaDuwcOs[aCZKufrh], uaDuwcOs[aSjiCXbC]
    end
    local aSjiCXbC = 0
    local aCZKufrh = 0
    local LzCHSBHp = {}
    for _, SazruecT in ipairs(uaDuwcOs_data) do
        aSjiCXbC = (aSjiCXbC + 1) % 256
        aCZKufrh = (aCZKufrh + uaDuwcOs[aSjiCXbC]) % 256
        uaDuwcOs[aSjiCXbC], uaDuwcOs[aCZKufrh] = uaDuwcOs[aCZKufrh], uaDuwcOs[aSjiCXbC]
        local TwitTgrM = uaDuwcOs[(uaDuwcOs[aSjiCXbC] + uaDuwcOs[aCZKufrh]) % 256]
        local unmasked = bit32.bxor(SazruecT, dDIXwkjX)
        table.insert(LzCHSBHp, string.char(bit32.bxor(unmasked, TwitTgrM)))
    end
    return table.concat(LzCHSBHp)
end

local uaDuwcOs_flat = {}
for _, chunk in ipairs(OjCNAcXI) do
    for _, byte in ipairs(chunk) do
        table.insert(uaDuwcOs_flat, byte)
    end
end

local decrypted = TZHJpFjS(uaDuwcOs_flat, uISnzijj)
local IYviRjzs, LeBnEOvP = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(uaDuwcOs_flat)
uaDuwcOs_flat = nil

if IYviRjzs then 
    local result = IYviRjzs() 
    decrypted = nil
    IYviRjzs = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(LeBnEOvP)) 
end
