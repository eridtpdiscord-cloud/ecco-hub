-- Protected Segment (teleport_handler)
local xEkLeKyM = 143
local rQZDiVbo = {
{28,205,130,135,32,32,85,79,54,45,242,167,152,179,10,140,57,142,6,76,142,30,122,250,80,28,220,37,77,124,126,61,191,145,144,131,232,96,248,73,188,84,105,9,176,215,150,232,170,91,133,124,8,24,245,79,96,205,210,114},{128,190,149,23,84,178,202,132,198,83,223,229,137,86,150,141,250,145,209,33,183,74,93,214,186,54,1,15,243,67,49,56,171,186,147,252,128,18,78,184,147,28,6,144,213,191,13,166,245,117,237,245,240,151,163,49,236,169,105,226},{111,88,205,121,149,42,27,174,157,139,32,204,197,155,172,55,146,91,67,171,244,43,77,144,246,27,89,138}
}
local krlUfFio = "eLhIUKpAXHwUsTbT"

local function CmonHQgR(UiWnkWFX_data, UiWnkWFX_key)
    if type(UiWnkWFX_key) ~= "string" or #UiWnkWFX_key == 0 then return "" end
    local UiWnkWFX = {}
    for WOxRMRCh = 0, 255 do UiWnkWFX[WOxRMRCh] = WOxRMRCh end
    local zScRisJU = 0
    for WOxRMRCh = 0, 255 do
        local WpBMcgnh = UiWnkWFX_key:byte((WOxRMRCh % #UiWnkWFX_key) + 1)
        zScRisJU = (zScRisJU + UiWnkWFX[WOxRMRCh] + WpBMcgnh) % 256
        UiWnkWFX[WOxRMRCh], UiWnkWFX[zScRisJU] = UiWnkWFX[zScRisJU], UiWnkWFX[WOxRMRCh]
    end
    local WOxRMRCh = 0
    local zScRisJU = 0
    local RNfOsLvS = {}
    for _, zauNgFlE in ipairs(UiWnkWFX_data) do
        WOxRMRCh = (WOxRMRCh + 1) % 256
        zScRisJU = (zScRisJU + UiWnkWFX[WOxRMRCh]) % 256
        UiWnkWFX[WOxRMRCh], UiWnkWFX[zScRisJU] = UiWnkWFX[zScRisJU], UiWnkWFX[WOxRMRCh]
        local WpBMcgnh = UiWnkWFX[(UiWnkWFX[WOxRMRCh] + UiWnkWFX[zScRisJU]) % 256]
        local unmasked = bit32.bxor(zauNgFlE, xEkLeKyM)
        table.insert(RNfOsLvS, string.char(bit32.bxor(unmasked, WpBMcgnh)))
    end
    return table.concat(RNfOsLvS)
end

local UiWnkWFX_flat = {}
for _, chunk in ipairs(rQZDiVbo) do
    for _, byte in ipairs(chunk) do
        table.insert(UiWnkWFX_flat, byte)
    end
end

local decrypted = CmonHQgR(UiWnkWFX_flat, krlUfFio)
local JwczpDEB, YgSGlDPB = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(UiWnkWFX_flat)
UiWnkWFX_flat = nil

if JwczpDEB then 
    local result = JwczpDEB() 
    decrypted = nil
    JwczpDEB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(YgSGlDPB)) 
end
