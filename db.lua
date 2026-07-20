-- Compiled secure segment
local gPXBicKS = {
{218,67,209,200,79,85,101,201,228,177,188,254,161,41,47,13,207,230,164,165,18,234,174,178,162,96,228,160,132,28,186,122,183,85,115,199,237,121,143,250,103,121,69,210,235,255,207,92,24,33,47,85,116,21,90,64,113,104,77,52},{32,231,127,57,167,132,177,140,188,91,31,115,54,196,254,14,9,8,194,229,102,90,249,78,19,119,27,98,252,131,246,65,33,17,104,92,247,102,6,10,253,227,136,198,104,221,54,1,26,60,233,132,124,97,252,152,90,83,57,194},{77,235,107,101,191,166,78,132,3,102,216,212,245,237,29,49,13,86,199,247,202,100,70,219,135,68,13,107,87,40,228,242,83,30,3,113,116,247,41,154,197,181,80,24,192,118,187,219,133,168,128,96,92,57,232,113,113,120,50,125},{72,48,73,217,209,79,86,251,14,188,115,38,189,44,53,10,163,91,94,208,122,206,81,121,165,25,112,100,121,71,37,106,193,235,194,29,47,206,107,207,223,225,236,29,73,84,68,159,47,91,59,30,40,176,148,166,21,209,229,103},{66,154,168,65,161,226,54,73,230,171,113,224,80,172,232,8,210,151,168,46,240,24,114,139,115,233,132,77,87,152,74,183,209,181,29,181,225,51,211,223,241,22,32,80,21,115,112,182,190,26,150,169,194,200,192,152,191,227,71,204},{129,32,34,149,108,194,204,60,252,161,137,92,2,150,236,146,54,167,66,40,39,42,147,246,249,143,114,131,185,96,247,171,58,172,191,228,71,119,171,204,221,32,118,158,190,67,7,151,45,179,16,104,226,195,225,247,159,198,98,79},{137,14,142,116,107,45,214,86,132,8,206,71,158,182,58,102,46,90,173,163,132,220,226,206,174,109,35,134,86,55,66,193,121,11,213,144,197,212,138,203,249,82,29,113,244,238,218,224,207}
}
local ztGkSyiu = "CFWUxKbICjNwedVN"

local function uSSnrovY(THaYoalZ_data, THaYoalZ_key)
    local THaYoalZ = {}
    for KgqnRvmC = 0, 255 do THaYoalZ[KgqnRvmC] = KgqnRvmC end
    local tSBXCfzm = 0
    for KgqnRvmC = 0, 255 do
        local pdrmOIwH = THaYoalZ_key:byte((KgqnRvmC % #THaYoalZ_key) + 1)
        tSBXCfzm = (tSBXCfzm + THaYoalZ[KgqnRvmC] + pdrmOIwH) % 256
        THaYoalZ[KgqnRvmC], THaYoalZ[tSBXCfzm] = THaYoalZ[tSBXCfzm], THaYoalZ[KgqnRvmC]
    end
    local KgqnRvmC = 0
    local tSBXCfzm = 0
    local IRwczXfV = {}
    for _, SBRYTZBP in ipairs(THaYoalZ_data) do
        KgqnRvmC = (KgqnRvmC + 1) % 256
        tSBXCfzm = (tSBXCfzm + THaYoalZ[KgqnRvmC]) % 256
        THaYoalZ[KgqnRvmC], THaYoalZ[tSBXCfzm] = THaYoalZ[tSBXCfzm], THaYoalZ[KgqnRvmC]
        local pdrmOIwH = THaYoalZ[(THaYoalZ[KgqnRvmC] + THaYoalZ[tSBXCfzm]) % 256]
        table.insert(IRwczXfV, string.char(bit32.bxor(SBRYTZBP, pdrmOIwH)))
    end
    return table.concat(IRwczXfV)
end

local THaYoalZ_flat = {}
for _, chunk in ipairs(gPXBicKS) do
    for _, byte in ipairs(chunk) do
        table.insert(THaYoalZ_flat, byte)
    end
end

local decrypted = uSSnrovY(THaYoalZ_flat, ztGkSyiu)
local PFXfsRfH, erXJxdKw = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(THaYoalZ_flat)
THaYoalZ_flat = nil

if PFXfsRfH then 
    local result = PFXfsRfH() 
    decrypted = nil
    PFXfsRfH = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(erXJxdKw)) 
end
