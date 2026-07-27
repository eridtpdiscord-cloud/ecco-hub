-- Protected Segment (anti_cheat_bypass)
local oJsVFsoe = 29
local tbunupvn = {
{96,39,112,205,116,11,63,186,120,12,139,129,88,3,85,3,29,47,252,244,228,80,209,17,169,43,193,220,44,62,26,202,54,169,150,88,221,6,168,16,238,194,137,81,126,254,128,231,136,19,242,61,17,217,248,120,151,161,16,37},{11,254,224,19,171,241,87,149,106,122,219,246,115,219,180,194,97,159,170,104,137,14,134,35,172,14,119,178,219,162,240,26,241,96,188,45,113,69,209,168,165,219,177,74,122,220,38,221,183,201,169,244,12,211,104,165,171,94,17,134},{229,72,252,103,38,171,171,222,32,186,37,133,167,144,124,157,216,234,129,176,90,151,83,2,178,214,246,20,126}
}
local zVqssonZ = "EPqWiYdwioUkyEBO"

local function wXRHgXzB(HTyIBaBe_data, HTyIBaBe_key)
    if type(HTyIBaBe_key) ~= "string" or #HTyIBaBe_key == 0 then return "" end
    local HTyIBaBe = {}
    for veXmJNmo = 0, 255 do HTyIBaBe[veXmJNmo] = veXmJNmo end
    local tdTEEdYB = 0
    for veXmJNmo = 0, 255 do
        local EyBsSvab = HTyIBaBe_key:byte((veXmJNmo % #HTyIBaBe_key) + 1)
        tdTEEdYB = (tdTEEdYB + HTyIBaBe[veXmJNmo] + EyBsSvab) % 256
        HTyIBaBe[veXmJNmo], HTyIBaBe[tdTEEdYB] = HTyIBaBe[tdTEEdYB], HTyIBaBe[veXmJNmo]
    end
    local veXmJNmo = 0
    local tdTEEdYB = 0
    local BHOWUbUG = {}
    for _, EUvLYOhw in ipairs(HTyIBaBe_data) do
        veXmJNmo = (veXmJNmo + 1) % 256
        tdTEEdYB = (tdTEEdYB + HTyIBaBe[veXmJNmo]) % 256
        HTyIBaBe[veXmJNmo], HTyIBaBe[tdTEEdYB] = HTyIBaBe[tdTEEdYB], HTyIBaBe[veXmJNmo]
        local EyBsSvab = HTyIBaBe[(HTyIBaBe[veXmJNmo] + HTyIBaBe[tdTEEdYB]) % 256]
        local unmasked = bit32.bxor(EUvLYOhw, oJsVFsoe)
        table.insert(BHOWUbUG, string.char(bit32.bxor(unmasked, EyBsSvab)))
    end
    return table.concat(BHOWUbUG)
end

local HTyIBaBe_flat = {}
for _, chunk in ipairs(tbunupvn) do
    for _, byte in ipairs(chunk) do
        table.insert(HTyIBaBe_flat, byte)
    end
end

local decrypted = wXRHgXzB(HTyIBaBe_flat, zVqssonZ)
local bpmDawUU, cpPgrkuN = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(HTyIBaBe_flat)
HTyIBaBe_flat = nil

if bpmDawUU then 
    local result = bpmDawUU() 
    decrypted = nil
    bpmDawUU = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(cpPgrkuN)) 
end
