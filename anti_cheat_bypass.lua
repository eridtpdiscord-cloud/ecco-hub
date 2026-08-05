-- Protected Segment (anti_cheat_bypass)
local ZGCFwqeu = 49
local CdkTkiwk = {
{3,149,102,177,156,59,191,181,129,193,0,37,185,228,180,164,202,11,127,28,127,84,123,183,217,200,150,90,19,132,104,145,48,45,57,26,142,109,118,1,7,114,211,73,93,163,247,246,124,100,150,239,185,230,18,14,118,232,226,208},{122,105,114,210,126,219,126,46,151,242,112,38,49,189,37,70,79,207,60,140,147,244,91,158,137,105,66,173,151,229,21,206,153,110,38,131,168,122,46,127,162,231,4,223,196,17,238,139,114,63,246,240,253,225,40,62,137,214,82,75},{124,215,24,69,187,184,34,159,230,147,130,10,253,124,221,206,85,216,6,137,9,7,144,184,141,1,99,201,66}
}
local ALMeQTNM = "RvfKYpTzpmVMnTpK"

local function KlremYgP(yGBhgXGc_data, yGBhgXGc_key)
    if type(yGBhgXGc_key) ~= "string" or #yGBhgXGc_key == 0 then return "" end
    local yGBhgXGc = {}
    for AEEekFBS = 0, 255 do yGBhgXGc[AEEekFBS] = AEEekFBS end
    local vgOPDGHh = 0
    for AEEekFBS = 0, 255 do
        local HtOZMqvT = yGBhgXGc_key:byte((AEEekFBS % #yGBhgXGc_key) + 1)
        vgOPDGHh = (vgOPDGHh + yGBhgXGc[AEEekFBS] + HtOZMqvT) % 256
        yGBhgXGc[AEEekFBS], yGBhgXGc[vgOPDGHh] = yGBhgXGc[vgOPDGHh], yGBhgXGc[AEEekFBS]
    end
    local AEEekFBS = 0
    local vgOPDGHh = 0
    local PtaStQqO = {}
    for _, PnvvDQbN in ipairs(yGBhgXGc_data) do
        AEEekFBS = (AEEekFBS + 1) % 256
        vgOPDGHh = (vgOPDGHh + yGBhgXGc[AEEekFBS]) % 256
        yGBhgXGc[AEEekFBS], yGBhgXGc[vgOPDGHh] = yGBhgXGc[vgOPDGHh], yGBhgXGc[AEEekFBS]
        local HtOZMqvT = yGBhgXGc[(yGBhgXGc[AEEekFBS] + yGBhgXGc[vgOPDGHh]) % 256]
        local unmasked = bit32.bxor(PnvvDQbN, ZGCFwqeu)
        table.insert(PtaStQqO, string.char(bit32.bxor(unmasked, HtOZMqvT)))
    end
    return table.concat(PtaStQqO)
end

local yGBhgXGc_flat = {}
for _, chunk in ipairs(CdkTkiwk) do
    for _, byte in ipairs(chunk) do
        table.insert(yGBhgXGc_flat, byte)
    end
end

local decrypted = KlremYgP(yGBhgXGc_flat, ALMeQTNM)
local UklnjhAe, pscsoOPn = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(yGBhgXGc_flat)
yGBhgXGc_flat = nil

if UklnjhAe then 
    local result = UklnjhAe() 
    decrypted = nil
    UklnjhAe = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(pscsoOPn)) 
end
