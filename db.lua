-- Compiled secure segment
local JNJeQcmN = {
{84,156,51,52,57,207,109,157,9,60,6,52,14,67,177,108,118,172,102,197,72,55,50,164,156,158,187,53,181,239,158,125,107,144,206,244,57,83,96,101,163,79,0,190,232,248,96,163,32,189,19,10,2,21,221,12,153,147,59,133},{80,218,176,164,225,186,213,87,41,129,107,249,96,165,99,51,50,214,17,244,98,232,209,167,199,16,253,230,5,38,248,200,65,134,218,224,210,173,112,199,133,107,107,186,174,112,214,136,42,242,95,146,86,109,42,69,32,81,194,92},{58,3,157,70,252,138,155,11,154,181,189,181,168,253,223,84,21,16,52,74,8,75,160,91,229,37,143,249,185,134,196,49,19,84,146,42,124,255,37,240,224,110,166,250,171,231,6,168,141,173,62,206,48,5,145,32,150,117,226,185},{110,185,160,168,209,203,184,126,111,249,58,38,229,177,152,129,156,210,75,175,71,144,199,25,122,91,92,209,122,149,3,142,220,106,61,196,32,2,120,147,151,50,46,102,105,235,201,67,145,138,64,106,35,8,14,28,205,65,250,141},{113,41,5,122,89,129,236,6,118,182,127,243,254,184,11,104,123,44,46,148,251,102,20,193,203,177,89,43,28,60,23,14,146,234,179,123,19,40,54,54,101,214,10,208,121,108,250,12,89,108,250,117,161,186,218,110,140,184,206,153},{18,0,88,126,83,11,22,123,237,146,192,152,128,109,204,217,121,88,97,125,210,19,234,50,41,142,111,216,104,232,183,44,86,171,57,51,127,215,36,5,231,196,133,151,163,115,129,187,44,9,138,91,241,202,86,55,197,29,53,22},{180,166,85,207,152,246,166,9,120,207,15,208,97,182,209,79,205,232,203,66,238,139,18,200,63,148,114,74,206,178,100,55,202,129,41,113,179,122,138,178,105,33,218,119,42,128,93,52,138,252,127,47,149,152,208,142,65,161,242,184},{255,10,19,188,224,121,59,54,110,203,108,155,105,212,162,192,221,177,232,128,234,112,194}
}
local fyrDzZVM = "UpOGGDPCnkvSLACm"

local function wjlsZzxP(kPYoyuSv_data, kPYoyuSv_key)
    local kPYoyuSv = {}
    for EULFLblL = 0, 255 do kPYoyuSv[EULFLblL] = EULFLblL end
    local rSyRMOEW = 0
    for EULFLblL = 0, 255 do
        local lSQTkXXo = kPYoyuSv_key:byte((EULFLblL % #kPYoyuSv_key) + 1)
        rSyRMOEW = (rSyRMOEW + kPYoyuSv[EULFLblL] + lSQTkXXo) % 256
        kPYoyuSv[EULFLblL], kPYoyuSv[rSyRMOEW] = kPYoyuSv[rSyRMOEW], kPYoyuSv[EULFLblL]
    end
    local EULFLblL = 0
    local rSyRMOEW = 0
    local xJWejOmj = {}
    for _, aQNHQusj in ipairs(kPYoyuSv_data) do
        EULFLblL = (EULFLblL + 1) % 256
        rSyRMOEW = (rSyRMOEW + kPYoyuSv[EULFLblL]) % 256
        kPYoyuSv[EULFLblL], kPYoyuSv[rSyRMOEW] = kPYoyuSv[rSyRMOEW], kPYoyuSv[EULFLblL]
        local lSQTkXXo = kPYoyuSv[(kPYoyuSv[EULFLblL] + kPYoyuSv[rSyRMOEW]) % 256]
        table.insert(xJWejOmj, string.char(bit32.bxor(aQNHQusj, lSQTkXXo)))
    end
    return table.concat(xJWejOmj)
end

local kPYoyuSv_flat = {}
for _, chunk in ipairs(JNJeQcmN) do
    for _, byte in ipairs(chunk) do
        table.insert(kPYoyuSv_flat, byte)
    end
end

local decrypted = wjlsZzxP(kPYoyuSv_flat, fyrDzZVM)
local lHFWlmlE, jhCOVmuq = loadstring(decrypted)
if lHFWlmlE then 
    return lHFWlmlE() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(jhCOVmuq)) 
end
