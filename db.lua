-- Protected Segment (db)
local EZNpRQjO = 45
local HDZavlic = {
{181,231,181,39,252,112,74,236,48,185,89,254,65,93,224,199,128,49,176,110,157,98,28,104,6,111,86,204,255,164,140,91,107,82,250,165,52,72,195,78,61,182,35,191,250,79,234,192,17,17,206,29,234,6,203,65,109,233,198,72},{188,255,107,236,44,170,83,152,229,134,144,60,253,233,33,1,12,123,78,131,12,204,29,130,46,5,55,10,113,118,123,43,245,101,105,142,200,144,100,161,216,86,172,123,201,117,136,13,70,206,198,19,6,70,186,148,127,123,122,251},{86,11,21,184,230,38,94,141,235,194,211,30,60,55,203,115,244,43,229,228,123,183,171,242,142,42,224,80,128,17,193,221,21,104,191,23,111,190,251,15,7,165,183,86,44,66,60,20,210,21,144,237,119,154,83,180,97,150,146,183},{130,107,90,84,233,136,197,9,48,89,5,99,27,53,24,99,252,193,91,52,244,157,120,198,60,24,238,5,164,234,102,28,95,145,239,219,108,107,177,254,110,103,86,70,106,123,36,183,97,68,215,76,79,151,190,181,81,76,229,199},{167,19,92,103,233,22,137,115,93,52,241,200,199,212,215,70,100,73,253,241,186,168,30,239,0,25,192,49,242,234,103,40,119,64,128,128,221,117,23,149,238,116,206,16,0,85,143,219,72,215,48,151,237,114,159,82,214,201,189,15},{42,233,156,71,111,91,219,120,145,162,90,177,81,52,21,191,98,167,169,115,193,231,92,41,213,181,28,45,102,121,214,9,249,70,126,194,231,160,5,249,107,248,252,26,50,6,84,63,48,192,202,210,72,31,31,189,96,96,5,163},{93,207,39,207,116,9,169,64,136,54,206,165,227,25,180,2,255,246,128,45,231,55,22,191,80,62,138,62,162,152,237,199,225,169,73,74,122,160,28,40,125,181,107,209,253}
}
local FFodVFZA = "CJFHAWUcLcMwYofp"

local function GKClpcIj(mmuKCTbE_data, mmuKCTbE_key)
    local mmuKCTbE = {}
    for sfInYiqu = 0, 255 do mmuKCTbE[sfInYiqu] = sfInYiqu end
    local tUAgduiR = 0
    for sfInYiqu = 0, 255 do
        local mGTsWkOR = mmuKCTbE_key:byte((sfInYiqu % #mmuKCTbE_key) + 1)
        tUAgduiR = (tUAgduiR + mmuKCTbE[sfInYiqu] + mGTsWkOR) % 256
        mmuKCTbE[sfInYiqu], mmuKCTbE[tUAgduiR] = mmuKCTbE[tUAgduiR], mmuKCTbE[sfInYiqu]
    end
    local sfInYiqu = 0
    local tUAgduiR = 0
    local WNtpAITZ = {}
    for _, wJmHotXX in ipairs(mmuKCTbE_data) do
        sfInYiqu = (sfInYiqu + 1) % 256
        tUAgduiR = (tUAgduiR + mmuKCTbE[sfInYiqu]) % 256
        mmuKCTbE[sfInYiqu], mmuKCTbE[tUAgduiR] = mmuKCTbE[tUAgduiR], mmuKCTbE[sfInYiqu]
        local mGTsWkOR = mmuKCTbE[(mmuKCTbE[sfInYiqu] + mmuKCTbE[tUAgduiR]) % 256]
        local unmasked = bit32.bxor(wJmHotXX, EZNpRQjO)
        table.insert(WNtpAITZ, string.char(bit32.bxor(unmasked, mGTsWkOR)))
    end
    return table.concat(WNtpAITZ)
end

local mmuKCTbE_flat = {}
for _, chunk in ipairs(HDZavlic) do
    for _, byte in ipairs(chunk) do
        table.insert(mmuKCTbE_flat, byte)
    end
end

local decrypted = GKClpcIj(mmuKCTbE_flat, FFodVFZA)
local lfHfUKdA, TZNyKLtF = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(mmuKCTbE_flat)
mmuKCTbE_flat = nil

if lfHfUKdA then 
    local result = lfHfUKdA() 
    decrypted = nil
    lfHfUKdA = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(TZNyKLtF)) 
end
