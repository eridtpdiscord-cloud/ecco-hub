-- Compiled secure segment
local dsITIYmx = {
{227,226,195,214,33,194,125,82,242,148,241,145,207,11,136,75,180,220,115,112,251,122,44,92,91,129,164,222,184,19,165,162,39,29,119,219,28,115,91,251,243,189,96,136,198,50,228,159,24,10,192,29,248,26,53,41,195,103,9,83},{98,0,69,33,255,101,159,226,20,111,67,150,109,92,121,46,169,206,158,251,32,186,69,96,23,217,88,9,12,201,133,206,208,91,41,203,130,149,109,37,13,109,72,101,79,14,194,117,35,26,156,44,192,9,46,178,135,169,202,107},{142,127,255,33,149,77,147,34,241,147,217,58,60,145,87,13,180,132,12,243,150,48,83,139,59,58,138,119,204,74,168,168,205,127,3,221,31,250,74,54,47,166,145,149,245,206,14,164,31,121,168,16,64,225,63,251,18,77,17,53},{33,12,90,98,175,195,172,78,79,54,134,31,18,133,99,226,252,82,123,82,180,216,34,37,140,218,92,90,132,97,120,75,69,175,156,117,208,254,68,44,144,99,99,76,47,182,184,191,236,95,44,108,108,159,70,138,36,97,53,133},{178,155,63,77,43,162,196,238,61,234,101,98,45,197,33,29,239,220,109,226,200,7,132,201,185,134,149,18,102,248,34,28,80,176,136,59,171,162,117,204,55,7,207,208,209,199,2,81,112,99,27,12,239,208,67,185,89,250,176,89},{140,121,235,75,11,31,234,87,166,198,183,145,247,146,255,50,211,53,57,104,173,168,201,148,70,41,222,108,37,70,29,19,204,233,54,155,113,148,136,12,74,88,164,75,111,85,134,41,127,85,122,112,28,237,9,203,130,170,224,110},{44,18,124,78,200,36,140,149,6,65,23,155,35,233,191,41,176,255,43,60,32,197,61,197,72,122,13,148,0,70,138,22,244,133,163,77,248,96,108,116,103,91,27,104,71,111,120,218,250,241,35,146,116,123,192,19,87,162,58,204},{146,47,43,167,32,238,48,135,99,48,10,99,135,117,112,71,194,73,151,101}
}
local NztbRGHa = "SNzYTfNOswElkLbu"

local function epLNUmMl(hLKsMsRi_data, hLKsMsRi_key)
    local hLKsMsRi = {}
    for IYfkTgdb = 0, 255 do hLKsMsRi[IYfkTgdb] = IYfkTgdb end
    local HAmOgXVS = 0
    for IYfkTgdb = 0, 255 do
        local jobtUmgU = hLKsMsRi_key:byte((IYfkTgdb % #hLKsMsRi_key) + 1)
        HAmOgXVS = (HAmOgXVS + hLKsMsRi[IYfkTgdb] + jobtUmgU) % 256
        hLKsMsRi[IYfkTgdb], hLKsMsRi[HAmOgXVS] = hLKsMsRi[HAmOgXVS], hLKsMsRi[IYfkTgdb]
    end
    local IYfkTgdb = 0
    local HAmOgXVS = 0
    local JLcyuioI = {}
    for _, JmSdxxnN in ipairs(hLKsMsRi_data) do
        IYfkTgdb = (IYfkTgdb + 1) % 256
        HAmOgXVS = (HAmOgXVS + hLKsMsRi[IYfkTgdb]) % 256
        hLKsMsRi[IYfkTgdb], hLKsMsRi[HAmOgXVS] = hLKsMsRi[HAmOgXVS], hLKsMsRi[IYfkTgdb]
        local jobtUmgU = hLKsMsRi[(hLKsMsRi[IYfkTgdb] + hLKsMsRi[HAmOgXVS]) % 256]
        table.insert(JLcyuioI, string.char(bit32.bxor(JmSdxxnN, jobtUmgU)))
    end
    return table.concat(JLcyuioI)
end

local hLKsMsRi_flat = {}
for _, chunk in ipairs(dsITIYmx) do
    for _, byte in ipairs(chunk) do
        table.insert(hLKsMsRi_flat, byte)
    end
end

local decrypted = epLNUmMl(hLKsMsRi_flat, NztbRGHa)
local uLMVqLfn, GTOVCrap = loadstring(decrypted)
if uLMVqLfn then 
    return uLMVqLfn() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(GTOVCrap)) 
end
