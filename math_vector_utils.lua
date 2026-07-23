-- Protected Segment (math_vector_utils)
local qWcPrTUX = 45
local zKTXeFhu = {
{157,232,202,132,171,169,29,102,25,65,63,10,157,221,184,121,91,56,208,40,212,231,209,57,184,147,181,33,110,21,152,55,129,28,131,156,239,46,251,124,250,21,229,39,96,147,250,44,105,98,234,226,121,5,167,72,129,69,237,226},{199,49,88,10,163,69,87,105,215,135,204,6,99,216,24,5,139,142,27,216,82,62,65,123,214,79,127,127,114,29,185,128,96,207,140,6,92,49,110,64,12,127,9,153,184,224,45,70,108,42,138,157,70,56,228,17,46,179,250,212},{35,124,23,136,20,239,249,24,83,42,234,205,74,63,90,158,225,156,13,92,97,191,137,211,16,230,90,208,99}
}
local kUbPoUSZ = "cBYPVblJdQbBDnTN"

local function rAzDYzwd(SPmZYItj_data, SPmZYItj_key)
    if type(SPmZYItj_key) ~= "string" or #SPmZYItj_key == 0 then return "" end
    local SPmZYItj = {}
    for GSwHxLkl = 0, 255 do SPmZYItj[GSwHxLkl] = GSwHxLkl end
    local KGuKzcci = 0
    for GSwHxLkl = 0, 255 do
        local ebqfOqdf = SPmZYItj_key:byte((GSwHxLkl % #SPmZYItj_key) + 1)
        KGuKzcci = (KGuKzcci + SPmZYItj[GSwHxLkl] + ebqfOqdf) % 256
        SPmZYItj[GSwHxLkl], SPmZYItj[KGuKzcci] = SPmZYItj[KGuKzcci], SPmZYItj[GSwHxLkl]
    end
    local GSwHxLkl = 0
    local KGuKzcci = 0
    local SihUVPDX = {}
    for _, WFkHVDbt in ipairs(SPmZYItj_data) do
        GSwHxLkl = (GSwHxLkl + 1) % 256
        KGuKzcci = (KGuKzcci + SPmZYItj[GSwHxLkl]) % 256
        SPmZYItj[GSwHxLkl], SPmZYItj[KGuKzcci] = SPmZYItj[KGuKzcci], SPmZYItj[GSwHxLkl]
        local ebqfOqdf = SPmZYItj[(SPmZYItj[GSwHxLkl] + SPmZYItj[KGuKzcci]) % 256]
        local unmasked = bit32.bxor(WFkHVDbt, qWcPrTUX)
        table.insert(SihUVPDX, string.char(bit32.bxor(unmasked, ebqfOqdf)))
    end
    return table.concat(SihUVPDX)
end

local SPmZYItj_flat = {}
for _, chunk in ipairs(zKTXeFhu) do
    for _, byte in ipairs(chunk) do
        table.insert(SPmZYItj_flat, byte)
    end
end

local decrypted = rAzDYzwd(SPmZYItj_flat, kUbPoUSZ)
local oCfsJMlL, jFNofkHX = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(SPmZYItj_flat)
SPmZYItj_flat = nil

if oCfsJMlL then 
    local result = oCfsJMlL() 
    decrypted = nil
    oCfsJMlL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(jFNofkHX)) 
end
