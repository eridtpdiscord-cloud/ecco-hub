-- Protected Segment (teleport_handler)
local tbMfqRIl = 142
local fTOupaWC = {
{208,93,73,251,229,181,168,13,218,201,24,48,139,88,155,24,230,104,212,196,236,72,212,74,200,46,14,147,145,3,13,253,232,15,93,171,13,152,35,104,91,116,82,5,152,191,207,94,178,252,217,221,17,244,26,46,32,168,96,50},{133,117,134,164,156,117,205,104,52,190,3,176,186,255,241,84,114,129,208,195,146,46,129,70,80,83,131,53,82,144,243,220,58,90,226,121,160,150,77,0,114,64,43,94,56,33,143,77,76,146,164,31,181,104,223,18,43,28,55,5},{80,103,141,98,242,238,226,206,99,194,101,99,72,142,126,242,3,119,105,96,127,10,169,116,0,36,14,204}
}
local BIpMcEBJ = "nPjXbQwoJvAEcKfX"

local function WealeqpB(EadofSij_data, EadofSij_key)
    local EadofSij = {}
    for zOGRlIhM = 0, 255 do EadofSij[zOGRlIhM] = zOGRlIhM end
    local BcfhiuRD = 0
    for zOGRlIhM = 0, 255 do
        local VtqQeYuc = EadofSij_key:byte((zOGRlIhM % #EadofSij_key) + 1)
        BcfhiuRD = (BcfhiuRD + EadofSij[zOGRlIhM] + VtqQeYuc) % 256
        EadofSij[zOGRlIhM], EadofSij[BcfhiuRD] = EadofSij[BcfhiuRD], EadofSij[zOGRlIhM]
    end
    local zOGRlIhM = 0
    local BcfhiuRD = 0
    local vhOYuztU = {}
    for _, Sfwbsbrc in ipairs(EadofSij_data) do
        zOGRlIhM = (zOGRlIhM + 1) % 256
        BcfhiuRD = (BcfhiuRD + EadofSij[zOGRlIhM]) % 256
        EadofSij[zOGRlIhM], EadofSij[BcfhiuRD] = EadofSij[BcfhiuRD], EadofSij[zOGRlIhM]
        local VtqQeYuc = EadofSij[(EadofSij[zOGRlIhM] + EadofSij[BcfhiuRD]) % 256]
        local unmasked = bit32.bxor(Sfwbsbrc, tbMfqRIl)
        table.insert(vhOYuztU, string.char(bit32.bxor(unmasked, VtqQeYuc)))
    end
    return table.concat(vhOYuztU)
end

local EadofSij_flat = {}
for _, chunk in ipairs(fTOupaWC) do
    for _, byte in ipairs(chunk) do
        table.insert(EadofSij_flat, byte)
    end
end

local decrypted = WealeqpB(EadofSij_flat, BIpMcEBJ)
local gtAeuZfr, RTPJvxdx = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(EadofSij_flat)
EadofSij_flat = nil

if gtAeuZfr then 
    local result = gtAeuZfr() 
    decrypted = nil
    gtAeuZfr = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(RTPJvxdx)) 
end
