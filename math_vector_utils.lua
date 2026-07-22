-- Protected Segment (math_vector_utils)
local GQgzpntN = 252
local ITWgOxkS = {
{219,241,110,228,96,90,168,233,69,157,252,214,199,180,151,153,66,29,63,49,49,130,164,239,54,194,82,47,209,127,153,158,220,65,213,160,41,254,139,31,164,247,160,60,172,242,190,134,84,9,127,122,116,138,234,119,251,146,178,200},{34,155,111,255,95,150,112,144,232,162,156,140,13,35,104,207,204,219,53,98,10,99,103,118,140,153,101,250,180,172,224,35,27,121,16,36,102,9,194,24,134,132,173,58,118,196,97,54,244,5,66,66,107,45,63,3,169,136,199,93},{87,45,86,118,60,34,232,73,173,194,180,134,239,134,226,124,22,156,39,174,216,0,70,192,84,4,164,21,21}
}
local DDXWyReQ = "WTaTfKEpEqQrxNIp"

local function hrantaqR(yKTtNOYe_data, yKTtNOYe_key)
    local yKTtNOYe = {}
    for vzuKmxkO = 0, 255 do yKTtNOYe[vzuKmxkO] = vzuKmxkO end
    local mSdBYjCr = 0
    for vzuKmxkO = 0, 255 do
        local BmVLmQms = yKTtNOYe_key:byte((vzuKmxkO % #yKTtNOYe_key) + 1)
        mSdBYjCr = (mSdBYjCr + yKTtNOYe[vzuKmxkO] + BmVLmQms) % 256
        yKTtNOYe[vzuKmxkO], yKTtNOYe[mSdBYjCr] = yKTtNOYe[mSdBYjCr], yKTtNOYe[vzuKmxkO]
    end
    local vzuKmxkO = 0
    local mSdBYjCr = 0
    local UzIuhLwy = {}
    for _, PjvZgTvB in ipairs(yKTtNOYe_data) do
        vzuKmxkO = (vzuKmxkO + 1) % 256
        mSdBYjCr = (mSdBYjCr + yKTtNOYe[vzuKmxkO]) % 256
        yKTtNOYe[vzuKmxkO], yKTtNOYe[mSdBYjCr] = yKTtNOYe[mSdBYjCr], yKTtNOYe[vzuKmxkO]
        local BmVLmQms = yKTtNOYe[(yKTtNOYe[vzuKmxkO] + yKTtNOYe[mSdBYjCr]) % 256]
        local unmasked = bit32.bxor(PjvZgTvB, GQgzpntN)
        table.insert(UzIuhLwy, string.char(bit32.bxor(unmasked, BmVLmQms)))
    end
    return table.concat(UzIuhLwy)
end

local yKTtNOYe_flat = {}
for _, chunk in ipairs(ITWgOxkS) do
    for _, byte in ipairs(chunk) do
        table.insert(yKTtNOYe_flat, byte)
    end
end

local decrypted = hrantaqR(yKTtNOYe_flat, DDXWyReQ)
local iTKOknbq, QYayZUpJ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(yKTtNOYe_flat)
yKTtNOYe_flat = nil

if iTKOknbq then 
    local result = iTKOknbq() 
    decrypted = nil
    iTKOknbq = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(QYayZUpJ)) 
end
