-- Protected Segment (network_optimizer)
local CIljisFZ = 67
local RSqxeFOS = {
{75,82,185,219,9,100,151,231,149,126,183,246,72,94,197,12,60,68,97,197,113,38,142,150,20,82,45,44,74,62,250,192,139,162,223,77,58,212,181,138,36,19,93,132,133,243,55,111,33,30,23,3,32,26,168,167,207,67,149,171},{117,81,244,155,98,133,26,241,249,13,166,132,230,17,193,241,163,19,40,62,26,190,250,222,227,67,103,199,23,83,144,105,184,40,35,223,100,112,232,45,237,158,217,117,53,226,76,136,246,167,180,15,156,54,197,49,232,36,57,89},{1,69,244,254,68,181,121,37,14,51,88,69,162,91,211,183,111,122,171,187,21,106,89,110,234,157,170,20,193}
}
local XyCryLSC = "ePvLbiucCqnAflOZ"

local function kgNphrwb(GrzLAuCk_data, GrzLAuCk_key)
    if type(GrzLAuCk_key) ~= "string" or #GrzLAuCk_key == 0 then return "" end
    local GrzLAuCk = {}
    for EynBEyqw = 0, 255 do GrzLAuCk[EynBEyqw] = EynBEyqw end
    local xntuGJCq = 0
    for EynBEyqw = 0, 255 do
        local ZvdIQiFa = GrzLAuCk_key:byte((EynBEyqw % #GrzLAuCk_key) + 1)
        xntuGJCq = (xntuGJCq + GrzLAuCk[EynBEyqw] + ZvdIQiFa) % 256
        GrzLAuCk[EynBEyqw], GrzLAuCk[xntuGJCq] = GrzLAuCk[xntuGJCq], GrzLAuCk[EynBEyqw]
    end
    local EynBEyqw = 0
    local xntuGJCq = 0
    local hcMxYPHN = {}
    for _, WwXPiIWD in ipairs(GrzLAuCk_data) do
        EynBEyqw = (EynBEyqw + 1) % 256
        xntuGJCq = (xntuGJCq + GrzLAuCk[EynBEyqw]) % 256
        GrzLAuCk[EynBEyqw], GrzLAuCk[xntuGJCq] = GrzLAuCk[xntuGJCq], GrzLAuCk[EynBEyqw]
        local ZvdIQiFa = GrzLAuCk[(GrzLAuCk[EynBEyqw] + GrzLAuCk[xntuGJCq]) % 256]
        local unmasked = bit32.bxor(WwXPiIWD, CIljisFZ)
        table.insert(hcMxYPHN, string.char(bit32.bxor(unmasked, ZvdIQiFa)))
    end
    return table.concat(hcMxYPHN)
end

local GrzLAuCk_flat = {}
for _, chunk in ipairs(RSqxeFOS) do
    for _, byte in ipairs(chunk) do
        table.insert(GrzLAuCk_flat, byte)
    end
end

local decrypted = kgNphrwb(GrzLAuCk_flat, XyCryLSC)
local nzHwHtvV, sWGUXMFp = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(GrzLAuCk_flat)
GrzLAuCk_flat = nil

if nzHwHtvV then 
    local result = nzHwHtvV() 
    decrypted = nil
    nzHwHtvV = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(sWGUXMFp)) 
end
