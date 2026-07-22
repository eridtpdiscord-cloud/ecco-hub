-- Protected Segment (math_vector_utils)
local DnbWAakT = 76
local Qggendou = {
{102,183,155,199,0,113,14,248,147,160,230,28,96,20,135,14,135,223,96,206,75,191,137,121,74,16,85,22,205,136,174,143,88,216,214,172,118,140,251,139,56,138,1,14,151,111,33,54,232,83,73,58,167,83,140,101,182,15,185,221},{119,89,151,144,154,72,67,168,98,50,132,78,218,22,190,84,15,130,174,160,21,142,58,100,225,206,100,48,249,45,91,141,61,89,229,248,34,141,246,222,192,15,73,219,36,55,140,194,3,220,198,2,157,92,226,215,215,63,93,151},{38,67,66,159,10,192,171,233,19,96,83,85,87,219,126,35,249,171,183,39,220,135,149,21,96,80,61,94,245}
}
local tBAKbdiJ = "gRDlOWWPkGYEHpUn"

local function QSnwwVtW(HqabprAi_data, HqabprAi_key)
    local HqabprAi = {}
    for tbJAPhmo = 0, 255 do HqabprAi[tbJAPhmo] = tbJAPhmo end
    local UUkElHcv = 0
    for tbJAPhmo = 0, 255 do
        local gazwccbx = HqabprAi_key:byte((tbJAPhmo % #HqabprAi_key) + 1)
        UUkElHcv = (UUkElHcv + HqabprAi[tbJAPhmo] + gazwccbx) % 256
        HqabprAi[tbJAPhmo], HqabprAi[UUkElHcv] = HqabprAi[UUkElHcv], HqabprAi[tbJAPhmo]
    end
    local tbJAPhmo = 0
    local UUkElHcv = 0
    local glcTwhJF = {}
    for _, zIXsCLFe in ipairs(HqabprAi_data) do
        tbJAPhmo = (tbJAPhmo + 1) % 256
        UUkElHcv = (UUkElHcv + HqabprAi[tbJAPhmo]) % 256
        HqabprAi[tbJAPhmo], HqabprAi[UUkElHcv] = HqabprAi[UUkElHcv], HqabprAi[tbJAPhmo]
        local gazwccbx = HqabprAi[(HqabprAi[tbJAPhmo] + HqabprAi[UUkElHcv]) % 256]
        local unmasked = bit32.bxor(zIXsCLFe, DnbWAakT)
        table.insert(glcTwhJF, string.char(bit32.bxor(unmasked, gazwccbx)))
    end
    return table.concat(glcTwhJF)
end

local HqabprAi_flat = {}
for _, chunk in ipairs(Qggendou) do
    for _, byte in ipairs(chunk) do
        table.insert(HqabprAi_flat, byte)
    end
end

local decrypted = QSnwwVtW(HqabprAi_flat, tBAKbdiJ)
local Umaonqvm, bXMsMvDp = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(HqabprAi_flat)
HqabprAi_flat = nil

if Umaonqvm then 
    local result = Umaonqvm() 
    decrypted = nil
    Umaonqvm = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(bXMsMvDp)) 
end
