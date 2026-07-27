-- Protected Segment (ui_themes)
local UbAGgtcW = 149
local jAwojYWW = {
{60,85,210,191,4,93,204,61,125,173,140,112,127,144,44,24,10,234,88,65,33,253,184,205,51,174,254,240,60,203,115,63,87,6,111,150,191,61,165,185,152,228,19,142,31,209,15,186,229,139,211,232,5,2,38,14,12,43,219,202},{97,220,62,13,47,16,44,57,149,126,62,158,240,196,24,242,69,235,185,184,79,184,166,115,16,249,104,180,152,41,114,3,31,192,40,76,108,60,108,202,1,40,10,30,50,51,215,188,40,50,120,1,55,207,79,35,162,234,92,190},{113,135,57,34,203,118,23,99,136,223,107,103,205,249,15,97,39,19,88,185,93}
}
local wbyitzIH = "NPzrVZzjZtyUFpQe"

local function KTVWHKXy(vuFsrysa_data, vuFsrysa_key)
    if type(vuFsrysa_key) ~= "string" or #vuFsrysa_key == 0 then return "" end
    local vuFsrysa = {}
    for CGwbwdhi = 0, 255 do vuFsrysa[CGwbwdhi] = CGwbwdhi end
    local pTbKWeYl = 0
    for CGwbwdhi = 0, 255 do
        local ywExqBps = vuFsrysa_key:byte((CGwbwdhi % #vuFsrysa_key) + 1)
        pTbKWeYl = (pTbKWeYl + vuFsrysa[CGwbwdhi] + ywExqBps) % 256
        vuFsrysa[CGwbwdhi], vuFsrysa[pTbKWeYl] = vuFsrysa[pTbKWeYl], vuFsrysa[CGwbwdhi]
    end
    local CGwbwdhi = 0
    local pTbKWeYl = 0
    local MQeyqkOP = {}
    for _, jPrcVsdP in ipairs(vuFsrysa_data) do
        CGwbwdhi = (CGwbwdhi + 1) % 256
        pTbKWeYl = (pTbKWeYl + vuFsrysa[CGwbwdhi]) % 256
        vuFsrysa[CGwbwdhi], vuFsrysa[pTbKWeYl] = vuFsrysa[pTbKWeYl], vuFsrysa[CGwbwdhi]
        local ywExqBps = vuFsrysa[(vuFsrysa[CGwbwdhi] + vuFsrysa[pTbKWeYl]) % 256]
        local unmasked = bit32.bxor(jPrcVsdP, UbAGgtcW)
        table.insert(MQeyqkOP, string.char(bit32.bxor(unmasked, ywExqBps)))
    end
    return table.concat(MQeyqkOP)
end

local vuFsrysa_flat = {}
for _, chunk in ipairs(jAwojYWW) do
    for _, byte in ipairs(chunk) do
        table.insert(vuFsrysa_flat, byte)
    end
end

local decrypted = KTVWHKXy(vuFsrysa_flat, wbyitzIH)
local FqFlbZrJ, hZuWfQJL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(vuFsrysa_flat)
vuFsrysa_flat = nil

if FqFlbZrJ then 
    local result = FqFlbZrJ() 
    decrypted = nil
    FqFlbZrJ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(hZuWfQJL)) 
end
