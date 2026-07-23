-- Protected Segment (ui_themes)
local eYGpvzgN = 177
local KuumdoaK = {
{69,134,138,116,125,233,138,82,226,163,37,97,167,196,208,121,60,61,128,1,241,194,213,117,173,4,125,199,117,3,253,210,166,37,212,0,120,114,59,179,235,96,247,186,230,168,44,248,132,211,13,154,138,157,67,147,44,163,18,51},{92,210,65,122,31,123,127,30,201,187,10,116,4,203,21,66,132,110,19,150,95,41,21,250,116,53,8,121,55,48,74,238,213,58,52,189,54,113,143,1,67,89,72,251,184,10,96,197,2,132,153,240,37,54,154,220,118,95,70,246},{252,97,33,8,138,32,227,66,219,194,14,57,122,53,18,137,212,214,247,154,245}
}
local uBJPHZFi = "EBzYWTroTkZYnMGB"

local function wSAhdQyj(UcPxWDhb_data, UcPxWDhb_key)
    if type(UcPxWDhb_key) ~= "string" or #UcPxWDhb_key == 0 then return "" end
    local UcPxWDhb = {}
    for yUkrBHNw = 0, 255 do UcPxWDhb[yUkrBHNw] = yUkrBHNw end
    local zqfySWvD = 0
    for yUkrBHNw = 0, 255 do
        local aSWqjwLC = UcPxWDhb_key:byte((yUkrBHNw % #UcPxWDhb_key) + 1)
        zqfySWvD = (zqfySWvD + UcPxWDhb[yUkrBHNw] + aSWqjwLC) % 256
        UcPxWDhb[yUkrBHNw], UcPxWDhb[zqfySWvD] = UcPxWDhb[zqfySWvD], UcPxWDhb[yUkrBHNw]
    end
    local yUkrBHNw = 0
    local zqfySWvD = 0
    local dpPNuSqD = {}
    for _, wnhjLWIh in ipairs(UcPxWDhb_data) do
        yUkrBHNw = (yUkrBHNw + 1) % 256
        zqfySWvD = (zqfySWvD + UcPxWDhb[yUkrBHNw]) % 256
        UcPxWDhb[yUkrBHNw], UcPxWDhb[zqfySWvD] = UcPxWDhb[zqfySWvD], UcPxWDhb[yUkrBHNw]
        local aSWqjwLC = UcPxWDhb[(UcPxWDhb[yUkrBHNw] + UcPxWDhb[zqfySWvD]) % 256]
        local unmasked = bit32.bxor(wnhjLWIh, eYGpvzgN)
        table.insert(dpPNuSqD, string.char(bit32.bxor(unmasked, aSWqjwLC)))
    end
    return table.concat(dpPNuSqD)
end

local UcPxWDhb_flat = {}
for _, chunk in ipairs(KuumdoaK) do
    for _, byte in ipairs(chunk) do
        table.insert(UcPxWDhb_flat, byte)
    end
end

local decrypted = wSAhdQyj(UcPxWDhb_flat, uBJPHZFi)
local RLBSAtxv, NWSQMhVo = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(UcPxWDhb_flat)
UcPxWDhb_flat = nil

if RLBSAtxv then 
    local result = RLBSAtxv() 
    decrypted = nil
    RLBSAtxv = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(NWSQMhVo)) 
end
