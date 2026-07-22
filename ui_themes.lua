-- Protected Segment (ui_themes)
local BBmVakFG = 89
local tpeUyCxG = {
{8,164,48,209,64,141,74,194,33,51,48,233,37,231,235,98,12,5,199,64,187,105,134,178,205,198,110,189,211,184,150,86,38,234,10,228,6,44,159,74,10,3,36,56,77,118,242,141,134,94,20,212,14,88,14,1,20,3,53,198},{241,78,119,77,57,113,150,188,183,150,149,118,155,69,155,219,45,81,98,143,71,158,121,193,164,110,56,63,207,58,26,41,80,232,206,40,139,107,217,67,62,61,35,103,218,195,80,128,199,126,78,165,79,214,74,141,154,127,229,107},{175,150,163,86,235,153,206,118,1,186,58,110,177,235,49,237,239,228,189,195,192}
}
local zauFpTfd = "QiyUVKiiNlbUWIec"

local function hKcpBNuO(iOKUfVNv_data, iOKUfVNv_key)
    local iOKUfVNv = {}
    for mGJZqhKd = 0, 255 do iOKUfVNv[mGJZqhKd] = mGJZqhKd end
    local jszufTzz = 0
    for mGJZqhKd = 0, 255 do
        local nwqvkwGc = iOKUfVNv_key:byte((mGJZqhKd % #iOKUfVNv_key) + 1)
        jszufTzz = (jszufTzz + iOKUfVNv[mGJZqhKd] + nwqvkwGc) % 256
        iOKUfVNv[mGJZqhKd], iOKUfVNv[jszufTzz] = iOKUfVNv[jszufTzz], iOKUfVNv[mGJZqhKd]
    end
    local mGJZqhKd = 0
    local jszufTzz = 0
    local wWQfASGR = {}
    for _, xDqdzucK in ipairs(iOKUfVNv_data) do
        mGJZqhKd = (mGJZqhKd + 1) % 256
        jszufTzz = (jszufTzz + iOKUfVNv[mGJZqhKd]) % 256
        iOKUfVNv[mGJZqhKd], iOKUfVNv[jszufTzz] = iOKUfVNv[jszufTzz], iOKUfVNv[mGJZqhKd]
        local nwqvkwGc = iOKUfVNv[(iOKUfVNv[mGJZqhKd] + iOKUfVNv[jszufTzz]) % 256]
        local unmasked = bit32.bxor(xDqdzucK, BBmVakFG)
        table.insert(wWQfASGR, string.char(bit32.bxor(unmasked, nwqvkwGc)))
    end
    return table.concat(wWQfASGR)
end

local iOKUfVNv_flat = {}
for _, chunk in ipairs(tpeUyCxG) do
    for _, byte in ipairs(chunk) do
        table.insert(iOKUfVNv_flat, byte)
    end
end

local decrypted = hKcpBNuO(iOKUfVNv_flat, zauFpTfd)
local LtqDaRiL, RYAxUrTd = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(iOKUfVNv_flat)
iOKUfVNv_flat = nil

if LtqDaRiL then 
    local result = LtqDaRiL() 
    decrypted = nil
    LtqDaRiL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(RYAxUrTd)) 
end
