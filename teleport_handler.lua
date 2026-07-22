-- Protected Segment (teleport_handler)
local bklVBIWt = 72
local bVnXClCh = {
{164,75,204,197,71,161,24,126,185,26,137,97,11,53,189,156,188,129,236,155,107,207,151,246,222,231,83,108,231,111,96,112,141,179,12,10,89,255,114,91,96,85,107,254,139,24,237,68,97,146,43,100,124,155,247,249,166,148,247,107},{180,200,214,153,87,4,79,199,183,18,207,195,94,11,220,84,189,227,180,85,152,129,136,14,78,215,196,239,93,93,30,172,159,140,138,104,194,186,46,38,33,204,134,106,196,26,86,224,247,208,152,173,79,43,11,5,9,7,55,37},{195,4,52,90,176,205,167,207,245,208,56,247,245,152,215,137,110,133,95,237,76,62,96,113,227,179,118,43}
}
local KvcMtsmu = "euSFWSXJpaMyOdjv"

local function ZEwRpQDK(oQixceXk_data, oQixceXk_key)
    local oQixceXk = {}
    for KSIdLiPX = 0, 255 do oQixceXk[KSIdLiPX] = KSIdLiPX end
    local fpYSrmoB = 0
    for KSIdLiPX = 0, 255 do
        local hKlpPmfz = oQixceXk_key:byte((KSIdLiPX % #oQixceXk_key) + 1)
        fpYSrmoB = (fpYSrmoB + oQixceXk[KSIdLiPX] + hKlpPmfz) % 256
        oQixceXk[KSIdLiPX], oQixceXk[fpYSrmoB] = oQixceXk[fpYSrmoB], oQixceXk[KSIdLiPX]
    end
    local KSIdLiPX = 0
    local fpYSrmoB = 0
    local EwZtofhq = {}
    for _, EZrEPvBr in ipairs(oQixceXk_data) do
        KSIdLiPX = (KSIdLiPX + 1) % 256
        fpYSrmoB = (fpYSrmoB + oQixceXk[KSIdLiPX]) % 256
        oQixceXk[KSIdLiPX], oQixceXk[fpYSrmoB] = oQixceXk[fpYSrmoB], oQixceXk[KSIdLiPX]
        local hKlpPmfz = oQixceXk[(oQixceXk[KSIdLiPX] + oQixceXk[fpYSrmoB]) % 256]
        local unmasked = bit32.bxor(EZrEPvBr, bklVBIWt)
        table.insert(EwZtofhq, string.char(bit32.bxor(unmasked, hKlpPmfz)))
    end
    return table.concat(EwZtofhq)
end

local oQixceXk_flat = {}
for _, chunk in ipairs(bVnXClCh) do
    for _, byte in ipairs(chunk) do
        table.insert(oQixceXk_flat, byte)
    end
end

local decrypted = ZEwRpQDK(oQixceXk_flat, KvcMtsmu)
local GuMBhVwJ, aphmLTSS = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(oQixceXk_flat)
oQixceXk_flat = nil

if GuMBhVwJ then 
    local result = GuMBhVwJ() 
    decrypted = nil
    GuMBhVwJ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(aphmLTSS)) 
end
