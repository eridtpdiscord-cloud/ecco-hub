-- Compiled secure segment
local hlehBLEH = {
{99,74,251,189,78,180,184,157,179,154,107,133,51,77,201,51,222,99,58,27,247,147,220,166,56,186,200,39,132,44,215,146,6,78,218,242,202,125,74,98,44,130,46,62,198,168,4,10,39,204,15,39,170,49,248,32,135,158,159,165},{247,118,176,118,85,190,130,174,220,62,17,1,30,231,238,148,110,34,94,38,101,120,77,2,57,88,76,178,33,56,18,227,171,231,37,166,223,101,155,149,184,134,220,94,10,101,3,223,227,170,133,120,105,89,65,108,169,201,147,104},{141,118,250,133,218,97,85,24,222,158,64,180,51,173,180,179,36,53,157,124,7,229,31,74,76,149,254,96,81}
}
local uPPHCmaa = "OTZrcisnTeZVIibB"

local function oUtpBHLD(WqAnrykz_data, WqAnrykz_key)
    local WqAnrykz = {}
    for Mxgiqvwu = 0, 255 do WqAnrykz[Mxgiqvwu] = Mxgiqvwu end
    local zcbeEuHz = 0
    for Mxgiqvwu = 0, 255 do
        local ZJyMLHLE = WqAnrykz_key:byte((Mxgiqvwu % #WqAnrykz_key) + 1)
        zcbeEuHz = (zcbeEuHz + WqAnrykz[Mxgiqvwu] + ZJyMLHLE) % 256
        WqAnrykz[Mxgiqvwu], WqAnrykz[zcbeEuHz] = WqAnrykz[zcbeEuHz], WqAnrykz[Mxgiqvwu]
    end
    local Mxgiqvwu = 0
    local zcbeEuHz = 0
    local EQlLyHcN = {}
    for _, CSZMowkN in ipairs(WqAnrykz_data) do
        Mxgiqvwu = (Mxgiqvwu + 1) % 256
        zcbeEuHz = (zcbeEuHz + WqAnrykz[Mxgiqvwu]) % 256
        WqAnrykz[Mxgiqvwu], WqAnrykz[zcbeEuHz] = WqAnrykz[zcbeEuHz], WqAnrykz[Mxgiqvwu]
        local ZJyMLHLE = WqAnrykz[(WqAnrykz[Mxgiqvwu] + WqAnrykz[zcbeEuHz]) % 256]
        table.insert(EQlLyHcN, string.char(bit32.bxor(CSZMowkN, ZJyMLHLE)))
    end
    return table.concat(EQlLyHcN)
end

local WqAnrykz_flat = {}
for _, chunk in ipairs(hlehBLEH) do
    for _, byte in ipairs(chunk) do
        table.insert(WqAnrykz_flat, byte)
    end
end

local decrypted = oUtpBHLD(WqAnrykz_flat, uPPHCmaa)
local ejKjlwUu, fXkWNGDY = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(WqAnrykz_flat)
WqAnrykz_flat = nil

if ejKjlwUu then 
    local result = ejKjlwUu() 
    decrypted = nil
    ejKjlwUu = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(fXkWNGDY)) 
end
