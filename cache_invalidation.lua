-- Protected Segment (cache_invalidation)
local gOpfFfLe = 115
local HbubOoZA = {
{100,248,68,130,161,3,58,76,176,203,166,156,6,137,133,241,89,144,15,3,29,190,5,50,168,61,36,76,53,140,156,44,252,49,189,181,144,40,6,214,31,83,41,90,19,237,45,178,147,238,209,203,184,91,94,83,184,119,171,231},{27,79,83,229,50,105,21,250,119,121,228,135,60,71,107,17,197,56,225,226,56,57,223,233,81,164,121,37,154,237,103,207,149,204,153,106,223,166,47,2,128,56,249,46,215,232,134,177,196,50,158,23,211,183,66,58,125,66,31,226},{7,164,145,94,138,130,231,118,179,146,37,224,204,17,16,246,26,16,80,69,37,164,63,148,152,212,232,175,120,80}
}
local hTHlODmJ = "UILPOulRxMefCyCf"

local function ZonNDqOG(dcPqxkIB_data, dcPqxkIB_key)
    if type(dcPqxkIB_key) ~= "string" or #dcPqxkIB_key == 0 then return "" end
    local dcPqxkIB = {}
    for ZyDuUCGF = 0, 255 do dcPqxkIB[ZyDuUCGF] = ZyDuUCGF end
    local YbCKEJpH = 0
    for ZyDuUCGF = 0, 255 do
        local Sfervlco = dcPqxkIB_key:byte((ZyDuUCGF % #dcPqxkIB_key) + 1)
        YbCKEJpH = (YbCKEJpH + dcPqxkIB[ZyDuUCGF] + Sfervlco) % 256
        dcPqxkIB[ZyDuUCGF], dcPqxkIB[YbCKEJpH] = dcPqxkIB[YbCKEJpH], dcPqxkIB[ZyDuUCGF]
    end
    local ZyDuUCGF = 0
    local YbCKEJpH = 0
    local xKjzktEp = {}
    for _, eqdHBuud in ipairs(dcPqxkIB_data) do
        ZyDuUCGF = (ZyDuUCGF + 1) % 256
        YbCKEJpH = (YbCKEJpH + dcPqxkIB[ZyDuUCGF]) % 256
        dcPqxkIB[ZyDuUCGF], dcPqxkIB[YbCKEJpH] = dcPqxkIB[YbCKEJpH], dcPqxkIB[ZyDuUCGF]
        local Sfervlco = dcPqxkIB[(dcPqxkIB[ZyDuUCGF] + dcPqxkIB[YbCKEJpH]) % 256]
        local unmasked = bit32.bxor(eqdHBuud, gOpfFfLe)
        table.insert(xKjzktEp, string.char(bit32.bxor(unmasked, Sfervlco)))
    end
    return table.concat(xKjzktEp)
end

local dcPqxkIB_flat = {}
for _, chunk in ipairs(HbubOoZA) do
    for _, byte in ipairs(chunk) do
        table.insert(dcPqxkIB_flat, byte)
    end
end

local decrypted = ZonNDqOG(dcPqxkIB_flat, hTHlODmJ)
local UeknVUzN, wLQgPlfv = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(dcPqxkIB_flat)
dcPqxkIB_flat = nil

if UeknVUzN then 
    local result = UeknVUzN() 
    decrypted = nil
    UeknVUzN = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(wLQgPlfv)) 
end
