-- Protected Segment (utility_helper)
local iaFceLjQ = 123
local GJawPdZn = {
{37,229,64,7,205,111,68,219,52,230,112,24,109,182,24,224,226,163,172,251,137,84,208,107,137,167,155,35,26,48,136,28,215,122,146,165,190,117,185,208,124,93,83,100,56,190,42,193,226,101,182,205,156,115,210,144,19,4,55,122},{10,174,108,119,240,103,184,217,241,66,46,237,105,218,254,170,91,8,124,46,67,236,86,45,121,121,96,111,161,122,82,250,36,198,228,45,182,74,24,170,202,47,214,87,131,167,189,207,50,193,77,28,152,147,204,183,120,105,147,189},{135,108,136,42,222,147,39,86,3,100,106,127,34,240,65,23,18,3,164,14,190,56,8,54,115,54}
}
local dNQDfLas = "SazJxTruwUaOJekf"

local function KVdjzHgm(rjfhnXbj_data, rjfhnXbj_key)
    local rjfhnXbj = {}
    for HodFwYfB = 0, 255 do rjfhnXbj[HodFwYfB] = HodFwYfB end
    local kOooDmBm = 0
    for HodFwYfB = 0, 255 do
        local keSiZGzA = rjfhnXbj_key:byte((HodFwYfB % #rjfhnXbj_key) + 1)
        kOooDmBm = (kOooDmBm + rjfhnXbj[HodFwYfB] + keSiZGzA) % 256
        rjfhnXbj[HodFwYfB], rjfhnXbj[kOooDmBm] = rjfhnXbj[kOooDmBm], rjfhnXbj[HodFwYfB]
    end
    local HodFwYfB = 0
    local kOooDmBm = 0
    local WnFfLpZL = {}
    for _, aylMqMWo in ipairs(rjfhnXbj_data) do
        HodFwYfB = (HodFwYfB + 1) % 256
        kOooDmBm = (kOooDmBm + rjfhnXbj[HodFwYfB]) % 256
        rjfhnXbj[HodFwYfB], rjfhnXbj[kOooDmBm] = rjfhnXbj[kOooDmBm], rjfhnXbj[HodFwYfB]
        local keSiZGzA = rjfhnXbj[(rjfhnXbj[HodFwYfB] + rjfhnXbj[kOooDmBm]) % 256]
        local unmasked = bit32.bxor(aylMqMWo, iaFceLjQ)
        table.insert(WnFfLpZL, string.char(bit32.bxor(unmasked, keSiZGzA)))
    end
    return table.concat(WnFfLpZL)
end

local rjfhnXbj_flat = {}
for _, chunk in ipairs(GJawPdZn) do
    for _, byte in ipairs(chunk) do
        table.insert(rjfhnXbj_flat, byte)
    end
end

local decrypted = KVdjzHgm(rjfhnXbj_flat, dNQDfLas)
local fjCqLrHt, MAZfRagj = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(rjfhnXbj_flat)
rjfhnXbj_flat = nil

if fjCqLrHt then 
    local result = fjCqLrHt() 
    decrypted = nil
    fjCqLrHt = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(MAZfRagj)) 
end
