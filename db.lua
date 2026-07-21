-- Compiled secure segment
local iavvtssL = {
{174,110,34,151,128,58,38,186,97,233,33,250,83,142,188,214,217,125,54,132,140,143,101,98,45,31,60,59,229,65,92,59,96,230,178,234,255,42,35,217,129,209,49,35,154,77,0,123,81,12,129,241,15,31,209,161,181,36,174,154},{91,151,229,179,96,118,162,35,241,107,12,207,103,8,85,99,166,124,24,235,203,71,70,213,160,71,253,48,36,121,221,30,103,211,116,210,220,1,137,14,231,148,5,73,155,254,68,1,80,149,225,49,18,83,72,182,133,72,47,209},{198,84,43,214,80,140,50,172,149,6,61,233,220,160,23,196,173,219,144,141,59,36,226,185,184,222,137,233,190,8,21,159,225,139,93,249,14,141,113,222,206,31,198,184,235,166,89,192,131,136,120,225,145,165,157,56,54,249,140,55},{230,45,167,227,38,112,135,130,115,227,91,122,226,168,245,220,104,10,17,101,2,220,168,84,166,96,79,99,144,155,236,243,4,113,78,97,7,17,221,244,230,193,164,191,226,214,21,121,195,209,38,150,31,174,39,21,165,230,150,106},{38,202,230,88,69,244,133,205,129,105,232,43,129,54,65,137,119,215,158,138,109,161,123,200,8,73,252,153,46,157,244,139,222,80,122,20,227,83,119,209,48,247,101,194,51,162,192,241,15,185,99,195,54,196,255,38,249,218,224,184},{180,37,84,245,43,39,191,150,106,100,121,229,231,161,159,98,58,171,133,35,211,29,203,231,138,165,209,15,191,248,79,34,176,129,90,243,115,84,190,130,174,205,211,82,158,115,51,195,100,110,49,251,186,215,49,64,223,63,218,42},{166,184,88,142,251,224,236,62,156,140,16,215,76,206,106,35,57,54,10,115,120,13,11,240,158,122,150,89,198,182,163,101,233,33,219,229,43,121,140,79,224,2,56,152,191}
}
local wBFsrPEW = "vGljsJbKIuQnXmmt"

local function whIUfSZQ(spFzVRBw_data, spFzVRBw_key)
    local spFzVRBw = {}
    for sPkJWMzP = 0, 255 do spFzVRBw[sPkJWMzP] = sPkJWMzP end
    local DxyKvfGH = 0
    for sPkJWMzP = 0, 255 do
        local bQpYlXXN = spFzVRBw_key:byte((sPkJWMzP % #spFzVRBw_key) + 1)
        DxyKvfGH = (DxyKvfGH + spFzVRBw[sPkJWMzP] + bQpYlXXN) % 256
        spFzVRBw[sPkJWMzP], spFzVRBw[DxyKvfGH] = spFzVRBw[DxyKvfGH], spFzVRBw[sPkJWMzP]
    end
    local sPkJWMzP = 0
    local DxyKvfGH = 0
    local lEQOPNyy = {}
    for _, VhUEDwGe in ipairs(spFzVRBw_data) do
        sPkJWMzP = (sPkJWMzP + 1) % 256
        DxyKvfGH = (DxyKvfGH + spFzVRBw[sPkJWMzP]) % 256
        spFzVRBw[sPkJWMzP], spFzVRBw[DxyKvfGH] = spFzVRBw[DxyKvfGH], spFzVRBw[sPkJWMzP]
        local bQpYlXXN = spFzVRBw[(spFzVRBw[sPkJWMzP] + spFzVRBw[DxyKvfGH]) % 256]
        table.insert(lEQOPNyy, string.char(bit32.bxor(VhUEDwGe, bQpYlXXN)))
    end
    return table.concat(lEQOPNyy)
end

local spFzVRBw_flat = {}
for _, chunk in ipairs(iavvtssL) do
    for _, byte in ipairs(chunk) do
        table.insert(spFzVRBw_flat, byte)
    end
end

local decrypted = whIUfSZQ(spFzVRBw_flat, wBFsrPEW)
local rtHNiAnv, pzHxSkjJ = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(spFzVRBw_flat)
spFzVRBw_flat = nil

if rtHNiAnv then 
    local result = rtHNiAnv() 
    decrypted = nil
    rtHNiAnv = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(pzHxSkjJ)) 
end
