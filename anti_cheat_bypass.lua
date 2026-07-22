-- Protected Segment (anti_cheat_bypass)
local LGvOYryj = 8
local tVPQYkRo = {
{117,30,231,114,20,123,136,139,220,155,189,118,44,207,72,199,89,100,185,82,210,197,57,117,40,176,179,249,180,186,120,95,84,177,62,95,171,127,152,104,31,215,178,244,100,28,71,223,251,49,177,242,127,199,146,171,176,72,67,251},{179,28,30,51,131,116,247,3,36,26,212,54,21,175,30,37,52,215,52,210,177,240,219,221,58,10,169,130,130,230,198,222,233,82,234,103,167,237,168,190,110,87,43,238,243,14,237,58,231,107,1,107,62,211,80,133,241,76,109,64},{229,217,67,137,238,115,248,149,4,46,121,93,28,216,133,129,49,93,168,69,131,193,47,240,180,118,97,132,42}
}
local KnHJPJBO = "SetRTIhOwuaPFgJO"

local function gToHjBON(OFneFJek_data, OFneFJek_key)
    local OFneFJek = {}
    for UdIQgpED = 0, 255 do OFneFJek[UdIQgpED] = UdIQgpED end
    local UnwwCeEO = 0
    for UdIQgpED = 0, 255 do
        local xjXOJUSq = OFneFJek_key:byte((UdIQgpED % #OFneFJek_key) + 1)
        UnwwCeEO = (UnwwCeEO + OFneFJek[UdIQgpED] + xjXOJUSq) % 256
        OFneFJek[UdIQgpED], OFneFJek[UnwwCeEO] = OFneFJek[UnwwCeEO], OFneFJek[UdIQgpED]
    end
    local UdIQgpED = 0
    local UnwwCeEO = 0
    local YSJefSbs = {}
    for _, IzQMJTqO in ipairs(OFneFJek_data) do
        UdIQgpED = (UdIQgpED + 1) % 256
        UnwwCeEO = (UnwwCeEO + OFneFJek[UdIQgpED]) % 256
        OFneFJek[UdIQgpED], OFneFJek[UnwwCeEO] = OFneFJek[UnwwCeEO], OFneFJek[UdIQgpED]
        local xjXOJUSq = OFneFJek[(OFneFJek[UdIQgpED] + OFneFJek[UnwwCeEO]) % 256]
        local unmasked = bit32.bxor(IzQMJTqO, LGvOYryj)
        table.insert(YSJefSbs, string.char(bit32.bxor(unmasked, xjXOJUSq)))
    end
    return table.concat(YSJefSbs)
end

local OFneFJek_flat = {}
for _, chunk in ipairs(tVPQYkRo) do
    for _, byte in ipairs(chunk) do
        table.insert(OFneFJek_flat, byte)
    end
end

local decrypted = gToHjBON(OFneFJek_flat, KnHJPJBO)
local ivNUCWnA, qpDpxISO = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(OFneFJek_flat)
OFneFJek_flat = nil

if ivNUCWnA then 
    local result = ivNUCWnA() 
    decrypted = nil
    ivNUCWnA = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(qpDpxISO)) 
end
