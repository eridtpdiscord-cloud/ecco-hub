-- Protected Segment (teleport_handler)
local TPcptbON = 183
local NBsmokTr = {
{82,77,93,5,171,113,221,164,81,80,141,71,18,135,122,108,86,254,162,224,24,17,187,141,221,172,88,105,153,61,142,182,37,146,41,131,204,194,189,142,118,171,111,103,38,77,150,107,244,93,34,186,174,12,96,31,129,80,179,0},{6,22,223,42,27,215,110,136,107,149,96,107,117,252,39,90,235,117,173,89,48,184,247,234,99,36,8,27,239,168,164,162,237,237,235,120,139,144,182,170,51,233,142,72,155,122,128,76,156,195,31,89,213,34,152,25,97,209,155,148},{190,19,103,236,174,4,231,215,244,114,199,126,195,153,169,237,153,102,155,161,219,237,5,6,49,94,160,175}
}
local DosENAIL = "vANzTsftGLHRaFGu"

local function mVaalZyx(cMndsXht_data, cMndsXht_key)
    local cMndsXht = {}
    for GBlkoHzc = 0, 255 do cMndsXht[GBlkoHzc] = GBlkoHzc end
    local lbTQBgXb = 0
    for GBlkoHzc = 0, 255 do
        local XsZUrNMr = cMndsXht_key:byte((GBlkoHzc % #cMndsXht_key) + 1)
        lbTQBgXb = (lbTQBgXb + cMndsXht[GBlkoHzc] + XsZUrNMr) % 256
        cMndsXht[GBlkoHzc], cMndsXht[lbTQBgXb] = cMndsXht[lbTQBgXb], cMndsXht[GBlkoHzc]
    end
    local GBlkoHzc = 0
    local lbTQBgXb = 0
    local ZYHhIArX = {}
    for _, zUonHrfL in ipairs(cMndsXht_data) do
        GBlkoHzc = (GBlkoHzc + 1) % 256
        lbTQBgXb = (lbTQBgXb + cMndsXht[GBlkoHzc]) % 256
        cMndsXht[GBlkoHzc], cMndsXht[lbTQBgXb] = cMndsXht[lbTQBgXb], cMndsXht[GBlkoHzc]
        local XsZUrNMr = cMndsXht[(cMndsXht[GBlkoHzc] + cMndsXht[lbTQBgXb]) % 256]
        local unmasked = bit32.bxor(zUonHrfL, TPcptbON)
        table.insert(ZYHhIArX, string.char(bit32.bxor(unmasked, XsZUrNMr)))
    end
    return table.concat(ZYHhIArX)
end

local cMndsXht_flat = {}
for _, chunk in ipairs(NBsmokTr) do
    for _, byte in ipairs(chunk) do
        table.insert(cMndsXht_flat, byte)
    end
end

local decrypted = mVaalZyx(cMndsXht_flat, DosENAIL)
local cILbIkZe, wWBXKzde = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(cMndsXht_flat)
cMndsXht_flat = nil

if cILbIkZe then 
    local result = cILbIkZe() 
    decrypted = nil
    cILbIkZe = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(wWBXKzde)) 
end
