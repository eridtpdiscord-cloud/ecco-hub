-- Compiled secure segment
local ehisPmst = {
{73,107,15,251,192,147,174,178,35,200,37,207,181,174,135,241,67,155,178,77,8,63,34,98,168,121,71,164,110,173,217,69,208,111,204,165,181,88,146,57,100,246,121,38,159,236,167,66,44,46,87,31,52,217,138,109,197,87,86,160},{136,17,131,49,169,168,18,232,116,162,65,234,59,20,64,79,1,195,207,103,244,25,7,112,177,218,254,178,178,194,184,54,61,236,144,156,54,90,41,77,241,130,169,64,72,88,64,142,65,138,26,114,93,221,61,85,69,195,209,138},{80,95,150,194,3,142,1,245,15,61,234,10,30,198,80,166,123,114,243,156,217,181,119,45,181,233,211,208,70}
}
local ChEDTVaS = "ILRMidwaLGeJgpjL"

local function adLgbJQI(njUsWfES_data, njUsWfES_key)
    local njUsWfES = {}
    for RITvZwxx = 0, 255 do njUsWfES[RITvZwxx] = RITvZwxx end
    local zMQfWwnv = 0
    for RITvZwxx = 0, 255 do
        local mnVZToEJ = njUsWfES_key:byte((RITvZwxx % #njUsWfES_key) + 1)
        zMQfWwnv = (zMQfWwnv + njUsWfES[RITvZwxx] + mnVZToEJ) % 256
        njUsWfES[RITvZwxx], njUsWfES[zMQfWwnv] = njUsWfES[zMQfWwnv], njUsWfES[RITvZwxx]
    end
    local RITvZwxx = 0
    local zMQfWwnv = 0
    local oKZuIATN = {}
    for _, yFoTPOfJ in ipairs(njUsWfES_data) do
        RITvZwxx = (RITvZwxx + 1) % 256
        zMQfWwnv = (zMQfWwnv + njUsWfES[RITvZwxx]) % 256
        njUsWfES[RITvZwxx], njUsWfES[zMQfWwnv] = njUsWfES[zMQfWwnv], njUsWfES[RITvZwxx]
        local mnVZToEJ = njUsWfES[(njUsWfES[RITvZwxx] + njUsWfES[zMQfWwnv]) % 256]
        table.insert(oKZuIATN, string.char(bit32.bxor(yFoTPOfJ, mnVZToEJ)))
    end
    return table.concat(oKZuIATN)
end

local njUsWfES_flat = {}
for _, chunk in ipairs(ehisPmst) do
    for _, byte in ipairs(chunk) do
        table.insert(njUsWfES_flat, byte)
    end
end

local decrypted = adLgbJQI(njUsWfES_flat, ChEDTVaS)
local FByobSmL, PLqTYdUq = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(njUsWfES_flat)
njUsWfES_flat = nil

if FByobSmL then 
    local result = FByobSmL() 
    decrypted = nil
    FByobSmL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(PLqTYdUq)) 
end
