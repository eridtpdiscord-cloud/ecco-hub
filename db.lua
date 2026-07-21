-- Protected Segment (db)
local PtlUqPnI = 197
local hAzESFAB = {
{221,175,179,48,189,60,15,133,0,132,141,96,19,105,240,8,219,54,6,48,132,234,195,128,32,246,47,155,140,229,93,111,195,192,78,125,43,165,127,187,161,149,177,85,183,102,75,56,15,42,123,246,136,60,156,124,8,127,210,154},{49,83,105,46,122,160,204,217,210,187,116,202,121,156,153,31,78,127,68,156,163,45,117,204,189,71,44,138,68,57,24,249,79,143,123,56,211,1,80,180,7,227,229,108,244,14,14,162,131,90,111,155,130,181,48,73,158,118,126,218},{126,50,124,139,26,103,76,48,234,140,6,33,86,62,234,252,223,131,147,144,247,100,149,17,186,31,20,219,98,5,82,186,63,77,50,42,148,220,235,28,243,129,249,83,228,38,173,39,205,212,38,202,186,51,238,196,29,52,111,64},{130,73,85,87,114,109,37,233,116,234,49,206,71,216,24,237,231,52,198,112,247,0,85,69,137,133,214,68,124,212,254,164,229,25,227,210,151,237,101,251,235,84,91,226,107,133,68,217,31,219,236,88,251,225,233,59,187,195,241,249},{251,66,28,13,118,164,102,249,13,5,217,170,30,45,60,20,152,59,47,149,222,106,44,143,163,162,147,55,210,143,166,208,238,206,80,160,2,202,82,195,203,237,175,31,236,237,87,159,152,88,12,11,159,11,216,47,86,249,5,51},{72,117,226,202,143,201,52,72,195,70,8,226,95,203,244,240,85,2,101,204,234,122,196,218,156,132,228,101,81,194,239,196,228,107,22,4,114,72,136,167,8,253,131,16,141,45,108,137,77,46,225,47,106,199,236,70,203,166,16,153},{116,58,106,132,191,241,7,200,131,240,72,210,221,147,103,218,195,1,196,150,206,152,125,98,181,20,92,251,176,251,49,125,104,206,193,130,242,190,227,63,1,123,232,219,156,191,38}
}
local TaKPlWMm = "aBuPJLbdCMcesgvC"

local function DDoZuuNQ(eAjDdbEV_data, eAjDdbEV_key)
    local eAjDdbEV = {}
    for ipbejkQJ = 0, 255 do eAjDdbEV[ipbejkQJ] = ipbejkQJ end
    local Tpxbkuxd = 0
    for ipbejkQJ = 0, 255 do
        local qqIeAtaE = eAjDdbEV_key:byte((ipbejkQJ % #eAjDdbEV_key) + 1)
        Tpxbkuxd = (Tpxbkuxd + eAjDdbEV[ipbejkQJ] + qqIeAtaE) % 256
        eAjDdbEV[ipbejkQJ], eAjDdbEV[Tpxbkuxd] = eAjDdbEV[Tpxbkuxd], eAjDdbEV[ipbejkQJ]
    end
    local ipbejkQJ = 0
    local Tpxbkuxd = 0
    local etUzFBcd = {}
    for _, rSYSsZrO in ipairs(eAjDdbEV_data) do
        ipbejkQJ = (ipbejkQJ + 1) % 256
        Tpxbkuxd = (Tpxbkuxd + eAjDdbEV[ipbejkQJ]) % 256
        eAjDdbEV[ipbejkQJ], eAjDdbEV[Tpxbkuxd] = eAjDdbEV[Tpxbkuxd], eAjDdbEV[ipbejkQJ]
        local qqIeAtaE = eAjDdbEV[(eAjDdbEV[ipbejkQJ] + eAjDdbEV[Tpxbkuxd]) % 256]
        local unmasked = bit32.bxor(rSYSsZrO, PtlUqPnI)
        table.insert(etUzFBcd, string.char(bit32.bxor(unmasked, qqIeAtaE)))
    end
    return table.concat(etUzFBcd)
end

local eAjDdbEV_flat = {}
for _, chunk in ipairs(hAzESFAB) do
    for _, byte in ipairs(chunk) do
        table.insert(eAjDdbEV_flat, byte)
    end
end

local decrypted = DDoZuuNQ(eAjDdbEV_flat, TaKPlWMm)
local mWoTuunr, MFXjtOSw = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(eAjDdbEV_flat)
eAjDdbEV_flat = nil

if mWoTuunr then 
    local result = mWoTuunr() 
    decrypted = nil
    mWoTuunr = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(MFXjtOSw)) 
end
