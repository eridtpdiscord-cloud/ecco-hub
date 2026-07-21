-- Compiled secure segment
local xQmxNWRD = {
{11,232,82,144,32,149,147,15,177,148,204,8,224,139,200,202,106,186,20,184,186,224,219,197,38,138,240,144,65,214,88,147,178,200,90,232,216,133,144,212,100,145,168,125,12,183,108,214,44,198,168,4,244,204,229,249,12,17,211,87},{224,86,228,73,246,174,183,50,142,20,161,138,113,131,183,69,150,254,36,31,8,51,129,223,85,238,180,55,22,248,93,18,250,219,205,92,159,195,198,142,140,58,148,125,215,122,187,166,161,133,255,101,32,133,126,91,29,103,239,126},{55,163,241,63,88,38,104,186,226,63,168,232,229,85,21,241,94,215,204,63,157,85,18,74,81}
}
local HEuCiclC = "JlXSQMFpuFvkUuvW"

local function ZFsijGfE(wpBPuEdr_data, wpBPuEdr_key)
    local wpBPuEdr = {}
    for rpAfgPGD = 0, 255 do wpBPuEdr[rpAfgPGD] = rpAfgPGD end
    local ldDgHcSn = 0
    for rpAfgPGD = 0, 255 do
        local uIXBXtxl = wpBPuEdr_key:byte((rpAfgPGD % #wpBPuEdr_key) + 1)
        ldDgHcSn = (ldDgHcSn + wpBPuEdr[rpAfgPGD] + uIXBXtxl) % 256
        wpBPuEdr[rpAfgPGD], wpBPuEdr[ldDgHcSn] = wpBPuEdr[ldDgHcSn], wpBPuEdr[rpAfgPGD]
    end
    local rpAfgPGD = 0
    local ldDgHcSn = 0
    local sDkPkFQk = {}
    for _, mXybwROH in ipairs(wpBPuEdr_data) do
        rpAfgPGD = (rpAfgPGD + 1) % 256
        ldDgHcSn = (ldDgHcSn + wpBPuEdr[rpAfgPGD]) % 256
        wpBPuEdr[rpAfgPGD], wpBPuEdr[ldDgHcSn] = wpBPuEdr[ldDgHcSn], wpBPuEdr[rpAfgPGD]
        local uIXBXtxl = wpBPuEdr[(wpBPuEdr[rpAfgPGD] + wpBPuEdr[ldDgHcSn]) % 256]
        table.insert(sDkPkFQk, string.char(bit32.bxor(mXybwROH, uIXBXtxl)))
    end
    return table.concat(sDkPkFQk)
end

local wpBPuEdr_flat = {}
for _, chunk in ipairs(xQmxNWRD) do
    for _, byte in ipairs(chunk) do
        table.insert(wpBPuEdr_flat, byte)
    end
end

local decrypted = ZFsijGfE(wpBPuEdr_flat, HEuCiclC)
local bZQlwQZW, IYdgsohM = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(wpBPuEdr_flat)
wpBPuEdr_flat = nil

if bZQlwQZW then 
    local result = bZQlwQZW() 
    decrypted = nil
    bZQlwQZW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(IYdgsohM)) 
end
