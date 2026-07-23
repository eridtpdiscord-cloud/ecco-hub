-- Protected Segment (math_vector_utils)
local YjhodCxp = 126
local MuDhCiLE = {
{150,218,49,34,108,171,60,149,65,20,8,67,155,142,109,138,6,147,64,19,103,6,135,80,204,185,230,34,15,118,143,104,16,167,225,204,150,57,104,10,187,125,145,62,207,232,64,236,80,201,205,93,146,83,89,133,212,106,95,243},{196,59,39,92,10,108,155,27,11,87,235,4,16,132,134,221,85,149,178,2,95,201,105,131,216,199,0,22,202,31,244,4,248,141,63,255,71,163,59,180,176,112,178,242,255,98,193,252,173,32,213,104,144,89,247,176,130,103,219,3},{47,162,218,5,135,133,242,107,180,77,117,157,81,194,245,120,155,38,54,56,209,45,22,61,176,233,134,46,135}
}
local ZqkHPWwY = "qZddxzEFHZgHAIqr"

local function KwwQBzXg(TunYeDcB_data, TunYeDcB_key)
    if type(TunYeDcB_key) ~= "string" or #TunYeDcB_key == 0 then return "" end
    local TunYeDcB = {}
    for dXZyzMfI = 0, 255 do TunYeDcB[dXZyzMfI] = dXZyzMfI end
    local iNMXJvmR = 0
    for dXZyzMfI = 0, 255 do
        local pbLryviv = TunYeDcB_key:byte((dXZyzMfI % #TunYeDcB_key) + 1)
        iNMXJvmR = (iNMXJvmR + TunYeDcB[dXZyzMfI] + pbLryviv) % 256
        TunYeDcB[dXZyzMfI], TunYeDcB[iNMXJvmR] = TunYeDcB[iNMXJvmR], TunYeDcB[dXZyzMfI]
    end
    local dXZyzMfI = 0
    local iNMXJvmR = 0
    local GGkTSNWE = {}
    for _, ROgdgGDD in ipairs(TunYeDcB_data) do
        dXZyzMfI = (dXZyzMfI + 1) % 256
        iNMXJvmR = (iNMXJvmR + TunYeDcB[dXZyzMfI]) % 256
        TunYeDcB[dXZyzMfI], TunYeDcB[iNMXJvmR] = TunYeDcB[iNMXJvmR], TunYeDcB[dXZyzMfI]
        local pbLryviv = TunYeDcB[(TunYeDcB[dXZyzMfI] + TunYeDcB[iNMXJvmR]) % 256]
        local unmasked = bit32.bxor(ROgdgGDD, YjhodCxp)
        table.insert(GGkTSNWE, string.char(bit32.bxor(unmasked, pbLryviv)))
    end
    return table.concat(GGkTSNWE)
end

local TunYeDcB_flat = {}
for _, chunk in ipairs(MuDhCiLE) do
    for _, byte in ipairs(chunk) do
        table.insert(TunYeDcB_flat, byte)
    end
end

local decrypted = KwwQBzXg(TunYeDcB_flat, ZqkHPWwY)
local ENKUdwZE, CbHvtVzf = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(TunYeDcB_flat)
TunYeDcB_flat = nil

if ENKUdwZE then 
    local result = ENKUdwZE() 
    decrypted = nil
    ENKUdwZE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(CbHvtVzf)) 
end
