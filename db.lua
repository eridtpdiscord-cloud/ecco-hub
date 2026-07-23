-- Protected Segment (db)
local AlmQJbjM = 12
local PpEXUbJj = {
{54,82,36,150,205,11,154,78,147,254,245,241,150,176,165,228,116,57,191,11,223,105,14,50,30,181,211,89,104,172,126,31,72,156,20,97,193,142,154,136,34,148,20,94,155,201,74,79,18,30,250,214,205,180,163,71,52,211,49,178},{225,27,77,135,91,240,14,22,183,57,147,110,201,68,14,159,58,61,244,34,0,20,119,59,189,89,52,41,103,187,4,130,58,80,215,214,255,105,21,169,104,108,105,89,222,215,92,79,32,33,151,117,88,59,251,224,140,24,67,158},{155,123,150,16,224,126,27,55,191,235,150,149,192,238,231,141,233,200,238,153,231,186,252,203,34,54,14,62,253,54,85,54,157,224,177,5,216,37,208,231,94,154,219,237,7,173,203,102,66,220,219,186,184,224,143,113,102,58,196,134},{237,32,104,155,12,253,220,133,129,79,219,66,177,141,197,104,138,253,201,218,200,5,87,92,60,112,160,126,41,48,173,158,165,205,5,66,216,251,76,246,238,188,213,125,141,245,122,226,13,243,91,35,25,4,196,243,35,169,243,237},{195,176,245,166,114,218,219,58,198,64,109,79,42,41,148,157,13,157,70,64,216,3,189,185,168,107,78,12,95,139,168,125,216,115,186,233,144,229,109,98,251,74,195,227,13,2,92,18,150,148,6,17,129,23,255,140,51,24,162,136},{131,161,104,216,188,177,211,153,81,46,215,13,185,21,38,83,226,50,21,139,210,32,68,84,112,36,128,154,238,41,8,80,221,51,148,251,94,120,152,18,246,193,214,138,151,109,232,183,201,178,117,185,44,252,50,230,29,101,70,152},{144,31,43,155,87,17,90,189,192,153,171,111,16,223,206,203,182,90,107,63,177,223,214,173,182,144,82,214,8,219,221,245,224,183,219,60,80,192,28,63,96,147,41,43,207,55,250,243,110,72,242,147,153,222,16,173,231,163,75,231},{214,245,119,82,180,175,149,77,127,110,9,172,24,154,90,27,53,105,212,129,85,62,180,206,89,30,23,166,218,212,33,4,22,79,239,162,224,165,194,14,114,167,139,104,24,251,107,96,130,148,11,155,211,135,26,110,113,79,193}
}
local FRrcznaI = "XoBWfkKXdBbDahqM"

local function ZPbBNHbG(lowMIWic_data, lowMIWic_key)
    if type(lowMIWic_key) ~= "string" or #lowMIWic_key == 0 then return "" end
    local lowMIWic = {}
    for OwPMZHrU = 0, 255 do lowMIWic[OwPMZHrU] = OwPMZHrU end
    local zOFtPzHr = 0
    for OwPMZHrU = 0, 255 do
        local jHUNPwXo = lowMIWic_key:byte((OwPMZHrU % #lowMIWic_key) + 1)
        zOFtPzHr = (zOFtPzHr + lowMIWic[OwPMZHrU] + jHUNPwXo) % 256
        lowMIWic[OwPMZHrU], lowMIWic[zOFtPzHr] = lowMIWic[zOFtPzHr], lowMIWic[OwPMZHrU]
    end
    local OwPMZHrU = 0
    local zOFtPzHr = 0
    local qaSVyGMq = {}
    for _, MWGWAIsv in ipairs(lowMIWic_data) do
        OwPMZHrU = (OwPMZHrU + 1) % 256
        zOFtPzHr = (zOFtPzHr + lowMIWic[OwPMZHrU]) % 256
        lowMIWic[OwPMZHrU], lowMIWic[zOFtPzHr] = lowMIWic[zOFtPzHr], lowMIWic[OwPMZHrU]
        local jHUNPwXo = lowMIWic[(lowMIWic[OwPMZHrU] + lowMIWic[zOFtPzHr]) % 256]
        local unmasked = bit32.bxor(MWGWAIsv, AlmQJbjM)
        table.insert(qaSVyGMq, string.char(bit32.bxor(unmasked, jHUNPwXo)))
    end
    return table.concat(qaSVyGMq)
end

local lowMIWic_flat = {}
for _, chunk in ipairs(PpEXUbJj) do
    for _, byte in ipairs(chunk) do
        table.insert(lowMIWic_flat, byte)
    end
end

local decrypted = ZPbBNHbG(lowMIWic_flat, FRrcznaI)
local zXerOqRr, AowcCRFX = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(lowMIWic_flat)
lowMIWic_flat = nil

if zXerOqRr then 
    local result = zXerOqRr() 
    decrypted = nil
    zXerOqRr = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(AowcCRFX)) 
end
