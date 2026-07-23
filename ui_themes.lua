-- Protected Segment (ui_themes)
local eCUDbyml = 224
local TqvsGjTx = {
{250,75,134,138,241,224,235,145,172,133,172,181,29,160,32,76,84,161,122,103,138,30,197,157,189,239,215,205,133,77,192,125,43,49,160,98,96,217,94,134,206,96,39,231,251,202,77,49,197,155,70,149,86,227,203,47,121,133,226,171},{51,140,67,89,185,207,166,93,111,215,237,82,31,179,26,161,6,242,2,228,195,98,241,85,58,181,231,120,92,115,85,17,83,91,250,235,101,127,62,19,205,106,98,42,234,59,242,161,80,9,94,193,119,209,195,92,144,0,3,203},{15,131,69,149,51,19,248,118,37,165,137,14,68,184,106,102,137,87,90,123,25}
}
local htESsssO = "UtPGtfKZXvvitdEl"

local function lBrfNXgo(jCWRRnHv_data, jCWRRnHv_key)
    if type(jCWRRnHv_key) ~= "string" or #jCWRRnHv_key == 0 then return "" end
    local jCWRRnHv = {}
    for NWYavaiL = 0, 255 do jCWRRnHv[NWYavaiL] = NWYavaiL end
    local UwccCHMv = 0
    for NWYavaiL = 0, 255 do
        local ThvtBOap = jCWRRnHv_key:byte((NWYavaiL % #jCWRRnHv_key) + 1)
        UwccCHMv = (UwccCHMv + jCWRRnHv[NWYavaiL] + ThvtBOap) % 256
        jCWRRnHv[NWYavaiL], jCWRRnHv[UwccCHMv] = jCWRRnHv[UwccCHMv], jCWRRnHv[NWYavaiL]
    end
    local NWYavaiL = 0
    local UwccCHMv = 0
    local WrQErDpa = {}
    for _, kgtxaMOw in ipairs(jCWRRnHv_data) do
        NWYavaiL = (NWYavaiL + 1) % 256
        UwccCHMv = (UwccCHMv + jCWRRnHv[NWYavaiL]) % 256
        jCWRRnHv[NWYavaiL], jCWRRnHv[UwccCHMv] = jCWRRnHv[UwccCHMv], jCWRRnHv[NWYavaiL]
        local ThvtBOap = jCWRRnHv[(jCWRRnHv[NWYavaiL] + jCWRRnHv[UwccCHMv]) % 256]
        local unmasked = bit32.bxor(kgtxaMOw, eCUDbyml)
        table.insert(WrQErDpa, string.char(bit32.bxor(unmasked, ThvtBOap)))
    end
    return table.concat(WrQErDpa)
end

local jCWRRnHv_flat = {}
for _, chunk in ipairs(TqvsGjTx) do
    for _, byte in ipairs(chunk) do
        table.insert(jCWRRnHv_flat, byte)
    end
end

local decrypted = lBrfNXgo(jCWRRnHv_flat, htESsssO)
local gaooLmKV, iXPeNvES = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(jCWRRnHv_flat)
jCWRRnHv_flat = nil

if gaooLmKV then 
    local result = gaooLmKV() 
    decrypted = nil
    gaooLmKV = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(iXPeNvES)) 
end
