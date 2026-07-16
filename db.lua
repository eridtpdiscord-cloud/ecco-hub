-- Compiled secure segment
local vmeRlHID = {
{245,102,136,140,21,163,105,30,237,81,115,139,173,233,91,240,202,101,2,132,5,194,58,161,0,154,45,101,211,134,10,167,205,73,132,223,220,215,34,136,210,51,233,1,50,224,119,34,97,168,79,196,160,125,95,209,164,169,1,70},{225,109,246,175,161,100,59,27,107,244,177,75,228,212,82,241,130,23,2,55,36,219,191,16,154,68,21,119,46,157,205,97,40,140,162,249,242,102,204,81,67,66,214,164,132,125,19,35,196,122,92,197,9,22,198,205,236,92,243,92},{162,179,125,175,243,201,251,212,110,21,224,64,166,247,83,188,247,244,136,134,91,50,155,53,122,226,244,20,73,85,149,161,33,180,29,194,231,181,252,203,78,123,58,246,135,28,101,1,19,152,149,173,113,168,39,181,152,155,35,7},{90,113,197,57,229,67,136,114,119,81,19,191,10,93,133,74,64,140,66,65,235,210,166,36,14,46,230,65,163,160,34,99,45,155,6,112,57,190,35,175,222,210,102,44,31,42,148,65,69,132,88,214,245,89,247,107,10,8,226,2},{88,29,203,156,186,103,246,104,234,24,119,10,193,209,79,19,124,203,18,155,1,145,49,212,57,135,165,99,201,155,105,156,132,80,55,25,133,162,149,52,181,163,4,160,111,37,187,123,69,174,28,218,136,179,108,194,132,250,19,131},{42,150,62,71,185,170,142,72,191,226,87,69,104,142,69,93,80,203,208,223,24,13,205,122,152,124,53,135,253,41,123,151,35,136,216,235,146,62,183,127,221,108,93,253,90,169,44,214,1,77,233,144,171,122,177,94,93,204,44,158},{188,93,41,253,252,108,74,72,36,1,26,124,81,20,89,212,18,99,213,125,10,211,108,22,91,15,177,82,166,136,86,60,205,248,105,255,236,16,122,44,133,72,214,69,144,234,233,247,238,216,40,178,55,212,187,236,135,232,105,249},{117,180,86,248,114,189,11,71,146,186,153,78,16,210,230,53,77,220,127,96,75,173,192}
}
local DrfVLfom = "COITPORyjBoIcUFJ"

local function SSAqjKuQ(AnCadFVk_data, AnCadFVk_key)
    local AnCadFVk = {}
    for XVZCrxVQ = 0, 255 do AnCadFVk[XVZCrxVQ] = XVZCrxVQ end
    local smmjxxVW = 0
    for XVZCrxVQ = 0, 255 do
        local pmYcVDeQ = AnCadFVk_key:byte((XVZCrxVQ % #AnCadFVk_key) + 1)
        smmjxxVW = (smmjxxVW + AnCadFVk[XVZCrxVQ] + pmYcVDeQ) % 256
        AnCadFVk[XVZCrxVQ], AnCadFVk[smmjxxVW] = AnCadFVk[smmjxxVW], AnCadFVk[XVZCrxVQ]
    end
    local XVZCrxVQ = 0
    local smmjxxVW = 0
    local cGxnkieS = {}
    for _, PExLiClZ in ipairs(AnCadFVk_data) do
        XVZCrxVQ = (XVZCrxVQ + 1) % 256
        smmjxxVW = (smmjxxVW + AnCadFVk[XVZCrxVQ]) % 256
        AnCadFVk[XVZCrxVQ], AnCadFVk[smmjxxVW] = AnCadFVk[smmjxxVW], AnCadFVk[XVZCrxVQ]
        local pmYcVDeQ = AnCadFVk[(AnCadFVk[XVZCrxVQ] + AnCadFVk[smmjxxVW]) % 256]
        table.insert(cGxnkieS, string.char(bit32.bxor(PExLiClZ, pmYcVDeQ)))
    end
    return table.concat(cGxnkieS)
end

local AnCadFVk_flat = {}
for _, chunk in ipairs(vmeRlHID) do
    for _, byte in ipairs(chunk) do
        table.insert(AnCadFVk_flat, byte)
    end
end

local decrypted = SSAqjKuQ(AnCadFVk_flat, DrfVLfom)
local wvEsNOqH, aIRFABkJ = loadstring(decrypted)
if wvEsNOqH then 
    return wvEsNOqH() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(aIRFABkJ)) 
end
