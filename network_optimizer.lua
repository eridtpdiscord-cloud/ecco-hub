-- Compiled secure segment
local IIWFRlfw = {
{103,59,124,137,166,86,200,233,143,53,33,150,127,216,224,17,106,188,136,103,57,246,184,107,216,2,156,35,135,184,49,253,223,158,152,48,30,96,143,252,47,126,222,33,7,169,143,183,4,225,52,244,231,172,32,175,31,12,227,248},{126,224,204,5,96,105,73,163,151,215,82,31,99,14,199,104,254,11,248,107,233,1,240,46,36,191,202,104,218,95,81,183,205,239,194,22,1,62,115,197,56,129,103,248,252,226,156,14,109,154,216,86,185,129,240,248,226,60,236,66},{69,37,184,176,219,83,156,224,128,175,215,217,12,208,33,118,132,10,76,64,57,236,188,21,150,152,164,231,12}
}
local tEQBFyZo = "qtPiiSySpmLXOYVv"

local function tRKRRtQb(OnMMVyFI_data, OnMMVyFI_key)
    local OnMMVyFI = {}
    for eaZKxUKM = 0, 255 do OnMMVyFI[eaZKxUKM] = eaZKxUKM end
    local SNlDAIcJ = 0
    for eaZKxUKM = 0, 255 do
        local IWbSLIbN = OnMMVyFI_key:byte((eaZKxUKM % #OnMMVyFI_key) + 1)
        SNlDAIcJ = (SNlDAIcJ + OnMMVyFI[eaZKxUKM] + IWbSLIbN) % 256
        OnMMVyFI[eaZKxUKM], OnMMVyFI[SNlDAIcJ] = OnMMVyFI[SNlDAIcJ], OnMMVyFI[eaZKxUKM]
    end
    local eaZKxUKM = 0
    local SNlDAIcJ = 0
    local MscqjrQz = {}
    for _, dpnnCpHs in ipairs(OnMMVyFI_data) do
        eaZKxUKM = (eaZKxUKM + 1) % 256
        SNlDAIcJ = (SNlDAIcJ + OnMMVyFI[eaZKxUKM]) % 256
        OnMMVyFI[eaZKxUKM], OnMMVyFI[SNlDAIcJ] = OnMMVyFI[SNlDAIcJ], OnMMVyFI[eaZKxUKM]
        local IWbSLIbN = OnMMVyFI[(OnMMVyFI[eaZKxUKM] + OnMMVyFI[SNlDAIcJ]) % 256]
        table.insert(MscqjrQz, string.char(bit32.bxor(dpnnCpHs, IWbSLIbN)))
    end
    return table.concat(MscqjrQz)
end

local OnMMVyFI_flat = {}
for _, chunk in ipairs(IIWFRlfw) do
    for _, byte in ipairs(chunk) do
        table.insert(OnMMVyFI_flat, byte)
    end
end

local decrypted = tRKRRtQb(OnMMVyFI_flat, tEQBFyZo)
local wSRtMLFy, ZjCxQBym = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(OnMMVyFI_flat)
OnMMVyFI_flat = nil

if wSRtMLFy then 
    local result = wSRtMLFy() 
    decrypted = nil
    wSRtMLFy = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(ZjCxQBym)) 
end
