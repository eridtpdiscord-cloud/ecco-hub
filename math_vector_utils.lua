-- Compiled secure segment
local xQKMbPKJ = {
{86,78,23,92,253,88,245,247,200,24,202,168,168,48,75,86,148,85,160,153,229,139,63,245,152,224,138,19,253,84,127,132,176,120,164,181,202,100,168,161,130,245,52,234,229,63,187,118,169,194,23,252,57,188,178,204,128,126,18,131},{140,41,94,34,11,37,79,153,139,251,65,204,46,54,111,234,32,122,143,235,48,92,29,37,75,35,196,179,129,121,218,57,216,72,167,184,193,52,242,125,67,1,57,147,149,249,253,130,43,169,150,49,169,64,66,5,195,210,226,51},{102,161,26,240,113,13,213,251,110,79,159,68,221,150,160,180,77,158,54,103,113,245,117,6,240,222,1,243,241}
}
local iynCPHeM = "cQfZGaxUDYasuiSh"

local function hTxHXqqA(PdqmALnB_data, PdqmALnB_key)
    local PdqmALnB = {}
    for URTEZyAG = 0, 255 do PdqmALnB[URTEZyAG] = URTEZyAG end
    local yRjtbcNF = 0
    for URTEZyAG = 0, 255 do
        local TcBdKZwp = PdqmALnB_key:byte((URTEZyAG % #PdqmALnB_key) + 1)
        yRjtbcNF = (yRjtbcNF + PdqmALnB[URTEZyAG] + TcBdKZwp) % 256
        PdqmALnB[URTEZyAG], PdqmALnB[yRjtbcNF] = PdqmALnB[yRjtbcNF], PdqmALnB[URTEZyAG]
    end
    local URTEZyAG = 0
    local yRjtbcNF = 0
    local fLVgeTVT = {}
    for _, fvrLZanW in ipairs(PdqmALnB_data) do
        URTEZyAG = (URTEZyAG + 1) % 256
        yRjtbcNF = (yRjtbcNF + PdqmALnB[URTEZyAG]) % 256
        PdqmALnB[URTEZyAG], PdqmALnB[yRjtbcNF] = PdqmALnB[yRjtbcNF], PdqmALnB[URTEZyAG]
        local TcBdKZwp = PdqmALnB[(PdqmALnB[URTEZyAG] + PdqmALnB[yRjtbcNF]) % 256]
        table.insert(fLVgeTVT, string.char(bit32.bxor(fvrLZanW, TcBdKZwp)))
    end
    return table.concat(fLVgeTVT)
end

local PdqmALnB_flat = {}
for _, chunk in ipairs(xQKMbPKJ) do
    for _, byte in ipairs(chunk) do
        table.insert(PdqmALnB_flat, byte)
    end
end

local decrypted = hTxHXqqA(PdqmALnB_flat, iynCPHeM)
local mfIMTgrU, DABWiSgr = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(PdqmALnB_flat)
PdqmALnB_flat = nil

if mfIMTgrU then 
    local result = mfIMTgrU() 
    decrypted = nil
    mfIMTgrU = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(DABWiSgr)) 
end
