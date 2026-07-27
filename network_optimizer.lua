-- Protected Segment (network_optimizer)
local GgEsfIxV = 144
local OolapJKB = {
{54,4,157,125,111,74,251,55,94,222,245,25,151,77,255,69,210,49,87,172,136,194,228,120,37,106,67,26,241,116,222,80,141,139,52,241,126,149,2,238,128,231,141,144,167,190,54,32,111,208,52,2,182,240,211,196,53,205,178,187},{218,134,111,233,247,223,22,216,76,3,248,179,199,247,175,192,214,251,117,112,78,243,140,183,159,154,34,120,18,58,97,215,56,165,83,127,18,219,220,188,78,159,97,143,184,223,29,202,70,20,31,18,172,80,84,105,42,181,158,89},{11,163,178,28,155,53,8,128,234,184,166,6,111,44,246,243,181,75,249,229,173,2,220,178,191,241,44,203,161}
}
local ZwBqsrgB = "lUvDZlekCfXAhSKz"

local function zbNFfnlK(ZYQcPiAS_data, ZYQcPiAS_key)
    if type(ZYQcPiAS_key) ~= "string" or #ZYQcPiAS_key == 0 then return "" end
    local ZYQcPiAS = {}
    for CKWrYYaC = 0, 255 do ZYQcPiAS[CKWrYYaC] = CKWrYYaC end
    local rWraFgIt = 0
    for CKWrYYaC = 0, 255 do
        local QixEHFJP = ZYQcPiAS_key:byte((CKWrYYaC % #ZYQcPiAS_key) + 1)
        rWraFgIt = (rWraFgIt + ZYQcPiAS[CKWrYYaC] + QixEHFJP) % 256
        ZYQcPiAS[CKWrYYaC], ZYQcPiAS[rWraFgIt] = ZYQcPiAS[rWraFgIt], ZYQcPiAS[CKWrYYaC]
    end
    local CKWrYYaC = 0
    local rWraFgIt = 0
    local oyYMfJvb = {}
    for _, ymznimKU in ipairs(ZYQcPiAS_data) do
        CKWrYYaC = (CKWrYYaC + 1) % 256
        rWraFgIt = (rWraFgIt + ZYQcPiAS[CKWrYYaC]) % 256
        ZYQcPiAS[CKWrYYaC], ZYQcPiAS[rWraFgIt] = ZYQcPiAS[rWraFgIt], ZYQcPiAS[CKWrYYaC]
        local QixEHFJP = ZYQcPiAS[(ZYQcPiAS[CKWrYYaC] + ZYQcPiAS[rWraFgIt]) % 256]
        local unmasked = bit32.bxor(ymznimKU, GgEsfIxV)
        table.insert(oyYMfJvb, string.char(bit32.bxor(unmasked, QixEHFJP)))
    end
    return table.concat(oyYMfJvb)
end

local ZYQcPiAS_flat = {}
for _, chunk in ipairs(OolapJKB) do
    for _, byte in ipairs(chunk) do
        table.insert(ZYQcPiAS_flat, byte)
    end
end

local decrypted = zbNFfnlK(ZYQcPiAS_flat, ZwBqsrgB)
local HOKELlWU, cntTDAQp = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ZYQcPiAS_flat)
ZYQcPiAS_flat = nil

if HOKELlWU then 
    local result = HOKELlWU() 
    decrypted = nil
    HOKELlWU = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(cntTDAQp)) 
end
