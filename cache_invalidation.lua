-- Protected Segment (cache_invalidation)
local bkAUouyx = 135
local fbxDJozX = {
{25,19,22,253,50,246,146,207,86,84,6,108,14,35,216,228,240,188,61,114,26,169,161,79,133,159,48,178,51,254,96,124,75,253,52,5,183,78,206,181,236,88,228,169,0,212,194,10,37,95,242,128,153,54,218,222,72,120,149,51},{15,192,21,231,160,250,5,245,238,171,40,58,53,95,106,1,160,129,227,113,37,10,254,175,87,177,144,26,227,54,137,245,182,86,26,229,236,109,56,55,77,177,122,83,182,118,50,4,117,23,205,44,124,23,107,32,229,145,98,25},{63,206,142,117,232,34,116,204,176,102,117,129,175,135,40,126,23,97,94,81,67,88,130,204,242,207,119,111,135,189}
}
local bmhKEmWV = "pRBvkqeuVxwfQRJU"

local function lKxCFPDQ(FwIuBogt_data, FwIuBogt_key)
    if type(FwIuBogt_key) ~= "string" or #FwIuBogt_key == 0 then return "" end
    local FwIuBogt = {}
    for wvhagKIG = 0, 255 do FwIuBogt[wvhagKIG] = wvhagKIG end
    local AhHuWiIc = 0
    for wvhagKIG = 0, 255 do
        local UQdROBxj = FwIuBogt_key:byte((wvhagKIG % #FwIuBogt_key) + 1)
        AhHuWiIc = (AhHuWiIc + FwIuBogt[wvhagKIG] + UQdROBxj) % 256
        FwIuBogt[wvhagKIG], FwIuBogt[AhHuWiIc] = FwIuBogt[AhHuWiIc], FwIuBogt[wvhagKIG]
    end
    local wvhagKIG = 0
    local AhHuWiIc = 0
    local tbRJstvZ = {}
    for _, TlFWNCoS in ipairs(FwIuBogt_data) do
        wvhagKIG = (wvhagKIG + 1) % 256
        AhHuWiIc = (AhHuWiIc + FwIuBogt[wvhagKIG]) % 256
        FwIuBogt[wvhagKIG], FwIuBogt[AhHuWiIc] = FwIuBogt[AhHuWiIc], FwIuBogt[wvhagKIG]
        local UQdROBxj = FwIuBogt[(FwIuBogt[wvhagKIG] + FwIuBogt[AhHuWiIc]) % 256]
        local unmasked = bit32.bxor(TlFWNCoS, bkAUouyx)
        table.insert(tbRJstvZ, string.char(bit32.bxor(unmasked, UQdROBxj)))
    end
    return table.concat(tbRJstvZ)
end

local FwIuBogt_flat = {}
for _, chunk in ipairs(fbxDJozX) do
    for _, byte in ipairs(chunk) do
        table.insert(FwIuBogt_flat, byte)
    end
end

local decrypted = lKxCFPDQ(FwIuBogt_flat, bmhKEmWV)
local tjrrzXzZ, jWWAKlGm = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(FwIuBogt_flat)
FwIuBogt_flat = nil

if tjrrzXzZ then 
    local result = tjrrzXzZ() 
    decrypted = nil
    tjrrzXzZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(jWWAKlGm)) 
end
