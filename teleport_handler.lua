-- Protected Segment (teleport_handler)
local UhKEMzxS = 36
local caoEgWHe = {
{181,168,21,31,194,117,127,112,40,245,59,199,41,222,186,88,138,119,71,248,25,36,206,84,136,31,17,80,239,143,157,174,16,83,175,49,156,25,57,12,130,229,8,70,139,68,141,153,98,140,240,197,103,28,88,7,222,62,253,239},{251,71,201,129,171,183,88,52,171,61,95,107,66,132,109,129,56,116,96,174,251,55,27,31,209,219,249,195,115,93,126,60,254,105,103,8,194,141,215,90,120,83,227,32,20,226,246,113,118,75,66,113,151,227,66,132,217,115,23,4},{51,114,184,203,35,183,120,255,83,110,0,217,97,152,60,180,207,144,134,228,242,146,220,102,47,9,4,168}
}
local uJKDRwSe = "iIlXYsYNowkxgiQC"

local function rDbHWTaN(kRPKgbyF_data, kRPKgbyF_key)
    local kRPKgbyF = {}
    for PAXVsCzU = 0, 255 do kRPKgbyF[PAXVsCzU] = PAXVsCzU end
    local vLCRXKjM = 0
    for PAXVsCzU = 0, 255 do
        local cGQULWXc = kRPKgbyF_key:byte((PAXVsCzU % #kRPKgbyF_key) + 1)
        vLCRXKjM = (vLCRXKjM + kRPKgbyF[PAXVsCzU] + cGQULWXc) % 256
        kRPKgbyF[PAXVsCzU], kRPKgbyF[vLCRXKjM] = kRPKgbyF[vLCRXKjM], kRPKgbyF[PAXVsCzU]
    end
    local PAXVsCzU = 0
    local vLCRXKjM = 0
    local aorWJgUf = {}
    for _, RozXOhhE in ipairs(kRPKgbyF_data) do
        PAXVsCzU = (PAXVsCzU + 1) % 256
        vLCRXKjM = (vLCRXKjM + kRPKgbyF[PAXVsCzU]) % 256
        kRPKgbyF[PAXVsCzU], kRPKgbyF[vLCRXKjM] = kRPKgbyF[vLCRXKjM], kRPKgbyF[PAXVsCzU]
        local cGQULWXc = kRPKgbyF[(kRPKgbyF[PAXVsCzU] + kRPKgbyF[vLCRXKjM]) % 256]
        local unmasked = bit32.bxor(RozXOhhE, UhKEMzxS)
        table.insert(aorWJgUf, string.char(bit32.bxor(unmasked, cGQULWXc)))
    end
    return table.concat(aorWJgUf)
end

local kRPKgbyF_flat = {}
for _, chunk in ipairs(caoEgWHe) do
    for _, byte in ipairs(chunk) do
        table.insert(kRPKgbyF_flat, byte)
    end
end

local decrypted = rDbHWTaN(kRPKgbyF_flat, uJKDRwSe)
local CXdhPEju, gtVNJQLp = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(kRPKgbyF_flat)
kRPKgbyF_flat = nil

if CXdhPEju then 
    local result = CXdhPEju() 
    decrypted = nil
    CXdhPEju = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(gtVNJQLp)) 
end
