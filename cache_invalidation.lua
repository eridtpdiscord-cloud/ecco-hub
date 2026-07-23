-- Protected Segment (cache_invalidation)
local ioNxmKCx = 210
local EXLURvVk = {
{230,239,12,194,57,51,232,241,213,174,150,129,177,246,63,32,214,206,206,205,24,63,144,84,74,50,250,43,203,216,21,114,116,14,227,230,55,232,81,83,227,223,237,9,40,66,16,31,118,220,178,200,83,137,64,50,165,56,236,128},{214,245,134,207,18,196,107,75,141,12,82,146,247,139,54,113,33,150,181,252,220,206,107,217,220,246,225,100,171,75,213,0,136,186,168,247,11,192,198,159,55,54,49,82,117,141,87,141,116,27,149,100,45,110,17,250,253,35,145,205},{77,140,180,55,167,112,20,248,47,190,25,166,192,234,234,226,37,79,139,201,24,91,53,9,233,17,81,160,174,12}
}
local AVdHdkdi = "guvhdChmCJuAyatZ"

local function HlCxLmBQ(adWaCSxW_data, adWaCSxW_key)
    if type(adWaCSxW_key) ~= "string" or #adWaCSxW_key == 0 then return "" end
    local adWaCSxW = {}
    for NbxdejiY = 0, 255 do adWaCSxW[NbxdejiY] = NbxdejiY end
    local uDFgEqVK = 0
    for NbxdejiY = 0, 255 do
        local hIwHuoxR = adWaCSxW_key:byte((NbxdejiY % #adWaCSxW_key) + 1)
        uDFgEqVK = (uDFgEqVK + adWaCSxW[NbxdejiY] + hIwHuoxR) % 256
        adWaCSxW[NbxdejiY], adWaCSxW[uDFgEqVK] = adWaCSxW[uDFgEqVK], adWaCSxW[NbxdejiY]
    end
    local NbxdejiY = 0
    local uDFgEqVK = 0
    local xLKEjxko = {}
    for _, xXFerDMw in ipairs(adWaCSxW_data) do
        NbxdejiY = (NbxdejiY + 1) % 256
        uDFgEqVK = (uDFgEqVK + adWaCSxW[NbxdejiY]) % 256
        adWaCSxW[NbxdejiY], adWaCSxW[uDFgEqVK] = adWaCSxW[uDFgEqVK], adWaCSxW[NbxdejiY]
        local hIwHuoxR = adWaCSxW[(adWaCSxW[NbxdejiY] + adWaCSxW[uDFgEqVK]) % 256]
        local unmasked = bit32.bxor(xXFerDMw, ioNxmKCx)
        table.insert(xLKEjxko, string.char(bit32.bxor(unmasked, hIwHuoxR)))
    end
    return table.concat(xLKEjxko)
end

local adWaCSxW_flat = {}
for _, chunk in ipairs(EXLURvVk) do
    for _, byte in ipairs(chunk) do
        table.insert(adWaCSxW_flat, byte)
    end
end

local decrypted = HlCxLmBQ(adWaCSxW_flat, AVdHdkdi)
local yptqHrvZ, nQxOJDZF = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(adWaCSxW_flat)
adWaCSxW_flat = nil

if yptqHrvZ then 
    local result = yptqHrvZ() 
    decrypted = nil
    yptqHrvZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(nQxOJDZF)) 
end
