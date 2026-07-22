-- Protected Segment (teleport_handler)
local QTJgFdKp = 197
local kRFTlzgW = {
{18,62,79,119,89,218,146,218,40,50,135,191,241,184,67,129,0,149,208,79,35,117,120,120,70,218,186,198,197,144,151,102,50,99,73,67,143,9,1,212,163,72,113,234,32,224,98,94,148,93,159,136,22,224,206,38,58,67,239,162},{121,228,144,199,100,77,100,199,165,247,14,105,150,53,83,184,173,70,80,49,204,75,186,5,234,110,3,58,243,225,226,216,85,162,224,47,95,41,58,186,24,124,113,148,83,34,135,8,237,142,240,4,152,249,165,209,206,152,97,248},{189,147,144,37,102,215,85,196,77,36,149,130,15,1,191,180,188,14,254,177,74,53,252,237,14,3,169,34}
}
local oFqugYRA = "OPHeSIgjuqQMFBwD"

local function qGFipvRv(WVIqhXMi_data, WVIqhXMi_key)
    local WVIqhXMi = {}
    for fVYPqRvA = 0, 255 do WVIqhXMi[fVYPqRvA] = fVYPqRvA end
    local eagZqkqy = 0
    for fVYPqRvA = 0, 255 do
        local yJymcDyy = WVIqhXMi_key:byte((fVYPqRvA % #WVIqhXMi_key) + 1)
        eagZqkqy = (eagZqkqy + WVIqhXMi[fVYPqRvA] + yJymcDyy) % 256
        WVIqhXMi[fVYPqRvA], WVIqhXMi[eagZqkqy] = WVIqhXMi[eagZqkqy], WVIqhXMi[fVYPqRvA]
    end
    local fVYPqRvA = 0
    local eagZqkqy = 0
    local UYHCWJDl = {}
    for _, IpDABkli in ipairs(WVIqhXMi_data) do
        fVYPqRvA = (fVYPqRvA + 1) % 256
        eagZqkqy = (eagZqkqy + WVIqhXMi[fVYPqRvA]) % 256
        WVIqhXMi[fVYPqRvA], WVIqhXMi[eagZqkqy] = WVIqhXMi[eagZqkqy], WVIqhXMi[fVYPqRvA]
        local yJymcDyy = WVIqhXMi[(WVIqhXMi[fVYPqRvA] + WVIqhXMi[eagZqkqy]) % 256]
        local unmasked = bit32.bxor(IpDABkli, QTJgFdKp)
        table.insert(UYHCWJDl, string.char(bit32.bxor(unmasked, yJymcDyy)))
    end
    return table.concat(UYHCWJDl)
end

local WVIqhXMi_flat = {}
for _, chunk in ipairs(kRFTlzgW) do
    for _, byte in ipairs(chunk) do
        table.insert(WVIqhXMi_flat, byte)
    end
end

local decrypted = qGFipvRv(WVIqhXMi_flat, oFqugYRA)
local VteUoGYf, VkxaynOM = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(WVIqhXMi_flat)
WVIqhXMi_flat = nil

if VteUoGYf then 
    local result = VteUoGYf() 
    decrypted = nil
    VteUoGYf = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(VkxaynOM)) 
end
