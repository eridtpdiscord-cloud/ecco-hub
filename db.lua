-- Protected Segment (db)
local sFlWiJQQ = 232
local gLncCPzG = {
{229,35,165,173,194,39,128,140,63,68,232,67,6,98,47,246,153,121,97,182,10,47,178,129,74,93,198,212,176,27,206,180,106,102,46,254,71,66,41,0,9,74,194,182,21,133,146,169,105,49,250,172,153,114,26,178,52,212,16,223},{152,219,123,181,70,218,185,115,15,32,168,225,214,134,171,110,35,4,26,88,5,182,142,59,146,252,158,9,3,169,230,103,112,39,111,43,129,2,252,238,18,239,132,33,21,202,71,36,186,74,9,48,225,212,211,36,153,144,176,137},{31,48,244,124,218,117,193,207,60,134,102,26,103,9,78,13,23,227,91,149,121,3,49,171,146,150,185,208,198,8,149,47,167,196,53,42,63,9,78,229,62,93,132,153,34,47,212,111,122,28,7,48,36,229,73,173,90,173,64,140},{148,194,14,164,12,27,15,69,101,75,76,82,223,46,158,15,53,86,96,215,234,64,29,251,196,195,241,229,14,17,141,154,208,55,212,67,158,39,227,100,198,49,95,9,53,37,224,105,157,186,86,156,188,121,166,191,145,116,144,184},{47,165,224,62,98,52,36,80,180,64,156,255,230,195,90,143,218,43,9,107,167,12,89,221,76,221,233,122,175,62,147,17,214,213,77,52,63,154,95,101,172,9,187,113,113,177,53,53,113,249,111,159,137,3,245,101,52,72,185,40},{229,60,244,62,24,240,126,249,106,185,144,168,219,55,167,249,38,248,76,45,149,80,77,206,52,135,228,62,199,150,210,9,229,72,135,29,105,34,15,165,131,234,243,156,57,240,64,137,161,128,250,175,39,54,176,90,204,46,96,7},{235,96,203,46,194,224,147,134,68,56,225,34,130,37,163,83,242,157,217,21,108,34,228,7,48,97,163,130,153,126,140,232,39,69,233,153,2,84,28,89,106,73,130,131,5,61,25,184,219,240,72,158,87,210,14,190,136,20,123,236},{166,124,92,59,193,241,232,202,121,249,205,128,214,237,251,127,88,212,134,64,11,207,73,129,40,251,187,172,157,210,212,165,114,218,115,15,153,229,255,97}
}
local mVNXaCqS = "OpCcbKkyMmMGaiMk"

local function TqObQaUt(FRBnSEGz_data, FRBnSEGz_key)
    if type(FRBnSEGz_key) ~= "string" or #FRBnSEGz_key == 0 then return "" end
    local FRBnSEGz = {}
    for KaSxbWJW = 0, 255 do FRBnSEGz[KaSxbWJW] = KaSxbWJW end
    local oEPVvNpQ = 0
    for KaSxbWJW = 0, 255 do
        local ZjbheinZ = FRBnSEGz_key:byte((KaSxbWJW % #FRBnSEGz_key) + 1)
        oEPVvNpQ = (oEPVvNpQ + FRBnSEGz[KaSxbWJW] + ZjbheinZ) % 256
        FRBnSEGz[KaSxbWJW], FRBnSEGz[oEPVvNpQ] = FRBnSEGz[oEPVvNpQ], FRBnSEGz[KaSxbWJW]
    end
    local KaSxbWJW = 0
    local oEPVvNpQ = 0
    local ZsRRwclQ = {}
    for _, KcCmHYGq in ipairs(FRBnSEGz_data) do
        KaSxbWJW = (KaSxbWJW + 1) % 256
        oEPVvNpQ = (oEPVvNpQ + FRBnSEGz[KaSxbWJW]) % 256
        FRBnSEGz[KaSxbWJW], FRBnSEGz[oEPVvNpQ] = FRBnSEGz[oEPVvNpQ], FRBnSEGz[KaSxbWJW]
        local ZjbheinZ = FRBnSEGz[(FRBnSEGz[KaSxbWJW] + FRBnSEGz[oEPVvNpQ]) % 256]
        local unmasked = bit32.bxor(KcCmHYGq, sFlWiJQQ)
        table.insert(ZsRRwclQ, string.char(bit32.bxor(unmasked, ZjbheinZ)))
    end
    return table.concat(ZsRRwclQ)
end

local FRBnSEGz_flat = {}
for _, chunk in ipairs(gLncCPzG) do
    for _, byte in ipairs(chunk) do
        table.insert(FRBnSEGz_flat, byte)
    end
end

local decrypted = TqObQaUt(FRBnSEGz_flat, mVNXaCqS)
local NHQCihrF, BbHIjHVw = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(FRBnSEGz_flat)
FRBnSEGz_flat = nil

if NHQCihrF then 
    local result = NHQCihrF() 
    decrypted = nil
    NHQCihrF = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(BbHIjHVw)) 
end
