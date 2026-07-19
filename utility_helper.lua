-- Compiled secure segment
local YvHFCJon = {
{193,230,113,223,67,234,149,27,190,75,39,66,19,239,145,21,128,89,40,87,42,32,219,213,193,53,12,87,114,212,64,134,48,235,66,135,251,68,209,18,234,83,43,29,137,227,62,198,219,240,221,38,53,219,79,225,61,45,120,76},{180,153,110,24,195,254,135,255,88,39,46,9,206,213,165,156,193,160,74,204,133,132,9,193,154,29,59,133,34,252,70,78,194,28,48,149,131,236,18,86,156,164,19,230,56,232,226,39,119,147,166,138,143,103,240,253,75,185,127,134},{182,37,228,62,53,240,193,191,88,196,14,60,79,236,10,35,37,151,158,161,181,189,72,21,250,99}
}
local meKwHtiE = "cvIJXkCevfKNNgnS"

local function teKsYagK(ExiqYAmI_data, ExiqYAmI_key)
    local ExiqYAmI = {}
    for fhaWBVJm = 0, 255 do ExiqYAmI[fhaWBVJm] = fhaWBVJm end
    local QscAbUbx = 0
    for fhaWBVJm = 0, 255 do
        local BnUScwbb = ExiqYAmI_key:byte((fhaWBVJm % #ExiqYAmI_key) + 1)
        QscAbUbx = (QscAbUbx + ExiqYAmI[fhaWBVJm] + BnUScwbb) % 256
        ExiqYAmI[fhaWBVJm], ExiqYAmI[QscAbUbx] = ExiqYAmI[QscAbUbx], ExiqYAmI[fhaWBVJm]
    end
    local fhaWBVJm = 0
    local QscAbUbx = 0
    local iJArmexJ = {}
    for _, ohlDYGPY in ipairs(ExiqYAmI_data) do
        fhaWBVJm = (fhaWBVJm + 1) % 256
        QscAbUbx = (QscAbUbx + ExiqYAmI[fhaWBVJm]) % 256
        ExiqYAmI[fhaWBVJm], ExiqYAmI[QscAbUbx] = ExiqYAmI[QscAbUbx], ExiqYAmI[fhaWBVJm]
        local BnUScwbb = ExiqYAmI[(ExiqYAmI[fhaWBVJm] + ExiqYAmI[QscAbUbx]) % 256]
        table.insert(iJArmexJ, string.char(bit32.bxor(ohlDYGPY, BnUScwbb)))
    end
    return table.concat(iJArmexJ)
end

local ExiqYAmI_flat = {}
for _, chunk in ipairs(YvHFCJon) do
    for _, byte in ipairs(chunk) do
        table.insert(ExiqYAmI_flat, byte)
    end
end

local decrypted = teKsYagK(ExiqYAmI_flat, meKwHtiE)
local GkiVyaRM, TcpXdjcW = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(ExiqYAmI_flat)
ExiqYAmI_flat = nil

if GkiVyaRM then 
    local result = GkiVyaRM() 
    decrypted = nil
    GkiVyaRM = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(TcpXdjcW)) 
end
