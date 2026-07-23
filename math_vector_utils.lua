-- Protected Segment (math_vector_utils)
local PoGwJUOz = 219
local FUDLkEcJ = {
{47,248,238,45,117,191,68,204,169,72,121,20,75,5,223,23,7,126,86,141,84,3,240,179,196,3,98,235,187,176,93,23,70,105,56,158,195,153,63,22,177,168,5,212,15,206,95,91,250,9,160,131,73,57,218,49,5,242,194,135},{42,210,157,95,250,126,141,114,83,78,41,215,45,79,203,190,226,156,27,84,143,71,172,166,248,185,162,24,166,84,205,238,92,141,17,56,156,128,30,64,15,11,169,234,66,166,150,84,10,124,67,98,110,170,244,9,252,102,164,15},{209,19,135,181,51,163,203,245,49,77,168,172,218,252,23,94,75,126,9,149,233,116,64,119,70,35,218,84,88}
}
local PpxnQPes = "HtHGjIWQBZkQnKqe"

local function aNDjMUxT(UESrveOR_data, UESrveOR_key)
    if type(UESrveOR_key) ~= "string" or #UESrveOR_key == 0 then return "" end
    local UESrveOR = {}
    for KUoIgpYx = 0, 255 do UESrveOR[KUoIgpYx] = KUoIgpYx end
    local WJofwlSW = 0
    for KUoIgpYx = 0, 255 do
        local xvLGGrQz = UESrveOR_key:byte((KUoIgpYx % #UESrveOR_key) + 1)
        WJofwlSW = (WJofwlSW + UESrveOR[KUoIgpYx] + xvLGGrQz) % 256
        UESrveOR[KUoIgpYx], UESrveOR[WJofwlSW] = UESrveOR[WJofwlSW], UESrveOR[KUoIgpYx]
    end
    local KUoIgpYx = 0
    local WJofwlSW = 0
    local CRSmcfPE = {}
    for _, qsuZZEkj in ipairs(UESrveOR_data) do
        KUoIgpYx = (KUoIgpYx + 1) % 256
        WJofwlSW = (WJofwlSW + UESrveOR[KUoIgpYx]) % 256
        UESrveOR[KUoIgpYx], UESrveOR[WJofwlSW] = UESrveOR[WJofwlSW], UESrveOR[KUoIgpYx]
        local xvLGGrQz = UESrveOR[(UESrveOR[KUoIgpYx] + UESrveOR[WJofwlSW]) % 256]
        local unmasked = bit32.bxor(qsuZZEkj, PoGwJUOz)
        table.insert(CRSmcfPE, string.char(bit32.bxor(unmasked, xvLGGrQz)))
    end
    return table.concat(CRSmcfPE)
end

local UESrveOR_flat = {}
for _, chunk in ipairs(FUDLkEcJ) do
    for _, byte in ipairs(chunk) do
        table.insert(UESrveOR_flat, byte)
    end
end

local decrypted = aNDjMUxT(UESrveOR_flat, PpxnQPes)
local XSsZZsyG, BAWZjHGi = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(UESrveOR_flat)
UESrveOR_flat = nil

if XSsZZsyG then 
    local result = XSsZZsyG() 
    decrypted = nil
    XSsZZsyG = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(BAWZjHGi)) 
end
