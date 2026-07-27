-- Protected Segment (teleport_handler)
local nCjeCbuR = 219
local EBmdEnJb = {
{153,167,107,252,78,218,42,190,118,45,147,231,254,84,59,128,143,142,56,108,95,223,203,252,83,138,235,140,218,214,31,103,112,175,248,24,187,146,8,94,185,122,145,254,185,115,130,144,2,26,84,146,61,11,199,224,110,163,64,253},{110,1,153,232,100,153,170,41,83,120,74,76,156,10,116,187,63,219,176,211,185,27,214,148,116,82,10,53,214,66,116,96,26,153,137,55,221,52,58,210,237,187,59,28,68,24,91,127,126,247,206,58,197,149,124,46,231,242,108,183},{125,130,68,140,174,174,255,48,150,193,4,46,30,110,194,238,165,121,76,161,145,104,254,90,9,36,208,226}
}
local tYcDpDwc = "PLnYkAPbuEVcjkBU"

local function IoJQuiyw(qJmeSbYT_data, qJmeSbYT_key)
    if type(qJmeSbYT_key) ~= "string" or #qJmeSbYT_key == 0 then return "" end
    local qJmeSbYT = {}
    for cfCXorHD = 0, 255 do qJmeSbYT[cfCXorHD] = cfCXorHD end
    local gfMHJCVw = 0
    for cfCXorHD = 0, 255 do
        local LECrLiYK = qJmeSbYT_key:byte((cfCXorHD % #qJmeSbYT_key) + 1)
        gfMHJCVw = (gfMHJCVw + qJmeSbYT[cfCXorHD] + LECrLiYK) % 256
        qJmeSbYT[cfCXorHD], qJmeSbYT[gfMHJCVw] = qJmeSbYT[gfMHJCVw], qJmeSbYT[cfCXorHD]
    end
    local cfCXorHD = 0
    local gfMHJCVw = 0
    local jzCJwvNd = {}
    for _, dpjOuQrK in ipairs(qJmeSbYT_data) do
        cfCXorHD = (cfCXorHD + 1) % 256
        gfMHJCVw = (gfMHJCVw + qJmeSbYT[cfCXorHD]) % 256
        qJmeSbYT[cfCXorHD], qJmeSbYT[gfMHJCVw] = qJmeSbYT[gfMHJCVw], qJmeSbYT[cfCXorHD]
        local LECrLiYK = qJmeSbYT[(qJmeSbYT[cfCXorHD] + qJmeSbYT[gfMHJCVw]) % 256]
        local unmasked = bit32.bxor(dpjOuQrK, nCjeCbuR)
        table.insert(jzCJwvNd, string.char(bit32.bxor(unmasked, LECrLiYK)))
    end
    return table.concat(jzCJwvNd)
end

local qJmeSbYT_flat = {}
for _, chunk in ipairs(EBmdEnJb) do
    for _, byte in ipairs(chunk) do
        table.insert(qJmeSbYT_flat, byte)
    end
end

local decrypted = IoJQuiyw(qJmeSbYT_flat, tYcDpDwc)
local hLMdCFCi, gbOGfdnI = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(qJmeSbYT_flat)
qJmeSbYT_flat = nil

if hLMdCFCi then 
    local result = hLMdCFCi() 
    decrypted = nil
    hLMdCFCi = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(gbOGfdnI)) 
end
