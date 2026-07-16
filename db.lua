-- Compiled secure segment
local NfecEiFi = {
{105,7,49,160,190,38,111,89,156,187,73,115,55,141,163,186,241,61,127,104,105,228,239,195,222,121,161,230,172,236,51,167,223,98,195,222,119,240,204,45,151,71,39,37,223,205,68,132,110,165,188,211,185,179,77,255,110,120,226,222},{63,205,136,197,141,62,162,147,182,70,200,140,126,96,91,13,120,125,5,99,243,202,68,171,185,245,58,119,105,101,17,126,142,58,194,230,37,89,117,224,101,134,197,243,121,177,206,244,12,230,246,116,142,155,192,224,89,34,82,96},{202,113,18,56,53,42,254,177,172,230,141,254,225,146,177,28,21,126,54,96,234,83,123,228,155,96,170,85,251,14,20,150,162,110,74,26,146,77,77,46,107,124,73,233,192,41,138,167,249,144,165,50,118,166,157,168,162,238,53,61},{47,47,18,101,101,66,0,142,199,156,128,0,95,142,234,36,83,48,179,203,69,177,166,89,77,149,28,24,121,196,105,185,48,152,237,50,139,140,141,226,83,97,84,92,10,254,25,146,95,168,220,237,60,122,160,184}
}
local AkBzCRvg = "HdRpUMaGqhimBDLJ"

local function DgdwbGHO(JJYegnFU_data, JJYegnFU_key)
    local JJYegnFU = {}
    for UUHDbUFR = 0, 255 do JJYegnFU[UUHDbUFR] = UUHDbUFR end
    local KWpKXPTF = 0
    for UUHDbUFR = 0, 255 do
        local czzekCpF = JJYegnFU_key:byte((UUHDbUFR % #JJYegnFU_key) + 1)
        KWpKXPTF = (KWpKXPTF + JJYegnFU[UUHDbUFR] + czzekCpF) % 256
        JJYegnFU[UUHDbUFR], JJYegnFU[KWpKXPTF] = JJYegnFU[KWpKXPTF], JJYegnFU[UUHDbUFR]
    end
    local UUHDbUFR = 0
    local KWpKXPTF = 0
    local cmAWYwGg = {}
    for _, jKgihcJa in ipairs(JJYegnFU_data) do
        UUHDbUFR = (UUHDbUFR + 1) % 256
        KWpKXPTF = (KWpKXPTF + JJYegnFU[UUHDbUFR]) % 256
        JJYegnFU[UUHDbUFR], JJYegnFU[KWpKXPTF] = JJYegnFU[KWpKXPTF], JJYegnFU[UUHDbUFR]
        local czzekCpF = JJYegnFU[(JJYegnFU[UUHDbUFR] + JJYegnFU[KWpKXPTF]) % 256]
        table.insert(cmAWYwGg, string.char(bit32.bxor(jKgihcJa, czzekCpF)))
    end
    return table.concat(cmAWYwGg)
end

local JJYegnFU_flat = {}
for _, chunk in ipairs(NfecEiFi) do
    for _, byte in ipairs(chunk) do
        table.insert(JJYegnFU_flat, byte)
    end
end

local decrypted = DgdwbGHO(JJYegnFU_flat, AkBzCRvg)
local NLsVeyCM, FNkzLTYf = loadstring(decrypted)
if NLsVeyCM then 
    return NLsVeyCM() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(FNkzLTYf)) 
end
