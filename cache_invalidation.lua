-- Protected Segment (cache_invalidation)
local ZQHNzwaN = 26
local gaJLXcAA = {
{163,151,141,37,200,61,151,227,70,69,246,102,246,24,135,50,79,143,79,128,138,3,49,131,206,197,88,167,195,161,178,42,10,253,76,193,143,174,155,141,186,47,232,144,139,158,24,90,74,48,217,41,240,80,165,158,11,203,29,18},{92,1,124,106,65,255,234,166,167,141,10,152,211,140,34,54,225,102,190,79,146,178,42,212,215,174,248,243,193,116,193,111,33,31,175,177,16,115,109,168,97,86,149,96,83,176,237,189,65,96,149,124,0,116,138,176,231,53,222,224},{17,2,68,56,88,213,132,189,199,151,219,36,244,78,93,95,28,246,10,38,224,183,33,133,217,224,91,96,177,13}
}
local VzpcNFnc = "huCdzeSnFseQUOWE"

local function GaKeJySo(lrSKqtmW_data, lrSKqtmW_key)
    local lrSKqtmW = {}
    for YKexTWcq = 0, 255 do lrSKqtmW[YKexTWcq] = YKexTWcq end
    local RVvYXWrI = 0
    for YKexTWcq = 0, 255 do
        local pJmHlqXo = lrSKqtmW_key:byte((YKexTWcq % #lrSKqtmW_key) + 1)
        RVvYXWrI = (RVvYXWrI + lrSKqtmW[YKexTWcq] + pJmHlqXo) % 256
        lrSKqtmW[YKexTWcq], lrSKqtmW[RVvYXWrI] = lrSKqtmW[RVvYXWrI], lrSKqtmW[YKexTWcq]
    end
    local YKexTWcq = 0
    local RVvYXWrI = 0
    local BFIheVpy = {}
    for _, QIsUYeRm in ipairs(lrSKqtmW_data) do
        YKexTWcq = (YKexTWcq + 1) % 256
        RVvYXWrI = (RVvYXWrI + lrSKqtmW[YKexTWcq]) % 256
        lrSKqtmW[YKexTWcq], lrSKqtmW[RVvYXWrI] = lrSKqtmW[RVvYXWrI], lrSKqtmW[YKexTWcq]
        local pJmHlqXo = lrSKqtmW[(lrSKqtmW[YKexTWcq] + lrSKqtmW[RVvYXWrI]) % 256]
        local unmasked = bit32.bxor(QIsUYeRm, ZQHNzwaN)
        table.insert(BFIheVpy, string.char(bit32.bxor(unmasked, pJmHlqXo)))
    end
    return table.concat(BFIheVpy)
end

local lrSKqtmW_flat = {}
for _, chunk in ipairs(gaJLXcAA) do
    for _, byte in ipairs(chunk) do
        table.insert(lrSKqtmW_flat, byte)
    end
end

local decrypted = GaKeJySo(lrSKqtmW_flat, VzpcNFnc)
local ochQrulE, QKgIFdTF = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(lrSKqtmW_flat)
lrSKqtmW_flat = nil

if ochQrulE then 
    local result = ochQrulE() 
    decrypted = nil
    ochQrulE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(QKgIFdTF)) 
end
