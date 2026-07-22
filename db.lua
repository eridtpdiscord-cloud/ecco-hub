-- Protected Segment (db)
local IZxlCwuH = 100
local OMVvGsra = {
{116,104,51,197,252,126,84,0,32,121,135,192,149,106,163,8,227,55,241,34,184,111,169,30,38,234,64,246,64,211,130,188,25,165,13,150,219,148,39,87,183,39,122,35,71,62,76,157,32,185,86,211,131,11,71,223,184,36,35,147},{78,243,155,110,112,7,133,100,170,201,13,197,254,58,182,10,226,234,198,96,192,18,69,190,45,157,125,240,210,44,70,23,41,193,177,187,63,220,63,237,223,192,10,109,177,62,83,20,15,87,182,252,220,57,108,27,94,214,38,5},{206,152,166,208,212,53,216,108,169,160,43,1,70,0,14,132,195,82,27,242,72,178,248,129,150,147,74,123,57,195,223,92,230,43,217,134,101,245,236,152,236,236,47,180,136,230,55,233,204,138,124,205,119,139,70,89,169,98,54,244},{25,89,70,227,232,174,0,62,8,5,177,43,112,52,17,231,11,70,150,22,199,111,222,165,57,244,0,233,60,102,162,251,5,90,39,78,86,89,82,229,4,238,64,242,32,249,1,122,229,174,222,49,74,117,226,37,251,69,240,126},{170,174,31,209,245,118,25,31,236,27,92,130,243,230,122,125,243,10,26,55,58,230,153,212,97,97,146,129,228,240,90,32,80,218,243,154,187,195,213,102,36,157,167,192,1,245,242,194,202,61,204,155,62,59,173,36,228,52,100,140},{172,59,187,136,96,200,45,50,202,189,61,67,15,95,122,217,34,229,23,21,118,172,252,84,169,226,10,68,86,236,19,193,233,209,113,50,151,155,216,222,69,77,168,102,164,182,62,14,10,212,248,203,112,91,146,235,155,106,174,104},{52,112,32,245,206,249,185,97,200,216,251,81,172,177,81,117,227,208,81,197,140,196,94,144,10,35,127,164,49,52,36,207,122,137,255,8,214,75,193,118,107,78,195,157,188,41,192}
}
local nseOnWsA = "ojbscIsEvxoDnQuK"

local function phOIDVAB(CCksfSky_data, CCksfSky_key)
    local CCksfSky = {}
    for dwSUNQsj = 0, 255 do CCksfSky[dwSUNQsj] = dwSUNQsj end
    local INjFITOf = 0
    for dwSUNQsj = 0, 255 do
        local GEqqiInm = CCksfSky_key:byte((dwSUNQsj % #CCksfSky_key) + 1)
        INjFITOf = (INjFITOf + CCksfSky[dwSUNQsj] + GEqqiInm) % 256
        CCksfSky[dwSUNQsj], CCksfSky[INjFITOf] = CCksfSky[INjFITOf], CCksfSky[dwSUNQsj]
    end
    local dwSUNQsj = 0
    local INjFITOf = 0
    local enrwBRTI = {}
    for _, EocaKgXi in ipairs(CCksfSky_data) do
        dwSUNQsj = (dwSUNQsj + 1) % 256
        INjFITOf = (INjFITOf + CCksfSky[dwSUNQsj]) % 256
        CCksfSky[dwSUNQsj], CCksfSky[INjFITOf] = CCksfSky[INjFITOf], CCksfSky[dwSUNQsj]
        local GEqqiInm = CCksfSky[(CCksfSky[dwSUNQsj] + CCksfSky[INjFITOf]) % 256]
        local unmasked = bit32.bxor(EocaKgXi, IZxlCwuH)
        table.insert(enrwBRTI, string.char(bit32.bxor(unmasked, GEqqiInm)))
    end
    return table.concat(enrwBRTI)
end

local CCksfSky_flat = {}
for _, chunk in ipairs(OMVvGsra) do
    for _, byte in ipairs(chunk) do
        table.insert(CCksfSky_flat, byte)
    end
end

local decrypted = phOIDVAB(CCksfSky_flat, nseOnWsA)
local UbcUKBNn, HldxRelT = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(CCksfSky_flat)
CCksfSky_flat = nil

if UbcUKBNn then 
    local result = UbcUKBNn() 
    decrypted = nil
    UbcUKBNn = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(HldxRelT)) 
end
