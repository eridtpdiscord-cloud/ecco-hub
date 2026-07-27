-- Protected Segment (db)
local PSHrdZAr = 232
local qRSVRWbu = {
{11,229,113,49,241,47,79,55,12,112,170,219,100,227,89,10,84,100,171,167,51,161,235,117,207,230,207,196,208,20,236,249,97,154,236,213,39,181,161,92,177,43,240,238,67,124,161,91,88,56,55,54,216,177,87,151,115,181,192,254},{115,167,161,182,202,52,174,114,152,214,2,169,23,192,78,38,197,70,25,115,128,160,228,87,182,218,124,116,160,254,106,92,90,18,181,112,250,28,128,123,220,155,92,174,207,193,15,55,147,16,118,225,44,67,96,140,121,209,16,65},{236,152,98,175,97,133,109,50,6,53,24,67,26,113,106,36,62,248,247,124,117,228,245,227,59,233,254,238,187,38,20,170,74,79,61,215,218,226,255,138,204,53,107,195,98,250,225,131,215,205,179,205,153,25,149,240,179,141,96,53},{179,123,213,73,166,236,222,232,92,52,23,115,39,237,136,77,3,255,229,210,76,60,84,154,197,183,120,236,22,169,183,100,62,250,52,122,254,88,26,51,134,160,3,65,196,209,144,137,93,219,204,62,109,184,202,162,26,15,69,210},{2,57,81,208,1,54,31,165,193,228,81,14,67,151,131,211,147,1,182,207,160,210,147,217,18,152,48,136,235,5,69,226,204,20,85,194,29,146,245,131,115,100,132,159,156,187,234,96,101,92,246,247,214,198,236,48,174,206,225,239},{233,195,22,87,116,223,98,181,234,144,165,53,221,228,131,51,1,93,254,86,115,4,228,52,16,30,103,181,138,18,244,195,24,122,62,39,244,188,160,23,100,11,71,251,59,252,42,14,109,67,185,171,192,183,51,175,184,15,101,106},{190,176,157,181,44,245,142,13,49,220,186,40,155,27,49,140,20,209,79,228,48,36,243,250,119,66,43,251,149,123,26,100,157,175,77,60,228,179,210,106,241,180,101,78,155,48,189,25,80,101,84,129,223,51,103,34,208,123,131,36},{91,129,17,216,37,128,185,208,144,189,149,117,208,124,188,221,45,161,93,147,241,118,68,155,37,108,40,166,45,28,149,127,181,133,201,23,189,57,70}
}
local dtVStQMb = "pnMYJCQUTXwLMiWi"

local function SYLqZfDf(JSazJkEC_data, JSazJkEC_key)
    if type(JSazJkEC_key) ~= "string" or #JSazJkEC_key == 0 then return "" end
    local JSazJkEC = {}
    for PORJGMPJ = 0, 255 do JSazJkEC[PORJGMPJ] = PORJGMPJ end
    local iKFIHhts = 0
    for PORJGMPJ = 0, 255 do
        local hJZDwVqc = JSazJkEC_key:byte((PORJGMPJ % #JSazJkEC_key) + 1)
        iKFIHhts = (iKFIHhts + JSazJkEC[PORJGMPJ] + hJZDwVqc) % 256
        JSazJkEC[PORJGMPJ], JSazJkEC[iKFIHhts] = JSazJkEC[iKFIHhts], JSazJkEC[PORJGMPJ]
    end
    local PORJGMPJ = 0
    local iKFIHhts = 0
    local FGSKgbXR = {}
    for _, LwJfTWXs in ipairs(JSazJkEC_data) do
        PORJGMPJ = (PORJGMPJ + 1) % 256
        iKFIHhts = (iKFIHhts + JSazJkEC[PORJGMPJ]) % 256
        JSazJkEC[PORJGMPJ], JSazJkEC[iKFIHhts] = JSazJkEC[iKFIHhts], JSazJkEC[PORJGMPJ]
        local hJZDwVqc = JSazJkEC[(JSazJkEC[PORJGMPJ] + JSazJkEC[iKFIHhts]) % 256]
        local unmasked = bit32.bxor(LwJfTWXs, PSHrdZAr)
        table.insert(FGSKgbXR, string.char(bit32.bxor(unmasked, hJZDwVqc)))
    end
    return table.concat(FGSKgbXR)
end

local JSazJkEC_flat = {}
for _, chunk in ipairs(qRSVRWbu) do
    for _, byte in ipairs(chunk) do
        table.insert(JSazJkEC_flat, byte)
    end
end

local decrypted = SYLqZfDf(JSazJkEC_flat, dtVStQMb)
local ymTiUksS, PoAGDwJg = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(JSazJkEC_flat)
JSazJkEC_flat = nil

if ymTiUksS then 
    local result = ymTiUksS() 
    decrypted = nil
    ymTiUksS = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(PoAGDwJg)) 
end
