-- Compiled secure segment
local VxmWgGnz = {
{111,29,23,122,70,163,59,160,212,212,158,187,7,183,6,161,206,80,162,239,197,202,190,153,200,99,156,124,113,169,164,241,62,119,3,255,230,48,87,219,222,109,103,175,39,72,46,16,10,76,126,242,237,133,221,107,123,169,208,166},{67,165,124,2,167,88,239,245,211,238,126,190,5,130,162,128,74,229,59,183,188,21,175,42,163,88,236,122,174,75,205,241,152,135,133,246,103,209,167,231,58,225,247,134,59,109,164,49,177,102,224,56,54,181,182,32,72,17,172,91},{108,205,19,122,250,38,121,45,6,206,165,7,111,255,186,104,128,82,15,185,94,102,137,165,228,252,143,8}
}
local dUubZKQr = "TfBoUQYozyjUcqbJ"

local function yFiKyTBc(AtITiLsH_data, AtITiLsH_key)
    local AtITiLsH = {}
    for qRhJMjHV = 0, 255 do AtITiLsH[qRhJMjHV] = qRhJMjHV end
    local OvyiduDE = 0
    for qRhJMjHV = 0, 255 do
        local UiprgpkO = AtITiLsH_key:byte((qRhJMjHV % #AtITiLsH_key) + 1)
        OvyiduDE = (OvyiduDE + AtITiLsH[qRhJMjHV] + UiprgpkO) % 256
        AtITiLsH[qRhJMjHV], AtITiLsH[OvyiduDE] = AtITiLsH[OvyiduDE], AtITiLsH[qRhJMjHV]
    end
    local qRhJMjHV = 0
    local OvyiduDE = 0
    local xByZpmtV = {}
    for _, nJhUXgxc in ipairs(AtITiLsH_data) do
        qRhJMjHV = (qRhJMjHV + 1) % 256
        OvyiduDE = (OvyiduDE + AtITiLsH[qRhJMjHV]) % 256
        AtITiLsH[qRhJMjHV], AtITiLsH[OvyiduDE] = AtITiLsH[OvyiduDE], AtITiLsH[qRhJMjHV]
        local UiprgpkO = AtITiLsH[(AtITiLsH[qRhJMjHV] + AtITiLsH[OvyiduDE]) % 256]
        table.insert(xByZpmtV, string.char(bit32.bxor(nJhUXgxc, UiprgpkO)))
    end
    return table.concat(xByZpmtV)
end

local AtITiLsH_flat = {}
for _, chunk in ipairs(VxmWgGnz) do
    for _, byte in ipairs(chunk) do
        table.insert(AtITiLsH_flat, byte)
    end
end

local decrypted = yFiKyTBc(AtITiLsH_flat, dUubZKQr)
local siAMtdtt, yJRbtJlz = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(AtITiLsH_flat)
AtITiLsH_flat = nil

if siAMtdtt then 
    local result = siAMtdtt() 
    decrypted = nil
    siAMtdtt = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(yJRbtJlz)) 
end
