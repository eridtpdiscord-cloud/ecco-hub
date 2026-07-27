-- Protected Segment (utility_helper)
local nqSMxQub = 71
local pKkmGSnx = {
{128,122,39,227,62,127,210,107,122,208,74,94,1,196,39,208,233,48,65,136,119,119,208,93,108,204,82,2,234,116,147,120,250,162,30,11,72,146,86,241,1,116,205,168,99,80,187,32,88,162,32,78,102,62,75,80,179,113,59,150},{113,165,129,95,33,100,159,229,33,103,99,187,37,162,5,21,130,172,102,147,160,30,179,160,2,100,234,240,160,26,10,60,59,148,7,150,56,28,81,4,22,21,210,216,118,206,11,55,153,245,255,29,46,222,168,231,92,186,153,29},{59,133,43,33,138,72,154,94,137,120,163,36,127,90,71,46,251,75,160,234,220,199,222,31,228,224}
}
local XCctrOcv = "XzuPbxpUbXsnHewR"

local function EBikqMym(RWmmBZaO_data, RWmmBZaO_key)
    if type(RWmmBZaO_key) ~= "string" or #RWmmBZaO_key == 0 then return "" end
    local RWmmBZaO = {}
    for gqWWBgty = 0, 255 do RWmmBZaO[gqWWBgty] = gqWWBgty end
    local GxWkiWOs = 0
    for gqWWBgty = 0, 255 do
        local THQkoNVi = RWmmBZaO_key:byte((gqWWBgty % #RWmmBZaO_key) + 1)
        GxWkiWOs = (GxWkiWOs + RWmmBZaO[gqWWBgty] + THQkoNVi) % 256
        RWmmBZaO[gqWWBgty], RWmmBZaO[GxWkiWOs] = RWmmBZaO[GxWkiWOs], RWmmBZaO[gqWWBgty]
    end
    local gqWWBgty = 0
    local GxWkiWOs = 0
    local ewMsfNAx = {}
    for _, veYuBhzC in ipairs(RWmmBZaO_data) do
        gqWWBgty = (gqWWBgty + 1) % 256
        GxWkiWOs = (GxWkiWOs + RWmmBZaO[gqWWBgty]) % 256
        RWmmBZaO[gqWWBgty], RWmmBZaO[GxWkiWOs] = RWmmBZaO[GxWkiWOs], RWmmBZaO[gqWWBgty]
        local THQkoNVi = RWmmBZaO[(RWmmBZaO[gqWWBgty] + RWmmBZaO[GxWkiWOs]) % 256]
        local unmasked = bit32.bxor(veYuBhzC, nqSMxQub)
        table.insert(ewMsfNAx, string.char(bit32.bxor(unmasked, THQkoNVi)))
    end
    return table.concat(ewMsfNAx)
end

local RWmmBZaO_flat = {}
for _, chunk in ipairs(pKkmGSnx) do
    for _, byte in ipairs(chunk) do
        table.insert(RWmmBZaO_flat, byte)
    end
end

local decrypted = EBikqMym(RWmmBZaO_flat, XCctrOcv)
local SRvrfXLj, gGhjJQuC = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(RWmmBZaO_flat)
RWmmBZaO_flat = nil

if SRvrfXLj then 
    local result = SRvrfXLj() 
    decrypted = nil
    SRvrfXLj = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(gGhjJQuC)) 
end
