-- Protected Segment (cache_invalidation)
local qkkkoIUS = 228
local ySecXlPl = {
{161,92,16,75,88,203,19,157,49,234,28,112,106,117,217,176,54,239,199,97,82,209,154,155,204,238,188,95,177,92,136,54,175,61,100,214,85,157,74,123,72,28,113,39,45,4,195,100,57,92,134,243,207,98,79,0,177,244,117,63},{127,125,124,161,128,32,152,247,36,153,205,32,156,235,242,95,255,6,24,35,218,89,220,119,198,232,243,253,18,119,228,78,246,136,170,62,95,246,252,54,36,73,156,80,200,223,27,7,102,15,77,25,216,28,251,169,10,82,224,73},{190,141,184,248,248,89,162,96,149,122,20,41,247,19,172,95,200,133,166,34,206,150,187,105,37,186,180,148,152,83}
}
local UCWMFZPG = "dezAYxjHAXfZRIoB"

local function jMrIrDPp(VdXMvSDq_data, VdXMvSDq_key)
    local VdXMvSDq = {}
    for WMOBfZua = 0, 255 do VdXMvSDq[WMOBfZua] = WMOBfZua end
    local pgNBXfAL = 0
    for WMOBfZua = 0, 255 do
        local dOThdUNf = VdXMvSDq_key:byte((WMOBfZua % #VdXMvSDq_key) + 1)
        pgNBXfAL = (pgNBXfAL + VdXMvSDq[WMOBfZua] + dOThdUNf) % 256
        VdXMvSDq[WMOBfZua], VdXMvSDq[pgNBXfAL] = VdXMvSDq[pgNBXfAL], VdXMvSDq[WMOBfZua]
    end
    local WMOBfZua = 0
    local pgNBXfAL = 0
    local aAXMYqxT = {}
    for _, zckUJGae in ipairs(VdXMvSDq_data) do
        WMOBfZua = (WMOBfZua + 1) % 256
        pgNBXfAL = (pgNBXfAL + VdXMvSDq[WMOBfZua]) % 256
        VdXMvSDq[WMOBfZua], VdXMvSDq[pgNBXfAL] = VdXMvSDq[pgNBXfAL], VdXMvSDq[WMOBfZua]
        local dOThdUNf = VdXMvSDq[(VdXMvSDq[WMOBfZua] + VdXMvSDq[pgNBXfAL]) % 256]
        local unmasked = bit32.bxor(zckUJGae, qkkkoIUS)
        table.insert(aAXMYqxT, string.char(bit32.bxor(unmasked, dOThdUNf)))
    end
    return table.concat(aAXMYqxT)
end

local VdXMvSDq_flat = {}
for _, chunk in ipairs(ySecXlPl) do
    for _, byte in ipairs(chunk) do
        table.insert(VdXMvSDq_flat, byte)
    end
end

local decrypted = jMrIrDPp(VdXMvSDq_flat, UCWMFZPG)
local cNAUlxDE, nlVnFdAL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(VdXMvSDq_flat)
VdXMvSDq_flat = nil

if cNAUlxDE then 
    local result = cNAUlxDE() 
    decrypted = nil
    cNAUlxDE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(nlVnFdAL)) 
end
