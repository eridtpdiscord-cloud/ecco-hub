-- Compiled secure segment
local wuDzDACv = {
{3,237,2,38,8,35,226,44,117,228,104,94,58,189,170,0,156,17,188,195,48,146,220,189,212,52,208,173,75,209,34,137,176,11,207,54,23,213,126,19,138,181,49,131,222,119,147,16,177,45,41,161,96,185,59,132,125,145,49,23},{211,227,220,87,200,62,133,12,76,176,153,199,69,146,100,77,200,236,58,209,216,224,206,159,238,203,116,97,184,186,97,176,95,39,155,11,184,187,53,4,171,229,0,244,80,64,163,18,190,4,76,17,137,175,35,62,89,239,105,109},{59,140,61,217,226,10,235,33,8,67,102,3,45,100,16,186,222,66,37,247,42,217,6,128,115,134,164,109,213,9,246,229,34,158,9,167,69,58,184,120,193,125,153,238,87,201,90,71,22,148,89,44,198,12,221,214,16,143,134,26},{232,105,70,66,210,54,107,235,135,225,242,63,194,116,250,212,209,76,228,79,108,64,248,9,113,36,136,176,53,202,57,14,147,179,104,192,166,253,84,203,15,33,28,100,254,73,135,192,39,0,65,168,236,15,96,223,30,108,177,78},{86,94,244,221,164,81,2,200,222,234,132,88,70,19,215,173,93,137,214,14,136,250,108,255,145,186,123,80,30,36,80,173,254,157,1,101,6,197,184,169,67,72,214,36,120,15,232,121,245,203,109,12,76,95,85,124,199,19,0,253},{104,179,180,165,119,208,242,223,132,214,83,57,129,252,238,168,58,31,225,53,173,7,62,156,248,88,142,49,219,130,245,61,62,220,246,85,77,170,37,40,124,53,69,188,123,92,210,121,46,207,133,179,67,4,126,16,77,188,161,7},{218,162,127,39,208,185,215,143,13,60,205,17,175,47,43,93,186,183,77,198,253,52,234,180,64,60,91,73,46,70,123,148,13,94,195,123,17,183,166,187,184,145}
}
local rzVmOkjN = "yEFlMGXEUBoTDYon"

local function svISebsf(TPCpgyKB_data, TPCpgyKB_key)
    local TPCpgyKB = {}
    for YqXEInxh = 0, 255 do TPCpgyKB[YqXEInxh] = YqXEInxh end
    local cQyxqZQG = 0
    for YqXEInxh = 0, 255 do
        local IcEWnHIW = TPCpgyKB_key:byte((YqXEInxh % #TPCpgyKB_key) + 1)
        cQyxqZQG = (cQyxqZQG + TPCpgyKB[YqXEInxh] + IcEWnHIW) % 256
        TPCpgyKB[YqXEInxh], TPCpgyKB[cQyxqZQG] = TPCpgyKB[cQyxqZQG], TPCpgyKB[YqXEInxh]
    end
    local YqXEInxh = 0
    local cQyxqZQG = 0
    local JKLwoqlI = {}
    for _, WLLyaRne in ipairs(TPCpgyKB_data) do
        YqXEInxh = (YqXEInxh + 1) % 256
        cQyxqZQG = (cQyxqZQG + TPCpgyKB[YqXEInxh]) % 256
        TPCpgyKB[YqXEInxh], TPCpgyKB[cQyxqZQG] = TPCpgyKB[cQyxqZQG], TPCpgyKB[YqXEInxh]
        local IcEWnHIW = TPCpgyKB[(TPCpgyKB[YqXEInxh] + TPCpgyKB[cQyxqZQG]) % 256]
        table.insert(JKLwoqlI, string.char(bit32.bxor(WLLyaRne, IcEWnHIW)))
    end
    return table.concat(JKLwoqlI)
end

local TPCpgyKB_flat = {}
for _, chunk in ipairs(wuDzDACv) do
    for _, byte in ipairs(chunk) do
        table.insert(TPCpgyKB_flat, byte)
    end
end

local decrypted = svISebsf(TPCpgyKB_flat, rzVmOkjN)
local xtPTnOpJ, kKjFyPwL = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(TPCpgyKB_flat)
TPCpgyKB_flat = nil

if xtPTnOpJ then 
    local result = xtPTnOpJ() 
    decrypted = nil
    xtPTnOpJ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(kKjFyPwL)) 
end
