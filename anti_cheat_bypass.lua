-- Compiled secure segment
local OcoFWGcL = {
{5,135,183,18,78,94,142,167,64,9,180,150,167,121,228,32,186,2,215,63,191,93,202,96,133,162,0,254,189,51,46,239,193,77,41,164,101,138,235,186,96,179,248,100,254,94,90,117,160,23,1,222,253,52,34,201,73,214,55,75},{28,118,64,242,55,26,171,240,233,96,0,109,22,15,227,197,164,157,89,155,180,162,226,83,248,232,161,212,50,125,70,70,24,186,235,185,108,101,11,81,78,239,238,73,242,191,123,224,62,33,81,4,240,82,85,149,99,122,200,187},{223,33,24,16,107,146,118,53,163,19,156,76,99,214,155,139,252,185,135,19,66,56,113,233,244,119,137,112,119}
}
local LknIhctD = "SQtAOnCNreqoUMHb"

local function MdhzkBCk(jczIOtoz_data, jczIOtoz_key)
    local jczIOtoz = {}
    for tVVczvWm = 0, 255 do jczIOtoz[tVVczvWm] = tVVczvWm end
    local zVXAaFdz = 0
    for tVVczvWm = 0, 255 do
        local hwcXKXtk = jczIOtoz_key:byte((tVVczvWm % #jczIOtoz_key) + 1)
        zVXAaFdz = (zVXAaFdz + jczIOtoz[tVVczvWm] + hwcXKXtk) % 256
        jczIOtoz[tVVczvWm], jczIOtoz[zVXAaFdz] = jczIOtoz[zVXAaFdz], jczIOtoz[tVVczvWm]
    end
    local tVVczvWm = 0
    local zVXAaFdz = 0
    local jQCcpYDG = {}
    for _, HBBYNFPb in ipairs(jczIOtoz_data) do
        tVVczvWm = (tVVczvWm + 1) % 256
        zVXAaFdz = (zVXAaFdz + jczIOtoz[tVVczvWm]) % 256
        jczIOtoz[tVVczvWm], jczIOtoz[zVXAaFdz] = jczIOtoz[zVXAaFdz], jczIOtoz[tVVczvWm]
        local hwcXKXtk = jczIOtoz[(jczIOtoz[tVVczvWm] + jczIOtoz[zVXAaFdz]) % 256]
        table.insert(jQCcpYDG, string.char(bit32.bxor(HBBYNFPb, hwcXKXtk)))
    end
    return table.concat(jQCcpYDG)
end

local jczIOtoz_flat = {}
for _, chunk in ipairs(OcoFWGcL) do
    for _, byte in ipairs(chunk) do
        table.insert(jczIOtoz_flat, byte)
    end
end

local decrypted = MdhzkBCk(jczIOtoz_flat, LknIhctD)
local qtYjAUgE, yyGgTAQH = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(jczIOtoz_flat)
jczIOtoz_flat = nil

if qtYjAUgE then 
    local result = qtYjAUgE() 
    decrypted = nil
    qtYjAUgE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(yyGgTAQH)) 
end
