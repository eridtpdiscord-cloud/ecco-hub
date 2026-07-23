-- Protected Segment (network_optimizer)
local wpQBSuge = 152
local YasJntLU = {
{254,140,255,64,246,221,175,231,130,19,160,131,4,42,109,249,190,84,112,195,252,13,34,18,211,194,177,251,63,179,137,73,114,99,7,150,236,32,129,56,61,123,11,107,60,171,227,244,169,255,111,211,222,185,196,222,12,204,120,0},{208,251,204,121,196,174,202,109,178,66,121,227,235,149,167,110,117,54,112,211,225,48,168,57,120,183,38,96,59,78,60,88,109,93,247,182,184,3,153,130,48,205,23,227,153,165,131,255,224,118,130,97,105,227,19,5,25,198,127,245},{91,129,97,18,28,113,164,140,231,8,230,156,42,217,220,158,52,160,86,103,34,42,53,7,85,67,125,235,240}
}
local GsRCKDva = "hPPjXFPWvgwmfdlC"

local function SmhffGkK(itWTgdVo_data, itWTgdVo_key)
    if type(itWTgdVo_key) ~= "string" or #itWTgdVo_key == 0 then return "" end
    local itWTgdVo = {}
    for nkwmgTKu = 0, 255 do itWTgdVo[nkwmgTKu] = nkwmgTKu end
    local OxWAIvtA = 0
    for nkwmgTKu = 0, 255 do
        local fppeKjnR = itWTgdVo_key:byte((nkwmgTKu % #itWTgdVo_key) + 1)
        OxWAIvtA = (OxWAIvtA + itWTgdVo[nkwmgTKu] + fppeKjnR) % 256
        itWTgdVo[nkwmgTKu], itWTgdVo[OxWAIvtA] = itWTgdVo[OxWAIvtA], itWTgdVo[nkwmgTKu]
    end
    local nkwmgTKu = 0
    local OxWAIvtA = 0
    local BjCKkHXK = {}
    for _, lnBzICgw in ipairs(itWTgdVo_data) do
        nkwmgTKu = (nkwmgTKu + 1) % 256
        OxWAIvtA = (OxWAIvtA + itWTgdVo[nkwmgTKu]) % 256
        itWTgdVo[nkwmgTKu], itWTgdVo[OxWAIvtA] = itWTgdVo[OxWAIvtA], itWTgdVo[nkwmgTKu]
        local fppeKjnR = itWTgdVo[(itWTgdVo[nkwmgTKu] + itWTgdVo[OxWAIvtA]) % 256]
        local unmasked = bit32.bxor(lnBzICgw, wpQBSuge)
        table.insert(BjCKkHXK, string.char(bit32.bxor(unmasked, fppeKjnR)))
    end
    return table.concat(BjCKkHXK)
end

local itWTgdVo_flat = {}
for _, chunk in ipairs(YasJntLU) do
    for _, byte in ipairs(chunk) do
        table.insert(itWTgdVo_flat, byte)
    end
end

local decrypted = SmhffGkK(itWTgdVo_flat, GsRCKDva)
local ZDCPRdqn, RgtSTloF = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(itWTgdVo_flat)
itWTgdVo_flat = nil

if ZDCPRdqn then 
    local result = ZDCPRdqn() 
    decrypted = nil
    ZDCPRdqn = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(RgtSTloF)) 
end
