-- Compiled secure segment
local lBEOuSBq = {
{217,195,72,13,7,36,247,173,219,158,122,33,179,8,155,10,121,76,225,123,238,128,20,128,101,169,11,129,28,225,134,95,11,99,182,196,174,55,209,55,94,233,124,115,58,75,222,78,23,10,16,151,19,44,240,53,103,214,70,55},{165,19,134,28,148,226,41,96,34,165,46,136,224,5,232,195,80,240,7,139,207,106,94,235,121,243,144,201,202,61,142,104,89,114,40,208,123,166,17,41,185,1,143,2,20,67,140,161,6,54,146,118,230,145,66,43,234,177,125,137},{89,246,91,194,196,143,128,217,149,80,145,152,255,185,73,152,116,135,108,146,54,80,13,46,186,178,170,251,49,199,110,224,140,127,45,75,93,100,206,211,47,134,43,125,19,247,129,253,33,229,201,31,254,180,170,118,220,153,251,81},{32,136,37,84,113,33,166,126,212,24,28,30,16,39,7,226,86,205,188,134,39,123,227,246,142,254,241,226,181,11,27,91,184,242,164,175,176,63,178,127,231,233,23,195,117,242,62,35,25,32,137,235,93,229,30,76}
}
local LsdZSmEW = "vbMwIOPpWVhPoxWE"

local function UyUPMsbu(xdxifldv_data, xdxifldv_key)
    local xdxifldv = {}
    for asfJcnRy = 0, 255 do xdxifldv[asfJcnRy] = asfJcnRy end
    local GiMMrIPb = 0
    for asfJcnRy = 0, 255 do
        local nMeBmXmQ = xdxifldv_key:byte((asfJcnRy % #xdxifldv_key) + 1)
        GiMMrIPb = (GiMMrIPb + xdxifldv[asfJcnRy] + nMeBmXmQ) % 256
        xdxifldv[asfJcnRy], xdxifldv[GiMMrIPb] = xdxifldv[GiMMrIPb], xdxifldv[asfJcnRy]
    end
    local asfJcnRy = 0
    local GiMMrIPb = 0
    local FqlBLlLs = {}
    for _, bOuMFZRt in ipairs(xdxifldv_data) do
        asfJcnRy = (asfJcnRy + 1) % 256
        GiMMrIPb = (GiMMrIPb + xdxifldv[asfJcnRy]) % 256
        xdxifldv[asfJcnRy], xdxifldv[GiMMrIPb] = xdxifldv[GiMMrIPb], xdxifldv[asfJcnRy]
        local nMeBmXmQ = xdxifldv[(xdxifldv[asfJcnRy] + xdxifldv[GiMMrIPb]) % 256]
        table.insert(FqlBLlLs, string.char(bit32.bxor(bOuMFZRt, nMeBmXmQ)))
    end
    return table.concat(FqlBLlLs)
end

local xdxifldv_flat = {}
for _, chunk in ipairs(lBEOuSBq) do
    for _, byte in ipairs(chunk) do
        table.insert(xdxifldv_flat, byte)
    end
end

local decrypted = UyUPMsbu(xdxifldv_flat, LsdZSmEW)
local JfuiQtlG, WHjFcEVT = loadstring(decrypted)
if JfuiQtlG then 
    return JfuiQtlG() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(WHjFcEVT)) 
end
