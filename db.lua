-- Compiled secure segment
local pYIsqeHA = {
{150,26,241,243,123,80,74,52,120,116,226,195,148,109,144,121,160,79,57,197,163,140,238,90,55,198,42,92,39,201,55,72,222,185,163,58,24,158,243,90,252,104,62,156,103,45,40,25,49,72,127,151,128,88,12,117,122,65,145,152},{121,172,154,199,6,115,151,68,75,219,253,93,47,8,90,205,0,45,233,133,107,185,21,228,185,103,99,199,25,236,94,132,238,236,235,118,54,164,9,218,100,60,168,65,8,97,104,222,68,196,245,226,98,94,121,177,207,42,254,14},{240,243,125,144,131,62,238,254,74,98,59,207,225,188,195,64,167,212,48,245,197,111,207,228,70,227,93,158,244,181,57,90,105,151,177,122,217,53,64,14,31,184,135,47,224,86,224,77,139,236,189,153,74,124,144,176,71,182,240,65},{160,120,134,119,214,36,176,103,11,70,70,119,227,168,60,163,200,235,185,67,184,148,33,173,171,80,15,135,224,127,80,39,131,179,121,210,242,139,138,220,238,145,19,53,214,169,247,48,169,244,231,145,140,61,83,189,84,157,114,119},{194,123,124,36,92,66,178,47,4,53,165,71,143,111,107,62,41,6,120,194,174,85,207,121,161,209,191,7,70,169,97,158,88,47,222,120,146,192,116,1,141,96,47,84,72,190,94,186,198,52,126,167,167,112,202,4,119,84,184,135},{211,20,210,123,59,114,178,189,9,225,51,178,225,13,215,101,112,143,183,144,147,40,8,223,139,152,93,132,91,222,40,38,54,168,158,199,230,248,3,140,79,137,43,64,154,24,120,156,53,224,160,145,164,96,108,184,130,194,206,202},{88,121,202,49,164,86,86,174,27,6,207,75,184,209,191,129,46,23,123,88,34,233,112,19,241,246,6,33,78,55,183,211,209,173,252,220,235,145,32,20,4,228,150,147,37}
}
local LhDcmByb = "vwQIUrwlFptRhbmj"

local function oZgPaRJp(UqZvAISK_data, UqZvAISK_key)
    local UqZvAISK = {}
    for aZwUXyXB = 0, 255 do UqZvAISK[aZwUXyXB] = aZwUXyXB end
    local ghqnnMna = 0
    for aZwUXyXB = 0, 255 do
        local PqOMgIsH = UqZvAISK_key:byte((aZwUXyXB % #UqZvAISK_key) + 1)
        ghqnnMna = (ghqnnMna + UqZvAISK[aZwUXyXB] + PqOMgIsH) % 256
        UqZvAISK[aZwUXyXB], UqZvAISK[ghqnnMna] = UqZvAISK[ghqnnMna], UqZvAISK[aZwUXyXB]
    end
    local aZwUXyXB = 0
    local ghqnnMna = 0
    local BzGVArOR = {}
    for _, yYOoBXlP in ipairs(UqZvAISK_data) do
        aZwUXyXB = (aZwUXyXB + 1) % 256
        ghqnnMna = (ghqnnMna + UqZvAISK[aZwUXyXB]) % 256
        UqZvAISK[aZwUXyXB], UqZvAISK[ghqnnMna] = UqZvAISK[ghqnnMna], UqZvAISK[aZwUXyXB]
        local PqOMgIsH = UqZvAISK[(UqZvAISK[aZwUXyXB] + UqZvAISK[ghqnnMna]) % 256]
        table.insert(BzGVArOR, string.char(bit32.bxor(yYOoBXlP, PqOMgIsH)))
    end
    return table.concat(BzGVArOR)
end

local UqZvAISK_flat = {}
for _, chunk in ipairs(pYIsqeHA) do
    for _, byte in ipairs(chunk) do
        table.insert(UqZvAISK_flat, byte)
    end
end

local decrypted = oZgPaRJp(UqZvAISK_flat, LhDcmByb)
local pykrBelj, SRHFvBhD = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(UqZvAISK_flat)
UqZvAISK_flat = nil

if pykrBelj then 
    local result = pykrBelj() 
    decrypted = nil
    pykrBelj = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(SRHFvBhD)) 
end
