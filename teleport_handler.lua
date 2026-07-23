-- Protected Segment (teleport_handler)
local dVJMXRqP = 195
local wOpekdnD = {
{97,83,111,91,60,192,132,187,159,202,209,159,206,112,112,89,54,92,106,72,131,206,106,70,175,121,37,169,186,221,15,91,99,243,158,219,243,222,81,58,33,100,132,134,86,79,59,198,215,177,90,220,25,218,216,109,54,62,216,245},{238,31,17,151,235,33,236,75,179,40,127,126,216,237,94,251,143,72,156,235,56,109,25,201,51,221,207,1,15,212,222,92,9,39,167,13,160,97,181,253,207,202,146,38,27,122,169,111,0,20,72,94,79,172,55,60,137,114,125,45},{59,174,214,58,248,234,102,153,80,170,45,228,126,13,84,158,37,105,14,171,28,97,220,142,46,176,133,206}
}
local pvklvdXK = "CrgrwCiVCkolibEi"

local function OrOVZnJw(SVZpQwJi_data, SVZpQwJi_key)
    if type(SVZpQwJi_key) ~= "string" or #SVZpQwJi_key == 0 then return "" end
    local SVZpQwJi = {}
    for ZfhlVONv = 0, 255 do SVZpQwJi[ZfhlVONv] = ZfhlVONv end
    local FrytasvA = 0
    for ZfhlVONv = 0, 255 do
        local VwpYneHT = SVZpQwJi_key:byte((ZfhlVONv % #SVZpQwJi_key) + 1)
        FrytasvA = (FrytasvA + SVZpQwJi[ZfhlVONv] + VwpYneHT) % 256
        SVZpQwJi[ZfhlVONv], SVZpQwJi[FrytasvA] = SVZpQwJi[FrytasvA], SVZpQwJi[ZfhlVONv]
    end
    local ZfhlVONv = 0
    local FrytasvA = 0
    local hfGnYXpy = {}
    for _, yGiRBbGC in ipairs(SVZpQwJi_data) do
        ZfhlVONv = (ZfhlVONv + 1) % 256
        FrytasvA = (FrytasvA + SVZpQwJi[ZfhlVONv]) % 256
        SVZpQwJi[ZfhlVONv], SVZpQwJi[FrytasvA] = SVZpQwJi[FrytasvA], SVZpQwJi[ZfhlVONv]
        local VwpYneHT = SVZpQwJi[(SVZpQwJi[ZfhlVONv] + SVZpQwJi[FrytasvA]) % 256]
        local unmasked = bit32.bxor(yGiRBbGC, dVJMXRqP)
        table.insert(hfGnYXpy, string.char(bit32.bxor(unmasked, VwpYneHT)))
    end
    return table.concat(hfGnYXpy)
end

local SVZpQwJi_flat = {}
for _, chunk in ipairs(wOpekdnD) do
    for _, byte in ipairs(chunk) do
        table.insert(SVZpQwJi_flat, byte)
    end
end

local decrypted = OrOVZnJw(SVZpQwJi_flat, pvklvdXK)
local PflIjziI, pNKSCDBc = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(SVZpQwJi_flat)
SVZpQwJi_flat = nil

if PflIjziI then 
    local result = PflIjziI() 
    decrypted = nil
    PflIjziI = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(pNKSCDBc)) 
end
