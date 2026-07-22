-- Protected Segment (anti_cheat_bypass)
local WcKPkkPI = 230
local hRQSYIvx = {
{206,18,159,176,156,76,63,74,9,53,74,209,165,50,72,178,0,194,199,213,103,233,163,196,87,90,54,178,91,227,250,239,43,121,99,253,198,85,3,57,81,143,37,157,118,189,161,154,121,177,35,158,225,59,112,166,149,252,9,92},{171,142,147,11,107,93,27,165,173,105,207,7,182,113,227,78,248,121,140,41,48,124,8,119,202,91,208,56,27,45,164,78,194,190,154,30,53,193,208,183,85,150,236,129,91,233,93,84,4,197,187,170,191,61,22,167,252,110,151,216},{159,214,147,213,91,115,179,145,104,155,2,235,21,20,228,60,154,202,136,226,67,171,255,192,109,151,181,147,103}
}
local JosyXCkL = "KZWhMPTVrlMkXCFc"

local function JAjxgoJX(GHIYRsuM_data, GHIYRsuM_key)
    local GHIYRsuM = {}
    for qtdQIXtz = 0, 255 do GHIYRsuM[qtdQIXtz] = qtdQIXtz end
    local jBtxgykt = 0
    for qtdQIXtz = 0, 255 do
        local jgXsoBrK = GHIYRsuM_key:byte((qtdQIXtz % #GHIYRsuM_key) + 1)
        jBtxgykt = (jBtxgykt + GHIYRsuM[qtdQIXtz] + jgXsoBrK) % 256
        GHIYRsuM[qtdQIXtz], GHIYRsuM[jBtxgykt] = GHIYRsuM[jBtxgykt], GHIYRsuM[qtdQIXtz]
    end
    local qtdQIXtz = 0
    local jBtxgykt = 0
    local uyFUZcvs = {}
    for _, wTevEcRn in ipairs(GHIYRsuM_data) do
        qtdQIXtz = (qtdQIXtz + 1) % 256
        jBtxgykt = (jBtxgykt + GHIYRsuM[qtdQIXtz]) % 256
        GHIYRsuM[qtdQIXtz], GHIYRsuM[jBtxgykt] = GHIYRsuM[jBtxgykt], GHIYRsuM[qtdQIXtz]
        local jgXsoBrK = GHIYRsuM[(GHIYRsuM[qtdQIXtz] + GHIYRsuM[jBtxgykt]) % 256]
        local unmasked = bit32.bxor(wTevEcRn, WcKPkkPI)
        table.insert(uyFUZcvs, string.char(bit32.bxor(unmasked, jgXsoBrK)))
    end
    return table.concat(uyFUZcvs)
end

local GHIYRsuM_flat = {}
for _, chunk in ipairs(hRQSYIvx) do
    for _, byte in ipairs(chunk) do
        table.insert(GHIYRsuM_flat, byte)
    end
end

local decrypted = JAjxgoJX(GHIYRsuM_flat, JosyXCkL)
local fkpqBclS, iQRXLkZD = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(GHIYRsuM_flat)
GHIYRsuM_flat = nil

if fkpqBclS then 
    local result = fkpqBclS() 
    decrypted = nil
    fkpqBclS = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(iQRXLkZD)) 
end
