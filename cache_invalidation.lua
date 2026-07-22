-- Protected Segment (cache_invalidation)
local gqNzBZVe = 237
local MszrflAr = {
{133,177,54,190,248,95,170,203,151,97,238,211,125,218,163,58,106,15,252,151,136,122,99,129,215,156,114,201,178,219,9,114,39,105,91,120,120,207,85,249,30,109,55,154,181,199,12,49,92,236,30,53,111,121,177,101,42,204,146,102},{84,178,78,56,179,76,143,20,22,243,149,48,130,35,9,121,118,46,166,136,237,230,137,123,35,103,241,241,20,164,34,213,241,174,198,53,56,170,97,59,228,48,105,69,11,61,86,117,12,194,121,219,46,67,199,98,237,179,103,60},{229,241,228,180,66,218,5,232,111,155,36,254,245,178,236,30,154,10,72,74,5,215,211,235,29,127,220,51,66,99}
}
local PVQYOgSC = "KJhcsouXSQewwDwK"

local function BgUFwXKH(GTUEXJJz_data, GTUEXJJz_key)
    local GTUEXJJz = {}
    for rwfuLsMK = 0, 255 do GTUEXJJz[rwfuLsMK] = rwfuLsMK end
    local tVtgDLMR = 0
    for rwfuLsMK = 0, 255 do
        local eiMBwvWf = GTUEXJJz_key:byte((rwfuLsMK % #GTUEXJJz_key) + 1)
        tVtgDLMR = (tVtgDLMR + GTUEXJJz[rwfuLsMK] + eiMBwvWf) % 256
        GTUEXJJz[rwfuLsMK], GTUEXJJz[tVtgDLMR] = GTUEXJJz[tVtgDLMR], GTUEXJJz[rwfuLsMK]
    end
    local rwfuLsMK = 0
    local tVtgDLMR = 0
    local znFymorq = {}
    for _, vTNTVeuY in ipairs(GTUEXJJz_data) do
        rwfuLsMK = (rwfuLsMK + 1) % 256
        tVtgDLMR = (tVtgDLMR + GTUEXJJz[rwfuLsMK]) % 256
        GTUEXJJz[rwfuLsMK], GTUEXJJz[tVtgDLMR] = GTUEXJJz[tVtgDLMR], GTUEXJJz[rwfuLsMK]
        local eiMBwvWf = GTUEXJJz[(GTUEXJJz[rwfuLsMK] + GTUEXJJz[tVtgDLMR]) % 256]
        local unmasked = bit32.bxor(vTNTVeuY, gqNzBZVe)
        table.insert(znFymorq, string.char(bit32.bxor(unmasked, eiMBwvWf)))
    end
    return table.concat(znFymorq)
end

local GTUEXJJz_flat = {}
for _, chunk in ipairs(MszrflAr) do
    for _, byte in ipairs(chunk) do
        table.insert(GTUEXJJz_flat, byte)
    end
end

local decrypted = BgUFwXKH(GTUEXJJz_flat, PVQYOgSC)
local szKguoWo, jxyZbXeD = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(GTUEXJJz_flat)
GTUEXJJz_flat = nil

if szKguoWo then 
    local result = szKguoWo() 
    decrypted = nil
    szKguoWo = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(jxyZbXeD)) 
end
