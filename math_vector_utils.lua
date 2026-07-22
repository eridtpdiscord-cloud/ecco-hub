-- Protected Segment (math_vector_utils)
local CHLbHvQS = 247
local gvvAtfhP = {
{236,90,126,54,210,33,38,221,111,240,41,109,251,209,147,131,39,98,83,40,26,64,160,254,5,113,177,120,42,178,193,3,222,42,3,24,37,159,97,191,202,242,58,177,218,8,0,42,94,187,38,25,51,12,102,222,186,83,71,55},{160,138,191,119,207,172,186,83,177,168,31,18,28,181,53,88,81,215,146,118,109,19,104,58,236,2,10,240,49,174,160,254,60,58,181,249,110,45,251,5,218,34,249,242,44,71,134,120,143,141,146,167,142,52,167,255,51,220,83,32},{55,109,26,117,115,45,228,204,115,213,30,187,5,109,146,66,110,97,49,4,156,17,94,50,234,153,18,124,174}
}
local jnRYNgue = "iWvmUcoRRjTBruww"

local function hPdKnlrC(YMVBdlKB_data, YMVBdlKB_key)
    local YMVBdlKB = {}
    for csfeoUzd = 0, 255 do YMVBdlKB[csfeoUzd] = csfeoUzd end
    local ORmNsmNs = 0
    for csfeoUzd = 0, 255 do
        local UdkcaHqs = YMVBdlKB_key:byte((csfeoUzd % #YMVBdlKB_key) + 1)
        ORmNsmNs = (ORmNsmNs + YMVBdlKB[csfeoUzd] + UdkcaHqs) % 256
        YMVBdlKB[csfeoUzd], YMVBdlKB[ORmNsmNs] = YMVBdlKB[ORmNsmNs], YMVBdlKB[csfeoUzd]
    end
    local csfeoUzd = 0
    local ORmNsmNs = 0
    local LeteybRc = {}
    for _, XmXZxHWb in ipairs(YMVBdlKB_data) do
        csfeoUzd = (csfeoUzd + 1) % 256
        ORmNsmNs = (ORmNsmNs + YMVBdlKB[csfeoUzd]) % 256
        YMVBdlKB[csfeoUzd], YMVBdlKB[ORmNsmNs] = YMVBdlKB[ORmNsmNs], YMVBdlKB[csfeoUzd]
        local UdkcaHqs = YMVBdlKB[(YMVBdlKB[csfeoUzd] + YMVBdlKB[ORmNsmNs]) % 256]
        local unmasked = bit32.bxor(XmXZxHWb, CHLbHvQS)
        table.insert(LeteybRc, string.char(bit32.bxor(unmasked, UdkcaHqs)))
    end
    return table.concat(LeteybRc)
end

local YMVBdlKB_flat = {}
for _, chunk in ipairs(gvvAtfhP) do
    for _, byte in ipairs(chunk) do
        table.insert(YMVBdlKB_flat, byte)
    end
end

local decrypted = hPdKnlrC(YMVBdlKB_flat, jnRYNgue)
local zOWUQQGt, WDCZZdyQ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(YMVBdlKB_flat)
YMVBdlKB_flat = nil

if zOWUQQGt then 
    local result = zOWUQQGt() 
    decrypted = nil
    zOWUQQGt = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(WDCZZdyQ)) 
end
