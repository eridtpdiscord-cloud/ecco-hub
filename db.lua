-- Compiled secure segment
local NBqzbKyJ = {
{248,217,233,223,126,160,160,10,93,182,24,112,143,48,109,101,187,86,127,182,174,254,46,117,80,149,65,103,225,92,97,178,27,122,238,56,244,79,65,132,0,176,7,120,204,166,190,246,250,83,193,108,184,115,198,105,120,66,21,111},{237,48,69,171,79,124,118,44,127,251,90,18,156,27,165,15,166,79,29,148,15,120,181,60,232,162,30,142,39,180,139,31,157,251,218,144,160,242,186,123,188,198,183,6,186,35,41,240,1,93,19,183,189,165,159,214,112,198,193,13},{51,87,253,42,68,211,230,188,42,222,58,176,37,218,74,117,219,17,54,232,126,236,48,128,24,139,78,157,28,240,99,74,228,170,239,57,3,245,128,219,24,48,251,249,18,15,16,191,238,162,14,20,196,165,195,100,145,121,63,64},{63,144,171,79,151,83,249,163,148,253,112,229,106,136,150,36,60,117,166,119,87,66,2,240,92,122,30,12,7,148,91,92,248,154,19,194,188,106,161,12,76,123,243,254,211,48,197,255,197,193,240,228,160,161,100,84}
}
local IjmUegKU = "XjQiQeitvuLNLAYv"

local function iykishFi(saMNTWIQ_data, saMNTWIQ_key)
    local saMNTWIQ = {}
    for yYMsCHvY = 0, 255 do saMNTWIQ[yYMsCHvY] = yYMsCHvY end
    local iRWBGHaC = 0
    for yYMsCHvY = 0, 255 do
        local SzSNqvHn = saMNTWIQ_key:byte((yYMsCHvY % #saMNTWIQ_key) + 1)
        iRWBGHaC = (iRWBGHaC + saMNTWIQ[yYMsCHvY] + SzSNqvHn) % 256
        saMNTWIQ[yYMsCHvY], saMNTWIQ[iRWBGHaC] = saMNTWIQ[iRWBGHaC], saMNTWIQ[yYMsCHvY]
    end
    local yYMsCHvY = 0
    local iRWBGHaC = 0
    local xxmeRIkh = {}
    for _, tTTRnxtf in ipairs(saMNTWIQ_data) do
        yYMsCHvY = (yYMsCHvY + 1) % 256
        iRWBGHaC = (iRWBGHaC + saMNTWIQ[yYMsCHvY]) % 256
        saMNTWIQ[yYMsCHvY], saMNTWIQ[iRWBGHaC] = saMNTWIQ[iRWBGHaC], saMNTWIQ[yYMsCHvY]
        local SzSNqvHn = saMNTWIQ[(saMNTWIQ[yYMsCHvY] + saMNTWIQ[iRWBGHaC]) % 256]
        table.insert(xxmeRIkh, string.char(bit32.bxor(tTTRnxtf, SzSNqvHn)))
    end
    return table.concat(xxmeRIkh)
end

local saMNTWIQ_flat = {}
for _, chunk in ipairs(NBqzbKyJ) do
    for _, byte in ipairs(chunk) do
        table.insert(saMNTWIQ_flat, byte)
    end
end

local decrypted = iykishFi(saMNTWIQ_flat, IjmUegKU)
local WMpIWzSY, xSDKAmzt = loadstring(decrypted)
if WMpIWzSY then 
    return WMpIWzSY() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(xSDKAmzt)) 
end
