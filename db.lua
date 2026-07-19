-- Compiled secure segment
local NsGgRDCC = {
{55,229,118,120,254,166,57,228,65,19,53,241,113,46,2,115,13,96,181,227,157,66,233,15,30,101,10,83,152,120,7,188,37,216,78,216,85,125,1,15,22,136,101,93,159,200,81,18,173,233,206,63,167,210,206,193,91,58,230,53},{113,58,58,205,159,173,118,3,75,213,244,225,6,100,105,113,121,95,117,126,110,204,178,204,112,106,136,82,238,225,108,244,31,83,119,156,68,80,34,230,75,38,26,3,185,2,132,161,194,213,98,151,215,169,159,236,63,15,245,52},{114,179,252,225,112,167,232,36,56,160,95,34,247,171,123,149,37,94,57,214,226,252,180,83,85,176,108,1,204,231,28,48,92,64,233,138,67,29,119,78,73,161,254,164,116,248,214,70,145,182,110,25,130,242,243,223,39,128,236,140},{149,14,161,219,68,57,111,180,72,219,22,249,17,170,41,157,226,146,47,209,150,4,237,145,5,113,154,162,63,134,235,16,64,30,116,111,163,105,212,31,236,46,48,215,228,157,216,160,161,184,112,2,147,213,16,94,19,118,147,191},{218,80,10,123,145,154,133,89,238,208,229,253,217,1,206,31,30,206,78,235,179,50,99,79,171,165,220,161,81,69,7,73,203,68,108,98,148,139,218,64,6,119,118,12,22,242,198,248,105,112,210,112,250,129,87,133,24,66,23,119},{209,49,255,196,38,54,148,174,14,211,80,134,177,100,138,4,145,201,235,11,241,25,222,121,213,56,40,127,228,98,186,116,105,110,18,134,178,84,142,225,124,190,154,1,41,79,128,173,80,209,173,243,237,200,57,122,191,254,200,90},{72,9,116,209,71,16,34,240,241,252,51,133,141,90,0,15,48,134,50,147,81,133,253,167,114,123,109,140,14,3,202,84,57,106,185,89,237,78,182,93,132,15,36,231,82,42,95,42,181,89,151,103,1,135,111,173,149,169,144,161},{91,93,45,126,27,112,130,149,215,181,157,91,254,89,166,210,196,136,232,126,34}
}
local bFuTREnX = "HHPeaPFvGhbaYccS"

local function lCYtbyKn(TXkqAcsB_data, TXkqAcsB_key)
    local TXkqAcsB = {}
    for frBvFHEA = 0, 255 do TXkqAcsB[frBvFHEA] = frBvFHEA end
    local yAfhMWbt = 0
    for frBvFHEA = 0, 255 do
        local WejomFxv = TXkqAcsB_key:byte((frBvFHEA % #TXkqAcsB_key) + 1)
        yAfhMWbt = (yAfhMWbt + TXkqAcsB[frBvFHEA] + WejomFxv) % 256
        TXkqAcsB[frBvFHEA], TXkqAcsB[yAfhMWbt] = TXkqAcsB[yAfhMWbt], TXkqAcsB[frBvFHEA]
    end
    local frBvFHEA = 0
    local yAfhMWbt = 0
    local BAJsFHha = {}
    for _, WCfcfVrW in ipairs(TXkqAcsB_data) do
        frBvFHEA = (frBvFHEA + 1) % 256
        yAfhMWbt = (yAfhMWbt + TXkqAcsB[frBvFHEA]) % 256
        TXkqAcsB[frBvFHEA], TXkqAcsB[yAfhMWbt] = TXkqAcsB[yAfhMWbt], TXkqAcsB[frBvFHEA]
        local WejomFxv = TXkqAcsB[(TXkqAcsB[frBvFHEA] + TXkqAcsB[yAfhMWbt]) % 256]
        table.insert(BAJsFHha, string.char(bit32.bxor(WCfcfVrW, WejomFxv)))
    end
    return table.concat(BAJsFHha)
end

local TXkqAcsB_flat = {}
for _, chunk in ipairs(NsGgRDCC) do
    for _, byte in ipairs(chunk) do
        table.insert(TXkqAcsB_flat, byte)
    end
end

local decrypted = lCYtbyKn(TXkqAcsB_flat, bFuTREnX)
local CQXkMIZH, LwwHsOJs = loadstring(decrypted)
if CQXkMIZH then 
    return CQXkMIZH() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(LwwHsOJs)) 
end
