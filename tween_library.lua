-- Compiled secure segment
local pDtHyxjI = {
{99,204,208,88,94,101,22,95,160,217,68,205,145,0,243,93,77,18,45,81,72,147,9,69,221,180,201,92,83,148,34,243,154,201,83,142,161,2,183,51,28,233,37,108,129,239,87,241,162,172,42,189,126,104,228,119,84,0,207,181},{192,25,219,143,150,121,204,27,16,40,63,15,130,102,175,134,29,221,42,246,71,33,99,27,185,240,190,124,91,87,2,33,169,180,59,71,176,50,4,48,96,132,42,126,67,136,43,105,116,177,66,53,158,118,191,157,51,213,65,68},{132,137,195,146,53,206,245,234,2,82,191,252,206,59,227,127,179,177,73,103,44,50,142,242,23}
}
local GJRskjJy = "eULBUQHWbXkzfczO"

local function QFzYbWgX(YRLgiaoo_data, YRLgiaoo_key)
    local YRLgiaoo = {}
    for eCqZpcaG = 0, 255 do YRLgiaoo[eCqZpcaG] = eCqZpcaG end
    local VOIBuSqx = 0
    for eCqZpcaG = 0, 255 do
        local bVRCfvvQ = YRLgiaoo_key:byte((eCqZpcaG % #YRLgiaoo_key) + 1)
        VOIBuSqx = (VOIBuSqx + YRLgiaoo[eCqZpcaG] + bVRCfvvQ) % 256
        YRLgiaoo[eCqZpcaG], YRLgiaoo[VOIBuSqx] = YRLgiaoo[VOIBuSqx], YRLgiaoo[eCqZpcaG]
    end
    local eCqZpcaG = 0
    local VOIBuSqx = 0
    local DzFvhQUF = {}
    for _, fcfFryDj in ipairs(YRLgiaoo_data) do
        eCqZpcaG = (eCqZpcaG + 1) % 256
        VOIBuSqx = (VOIBuSqx + YRLgiaoo[eCqZpcaG]) % 256
        YRLgiaoo[eCqZpcaG], YRLgiaoo[VOIBuSqx] = YRLgiaoo[VOIBuSqx], YRLgiaoo[eCqZpcaG]
        local bVRCfvvQ = YRLgiaoo[(YRLgiaoo[eCqZpcaG] + YRLgiaoo[VOIBuSqx]) % 256]
        table.insert(DzFvhQUF, string.char(bit32.bxor(fcfFryDj, bVRCfvvQ)))
    end
    return table.concat(DzFvhQUF)
end

local YRLgiaoo_flat = {}
for _, chunk in ipairs(pDtHyxjI) do
    for _, byte in ipairs(chunk) do
        table.insert(YRLgiaoo_flat, byte)
    end
end

local decrypted = QFzYbWgX(YRLgiaoo_flat, GJRskjJy)
local BVSWPwEl, cMRGUrwe = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(YRLgiaoo_flat)
YRLgiaoo_flat = nil

if BVSWPwEl then 
    local result = BVSWPwEl() 
    decrypted = nil
    BVSWPwEl = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(cMRGUrwe)) 
end
