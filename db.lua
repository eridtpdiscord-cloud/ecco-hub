-- Compiled secure segment
local klJYVxEI = {
{171,42,227,184,216,107,134,49,45,37,209,219,2,16,52,213,132,235,206,51,210,57,123,206,120,104,190,128,127,202,31,74,192,30,17,200,74,33,19,129,196,162,120,39,134,156,61,137,198,175,93,96,207,192,32,53,174,188,158,225},{23,114,132,241,221,62,7,167,189,4,156,143,210,15,99,27,53,22,39,214,190,217,189,174,211,87,110,117,237,246,175,219,132,58,112,43,215,112,29,94,85,66,146,149,199,111,66,212,59,73,170,12,103,112,217,129,74,37,15,40},{252,26,46,0,232,2,88,219,241,161,151,250,85,232,70,21,81,197,153,170,94,98,37,2,38,85,178,161,69,214,94,227,191,50,191,238,112,27,12,60,1,60,23,115,175,136,123,190,165,133,63,254,166,5,47,47,155,182,19,24},{218,68,200,4,76,70,91,128,92,52,189,46,208,134,186,95,179,50,218,35,220,252,47,237,74,190,211,42,249,158,234,178,46,66,96,154,52,191,9,43,226,47,181,49,69,39,241,126,57,132,222,52,157,152,109,122,115,197,203,244},{174,62,93,65,88,181,128,5,125,32,233,130,110,114,182,154,70,252,130,110,232,215,144,185,115,48,188,190,124,52,246,13,101,232,61,2,134,154,190,142,104,64,135,104,144,115,122,145,124,188,11,120,94,225,23,79,12,88,198,127},{76,41,70,16,7,110,45,173,16,33,188,253,250,115,186,34,142,107,145,134,197,243,72,232,220,235,214,108,128,11,17,175,167,223,168,105,121,19,51,157,178,120,7,215,225,143,60,220,101,251,34,126,220,241,176,65,222,174,118,41},{107,197,31,218,214,192,26,18,100,41,123,141,33,76,133,232,4,227,226,36,2,247,223,6,112,216,192,15,154,235,7,93,62,122,248,86,215,213,253,168,173,8,62}
}
local Wadjdiav = "EtYMIVHZKJPmGoxD"

local function XttIfEdK(zFhgaXLS_data, zFhgaXLS_key)
    local zFhgaXLS = {}
    for BHbmbJBE = 0, 255 do zFhgaXLS[BHbmbJBE] = BHbmbJBE end
    local leKUxvyt = 0
    for BHbmbJBE = 0, 255 do
        local yUGFtrUp = zFhgaXLS_key:byte((BHbmbJBE % #zFhgaXLS_key) + 1)
        leKUxvyt = (leKUxvyt + zFhgaXLS[BHbmbJBE] + yUGFtrUp) % 256
        zFhgaXLS[BHbmbJBE], zFhgaXLS[leKUxvyt] = zFhgaXLS[leKUxvyt], zFhgaXLS[BHbmbJBE]
    end
    local BHbmbJBE = 0
    local leKUxvyt = 0
    local RhUHSTxO = {}
    for _, zfLCwccl in ipairs(zFhgaXLS_data) do
        BHbmbJBE = (BHbmbJBE + 1) % 256
        leKUxvyt = (leKUxvyt + zFhgaXLS[BHbmbJBE]) % 256
        zFhgaXLS[BHbmbJBE], zFhgaXLS[leKUxvyt] = zFhgaXLS[leKUxvyt], zFhgaXLS[BHbmbJBE]
        local yUGFtrUp = zFhgaXLS[(zFhgaXLS[BHbmbJBE] + zFhgaXLS[leKUxvyt]) % 256]
        table.insert(RhUHSTxO, string.char(bit32.bxor(zfLCwccl, yUGFtrUp)))
    end
    return table.concat(RhUHSTxO)
end

local zFhgaXLS_flat = {}
for _, chunk in ipairs(klJYVxEI) do
    for _, byte in ipairs(chunk) do
        table.insert(zFhgaXLS_flat, byte)
    end
end

local decrypted = XttIfEdK(zFhgaXLS_flat, Wadjdiav)
local fHTWOstx, EMZKoRvF = loadstring(decrypted)
if fHTWOstx then 
    return fHTWOstx() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(EMZKoRvF)) 
end
