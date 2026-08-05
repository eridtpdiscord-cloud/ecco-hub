-- Protected Segment (ui_themes)
local OZioHRUg = 60
local MjdCzrRd = {
{108,234,166,198,179,146,52,88,103,223,28,180,85,4,69,28,133,140,83,205,167,70,239,63,242,186,93,239,207,255,106,220,166,218,51,11,12,139,242,125,203,51,181,171,4,78,217,180,1,141,123,149,137,212,3,134,233,45,93,114},{193,45,240,188,63,123,248,1,9,122,89,103,145,4,174,56,51,9,248,133,27,1,130,49,31,123,205,21,186,201,202,48,253,50,184,7,9,234,94,212,243,95,25,223,236,12,208,163,227,164,196,215,23,77,158,188,44,23,192,97},{190,197,25,230,208,42,49,132,59,247,139,27,216,8,184,222,143,60,145,157,161}
}
local VuFypLBZ = "JuZJcBHWpEVWAcEB"

local function GkPBetjh(tWQdDRMc_data, tWQdDRMc_key)
    if type(tWQdDRMc_key) ~= "string" or #tWQdDRMc_key == 0 then return "" end
    local tWQdDRMc = {}
    for hLKYJiTR = 0, 255 do tWQdDRMc[hLKYJiTR] = hLKYJiTR end
    local MgKCrxcS = 0
    for hLKYJiTR = 0, 255 do
        local UPbDrBYZ = tWQdDRMc_key:byte((hLKYJiTR % #tWQdDRMc_key) + 1)
        MgKCrxcS = (MgKCrxcS + tWQdDRMc[hLKYJiTR] + UPbDrBYZ) % 256
        tWQdDRMc[hLKYJiTR], tWQdDRMc[MgKCrxcS] = tWQdDRMc[MgKCrxcS], tWQdDRMc[hLKYJiTR]
    end
    local hLKYJiTR = 0
    local MgKCrxcS = 0
    local JrGJOpVt = {}
    for _, LUzKVDJA in ipairs(tWQdDRMc_data) do
        hLKYJiTR = (hLKYJiTR + 1) % 256
        MgKCrxcS = (MgKCrxcS + tWQdDRMc[hLKYJiTR]) % 256
        tWQdDRMc[hLKYJiTR], tWQdDRMc[MgKCrxcS] = tWQdDRMc[MgKCrxcS], tWQdDRMc[hLKYJiTR]
        local UPbDrBYZ = tWQdDRMc[(tWQdDRMc[hLKYJiTR] + tWQdDRMc[MgKCrxcS]) % 256]
        local unmasked = bit32.bxor(LUzKVDJA, OZioHRUg)
        table.insert(JrGJOpVt, string.char(bit32.bxor(unmasked, UPbDrBYZ)))
    end
    return table.concat(JrGJOpVt)
end

local tWQdDRMc_flat = {}
for _, chunk in ipairs(MjdCzrRd) do
    for _, byte in ipairs(chunk) do
        table.insert(tWQdDRMc_flat, byte)
    end
end

local decrypted = GkPBetjh(tWQdDRMc_flat, VuFypLBZ)
local NdwOTFIo, yTJxLunD = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(tWQdDRMc_flat)
tWQdDRMc_flat = nil

if NdwOTFIo then 
    local result = NdwOTFIo() 
    decrypted = nil
    NdwOTFIo = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(yTJxLunD)) 
end
