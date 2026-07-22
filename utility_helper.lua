-- Protected Segment (utility_helper)
local sbEcVgOj = 156
local dyhnXLvg = {
{236,204,14,235,123,11,228,209,53,102,51,104,55,67,161,151,136,157,216,169,252,157,240,216,227,16,32,206,167,41,229,24,103,83,41,164,180,214,169,67,113,145,61,87,151,223,200,189,180,116,0,114,96,90,44,132,78,13,3,176},{78,142,118,172,121,45,37,74,205,123,243,26,180,127,254,1,166,167,195,248,148,84,202,108,37,165,176,65,23,203,104,244,35,26,199,66,183,124,74,56,75,2,143,127,163,144,92,109,49,183,186,136,157,250,153,133,210,153,85,19},{186,192,210,24,56,193,35,94,17,189,63,50,101,166,62,131,216,188,64,69,16,245,177,42,24,191}
}
local UemmCwdp = "OMJHNzRyDIYHLawi"

local function TICrYiqQ(cjSLSGVt_data, cjSLSGVt_key)
    local cjSLSGVt = {}
    for JoTtkiar = 0, 255 do cjSLSGVt[JoTtkiar] = JoTtkiar end
    local CqpZplQn = 0
    for JoTtkiar = 0, 255 do
        local QScEQzds = cjSLSGVt_key:byte((JoTtkiar % #cjSLSGVt_key) + 1)
        CqpZplQn = (CqpZplQn + cjSLSGVt[JoTtkiar] + QScEQzds) % 256
        cjSLSGVt[JoTtkiar], cjSLSGVt[CqpZplQn] = cjSLSGVt[CqpZplQn], cjSLSGVt[JoTtkiar]
    end
    local JoTtkiar = 0
    local CqpZplQn = 0
    local MnoKjGgj = {}
    for _, gZTknopE in ipairs(cjSLSGVt_data) do
        JoTtkiar = (JoTtkiar + 1) % 256
        CqpZplQn = (CqpZplQn + cjSLSGVt[JoTtkiar]) % 256
        cjSLSGVt[JoTtkiar], cjSLSGVt[CqpZplQn] = cjSLSGVt[CqpZplQn], cjSLSGVt[JoTtkiar]
        local QScEQzds = cjSLSGVt[(cjSLSGVt[JoTtkiar] + cjSLSGVt[CqpZplQn]) % 256]
        local unmasked = bit32.bxor(gZTknopE, sbEcVgOj)
        table.insert(MnoKjGgj, string.char(bit32.bxor(unmasked, QScEQzds)))
    end
    return table.concat(MnoKjGgj)
end

local cjSLSGVt_flat = {}
for _, chunk in ipairs(dyhnXLvg) do
    for _, byte in ipairs(chunk) do
        table.insert(cjSLSGVt_flat, byte)
    end
end

local decrypted = TICrYiqQ(cjSLSGVt_flat, UemmCwdp)
local zSsHCFgs, OLopOCws = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(cjSLSGVt_flat)
cjSLSGVt_flat = nil

if zSsHCFgs then 
    local result = zSsHCFgs() 
    decrypted = nil
    zSsHCFgs = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(OLopOCws)) 
end
