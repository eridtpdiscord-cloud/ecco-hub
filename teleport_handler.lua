-- Protected Segment (teleport_handler)
local MESUQKGF = 15
local MODVZQpu = {
{29,214,195,227,103,134,198,177,71,92,92,45,169,144,122,170,6,9,216,232,103,27,170,140,155,196,209,212,21,75,123,125,85,110,185,243,160,208,103,202,50,137,119,52,53,157,220,115,181,73,173,40,123,100,166,65,225,2,131,251},{159,67,27,165,169,213,156,118,155,122,208,127,53,204,122,230,0,22,200,225,238,123,98,190,137,78,140,83,132,255,13,91,81,63,116,113,184,233,236,111,172,66,252,66,145,154,160,168,21,45,53,219,35,30,230,96,171,85,67,212},{230,41,39,255,182,76,4,79,84,1,245,20,135,182,184,89,214,16,88,169,255,15,150,58,104,168,56,182}
}
local bDcRogBw = "iJgaLUGhNBkxGbHL"

local function txexIjes(eRqUzklU_data, eRqUzklU_key)
    if type(eRqUzklU_key) ~= "string" or #eRqUzklU_key == 0 then return "" end
    local eRqUzklU = {}
    for KMaqMBCZ = 0, 255 do eRqUzklU[KMaqMBCZ] = KMaqMBCZ end
    local bCQSptVc = 0
    for KMaqMBCZ = 0, 255 do
        local ntgXpMjq = eRqUzklU_key:byte((KMaqMBCZ % #eRqUzklU_key) + 1)
        bCQSptVc = (bCQSptVc + eRqUzklU[KMaqMBCZ] + ntgXpMjq) % 256
        eRqUzklU[KMaqMBCZ], eRqUzklU[bCQSptVc] = eRqUzklU[bCQSptVc], eRqUzklU[KMaqMBCZ]
    end
    local KMaqMBCZ = 0
    local bCQSptVc = 0
    local bPbwVYGR = {}
    for _, oCVZWWkn in ipairs(eRqUzklU_data) do
        KMaqMBCZ = (KMaqMBCZ + 1) % 256
        bCQSptVc = (bCQSptVc + eRqUzklU[KMaqMBCZ]) % 256
        eRqUzklU[KMaqMBCZ], eRqUzklU[bCQSptVc] = eRqUzklU[bCQSptVc], eRqUzklU[KMaqMBCZ]
        local ntgXpMjq = eRqUzklU[(eRqUzklU[KMaqMBCZ] + eRqUzklU[bCQSptVc]) % 256]
        local unmasked = bit32.bxor(oCVZWWkn, MESUQKGF)
        table.insert(bPbwVYGR, string.char(bit32.bxor(unmasked, ntgXpMjq)))
    end
    return table.concat(bPbwVYGR)
end

local eRqUzklU_flat = {}
for _, chunk in ipairs(MODVZQpu) do
    for _, byte in ipairs(chunk) do
        table.insert(eRqUzklU_flat, byte)
    end
end

local decrypted = txexIjes(eRqUzklU_flat, bDcRogBw)
local GCjzkrVf, bBwHplut = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(eRqUzklU_flat)
eRqUzklU_flat = nil

if GCjzkrVf then 
    local result = GCjzkrVf() 
    decrypted = nil
    GCjzkrVf = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(bBwHplut)) 
end
