-- Protected Segment (anti_cheat_bypass)
local XzmvKHda = 245
local RzlpuZjI = {
{151,186,139,168,135,64,97,60,230,24,108,117,172,248,177,79,116,163,237,224,109,247,102,214,0,48,97,215,238,78,137,97,234,2,113,104,192,177,94,243,105,225,26,88,106,151,107,177,146,233,3,5,108,129,233,194,54,40,47,14},{94,240,212,33,92,135,182,29,156,214,14,2,168,30,74,224,84,254,163,236,94,179,77,217,156,73,112,248,188,138,103,231,226,149,109,99,118,218,204,179,121,239,101,48,201,137,169,81,105,116,212,78,92,34,192,112,33,236,10,253},{34,213,210,139,201,76,140,42,115,202,91,6,118,73,205,45,236,152,56,85,49,101,18,33,5,182,223,202,123}
}
local hJKpXcTS = "kewJxLWxVuArEsnK"

local function PLeTlpOz(cRJkpgCr_data, cRJkpgCr_key)
    local cRJkpgCr = {}
    for CFhQnpBq = 0, 255 do cRJkpgCr[CFhQnpBq] = CFhQnpBq end
    local KDianJlF = 0
    for CFhQnpBq = 0, 255 do
        local lrNZSoGW = cRJkpgCr_key:byte((CFhQnpBq % #cRJkpgCr_key) + 1)
        KDianJlF = (KDianJlF + cRJkpgCr[CFhQnpBq] + lrNZSoGW) % 256
        cRJkpgCr[CFhQnpBq], cRJkpgCr[KDianJlF] = cRJkpgCr[KDianJlF], cRJkpgCr[CFhQnpBq]
    end
    local CFhQnpBq = 0
    local KDianJlF = 0
    local WJREVYVB = {}
    for _, qGzPzpGm in ipairs(cRJkpgCr_data) do
        CFhQnpBq = (CFhQnpBq + 1) % 256
        KDianJlF = (KDianJlF + cRJkpgCr[CFhQnpBq]) % 256
        cRJkpgCr[CFhQnpBq], cRJkpgCr[KDianJlF] = cRJkpgCr[KDianJlF], cRJkpgCr[CFhQnpBq]
        local lrNZSoGW = cRJkpgCr[(cRJkpgCr[CFhQnpBq] + cRJkpgCr[KDianJlF]) % 256]
        local unmasked = bit32.bxor(qGzPzpGm, XzmvKHda)
        table.insert(WJREVYVB, string.char(bit32.bxor(unmasked, lrNZSoGW)))
    end
    return table.concat(WJREVYVB)
end

local cRJkpgCr_flat = {}
for _, chunk in ipairs(RzlpuZjI) do
    for _, byte in ipairs(chunk) do
        table.insert(cRJkpgCr_flat, byte)
    end
end

local decrypted = PLeTlpOz(cRJkpgCr_flat, hJKpXcTS)
local agdNiSUr, GhvdsTRg = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(cRJkpgCr_flat)
cRJkpgCr_flat = nil

if agdNiSUr then 
    local result = agdNiSUr() 
    decrypted = nil
    agdNiSUr = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(GhvdsTRg)) 
end
