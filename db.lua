-- Protected Segment (db)
local IHzizPsm = 88
local NuESVqWE = {
{99,69,181,8,174,229,84,73,24,98,25,126,214,232,66,48,156,188,189,218,203,101,103,184,60,53,32,225,29,154,206,247,32,31,74,240,101,60,210,124,207,57,70,142,126,136,245,48,185,10,253,52,137,54,245,214,224,50,210,105},{234,4,247,137,250,83,232,45,80,64,82,219,106,171,212,121,172,225,125,198,28,52,75,44,77,240,155,129,80,211,211,251,187,200,203,170,173,217,220,80,154,148,26,112,205,220,179,122,52,160,190,144,118,144,54,48,98,159,219,62},{110,195,250,183,219,147,214,118,219,72,173,77,79,49,80,245,217,116,237,78,172,25,79,40,79,173,225,106,255,179,19,208,200,123,76,253,44,175,25,181,48,84,11,62,210,181,80,34,224,23,45,199,174,134,30,189,49,26,109,200},{151,44,199,125,233,123,211,65,98,1,105,218,15,33,199,41,137,145,9,83,16,177,127,145,233,42,79,108,121,189,203,112,245,111,1,196,217,248,92,154,101,138,140,138,16,19,41,15,96,145,22,56,13,201,83,46,147,225,158,154},{76,81,30,177,56,205,27,45,236,74,203,57,14,112,104,28,49,244,45,159,81,59,168,127,89,74,19,169,65,248,27,135,107,7,105,182,227,124,216,144,246,225,112,5,201,51,37,28,22,186,205,193,166,188,177,205,100,138,247,38},{176,98,127,150,1,182,49,128,217,177,212,31,102,155,230,54,122,185,82,120,232,243,48,119,188,211,143,67,161,227,31,77,93,21,176,122,239,156,247,232,165,76,246,187,24,130,139,180,95,183,103,96,39,212,139,59,169,35,26,137},{56,175,63,187,29,88,160,7,143,31,150,84,244,252,51,38,62,30,101,23,177,211,150,142,145,205,37,149,3,90,180,248,62,150,112,248,149,109,38,25,37,223,184,106}
}
local XVvhkRHS = "tQsxQBiEgVhHbgRy"

local function Gjiixwgi(ZZmuHRIb_data, ZZmuHRIb_key)
    local ZZmuHRIb = {}
    for qDYWURzq = 0, 255 do ZZmuHRIb[qDYWURzq] = qDYWURzq end
    local aASYrQOP = 0
    for qDYWURzq = 0, 255 do
        local WKFDPXYc = ZZmuHRIb_key:byte((qDYWURzq % #ZZmuHRIb_key) + 1)
        aASYrQOP = (aASYrQOP + ZZmuHRIb[qDYWURzq] + WKFDPXYc) % 256
        ZZmuHRIb[qDYWURzq], ZZmuHRIb[aASYrQOP] = ZZmuHRIb[aASYrQOP], ZZmuHRIb[qDYWURzq]
    end
    local qDYWURzq = 0
    local aASYrQOP = 0
    local ijkdOZTH = {}
    for _, KIzsdJVA in ipairs(ZZmuHRIb_data) do
        qDYWURzq = (qDYWURzq + 1) % 256
        aASYrQOP = (aASYrQOP + ZZmuHRIb[qDYWURzq]) % 256
        ZZmuHRIb[qDYWURzq], ZZmuHRIb[aASYrQOP] = ZZmuHRIb[aASYrQOP], ZZmuHRIb[qDYWURzq]
        local WKFDPXYc = ZZmuHRIb[(ZZmuHRIb[qDYWURzq] + ZZmuHRIb[aASYrQOP]) % 256]
        local unmasked = bit32.bxor(KIzsdJVA, IHzizPsm)
        table.insert(ijkdOZTH, string.char(bit32.bxor(unmasked, WKFDPXYc)))
    end
    return table.concat(ijkdOZTH)
end

local ZZmuHRIb_flat = {}
for _, chunk in ipairs(NuESVqWE) do
    for _, byte in ipairs(chunk) do
        table.insert(ZZmuHRIb_flat, byte)
    end
end

local decrypted = Gjiixwgi(ZZmuHRIb_flat, XVvhkRHS)
local jJGOSoCq, ANoZehov = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ZZmuHRIb_flat)
ZZmuHRIb_flat = nil

if jJGOSoCq then 
    local result = jJGOSoCq() 
    decrypted = nil
    jJGOSoCq = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(ANoZehov)) 
end
