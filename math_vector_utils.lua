-- Compiled secure segment
local mnhAeMCZ = {
{158,98,8,227,251,184,216,243,238,25,245,189,83,215,199,113,100,98,19,87,184,233,207,248,118,227,145,197,180,8,148,219,48,1,167,248,36,210,149,45,251,24,127,101,0,61,56,110,156,107,115,68,24,197,53,77,155,6,10,127},{193,157,41,116,147,49,80,146,87,201,130,152,70,24,102,47,119,174,203,43,132,203,247,64,224,75,4,39,50,120,30,186,253,104,106,51,164,225,175,111,78,9,190,217,101,75,27,221,48,225,35,198,175,24,201,174,67,177,177,209},{238,44,194,59,156,25,91,162,182,44,88,216,23,176,147,119,223,100,136,122,40,130,140,153,52,76,188,38,102}
}
local OjLQWtxN = "HQyUnRDyTGNYIyAm"

local function nWouTGho(mtXQsInu_data, mtXQsInu_key)
    local mtXQsInu = {}
    for uavZqrcq = 0, 255 do mtXQsInu[uavZqrcq] = uavZqrcq end
    local dCSPLDHp = 0
    for uavZqrcq = 0, 255 do
        local LNSWhVkk = mtXQsInu_key:byte((uavZqrcq % #mtXQsInu_key) + 1)
        dCSPLDHp = (dCSPLDHp + mtXQsInu[uavZqrcq] + LNSWhVkk) % 256
        mtXQsInu[uavZqrcq], mtXQsInu[dCSPLDHp] = mtXQsInu[dCSPLDHp], mtXQsInu[uavZqrcq]
    end
    local uavZqrcq = 0
    local dCSPLDHp = 0
    local WFqnfkjH = {}
    for _, RJeFCAkl in ipairs(mtXQsInu_data) do
        uavZqrcq = (uavZqrcq + 1) % 256
        dCSPLDHp = (dCSPLDHp + mtXQsInu[uavZqrcq]) % 256
        mtXQsInu[uavZqrcq], mtXQsInu[dCSPLDHp] = mtXQsInu[dCSPLDHp], mtXQsInu[uavZqrcq]
        local LNSWhVkk = mtXQsInu[(mtXQsInu[uavZqrcq] + mtXQsInu[dCSPLDHp]) % 256]
        table.insert(WFqnfkjH, string.char(bit32.bxor(RJeFCAkl, LNSWhVkk)))
    end
    return table.concat(WFqnfkjH)
end

local mtXQsInu_flat = {}
for _, chunk in ipairs(mnhAeMCZ) do
    for _, byte in ipairs(chunk) do
        table.insert(mtXQsInu_flat, byte)
    end
end

local decrypted = nWouTGho(mtXQsInu_flat, OjLQWtxN)
local isbvXOtJ, UVQefUgw = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(mtXQsInu_flat)
mtXQsInu_flat = nil

if isbvXOtJ then 
    local result = isbvXOtJ() 
    decrypted = nil
    isbvXOtJ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(UVQefUgw)) 
end
