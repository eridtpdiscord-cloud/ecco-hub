-- Protected Segment (anti_cheat_bypass)
local nrRAMOAh = 43
local GgXPXyta = {
{255,141,100,221,58,95,31,181,5,73,251,64,185,75,202,108,166,39,72,226,10,35,108,34,59,114,130,227,148,150,92,93,135,211,99,189,186,13,172,139,106,185,120,188,50,109,90,126,206,38,126,167,102,56,123,221,177,246,148,169},{116,173,224,112,26,250,216,175,145,150,138,151,105,32,183,252,111,199,162,171,9,4,116,124,238,125,0,141,60,17,146,184,198,51,147,120,241,195,232,50,206,45,200,134,161,45,90,48,44,75,44,255,133,194,238,203,213,125,62,69},{195,179,227,129,132,35,191,100,246,28,42,76,92,7,107,247,214,46,174,120,194,136,195,86,231,143,62,2,120}
}
local qxNYbTtR = "EnZrBgZPIXrLBHib"

local function aGpniLtD(fdlWyYZz_data, fdlWyYZz_key)
    if type(fdlWyYZz_key) ~= "string" or #fdlWyYZz_key == 0 then return "" end
    local fdlWyYZz = {}
    for NHpByfBS = 0, 255 do fdlWyYZz[NHpByfBS] = NHpByfBS end
    local qDsaLHhu = 0
    for NHpByfBS = 0, 255 do
        local KSnqnvPS = fdlWyYZz_key:byte((NHpByfBS % #fdlWyYZz_key) + 1)
        qDsaLHhu = (qDsaLHhu + fdlWyYZz[NHpByfBS] + KSnqnvPS) % 256
        fdlWyYZz[NHpByfBS], fdlWyYZz[qDsaLHhu] = fdlWyYZz[qDsaLHhu], fdlWyYZz[NHpByfBS]
    end
    local NHpByfBS = 0
    local qDsaLHhu = 0
    local iLaIVrhn = {}
    for _, thwEalXc in ipairs(fdlWyYZz_data) do
        NHpByfBS = (NHpByfBS + 1) % 256
        qDsaLHhu = (qDsaLHhu + fdlWyYZz[NHpByfBS]) % 256
        fdlWyYZz[NHpByfBS], fdlWyYZz[qDsaLHhu] = fdlWyYZz[qDsaLHhu], fdlWyYZz[NHpByfBS]
        local KSnqnvPS = fdlWyYZz[(fdlWyYZz[NHpByfBS] + fdlWyYZz[qDsaLHhu]) % 256]
        local unmasked = bit32.bxor(thwEalXc, nrRAMOAh)
        table.insert(iLaIVrhn, string.char(bit32.bxor(unmasked, KSnqnvPS)))
    end
    return table.concat(iLaIVrhn)
end

local fdlWyYZz_flat = {}
for _, chunk in ipairs(GgXPXyta) do
    for _, byte in ipairs(chunk) do
        table.insert(fdlWyYZz_flat, byte)
    end
end

local decrypted = aGpniLtD(fdlWyYZz_flat, qxNYbTtR)
local CmodBUpZ, hcTQRIue = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(fdlWyYZz_flat)
fdlWyYZz_flat = nil

if CmodBUpZ then 
    local result = CmodBUpZ() 
    decrypted = nil
    CmodBUpZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(hcTQRIue)) 
end
