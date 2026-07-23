-- Protected Segment (math_vector_utils)
local txDJYsOQ = 111
local ihxuGdeU = {
{38,207,225,150,87,29,49,21,215,63,73,64,230,168,219,48,246,52,5,186,54,109,76,147,106,172,99,71,239,189,70,23,232,166,169,232,99,175,107,97,81,158,235,202,78,206,25,191,34,7,35,52,47,143,64,57,63,215,74,212},{125,143,222,46,42,164,176,144,73,53,160,228,166,157,188,196,255,242,0,188,223,14,50,229,232,107,3,122,206,176,138,161,139,39,65,225,178,131,42,64,10,180,248,227,113,104,181,90,209,68,207,148,133,39,48,105,245,243,30,155},{79,55,108,66,187,28,122,62,188,79,149,200,191,153,109,164,66,159,255,113,124,150,1,92,3,135,91,116,131}
}
local OdFUesDP = "zrVAjgoJNyAHeJqh"

local function PnEVHgKc(ppzwSNqc_data, ppzwSNqc_key)
    if type(ppzwSNqc_key) ~= "string" or #ppzwSNqc_key == 0 then return "" end
    local ppzwSNqc = {}
    for bhMssxkn = 0, 255 do ppzwSNqc[bhMssxkn] = bhMssxkn end
    local QqxpvAoe = 0
    for bhMssxkn = 0, 255 do
        local EONhBdBb = ppzwSNqc_key:byte((bhMssxkn % #ppzwSNqc_key) + 1)
        QqxpvAoe = (QqxpvAoe + ppzwSNqc[bhMssxkn] + EONhBdBb) % 256
        ppzwSNqc[bhMssxkn], ppzwSNqc[QqxpvAoe] = ppzwSNqc[QqxpvAoe], ppzwSNqc[bhMssxkn]
    end
    local bhMssxkn = 0
    local QqxpvAoe = 0
    local YqDvEaqV = {}
    for _, woHmYjlq in ipairs(ppzwSNqc_data) do
        bhMssxkn = (bhMssxkn + 1) % 256
        QqxpvAoe = (QqxpvAoe + ppzwSNqc[bhMssxkn]) % 256
        ppzwSNqc[bhMssxkn], ppzwSNqc[QqxpvAoe] = ppzwSNqc[QqxpvAoe], ppzwSNqc[bhMssxkn]
        local EONhBdBb = ppzwSNqc[(ppzwSNqc[bhMssxkn] + ppzwSNqc[QqxpvAoe]) % 256]
        local unmasked = bit32.bxor(woHmYjlq, txDJYsOQ)
        table.insert(YqDvEaqV, string.char(bit32.bxor(unmasked, EONhBdBb)))
    end
    return table.concat(YqDvEaqV)
end

local ppzwSNqc_flat = {}
for _, chunk in ipairs(ihxuGdeU) do
    for _, byte in ipairs(chunk) do
        table.insert(ppzwSNqc_flat, byte)
    end
end

local decrypted = PnEVHgKc(ppzwSNqc_flat, OdFUesDP)
local BKprtKZD, kAhVoHjL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ppzwSNqc_flat)
ppzwSNqc_flat = nil

if BKprtKZD then 
    local result = BKprtKZD() 
    decrypted = nil
    BKprtKZD = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(kAhVoHjL)) 
end
