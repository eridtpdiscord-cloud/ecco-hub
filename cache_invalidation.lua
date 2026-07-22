-- Protected Segment (cache_invalidation)
local MjwUtkcW = 89
local vktBpMBv = {
{50,81,243,237,46,226,45,87,22,246,182,241,159,105,37,160,11,38,3,240,105,254,186,111,180,51,13,189,215,65,25,28,95,201,227,254,188,73,51,241,45,251,214,193,103,149,8,113,70,5,120,34,68,184,188,184,107,244,64,116},{228,215,127,9,107,149,98,224,40,201,9,64,237,175,101,18,92,233,154,243,93,107,190,221,65,144,153,4,166,97,232,23,141,240,147,93,124,77,41,220,50,145,37,186,2,244,116,147,51,38,42,25,75,83,142,173,138,2,63,83},{6,185,144,231,194,240,56,55,105,235,104,131,105,156,184,177,152,28,210,174,5,36,117,2,21,176,63,248,228,62}
}
local OjvwcvmT = "YAiCpCJwCuLleSFE"

local function xASnOmbk(oSFvaXMk_data, oSFvaXMk_key)
    local oSFvaXMk = {}
    for jyBFFPsI = 0, 255 do oSFvaXMk[jyBFFPsI] = jyBFFPsI end
    local aQLMySpl = 0
    for jyBFFPsI = 0, 255 do
        local MMlBopGq = oSFvaXMk_key:byte((jyBFFPsI % #oSFvaXMk_key) + 1)
        aQLMySpl = (aQLMySpl + oSFvaXMk[jyBFFPsI] + MMlBopGq) % 256
        oSFvaXMk[jyBFFPsI], oSFvaXMk[aQLMySpl] = oSFvaXMk[aQLMySpl], oSFvaXMk[jyBFFPsI]
    end
    local jyBFFPsI = 0
    local aQLMySpl = 0
    local mDcNRaKE = {}
    for _, kgywznxo in ipairs(oSFvaXMk_data) do
        jyBFFPsI = (jyBFFPsI + 1) % 256
        aQLMySpl = (aQLMySpl + oSFvaXMk[jyBFFPsI]) % 256
        oSFvaXMk[jyBFFPsI], oSFvaXMk[aQLMySpl] = oSFvaXMk[aQLMySpl], oSFvaXMk[jyBFFPsI]
        local MMlBopGq = oSFvaXMk[(oSFvaXMk[jyBFFPsI] + oSFvaXMk[aQLMySpl]) % 256]
        local unmasked = bit32.bxor(kgywznxo, MjwUtkcW)
        table.insert(mDcNRaKE, string.char(bit32.bxor(unmasked, MMlBopGq)))
    end
    return table.concat(mDcNRaKE)
end

local oSFvaXMk_flat = {}
for _, chunk in ipairs(vktBpMBv) do
    for _, byte in ipairs(chunk) do
        table.insert(oSFvaXMk_flat, byte)
    end
end

local decrypted = xASnOmbk(oSFvaXMk_flat, OjvwcvmT)
local utepgPgV, SFZGcExW = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(oSFvaXMk_flat)
oSFvaXMk_flat = nil

if utepgPgV then 
    local result = utepgPgV() 
    decrypted = nil
    utepgPgV = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(SFZGcExW)) 
end
