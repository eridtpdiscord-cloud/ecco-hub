-- Compiled secure segment
local BBbFPaJb = {
{103,235,235,25,86,10,152,8,128,150,249,216,117,213,117,163,77,88,220,17,207,51,255,243,171,108,102,163,159,56,244,99,239,112,208,3,122,201,33,129,219,23,104,101,138,230,56,174,159,32,246,20,224,235,20,213,158,133,90,52},{49,80,43,223,239,111,227,255,224,207,198,187,160,240,44,254,144,20,218,141,73,149,35,150,192,196,1,91,109,78,232,39,82,85,140,81,206,86,150,191,209,100,58,115,36,237,182,64,144,235,176,242,249,95,169,0,75,119,105,52},{247,11,244,185,91,17,235,226,231,77,196,194,198,238,245,180,126,242,46,215,160,103,145,199,164,64,201,248,101,66,42,147,125,221,179,75,82,196,194,251,246,233,194,153,79,197,219,6,236,113,36,170,111,47,38,177,177,227,1,248},{199,145,157,52,65,56,255,186,204,111,190,164,140,185,94,8,253,131,171,227,115,204,174,177,200,194,1,213,70,209,80,157,132,149,69,243,130,248,81,222,246,133,170,195,124,137,123,151,200,185,121,79,142,176,43,165}
}
local eXtCtlZT = "yJLsxvbyGsoajlAz"

local function YfLWUeTU(vMrRgQYd_data, vMrRgQYd_key)
    local vMrRgQYd = {}
    for nLpUghNX = 0, 255 do vMrRgQYd[nLpUghNX] = nLpUghNX end
    local QCAPSOFM = 0
    for nLpUghNX = 0, 255 do
        local zZOrmZSB = vMrRgQYd_key:byte((nLpUghNX % #vMrRgQYd_key) + 1)
        QCAPSOFM = (QCAPSOFM + vMrRgQYd[nLpUghNX] + zZOrmZSB) % 256
        vMrRgQYd[nLpUghNX], vMrRgQYd[QCAPSOFM] = vMrRgQYd[QCAPSOFM], vMrRgQYd[nLpUghNX]
    end
    local nLpUghNX = 0
    local QCAPSOFM = 0
    local qycRjqRY = {}
    for _, IaQTVrFk in ipairs(vMrRgQYd_data) do
        nLpUghNX = (nLpUghNX + 1) % 256
        QCAPSOFM = (QCAPSOFM + vMrRgQYd[nLpUghNX]) % 256
        vMrRgQYd[nLpUghNX], vMrRgQYd[QCAPSOFM] = vMrRgQYd[QCAPSOFM], vMrRgQYd[nLpUghNX]
        local zZOrmZSB = vMrRgQYd[(vMrRgQYd[nLpUghNX] + vMrRgQYd[QCAPSOFM]) % 256]
        table.insert(qycRjqRY, string.char(bit32.bxor(IaQTVrFk, zZOrmZSB)))
    end
    return table.concat(qycRjqRY)
end

local vMrRgQYd_flat = {}
for _, chunk in ipairs(BBbFPaJb) do
    for _, byte in ipairs(chunk) do
        table.insert(vMrRgQYd_flat, byte)
    end
end

local decrypted = YfLWUeTU(vMrRgQYd_flat, eXtCtlZT)
local dXBhGMwQ, uXVkthaE = loadstring(decrypted)
if dXBhGMwQ then 
    return dXBhGMwQ() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(uXVkthaE)) 
end
