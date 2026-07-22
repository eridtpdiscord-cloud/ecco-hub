-- Protected Segment (ui_themes)
local hcrDRMME = 153
local DxhLGOdl = {
{95,161,193,242,66,88,191,7,33,158,181,7,129,202,39,245,115,196,221,83,8,9,105,73,233,73,94,86,179,35,162,93,110,113,49,112,118,199,232,168,154,9,231,132,225,223,33,157,124,185,95,201,195,1,131,136,194,193,136,80},{116,40,137,231,218,66,9,125,92,180,19,239,83,141,150,122,24,30,86,111,174,201,35,235,24,185,176,95,78,200,254,103,2,181,51,203,244,228,110,237,172,56,52,44,87,254,64,205,210,100,14,27,145,189,22,58,217,20,195,210},{75,70,124,239,36,153,245,189,176,43,149,26,117,48,184,136,76,204,100,176,106}
}
local njkAfleD = "fKYQNuBwcrrJADTz"

local function qnVJpRPX(qOftBwyv_data, qOftBwyv_key)
    local qOftBwyv = {}
    for onUwTSDU = 0, 255 do qOftBwyv[onUwTSDU] = onUwTSDU end
    local smGwBadX = 0
    for onUwTSDU = 0, 255 do
        local IzRIajjv = qOftBwyv_key:byte((onUwTSDU % #qOftBwyv_key) + 1)
        smGwBadX = (smGwBadX + qOftBwyv[onUwTSDU] + IzRIajjv) % 256
        qOftBwyv[onUwTSDU], qOftBwyv[smGwBadX] = qOftBwyv[smGwBadX], qOftBwyv[onUwTSDU]
    end
    local onUwTSDU = 0
    local smGwBadX = 0
    local ophekdYW = {}
    for _, MFrtEYCP in ipairs(qOftBwyv_data) do
        onUwTSDU = (onUwTSDU + 1) % 256
        smGwBadX = (smGwBadX + qOftBwyv[onUwTSDU]) % 256
        qOftBwyv[onUwTSDU], qOftBwyv[smGwBadX] = qOftBwyv[smGwBadX], qOftBwyv[onUwTSDU]
        local IzRIajjv = qOftBwyv[(qOftBwyv[onUwTSDU] + qOftBwyv[smGwBadX]) % 256]
        local unmasked = bit32.bxor(MFrtEYCP, hcrDRMME)
        table.insert(ophekdYW, string.char(bit32.bxor(unmasked, IzRIajjv)))
    end
    return table.concat(ophekdYW)
end

local qOftBwyv_flat = {}
for _, chunk in ipairs(DxhLGOdl) do
    for _, byte in ipairs(chunk) do
        table.insert(qOftBwyv_flat, byte)
    end
end

local decrypted = qnVJpRPX(qOftBwyv_flat, njkAfleD)
local ODYqKPgE, MHJttIyJ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(qOftBwyv_flat)
qOftBwyv_flat = nil

if ODYqKPgE then 
    local result = ODYqKPgE() 
    decrypted = nil
    ODYqKPgE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(MHJttIyJ)) 
end
