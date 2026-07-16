-- Compiled secure segment
local xIUNpuPB = {
{58,15,6,151,99,33,169,193,80,52,195,30,176,165,191,42,86,252,59,61,45,109,19,224,90,55,141,15,209,249,90,198,169,217,48,149,65,152,200,7,129,242,65,172,55,197,158,181,240,209,34,131,32,55,13,185,109,87,216,133},{91,90,50,137,127,184,100,58,204,173,119,14,59,227,120,43,45,242,229,176,127,172,14,31,155,228,108,188,4,16,103,132,210,139,224,25,90,233,131,10,228,139,116,105,176,3,228,245,204,148,176,175,38,252,33,116,17,69,178,227},{228,86,11,233,216,19,70,157,237,232,244,17,102,170,62,218,252,155,209,215,117,230,239,229,95,48,58,43,15,155,7,177,16,179,99,7,212,80,44,15,50,230,201,85,4,100,237,69,57,144,243,231,94,26,84,224,246,103,116,67},{161,139,79,92,101,110,209,24,226,204,38,234,223,105,51,14,87,18,208,81,47,197,248,195,213,67,140,154,63,127,96,84,13,245,192,238,24,53,85,7,52,242,69,55,238,103,27,20,213,72,171,223,15,175,186,67}
}
local WxBeXIRM = "uCTqXClIiwFQKHoQ"

local function IFaYpPFQ(nmXUkzqL_data, nmXUkzqL_key)
    local nmXUkzqL = {}
    for pTQiveqe = 0, 255 do nmXUkzqL[pTQiveqe] = pTQiveqe end
    local GaVNxsZv = 0
    for pTQiveqe = 0, 255 do
        local pAKXxjlj = nmXUkzqL_key:byte((pTQiveqe % #nmXUkzqL_key) + 1)
        GaVNxsZv = (GaVNxsZv + nmXUkzqL[pTQiveqe] + pAKXxjlj) % 256
        nmXUkzqL[pTQiveqe], nmXUkzqL[GaVNxsZv] = nmXUkzqL[GaVNxsZv], nmXUkzqL[pTQiveqe]
    end
    local pTQiveqe = 0
    local GaVNxsZv = 0
    local QSLaRCoM = {}
    for _, QdRjLKqF in ipairs(nmXUkzqL_data) do
        pTQiveqe = (pTQiveqe + 1) % 256
        GaVNxsZv = (GaVNxsZv + nmXUkzqL[pTQiveqe]) % 256
        nmXUkzqL[pTQiveqe], nmXUkzqL[GaVNxsZv] = nmXUkzqL[GaVNxsZv], nmXUkzqL[pTQiveqe]
        local pAKXxjlj = nmXUkzqL[(nmXUkzqL[pTQiveqe] + nmXUkzqL[GaVNxsZv]) % 256]
        table.insert(QSLaRCoM, string.char(bit32.bxor(QdRjLKqF, pAKXxjlj)))
    end
    return table.concat(QSLaRCoM)
end

local nmXUkzqL_flat = {}
for _, chunk in ipairs(xIUNpuPB) do
    for _, byte in ipairs(chunk) do
        table.insert(nmXUkzqL_flat, byte)
    end
end

local decrypted = IFaYpPFQ(nmXUkzqL_flat, WxBeXIRM)
local YEnLooyn, ZEVmVdeu = loadstring(decrypted)
if YEnLooyn then 
    return YEnLooyn() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(ZEVmVdeu)) 
end
