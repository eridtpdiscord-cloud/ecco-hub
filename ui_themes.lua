-- Protected Segment (ui_themes)
local ZMKgAMmQ = 122
local veaogUHm = {
{169,212,37,36,71,226,247,157,142,208,219,224,169,26,213,60,82,156,3,73,154,174,33,88,196,39,60,226,141,52,247,223,49,206,192,223,218,192,34,89,27,214,0,185,199,15,96,158,135,18,16,56,86,193,98,174,119,230,42,196},{87,116,21,146,211,130,209,104,178,3,232,229,42,54,182,170,54,65,54,41,222,31,193,79,94,179,242,192,186,157,27,183,74,183,114,108,116,62,226,183,83,18,47,243,223,7,183,74,2,25,178,249,4,47,154,31,150,56,218,0},{186,171,102,125,240,21,42,33,47,87,238,228,166,149,74,181,127,164,50,1,203}
}
local SeIfgVhu = "aizTIttbQEYlLOyD"

local function fcMHipSR(slpxCpQH_data, slpxCpQH_key)
    local slpxCpQH = {}
    for EpmDhIXT = 0, 255 do slpxCpQH[EpmDhIXT] = EpmDhIXT end
    local EiQLmxLe = 0
    for EpmDhIXT = 0, 255 do
        local ABbAncZf = slpxCpQH_key:byte((EpmDhIXT % #slpxCpQH_key) + 1)
        EiQLmxLe = (EiQLmxLe + slpxCpQH[EpmDhIXT] + ABbAncZf) % 256
        slpxCpQH[EpmDhIXT], slpxCpQH[EiQLmxLe] = slpxCpQH[EiQLmxLe], slpxCpQH[EpmDhIXT]
    end
    local EpmDhIXT = 0
    local EiQLmxLe = 0
    local EegRmuvP = {}
    for _, TwjDxClx in ipairs(slpxCpQH_data) do
        EpmDhIXT = (EpmDhIXT + 1) % 256
        EiQLmxLe = (EiQLmxLe + slpxCpQH[EpmDhIXT]) % 256
        slpxCpQH[EpmDhIXT], slpxCpQH[EiQLmxLe] = slpxCpQH[EiQLmxLe], slpxCpQH[EpmDhIXT]
        local ABbAncZf = slpxCpQH[(slpxCpQH[EpmDhIXT] + slpxCpQH[EiQLmxLe]) % 256]
        local unmasked = bit32.bxor(TwjDxClx, ZMKgAMmQ)
        table.insert(EegRmuvP, string.char(bit32.bxor(unmasked, ABbAncZf)))
    end
    return table.concat(EegRmuvP)
end

local slpxCpQH_flat = {}
for _, chunk in ipairs(veaogUHm) do
    for _, byte in ipairs(chunk) do
        table.insert(slpxCpQH_flat, byte)
    end
end

local decrypted = fcMHipSR(slpxCpQH_flat, SeIfgVhu)
local VNLruDzk, MFbcmEYJ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(slpxCpQH_flat)
slpxCpQH_flat = nil

if VNLruDzk then 
    local result = VNLruDzk() 
    decrypted = nil
    VNLruDzk = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(MFbcmEYJ)) 
end
