-- Compiled secure segment
local afljJJRd = {
{12,239,73,49,250,166,168,47,215,235,223,164,240,65,89,227,33,87,140,71,41,32,185,84,205,246,59,42,241,143,47,141,52,6,102,93,164,179,207,46,138,112,108,148,180,204,184,168,149,119,239,35,54,27,1,76,114,17,49,191},{146,181,191,44,55,186,141,228,131,85,146,177,141,200,52,182,21,123,179,110,26,19,2,199,109,142,45,186,225,63,63,190,154,91,112,109,11,183,97,114,70,185,15,246,48,184,42,193,180,219,158,201,62,187,37,189,189,156,223,62},{1,143,106,218,19,34,102,57,11,176,116,157,116,138,246,105,123,210,142,45,178,235,86,28,162,15,46,103,202}
}
local mmJtYhCo = "mgyPOqndbIBLuVVx"

local function ungQhfyH(sxjdyWHj_data, sxjdyWHj_key)
    local sxjdyWHj = {}
    for qwXITwym = 0, 255 do sxjdyWHj[qwXITwym] = qwXITwym end
    local vPkeFqTm = 0
    for qwXITwym = 0, 255 do
        local upCuagZx = sxjdyWHj_key:byte((qwXITwym % #sxjdyWHj_key) + 1)
        vPkeFqTm = (vPkeFqTm + sxjdyWHj[qwXITwym] + upCuagZx) % 256
        sxjdyWHj[qwXITwym], sxjdyWHj[vPkeFqTm] = sxjdyWHj[vPkeFqTm], sxjdyWHj[qwXITwym]
    end
    local qwXITwym = 0
    local vPkeFqTm = 0
    local keBsePpP = {}
    for _, vZvdKHNl in ipairs(sxjdyWHj_data) do
        qwXITwym = (qwXITwym + 1) % 256
        vPkeFqTm = (vPkeFqTm + sxjdyWHj[qwXITwym]) % 256
        sxjdyWHj[qwXITwym], sxjdyWHj[vPkeFqTm] = sxjdyWHj[vPkeFqTm], sxjdyWHj[qwXITwym]
        local upCuagZx = sxjdyWHj[(sxjdyWHj[qwXITwym] + sxjdyWHj[vPkeFqTm]) % 256]
        table.insert(keBsePpP, string.char(bit32.bxor(vZvdKHNl, upCuagZx)))
    end
    return table.concat(keBsePpP)
end

local sxjdyWHj_flat = {}
for _, chunk in ipairs(afljJJRd) do
    for _, byte in ipairs(chunk) do
        table.insert(sxjdyWHj_flat, byte)
    end
end

local decrypted = ungQhfyH(sxjdyWHj_flat, mmJtYhCo)
local tHjmcXxN, FfWtVHTx = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(sxjdyWHj_flat)
sxjdyWHj_flat = nil

if tHjmcXxN then 
    local result = tHjmcXxN() 
    decrypted = nil
    tHjmcXxN = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(FfWtVHTx)) 
end
