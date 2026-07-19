-- Compiled secure segment
local dpdVnIzj = {
{89,61,35,69,184,108,163,118,201,86,244,137,23,158,240,107,52,206,75,255,114,64,39,65,88,62,111,245,100,67,63,163,70,159,20,176,28,187,246,100,150,231,229,205,31,156,215,53,75,68,215,36,193,255,94,77,197,77,22,89},{160,204,82,69,11,124,59,192,22,194,177,192,190,17,68,183,166,109,115,253,112,60,64,142,126,202,100,12,134,216,97,133,56,33,21,162,157,234,112,186,164,56,194,34,244,217,210,206,107,225,239,1,52,7,88,165,209,35,134,171},{248,172,222,208,36,31,104,214,8,229,202,101,127,253,101,52,118,177,76,54,90}
}
local ojczPyfJ = "kMtRebXePXGiBBlG"

local function hvCJlyJP(GiAefNZy_data, GiAefNZy_key)
    local GiAefNZy = {}
    for kWhTTFlX = 0, 255 do GiAefNZy[kWhTTFlX] = kWhTTFlX end
    local VdCRCNuH = 0
    for kWhTTFlX = 0, 255 do
        local kHiVgcSj = GiAefNZy_key:byte((kWhTTFlX % #GiAefNZy_key) + 1)
        VdCRCNuH = (VdCRCNuH + GiAefNZy[kWhTTFlX] + kHiVgcSj) % 256
        GiAefNZy[kWhTTFlX], GiAefNZy[VdCRCNuH] = GiAefNZy[VdCRCNuH], GiAefNZy[kWhTTFlX]
    end
    local kWhTTFlX = 0
    local VdCRCNuH = 0
    local FvRIaZSK = {}
    for _, OLfapzFi in ipairs(GiAefNZy_data) do
        kWhTTFlX = (kWhTTFlX + 1) % 256
        VdCRCNuH = (VdCRCNuH + GiAefNZy[kWhTTFlX]) % 256
        GiAefNZy[kWhTTFlX], GiAefNZy[VdCRCNuH] = GiAefNZy[VdCRCNuH], GiAefNZy[kWhTTFlX]
        local kHiVgcSj = GiAefNZy[(GiAefNZy[kWhTTFlX] + GiAefNZy[VdCRCNuH]) % 256]
        table.insert(FvRIaZSK, string.char(bit32.bxor(OLfapzFi, kHiVgcSj)))
    end
    return table.concat(FvRIaZSK)
end

local GiAefNZy_flat = {}
for _, chunk in ipairs(dpdVnIzj) do
    for _, byte in ipairs(chunk) do
        table.insert(GiAefNZy_flat, byte)
    end
end

local decrypted = hvCJlyJP(GiAefNZy_flat, ojczPyfJ)
local eRtmkiDM, OoGwqYID = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(GiAefNZy_flat)
GiAefNZy_flat = nil

if eRtmkiDM then 
    local result = eRtmkiDM() 
    decrypted = nil
    eRtmkiDM = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(OoGwqYID)) 
end
