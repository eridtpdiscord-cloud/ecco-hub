-- Protected Segment (ui_themes)
local PHXnMarG = 94
local KcrSPZAv = {
{149,108,69,84,74,51,144,114,115,88,212,244,202,62,184,139,181,228,64,41,81,195,72,152,118,181,119,86,65,238,167,59,7,182,98,63,62,242,76,254,227,40,160,114,99,49,194,13,74,96,131,164,211,196,81,190,254,21,84,236},{117,189,160,166,122,230,224,167,211,139,112,224,229,67,93,175,22,197,49,32,57,111,230,57,206,66,78,118,175,202,104,189,105,0,217,74,199,72,184,49,22,134,75,229,189,86,214,246,124,226,172,46,253,205,217,237,183,78,245,216},{144,113,78,11,39,150,217,4,232,170,138,92,242,123,8,8,65,158,59,3,128}
}
local BPVzYkmk = "bTaBCdEPJXNJlQLt"

local function OVPbAkJt(lGzIiFGj_data, lGzIiFGj_key)
    local lGzIiFGj = {}
    for BuzqtqFg = 0, 255 do lGzIiFGj[BuzqtqFg] = BuzqtqFg end
    local bJdFQsEZ = 0
    for BuzqtqFg = 0, 255 do
        local ONuCyMtt = lGzIiFGj_key:byte((BuzqtqFg % #lGzIiFGj_key) + 1)
        bJdFQsEZ = (bJdFQsEZ + lGzIiFGj[BuzqtqFg] + ONuCyMtt) % 256
        lGzIiFGj[BuzqtqFg], lGzIiFGj[bJdFQsEZ] = lGzIiFGj[bJdFQsEZ], lGzIiFGj[BuzqtqFg]
    end
    local BuzqtqFg = 0
    local bJdFQsEZ = 0
    local MUmgdFUH = {}
    for _, MdxMAEGn in ipairs(lGzIiFGj_data) do
        BuzqtqFg = (BuzqtqFg + 1) % 256
        bJdFQsEZ = (bJdFQsEZ + lGzIiFGj[BuzqtqFg]) % 256
        lGzIiFGj[BuzqtqFg], lGzIiFGj[bJdFQsEZ] = lGzIiFGj[bJdFQsEZ], lGzIiFGj[BuzqtqFg]
        local ONuCyMtt = lGzIiFGj[(lGzIiFGj[BuzqtqFg] + lGzIiFGj[bJdFQsEZ]) % 256]
        local unmasked = bit32.bxor(MdxMAEGn, PHXnMarG)
        table.insert(MUmgdFUH, string.char(bit32.bxor(unmasked, ONuCyMtt)))
    end
    return table.concat(MUmgdFUH)
end

local lGzIiFGj_flat = {}
for _, chunk in ipairs(KcrSPZAv) do
    for _, byte in ipairs(chunk) do
        table.insert(lGzIiFGj_flat, byte)
    end
end

local decrypted = OVPbAkJt(lGzIiFGj_flat, BPVzYkmk)
local CGALcPYt, ULJaqids = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(lGzIiFGj_flat)
lGzIiFGj_flat = nil

if CGALcPYt then 
    local result = CGALcPYt() 
    decrypted = nil
    CGALcPYt = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(ULJaqids)) 
end
