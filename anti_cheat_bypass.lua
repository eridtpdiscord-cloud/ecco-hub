-- Protected Segment (anti_cheat_bypass)
local STPUVjAT = 184
local qXfixCGO = {
{160,238,13,96,189,255,60,35,201,187,174,220,109,77,118,85,193,252,208,155,51,211,157,186,120,114,100,72,209,130,55,108,232,31,24,156,15,69,147,125,198,180,160,170,41,26,162,246,84,36,231,21,13,77,203,60,141,12,145,103},{219,212,67,55,76,23,71,173,64,110,141,183,74,210,126,5,76,227,151,254,250,175,57,1,122,125,21,64,30,45,37,120,138,47,178,156,155,220,111,205,86,69,141,28,13,50,165,195,152,71,8,47,170,12,202,103,210,71,64,144},{89,231,34,171,56,132,224,197,192,87,178,98,52,236,80,219,238,255,94,135,21,123,78,65,86,120,198,78,100}
}
local jmNiZhUY = "NhwZZFxboHOEODIn"

local function wPGgqeFp(OaoicOxA_data, OaoicOxA_key)
    if type(OaoicOxA_key) ~= "string" or #OaoicOxA_key == 0 then return "" end
    local OaoicOxA = {}
    for CMogVVJK = 0, 255 do OaoicOxA[CMogVVJK] = CMogVVJK end
    local NiCJmabm = 0
    for CMogVVJK = 0, 255 do
        local eGinTTKi = OaoicOxA_key:byte((CMogVVJK % #OaoicOxA_key) + 1)
        NiCJmabm = (NiCJmabm + OaoicOxA[CMogVVJK] + eGinTTKi) % 256
        OaoicOxA[CMogVVJK], OaoicOxA[NiCJmabm] = OaoicOxA[NiCJmabm], OaoicOxA[CMogVVJK]
    end
    local CMogVVJK = 0
    local NiCJmabm = 0
    local datWKJNc = {}
    for _, qZcDpnin in ipairs(OaoicOxA_data) do
        CMogVVJK = (CMogVVJK + 1) % 256
        NiCJmabm = (NiCJmabm + OaoicOxA[CMogVVJK]) % 256
        OaoicOxA[CMogVVJK], OaoicOxA[NiCJmabm] = OaoicOxA[NiCJmabm], OaoicOxA[CMogVVJK]
        local eGinTTKi = OaoicOxA[(OaoicOxA[CMogVVJK] + OaoicOxA[NiCJmabm]) % 256]
        local unmasked = bit32.bxor(qZcDpnin, STPUVjAT)
        table.insert(datWKJNc, string.char(bit32.bxor(unmasked, eGinTTKi)))
    end
    return table.concat(datWKJNc)
end

local OaoicOxA_flat = {}
for _, chunk in ipairs(qXfixCGO) do
    for _, byte in ipairs(chunk) do
        table.insert(OaoicOxA_flat, byte)
    end
end

local decrypted = wPGgqeFp(OaoicOxA_flat, jmNiZhUY)
local IwylaAGj, LcvnGQMw = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(OaoicOxA_flat)
OaoicOxA_flat = nil

if IwylaAGj then 
    local result = IwylaAGj() 
    decrypted = nil
    IwylaAGj = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(LcvnGQMw)) 
end
