-- Protected Segment (math_vector_utils)
local sKRFddgQ = 97
local apxVVTep = {
{20,82,209,172,59,45,102,44,122,223,116,160,75,24,152,119,79,106,33,136,255,59,83,195,3,117,123,69,221,210,45,91,159,245,217,123,123,134,178,240,24,53,173,177,158,62,61,223,128,152,109,42,82,10,221,217,245,48,211,72},{76,50,105,254,36,109,31,39,239,115,101,110,8,225,163,135,113,249,202,139,26,169,38,83,27,145,141,174,1,148,94,35,149,62,197,37,132,13,54,95,189,135,133,186,21,164,10,4,12,69,146,226,180,20,116,128,223,52,57,16},{45,146,201,89,179,125,7,0,234,179,254,179,178,77,218,173,133,48,34,63,126,22,109,135,32,25,239,152,48}
}
local SuilWlTp = "vlHPPuHwLCfPaaEV"

local function YfmcNNcx(zicryQfa_data, zicryQfa_key)
    local zicryQfa = {}
    for XKQtGGIx = 0, 255 do zicryQfa[XKQtGGIx] = XKQtGGIx end
    local aGqfIAlL = 0
    for XKQtGGIx = 0, 255 do
        local NCTUSIpD = zicryQfa_key:byte((XKQtGGIx % #zicryQfa_key) + 1)
        aGqfIAlL = (aGqfIAlL + zicryQfa[XKQtGGIx] + NCTUSIpD) % 256
        zicryQfa[XKQtGGIx], zicryQfa[aGqfIAlL] = zicryQfa[aGqfIAlL], zicryQfa[XKQtGGIx]
    end
    local XKQtGGIx = 0
    local aGqfIAlL = 0
    local DynJEKsk = {}
    for _, pacJYmYW in ipairs(zicryQfa_data) do
        XKQtGGIx = (XKQtGGIx + 1) % 256
        aGqfIAlL = (aGqfIAlL + zicryQfa[XKQtGGIx]) % 256
        zicryQfa[XKQtGGIx], zicryQfa[aGqfIAlL] = zicryQfa[aGqfIAlL], zicryQfa[XKQtGGIx]
        local NCTUSIpD = zicryQfa[(zicryQfa[XKQtGGIx] + zicryQfa[aGqfIAlL]) % 256]
        local unmasked = bit32.bxor(pacJYmYW, sKRFddgQ)
        table.insert(DynJEKsk, string.char(bit32.bxor(unmasked, NCTUSIpD)))
    end
    return table.concat(DynJEKsk)
end

local zicryQfa_flat = {}
for _, chunk in ipairs(apxVVTep) do
    for _, byte in ipairs(chunk) do
        table.insert(zicryQfa_flat, byte)
    end
end

local decrypted = YfmcNNcx(zicryQfa_flat, SuilWlTp)
local ToKfrkDE, UQvPeabd = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(zicryQfa_flat)
zicryQfa_flat = nil

if ToKfrkDE then 
    local result = ToKfrkDE() 
    decrypted = nil
    ToKfrkDE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(UQvPeabd)) 
end
