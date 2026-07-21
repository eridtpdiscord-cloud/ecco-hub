-- Compiled secure segment
local ToONjPFC = {
{188,112,95,143,172,33,208,184,244,148,111,205,102,160,50,61,171,60,146,238,73,212,119,137,67,62,179,170,205,223,50,128,163,165,50,188,249,170,30,186,235,135,55,169,39,101,91,194,140,76,62,82,229,160,70,134,110,121,15,74},{47,107,110,94,45,86,175,45,82,31,228,181,113,82,73,130,239,244,100,254,231,233,203,129,193,107,184,21,182,252,150,208,51,208,6,166,92,86,192,255,122,119,116,236,146,157,25,67,36,83,185,248,82,102,40,223,138,36,16,192},{222,76,24,213,35,19,148,102,46,15,38,250,103,64,105,234,56,205,154,148,159,107,229,53,143,117,112,233,105,146}
}
local XazjzVvg = "nZTDoCkHfKyPgLik"

local function rHreRNhH(JVLGhhBi_data, JVLGhhBi_key)
    local JVLGhhBi = {}
    for FZnDSBLF = 0, 255 do JVLGhhBi[FZnDSBLF] = FZnDSBLF end
    local GZGpSqUv = 0
    for FZnDSBLF = 0, 255 do
        local MwoJyczd = JVLGhhBi_key:byte((FZnDSBLF % #JVLGhhBi_key) + 1)
        GZGpSqUv = (GZGpSqUv + JVLGhhBi[FZnDSBLF] + MwoJyczd) % 256
        JVLGhhBi[FZnDSBLF], JVLGhhBi[GZGpSqUv] = JVLGhhBi[GZGpSqUv], JVLGhhBi[FZnDSBLF]
    end
    local FZnDSBLF = 0
    local GZGpSqUv = 0
    local UtmdGTbp = {}
    for _, jHfXHdVx in ipairs(JVLGhhBi_data) do
        FZnDSBLF = (FZnDSBLF + 1) % 256
        GZGpSqUv = (GZGpSqUv + JVLGhhBi[FZnDSBLF]) % 256
        JVLGhhBi[FZnDSBLF], JVLGhhBi[GZGpSqUv] = JVLGhhBi[GZGpSqUv], JVLGhhBi[FZnDSBLF]
        local MwoJyczd = JVLGhhBi[(JVLGhhBi[FZnDSBLF] + JVLGhhBi[GZGpSqUv]) % 256]
        table.insert(UtmdGTbp, string.char(bit32.bxor(jHfXHdVx, MwoJyczd)))
    end
    return table.concat(UtmdGTbp)
end

local JVLGhhBi_flat = {}
for _, chunk in ipairs(ToONjPFC) do
    for _, byte in ipairs(chunk) do
        table.insert(JVLGhhBi_flat, byte)
    end
end

local decrypted = rHreRNhH(JVLGhhBi_flat, XazjzVvg)
local hwUTNkUB, viGzRGal = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(JVLGhhBi_flat)
JVLGhhBi_flat = nil

if hwUTNkUB then 
    local result = hwUTNkUB() 
    decrypted = nil
    hwUTNkUB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(viGzRGal)) 
end
