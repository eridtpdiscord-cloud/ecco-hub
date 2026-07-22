-- Protected Segment (ui_themes)
local nVbcEgBf = 36
local ESPRbIZZ = {
{101,227,250,248,18,57,226,22,226,34,251,99,112,246,89,245,137,162,54,41,150,237,60,212,114,183,52,206,38,216,31,99,107,245,103,254,40,199,85,67,160,41,66,38,28,104,223,198,95,129,146,39,133,149,231,187,146,88,183,240},{218,106,54,152,127,183,188,123,188,148,56,96,225,242,120,196,87,219,232,136,105,80,62,24,194,133,168,39,88,217,132,108,5,48,165,19,67,79,237,19,55,90,243,249,14,157,27,194,171,116,33,124,9,53,50,253,56,180,13,107},{191,103,231,26,129,85,2,49,114,238,222,57,90,188,119,38,54,39,173,243,239}
}
local bMtmKKFY = "coRXRSTjWSbxNkAy"

local function TekFHinC(DmqDqXZw_data, DmqDqXZw_key)
    local DmqDqXZw = {}
    for zgcvvEUW = 0, 255 do DmqDqXZw[zgcvvEUW] = zgcvvEUW end
    local vNXqGElx = 0
    for zgcvvEUW = 0, 255 do
        local ZlIjgIKh = DmqDqXZw_key:byte((zgcvvEUW % #DmqDqXZw_key) + 1)
        vNXqGElx = (vNXqGElx + DmqDqXZw[zgcvvEUW] + ZlIjgIKh) % 256
        DmqDqXZw[zgcvvEUW], DmqDqXZw[vNXqGElx] = DmqDqXZw[vNXqGElx], DmqDqXZw[zgcvvEUW]
    end
    local zgcvvEUW = 0
    local vNXqGElx = 0
    local ejReYRhd = {}
    for _, TWlIfGaM in ipairs(DmqDqXZw_data) do
        zgcvvEUW = (zgcvvEUW + 1) % 256
        vNXqGElx = (vNXqGElx + DmqDqXZw[zgcvvEUW]) % 256
        DmqDqXZw[zgcvvEUW], DmqDqXZw[vNXqGElx] = DmqDqXZw[vNXqGElx], DmqDqXZw[zgcvvEUW]
        local ZlIjgIKh = DmqDqXZw[(DmqDqXZw[zgcvvEUW] + DmqDqXZw[vNXqGElx]) % 256]
        local unmasked = bit32.bxor(TWlIfGaM, nVbcEgBf)
        table.insert(ejReYRhd, string.char(bit32.bxor(unmasked, ZlIjgIKh)))
    end
    return table.concat(ejReYRhd)
end

local DmqDqXZw_flat = {}
for _, chunk in ipairs(ESPRbIZZ) do
    for _, byte in ipairs(chunk) do
        table.insert(DmqDqXZw_flat, byte)
    end
end

local decrypted = TekFHinC(DmqDqXZw_flat, bMtmKKFY)
local HQkqPobZ, jpOLarWM = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(DmqDqXZw_flat)
DmqDqXZw_flat = nil

if HQkqPobZ then 
    local result = HQkqPobZ() 
    decrypted = nil
    HQkqPobZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(jpOLarWM)) 
end
