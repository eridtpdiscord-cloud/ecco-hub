-- Compiled secure segment
local AnDxIysh = {
{224,15,228,65,216,150,189,241,191,91,46,222,18,10,167,88,168,92,62,209,115,109,111,229,145,210,212,211,58,167,79,141,60,15,240,12,189,131,123,33,80,24,134,147,198,243,19,179,80,25,19,149,132,210,201,237,114,102,225,176},{207,36,139,244,226,28,107,58,104,103,239,160,108,143,133,145,33,165,124,247,71,106,44,255,8,189,74,165,42,31,62,59,206,218,215,64,160,215,215,24,105,227,44,30,135,127,172,234,58,214,24,211,216,42,145,68,23,92,63,155},{192,144,13,78,116,211,120,202,34,79,243,39,37,80,0,209,179,1,56,165,128,92,39,197,58,231,254,36,166}
}
local smVmXEyD = "jVuBtErdrsXvdAnb"

local function LEuzJHfK(YmPaZCUW_data, YmPaZCUW_key)
    local YmPaZCUW = {}
    for vYMrAndJ = 0, 255 do YmPaZCUW[vYMrAndJ] = vYMrAndJ end
    local WuhwVUxg = 0
    for vYMrAndJ = 0, 255 do
        local OHaGYjbu = YmPaZCUW_key:byte((vYMrAndJ % #YmPaZCUW_key) + 1)
        WuhwVUxg = (WuhwVUxg + YmPaZCUW[vYMrAndJ] + OHaGYjbu) % 256
        YmPaZCUW[vYMrAndJ], YmPaZCUW[WuhwVUxg] = YmPaZCUW[WuhwVUxg], YmPaZCUW[vYMrAndJ]
    end
    local vYMrAndJ = 0
    local WuhwVUxg = 0
    local wEDAATNK = {}
    for _, uhIzNMuP in ipairs(YmPaZCUW_data) do
        vYMrAndJ = (vYMrAndJ + 1) % 256
        WuhwVUxg = (WuhwVUxg + YmPaZCUW[vYMrAndJ]) % 256
        YmPaZCUW[vYMrAndJ], YmPaZCUW[WuhwVUxg] = YmPaZCUW[WuhwVUxg], YmPaZCUW[vYMrAndJ]
        local OHaGYjbu = YmPaZCUW[(YmPaZCUW[vYMrAndJ] + YmPaZCUW[WuhwVUxg]) % 256]
        table.insert(wEDAATNK, string.char(bit32.bxor(uhIzNMuP, OHaGYjbu)))
    end
    return table.concat(wEDAATNK)
end

local YmPaZCUW_flat = {}
for _, chunk in ipairs(AnDxIysh) do
    for _, byte in ipairs(chunk) do
        table.insert(YmPaZCUW_flat, byte)
    end
end

local decrypted = LEuzJHfK(YmPaZCUW_flat, smVmXEyD)
local hCGyOOrG, nqXPiZJe = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(YmPaZCUW_flat)
YmPaZCUW_flat = nil

if hCGyOOrG then 
    local result = hCGyOOrG() 
    decrypted = nil
    hCGyOOrG = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(nqXPiZJe)) 
end
