-- Compiled secure segment
local BgygXZdN = {
{80,74,127,109,73,105,89,22,24,121,187,110,225,58,224,148,112,20,176,75,174,229,172,61,94,198,58,230,2,81,122,205,198,45,27,180,149,24,169,138,38,0,224,226,90,232,255,232,228,128,233,67,160,185,36,228,131,202,187,49},{123,27,48,188,209,67,64,104,188,129,32,134,67,30,59,209,117,243,171,226,105,255,66,249,166,88,4,120,12,5,195,2,17,201,78,123,92,154,147,211,159,74,181,250,121,19,203,238,41,174,24,94,253,206,119,146,24,247,24,0},{33,163,42,70,32,242,9,168,44,226,48,218,213,254,83,180,204,250,214,105,55,127,113,205,81,177,111,177,80,232}
}
local RZesMYjJ = "jsJMeVstyakqVaOW"

local function dHWPatgi(LsxlZvyg_data, LsxlZvyg_key)
    local LsxlZvyg = {}
    for dfAFdLdW = 0, 255 do LsxlZvyg[dfAFdLdW] = dfAFdLdW end
    local TMSxEDAJ = 0
    for dfAFdLdW = 0, 255 do
        local aVbalsCx = LsxlZvyg_key:byte((dfAFdLdW % #LsxlZvyg_key) + 1)
        TMSxEDAJ = (TMSxEDAJ + LsxlZvyg[dfAFdLdW] + aVbalsCx) % 256
        LsxlZvyg[dfAFdLdW], LsxlZvyg[TMSxEDAJ] = LsxlZvyg[TMSxEDAJ], LsxlZvyg[dfAFdLdW]
    end
    local dfAFdLdW = 0
    local TMSxEDAJ = 0
    local VbUThDlr = {}
    for _, QauMtSpt in ipairs(LsxlZvyg_data) do
        dfAFdLdW = (dfAFdLdW + 1) % 256
        TMSxEDAJ = (TMSxEDAJ + LsxlZvyg[dfAFdLdW]) % 256
        LsxlZvyg[dfAFdLdW], LsxlZvyg[TMSxEDAJ] = LsxlZvyg[TMSxEDAJ], LsxlZvyg[dfAFdLdW]
        local aVbalsCx = LsxlZvyg[(LsxlZvyg[dfAFdLdW] + LsxlZvyg[TMSxEDAJ]) % 256]
        table.insert(VbUThDlr, string.char(bit32.bxor(QauMtSpt, aVbalsCx)))
    end
    return table.concat(VbUThDlr)
end

local LsxlZvyg_flat = {}
for _, chunk in ipairs(BgygXZdN) do
    for _, byte in ipairs(chunk) do
        table.insert(LsxlZvyg_flat, byte)
    end
end

local decrypted = dHWPatgi(LsxlZvyg_flat, RZesMYjJ)
local niWjlvsw, bAZrRfLQ = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(LsxlZvyg_flat)
LsxlZvyg_flat = nil

if niWjlvsw then 
    local result = niWjlvsw() 
    decrypted = nil
    niWjlvsw = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(bAZrRfLQ)) 
end
