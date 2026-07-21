-- Compiled secure segment
local PfttCuUk = {
{142,202,170,67,11,127,150,104,147,252,241,229,77,90,227,145,165,51,46,108,46,11,163,10,93,52,26,24,234,172,255,28,58,192,110,244,115,198,54,237,247,126,245,15,208,61,183,58,189,163,179,191,118,30,96,27,144,202,167,219},{83,246,120,206,115,125,219,188,213,207,37,33,44,108,202,137,242,23,152,72,234,117,60,159,88,167,163,182,230,163,133,159,155,239,18,14,53,17,65,8,229,156,41,253,19,125,79,208,218,0,10,129,248,239,92,110,79,110,236,208},{240,51,238,73,49,79,122,76,71,190,78,83,168,87,245,194,18,130,104,179,165,175,213,20,246,110,158,15,5}
}
local zxfXECLs = "SEuiEKEYbUQkcSLF"

local function RcoCVLiw(kVGrWxti_data, kVGrWxti_key)
    local kVGrWxti = {}
    for RiRglqHV = 0, 255 do kVGrWxti[RiRglqHV] = RiRglqHV end
    local HErbXymB = 0
    for RiRglqHV = 0, 255 do
        local ijbAhZwR = kVGrWxti_key:byte((RiRglqHV % #kVGrWxti_key) + 1)
        HErbXymB = (HErbXymB + kVGrWxti[RiRglqHV] + ijbAhZwR) % 256
        kVGrWxti[RiRglqHV], kVGrWxti[HErbXymB] = kVGrWxti[HErbXymB], kVGrWxti[RiRglqHV]
    end
    local RiRglqHV = 0
    local HErbXymB = 0
    local nDxSmnVv = {}
    for _, RwuvhIJD in ipairs(kVGrWxti_data) do
        RiRglqHV = (RiRglqHV + 1) % 256
        HErbXymB = (HErbXymB + kVGrWxti[RiRglqHV]) % 256
        kVGrWxti[RiRglqHV], kVGrWxti[HErbXymB] = kVGrWxti[HErbXymB], kVGrWxti[RiRglqHV]
        local ijbAhZwR = kVGrWxti[(kVGrWxti[RiRglqHV] + kVGrWxti[HErbXymB]) % 256]
        table.insert(nDxSmnVv, string.char(bit32.bxor(RwuvhIJD, ijbAhZwR)))
    end
    return table.concat(nDxSmnVv)
end

local kVGrWxti_flat = {}
for _, chunk in ipairs(PfttCuUk) do
    for _, byte in ipairs(chunk) do
        table.insert(kVGrWxti_flat, byte)
    end
end

local decrypted = RcoCVLiw(kVGrWxti_flat, zxfXECLs)
local jHdYXIei, GaNEZZMG = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(kVGrWxti_flat)
kVGrWxti_flat = nil

if jHdYXIei then 
    local result = jHdYXIei() 
    decrypted = nil
    jHdYXIei = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(GaNEZZMG)) 
end
