-- Protected Segment (anti_cheat_bypass)
local gFEQYzLR = 29
local WqDPdzuA = {
{124,232,75,6,135,152,104,224,241,66,75,59,231,218,38,173,219,231,37,212,48,14,214,198,140,145,137,190,180,131,216,162,96,138,212,94,11,223,8,244,163,219,124,199,155,52,87,118,140,87,246,61,228,10,45,167,218,227,139,229},{150,40,237,173,77,235,29,30,83,45,116,253,210,248,11,165,211,116,206,25,23,221,207,146,90,95,189,87,196,73,50,136,65,193,175,145,223,81,19,167,229,200,206,166,114,253,124,8,201,98,90,146,87,244,163,104,213,244,157,137},{243,100,36,177,3,227,197,42,105,156,109,242,2,231,142,19,86,228,30,213,123,174,227,146,60,6,93,156,70}
}
local TDBdOzuR = "EaBSYtMuxXEXmtFH"

local function WlCDEzUV(gQHSWRVe_data, gQHSWRVe_key)
    if type(gQHSWRVe_key) ~= "string" or #gQHSWRVe_key == 0 then return "" end
    local gQHSWRVe = {}
    for OPEfEivw = 0, 255 do gQHSWRVe[OPEfEivw] = OPEfEivw end
    local VNnddncw = 0
    for OPEfEivw = 0, 255 do
        local stGMrpij = gQHSWRVe_key:byte((OPEfEivw % #gQHSWRVe_key) + 1)
        VNnddncw = (VNnddncw + gQHSWRVe[OPEfEivw] + stGMrpij) % 256
        gQHSWRVe[OPEfEivw], gQHSWRVe[VNnddncw] = gQHSWRVe[VNnddncw], gQHSWRVe[OPEfEivw]
    end
    local OPEfEivw = 0
    local VNnddncw = 0
    local wbPhKsuq = {}
    for _, YrPyJxlL in ipairs(gQHSWRVe_data) do
        OPEfEivw = (OPEfEivw + 1) % 256
        VNnddncw = (VNnddncw + gQHSWRVe[OPEfEivw]) % 256
        gQHSWRVe[OPEfEivw], gQHSWRVe[VNnddncw] = gQHSWRVe[VNnddncw], gQHSWRVe[OPEfEivw]
        local stGMrpij = gQHSWRVe[(gQHSWRVe[OPEfEivw] + gQHSWRVe[VNnddncw]) % 256]
        local unmasked = bit32.bxor(YrPyJxlL, gFEQYzLR)
        table.insert(wbPhKsuq, string.char(bit32.bxor(unmasked, stGMrpij)))
    end
    return table.concat(wbPhKsuq)
end

local gQHSWRVe_flat = {}
for _, chunk in ipairs(WqDPdzuA) do
    for _, byte in ipairs(chunk) do
        table.insert(gQHSWRVe_flat, byte)
    end
end

local decrypted = WlCDEzUV(gQHSWRVe_flat, TDBdOzuR)
local LExDYeha, HQIqDqJQ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(gQHSWRVe_flat)
gQHSWRVe_flat = nil

if LExDYeha then 
    local result = LExDYeha() 
    decrypted = nil
    LExDYeha = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(HQIqDqJQ)) 
end
