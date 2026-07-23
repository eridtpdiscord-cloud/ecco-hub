-- Protected Segment (cache_invalidation)
local IErfibHj = 105
local NwmWhTFh = {
{75,199,69,244,82,99,179,213,99,233,103,216,184,114,81,207,135,6,131,176,59,101,115,154,210,217,183,213,247,131,7,208,77,110,69,218,127,195,239,13,123,75,212,96,138,2,94,236,121,83,89,252,25,202,15,69,159,8,4,77},{97,60,239,93,184,198,143,22,83,7,241,114,163,55,188,30,63,89,138,19,184,23,57,56,141,88,226,13,151,121,143,132,211,140,103,192,83,118,157,122,138,51,112,100,161,168,20,155,183,182,97,33,24,85,236,32,188,198,162,3},{186,135,209,105,34,14,106,22,201,201,43,92,204,134,168,53,6,186,124,231,143,0,66,52,87,189,101,53,54,93}
}
local VMacTWsG = "SDfZHzzoVKbOPHOM"

local function weLKDRdW(UStnxgqz_data, UStnxgqz_key)
    if type(UStnxgqz_key) ~= "string" or #UStnxgqz_key == 0 then return "" end
    local UStnxgqz = {}
    for vpZEDHdI = 0, 255 do UStnxgqz[vpZEDHdI] = vpZEDHdI end
    local LbIOYCsG = 0
    for vpZEDHdI = 0, 255 do
        local iQzOjdSU = UStnxgqz_key:byte((vpZEDHdI % #UStnxgqz_key) + 1)
        LbIOYCsG = (LbIOYCsG + UStnxgqz[vpZEDHdI] + iQzOjdSU) % 256
        UStnxgqz[vpZEDHdI], UStnxgqz[LbIOYCsG] = UStnxgqz[LbIOYCsG], UStnxgqz[vpZEDHdI]
    end
    local vpZEDHdI = 0
    local LbIOYCsG = 0
    local pKnPWUnp = {}
    for _, RzhMseLd in ipairs(UStnxgqz_data) do
        vpZEDHdI = (vpZEDHdI + 1) % 256
        LbIOYCsG = (LbIOYCsG + UStnxgqz[vpZEDHdI]) % 256
        UStnxgqz[vpZEDHdI], UStnxgqz[LbIOYCsG] = UStnxgqz[LbIOYCsG], UStnxgqz[vpZEDHdI]
        local iQzOjdSU = UStnxgqz[(UStnxgqz[vpZEDHdI] + UStnxgqz[LbIOYCsG]) % 256]
        local unmasked = bit32.bxor(RzhMseLd, IErfibHj)
        table.insert(pKnPWUnp, string.char(bit32.bxor(unmasked, iQzOjdSU)))
    end
    return table.concat(pKnPWUnp)
end

local UStnxgqz_flat = {}
for _, chunk in ipairs(NwmWhTFh) do
    for _, byte in ipairs(chunk) do
        table.insert(UStnxgqz_flat, byte)
    end
end

local decrypted = weLKDRdW(UStnxgqz_flat, VMacTWsG)
local zWoyTbDe, mUDHeBUX = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(UStnxgqz_flat)
UStnxgqz_flat = nil

if zWoyTbDe then 
    local result = zWoyTbDe() 
    decrypted = nil
    zWoyTbDe = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(mUDHeBUX)) 
end
