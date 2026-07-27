-- Protected Segment (network_optimizer)
local khijvXeD = 241
local oIzSlaRu = {
{33,107,183,169,227,219,210,15,64,82,195,103,19,158,130,242,249,79,157,149,59,109,43,111,180,204,8,12,159,102,232,17,135,51,177,47,115,16,132,106,189,189,180,145,180,215,253,237,157,170,198,49,27,94,110,190,104,34,122,57},{52,50,193,8,37,156,2,196,128,209,152,181,206,44,236,141,31,115,216,137,175,215,120,243,117,185,49,87,16,229,21,114,76,62,17,225,179,227,145,119,187,199,162,220,60,151,52,120,255,79,26,38,31,192,81,106,194,95,162,248},{167,193,206,13,119,41,8,42,250,66,81,132,138,53,104,208,99,238,55,216,164,229,164,195,227,142,251,62,249}
}
local xURXCmGD = "JauSweQkuWYoAxtu"

local function cKyarrUO(YOSEVnZZ_data, YOSEVnZZ_key)
    if type(YOSEVnZZ_key) ~= "string" or #YOSEVnZZ_key == 0 then return "" end
    local YOSEVnZZ = {}
    for BxZNJHWC = 0, 255 do YOSEVnZZ[BxZNJHWC] = BxZNJHWC end
    local rbnXVHdv = 0
    for BxZNJHWC = 0, 255 do
        local ElxKfPzb = YOSEVnZZ_key:byte((BxZNJHWC % #YOSEVnZZ_key) + 1)
        rbnXVHdv = (rbnXVHdv + YOSEVnZZ[BxZNJHWC] + ElxKfPzb) % 256
        YOSEVnZZ[BxZNJHWC], YOSEVnZZ[rbnXVHdv] = YOSEVnZZ[rbnXVHdv], YOSEVnZZ[BxZNJHWC]
    end
    local BxZNJHWC = 0
    local rbnXVHdv = 0
    local BNVPgFmV = {}
    for _, QEJeEGSh in ipairs(YOSEVnZZ_data) do
        BxZNJHWC = (BxZNJHWC + 1) % 256
        rbnXVHdv = (rbnXVHdv + YOSEVnZZ[BxZNJHWC]) % 256
        YOSEVnZZ[BxZNJHWC], YOSEVnZZ[rbnXVHdv] = YOSEVnZZ[rbnXVHdv], YOSEVnZZ[BxZNJHWC]
        local ElxKfPzb = YOSEVnZZ[(YOSEVnZZ[BxZNJHWC] + YOSEVnZZ[rbnXVHdv]) % 256]
        local unmasked = bit32.bxor(QEJeEGSh, khijvXeD)
        table.insert(BNVPgFmV, string.char(bit32.bxor(unmasked, ElxKfPzb)))
    end
    return table.concat(BNVPgFmV)
end

local YOSEVnZZ_flat = {}
for _, chunk in ipairs(oIzSlaRu) do
    for _, byte in ipairs(chunk) do
        table.insert(YOSEVnZZ_flat, byte)
    end
end

local decrypted = cKyarrUO(YOSEVnZZ_flat, xURXCmGD)
local WBLaifcO, mhUPuEPJ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(YOSEVnZZ_flat)
YOSEVnZZ_flat = nil

if WBLaifcO then 
    local result = WBLaifcO() 
    decrypted = nil
    WBLaifcO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(mhUPuEPJ)) 
end
