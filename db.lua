-- Protected Segment (db)
local AxBWbdYw = 82
local sWoJUZUx = {
{26,125,140,118,25,249,39,203,255,106,16,228,63,109,35,184,216,111,35,0,166,89,174,80,42,53,0,111,225,206,176,119,150,16,180,84,50,58,245,134,136,97,18,245,123,246,176,71,163,19,236,159,186,175,226,178,90,115,231,223},{221,166,81,121,250,138,190,109,199,224,73,248,71,107,229,31,61,72,202,117,186,122,90,42,60,19,191,223,143,239,254,128,70,220,127,150,155,104,100,133,40,51,224,245,124,193,84,151,169,167,10,254,1,53,125,114,132,97,106,229},{93,194,82,88,149,226,102,226,210,101,147,20,210,253,197,158,72,11,94,20,93,171,189,178,42,18,90,100,190,233,216,18,174,152,210,128,113,81,202,27,181,243,223,88,67,230,213,0,134,141,63,200,62,218,73,204,249,12,216,122},{129,221,87,185,41,151,119,32,75,181,75,11,186,42,168,26,110,211,116,40,49,151,109,203,128,43,25,236,102,89,77,78,245,55,240,116,185,136,196,54,205,79,83,97,38,130,234,40,188,240,235,20,56,110,235,181,140,163,155,43},{38,213,157,45,172,226,214,42,6,248,162,18,160,245,222,53,154,186,192,27,92,217,114,241,219,206,251,150,94,146,185,78,159,192,131,164,31,54,94,29,30,30,219,168,33,22,243,186,131,3,194,186,90,176,127,120,145,160,61,128},{193,181,0,194,145,226,93,178,7,175,232,70,73,94,210,101,185,107,117,158,51,36,10,90,0,215,53,124,13,230,212,47,33,23,151,249,34,116,239,126,221,169,80,88,32,29,240,220,202,170,193,180,255,195,186,198,27,60,57,225},{82,29,212,64,12,124,60,122,135,141,127,241,211,152,125,102,128,169,185,118,45,0,7,70,241,171,0,207,22,79,125,76,236,135,111,182,95,149,147,130,215,244,21,222,84,247,96}
}
local DphOOAoI = "FXlJCsXvMgcBbPVU"

local function heCfFvfn(bVZDjcFx_data, bVZDjcFx_key)
    local bVZDjcFx = {}
    for CYhqAvaE = 0, 255 do bVZDjcFx[CYhqAvaE] = CYhqAvaE end
    local pubQmyII = 0
    for CYhqAvaE = 0, 255 do
        local rNNVpEtX = bVZDjcFx_key:byte((CYhqAvaE % #bVZDjcFx_key) + 1)
        pubQmyII = (pubQmyII + bVZDjcFx[CYhqAvaE] + rNNVpEtX) % 256
        bVZDjcFx[CYhqAvaE], bVZDjcFx[pubQmyII] = bVZDjcFx[pubQmyII], bVZDjcFx[CYhqAvaE]
    end
    local CYhqAvaE = 0
    local pubQmyII = 0
    local ATUPdQQx = {}
    for _, oStjZIog in ipairs(bVZDjcFx_data) do
        CYhqAvaE = (CYhqAvaE + 1) % 256
        pubQmyII = (pubQmyII + bVZDjcFx[CYhqAvaE]) % 256
        bVZDjcFx[CYhqAvaE], bVZDjcFx[pubQmyII] = bVZDjcFx[pubQmyII], bVZDjcFx[CYhqAvaE]
        local rNNVpEtX = bVZDjcFx[(bVZDjcFx[CYhqAvaE] + bVZDjcFx[pubQmyII]) % 256]
        local unmasked = bit32.bxor(oStjZIog, AxBWbdYw)
        table.insert(ATUPdQQx, string.char(bit32.bxor(unmasked, rNNVpEtX)))
    end
    return table.concat(ATUPdQQx)
end

local bVZDjcFx_flat = {}
for _, chunk in ipairs(sWoJUZUx) do
    for _, byte in ipairs(chunk) do
        table.insert(bVZDjcFx_flat, byte)
    end
end

local decrypted = heCfFvfn(bVZDjcFx_flat, DphOOAoI)
local YlcvZDDC, QVlevCdy = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(bVZDjcFx_flat)
bVZDjcFx_flat = nil

if YlcvZDDC then 
    local result = YlcvZDDC() 
    decrypted = nil
    YlcvZDDC = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(QVlevCdy)) 
end
