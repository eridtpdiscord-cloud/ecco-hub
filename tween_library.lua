-- Protected Segment (tween_library)
local jHrACYuA = 124
local gsJvsKPl = {
{169,148,195,167,44,5,85,100,126,86,55,96,221,58,29,16,147,210,246,32,227,149,198,166,126,61,60,135,25,67,226,34,28,8,58,76,175,199,130,190,219,162,125,121,46,130,110,45,6,153,208,147,97,76,105,201,114,44,255,210},{51,103,145,251,103,20,179,219,194,235,232,1,152,134,196,150,43,213,56,78,178,190,33,39,42,136,164,58,8,212,32,141,89,78,216,0,210,15,239,7,227,159,150,26,32,83,173,66,164,11,89,94,245,166,6,15,192,53,47,217},{61,158,127,24,184,38,68,207,153,253,64,73,129,231,191,249,31,70,67,240,11,68,135,106,191}
}
local IuqBPkvu = "LrCqYsvtEKkXHNpt"

local function NVjyJVuj(bAJUueYD_data, bAJUueYD_key)
    if type(bAJUueYD_key) ~= "string" or #bAJUueYD_key == 0 then return "" end
    local bAJUueYD = {}
    for LKlizDRW = 0, 255 do bAJUueYD[LKlizDRW] = LKlizDRW end
    local RXsJMpYD = 0
    for LKlizDRW = 0, 255 do
        local wmUyaBQV = bAJUueYD_key:byte((LKlizDRW % #bAJUueYD_key) + 1)
        RXsJMpYD = (RXsJMpYD + bAJUueYD[LKlizDRW] + wmUyaBQV) % 256
        bAJUueYD[LKlizDRW], bAJUueYD[RXsJMpYD] = bAJUueYD[RXsJMpYD], bAJUueYD[LKlizDRW]
    end
    local LKlizDRW = 0
    local RXsJMpYD = 0
    local gTeIwXOF = {}
    for _, wVEvtSpt in ipairs(bAJUueYD_data) do
        LKlizDRW = (LKlizDRW + 1) % 256
        RXsJMpYD = (RXsJMpYD + bAJUueYD[LKlizDRW]) % 256
        bAJUueYD[LKlizDRW], bAJUueYD[RXsJMpYD] = bAJUueYD[RXsJMpYD], bAJUueYD[LKlizDRW]
        local wmUyaBQV = bAJUueYD[(bAJUueYD[LKlizDRW] + bAJUueYD[RXsJMpYD]) % 256]
        local unmasked = bit32.bxor(wVEvtSpt, jHrACYuA)
        table.insert(gTeIwXOF, string.char(bit32.bxor(unmasked, wmUyaBQV)))
    end
    return table.concat(gTeIwXOF)
end

local bAJUueYD_flat = {}
for _, chunk in ipairs(gsJvsKPl) do
    for _, byte in ipairs(chunk) do
        table.insert(bAJUueYD_flat, byte)
    end
end

local decrypted = NVjyJVuj(bAJUueYD_flat, IuqBPkvu)
local BrvfERTG, NOpniZCl = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(bAJUueYD_flat)
bAJUueYD_flat = nil

if BrvfERTG then 
    local result = BrvfERTG() 
    decrypted = nil
    BrvfERTG = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(NOpniZCl)) 
end
