-- Protected Segment (math_vector_utils)
local ePWtVIXP = 3
local AheyjaaT = {
{250,43,136,243,131,252,84,19,1,182,31,247,54,32,42,143,150,38,147,178,25,213,141,144,70,20,137,76,125,9,4,0,172,78,35,22,48,141,219,199,159,94,215,24,211,97,163,128,192,155,183,91,76,49,241,72,73,227,178,155},{111,253,176,158,83,48,239,249,120,92,85,141,155,250,146,198,16,219,125,147,192,110,214,138,189,224,250,217,27,57,98,212,155,80,56,121,252,72,11,145,124,43,46,240,195,82,71,125,149,74,78,23,240,65,103,140,1,154,132,253},{61,162,160,247,239,146,25,237,21,99,174,91,174,157,28,83,166,147,174,111,54,202,77,205,113,99,32,36,120}
}
local KVkECmuV = "BVdKVGtCCAGqIxmO"

local function OfWCVrJQ(nbJNoeKp_data, nbJNoeKp_key)
    if type(nbJNoeKp_key) ~= "string" or #nbJNoeKp_key == 0 then return "" end
    local nbJNoeKp = {}
    for OUZhFyeB = 0, 255 do nbJNoeKp[OUZhFyeB] = OUZhFyeB end
    local FyIgoyYa = 0
    for OUZhFyeB = 0, 255 do
        local vUzUAElh = nbJNoeKp_key:byte((OUZhFyeB % #nbJNoeKp_key) + 1)
        FyIgoyYa = (FyIgoyYa + nbJNoeKp[OUZhFyeB] + vUzUAElh) % 256
        nbJNoeKp[OUZhFyeB], nbJNoeKp[FyIgoyYa] = nbJNoeKp[FyIgoyYa], nbJNoeKp[OUZhFyeB]
    end
    local OUZhFyeB = 0
    local FyIgoyYa = 0
    local XrvvRXSM = {}
    for _, ZstUGrpL in ipairs(nbJNoeKp_data) do
        OUZhFyeB = (OUZhFyeB + 1) % 256
        FyIgoyYa = (FyIgoyYa + nbJNoeKp[OUZhFyeB]) % 256
        nbJNoeKp[OUZhFyeB], nbJNoeKp[FyIgoyYa] = nbJNoeKp[FyIgoyYa], nbJNoeKp[OUZhFyeB]
        local vUzUAElh = nbJNoeKp[(nbJNoeKp[OUZhFyeB] + nbJNoeKp[FyIgoyYa]) % 256]
        local unmasked = bit32.bxor(ZstUGrpL, ePWtVIXP)
        table.insert(XrvvRXSM, string.char(bit32.bxor(unmasked, vUzUAElh)))
    end
    return table.concat(XrvvRXSM)
end

local nbJNoeKp_flat = {}
for _, chunk in ipairs(AheyjaaT) do
    for _, byte in ipairs(chunk) do
        table.insert(nbJNoeKp_flat, byte)
    end
end

local decrypted = OfWCVrJQ(nbJNoeKp_flat, KVkECmuV)
local GxGhHVwO, azQGMBAe = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(nbJNoeKp_flat)
nbJNoeKp_flat = nil

if GxGhHVwO then 
    local result = GxGhHVwO() 
    decrypted = nil
    GxGhHVwO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(azQGMBAe)) 
end
