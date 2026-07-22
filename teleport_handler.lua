-- Protected Segment (teleport_handler)
local uixjtDVv = 13
local URJGUzLO = {
{230,51,63,179,97,173,241,196,150,12,246,151,86,75,215,66,86,113,14,249,162,212,54,95,126,17,95,223,250,159,57,205,90,232,72,41,151,220,241,130,159,227,20,109,183,46,68,205,22,24,226,234,44,184,37,249,93,85,128,4},{116,242,180,41,105,123,59,196,143,195,24,69,245,197,182,117,26,70,167,126,75,42,242,4,223,23,225,180,250,3,146,156,186,136,252,123,155,247,202,154,50,243,158,220,189,223,206,70,182,185,229,21,36,141,138,240,225,82,196,16},{184,178,62,71,231,59,252,7,157,148,104,146,25,131,64,48,240,84,19,18,217,20,242,163,126,102,155,188}
}
local PQRmiuwB = "rDgBPKknnaBXUyIc"

local function gNDASOOa(oekCdgoy_data, oekCdgoy_key)
    local oekCdgoy = {}
    for QtPFfxIG = 0, 255 do oekCdgoy[QtPFfxIG] = QtPFfxIG end
    local ucqQjxpZ = 0
    for QtPFfxIG = 0, 255 do
        local gnySJras = oekCdgoy_key:byte((QtPFfxIG % #oekCdgoy_key) + 1)
        ucqQjxpZ = (ucqQjxpZ + oekCdgoy[QtPFfxIG] + gnySJras) % 256
        oekCdgoy[QtPFfxIG], oekCdgoy[ucqQjxpZ] = oekCdgoy[ucqQjxpZ], oekCdgoy[QtPFfxIG]
    end
    local QtPFfxIG = 0
    local ucqQjxpZ = 0
    local FeYdWKoX = {}
    for _, RONirxUx in ipairs(oekCdgoy_data) do
        QtPFfxIG = (QtPFfxIG + 1) % 256
        ucqQjxpZ = (ucqQjxpZ + oekCdgoy[QtPFfxIG]) % 256
        oekCdgoy[QtPFfxIG], oekCdgoy[ucqQjxpZ] = oekCdgoy[ucqQjxpZ], oekCdgoy[QtPFfxIG]
        local gnySJras = oekCdgoy[(oekCdgoy[QtPFfxIG] + oekCdgoy[ucqQjxpZ]) % 256]
        local unmasked = bit32.bxor(RONirxUx, uixjtDVv)
        table.insert(FeYdWKoX, string.char(bit32.bxor(unmasked, gnySJras)))
    end
    return table.concat(FeYdWKoX)
end

local oekCdgoy_flat = {}
for _, chunk in ipairs(URJGUzLO) do
    for _, byte in ipairs(chunk) do
        table.insert(oekCdgoy_flat, byte)
    end
end

local decrypted = gNDASOOa(oekCdgoy_flat, PQRmiuwB)
local iaygrbRo, WwadNxJN = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(oekCdgoy_flat)
oekCdgoy_flat = nil

if iaygrbRo then 
    local result = iaygrbRo() 
    decrypted = nil
    iaygrbRo = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(WwadNxJN)) 
end
