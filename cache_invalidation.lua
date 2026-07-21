-- Protected Segment (cache_invalidation)
local bdGfwwya = 107
local peMksqEl = {
{81,58,145,89,217,136,233,249,65,138,172,88,87,148,163,197,121,143,151,158,138,209,11,82,227,202,142,148,118,168,183,15,126,140,111,35,211,96,77,50,178,145,153,0,143,155,166,166,70,16,82,213,87,110,81,10,187,255,195,231},{1,92,177,118,64,164,107,60,152,64,172,38,253,16,19,68,128,48,61,162,175,45,10,23,222,249,15,68,85,64,160,37,40,218,187,241,146,1,167,209,239,148,227,88,147,64,139,219,104,149,156,24,134,67,174,119,129,153,5,230},{140,231,230,172,8,68,138,244,65,173,170,238,119,123,84,104,9,238,197,112,31,110,188,250,54,14,164,163,215,170}
}
local YsmtHXiA = "tOdPsZrQndtOZvaS"

local function lxQchcZB(qeEGqKlT_data, qeEGqKlT_key)
    local qeEGqKlT = {}
    for ODOQmeIi = 0, 255 do qeEGqKlT[ODOQmeIi] = ODOQmeIi end
    local yDIpjLZb = 0
    for ODOQmeIi = 0, 255 do
        local cBAWuIPf = qeEGqKlT_key:byte((ODOQmeIi % #qeEGqKlT_key) + 1)
        yDIpjLZb = (yDIpjLZb + qeEGqKlT[ODOQmeIi] + cBAWuIPf) % 256
        qeEGqKlT[ODOQmeIi], qeEGqKlT[yDIpjLZb] = qeEGqKlT[yDIpjLZb], qeEGqKlT[ODOQmeIi]
    end
    local ODOQmeIi = 0
    local yDIpjLZb = 0
    local hvhrFszA = {}
    for _, YKdXbOoy in ipairs(qeEGqKlT_data) do
        ODOQmeIi = (ODOQmeIi + 1) % 256
        yDIpjLZb = (yDIpjLZb + qeEGqKlT[ODOQmeIi]) % 256
        qeEGqKlT[ODOQmeIi], qeEGqKlT[yDIpjLZb] = qeEGqKlT[yDIpjLZb], qeEGqKlT[ODOQmeIi]
        local cBAWuIPf = qeEGqKlT[(qeEGqKlT[ODOQmeIi] + qeEGqKlT[yDIpjLZb]) % 256]
        local unmasked = bit32.bxor(YKdXbOoy, bdGfwwya)
        table.insert(hvhrFszA, string.char(bit32.bxor(unmasked, cBAWuIPf)))
    end
    return table.concat(hvhrFszA)
end

local qeEGqKlT_flat = {}
for _, chunk in ipairs(peMksqEl) do
    for _, byte in ipairs(chunk) do
        table.insert(qeEGqKlT_flat, byte)
    end
end

local decrypted = lxQchcZB(qeEGqKlT_flat, YsmtHXiA)
local XbmndVZo, BYaSyVPw = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(qeEGqKlT_flat)
qeEGqKlT_flat = nil

if XbmndVZo then 
    local result = XbmndVZo() 
    decrypted = nil
    XbmndVZo = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(BYaSyVPw)) 
end
