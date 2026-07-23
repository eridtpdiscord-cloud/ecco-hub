-- Protected Segment (db)
local oeSmdFDP = 201
local RYjUXKWh = {
{102,64,174,0,149,159,207,15,105,255,4,85,75,173,38,49,153,92,91,59,29,121,200,165,55,223,20,74,197,15,91,227,244,213,175,187,242,185,102,240,96,249,171,152,174,56,90,52,241,190,123,188,65,150,169,130,23,222,197,70},{3,209,75,214,151,128,64,176,47,105,199,206,255,25,161,162,219,81,6,170,77,165,240,149,226,176,250,208,127,219,192,185,26,92,30,153,101,36,89,26,132,241,91,245,6,225,131,143,190,245,103,250,153,154,98,191,252,49,31,109},{108,107,171,113,190,182,148,122,149,231,25,92,222,128,114,131,228,113,16,161,180,159,240,170,168,100,158,99,83,9,155,22,73,46,192,225,123,101,119,215,81,70,185,148,222,206,59,84,73,174,249,180,214,129,130,5,237,56,236,8},{170,216,32,40,179,119,204,52,236,41,2,185,211,38,52,232,230,78,237,184,125,97,212,180,90,194,17,115,54,220,190,57,150,202,129,126,217,219,235,226,215,108,25,63,225,189,160,253,78,48,213,91,107,243,14,247,60,146,24,83},{13,235,181,138,51,249,29,145,192,179,17,23,113,94,220,133,73,185,22,237,8,150,225,86,19,233,62,75,175,24,16,165,242,11,114,76,209,82,83,95,51,135,156,193,114,93,191,54,234,69,69,69,252,108,174,143,255,41,191,204},{24,135,237,115,234,254,77,22,127,222,196,130,54,235,217,183,107,219,249,239,111,79,54,253,241,119,139,128,38,125,204,175,151,236,126,88,167,200,231,182,206,209,179,185,68,35,129,112,163,23,48,189,252,172,43,34,217,210,33,99},{107,218,75,149,65,133,129,129,149,251,159,32,122,247,220,102,31,85,125,114,12,18,164,73,86,68,18,160,228,38,199,56,25,153,189,0,235,135,22,32,221,250,124,70,148,161,80,22,199,160,122,45,167,44,252,53,43,244,217,198},{222,130,227,151,157,134,143,189,3,200,12,24,100,107,148,78,41,24,160,88,240,55,244,143,61,181,255,39,232,28,89,103,184,176,84,109,100,201,130,248,68,97,217,113,240,128,198,107,195,0,128,253,185,225,155,237,131,186,221}
}
local tmDShEcV = "ScxMpLuunqfmxSWm"

local function eJrHdDIX(eyPiNsWB_data, eyPiNsWB_key)
    if type(eyPiNsWB_key) ~= "string" or #eyPiNsWB_key == 0 then return "" end
    local eyPiNsWB = {}
    for jyqKhSfc = 0, 255 do eyPiNsWB[jyqKhSfc] = jyqKhSfc end
    local wcdnOEwv = 0
    for jyqKhSfc = 0, 255 do
        local vYxqvzqL = eyPiNsWB_key:byte((jyqKhSfc % #eyPiNsWB_key) + 1)
        wcdnOEwv = (wcdnOEwv + eyPiNsWB[jyqKhSfc] + vYxqvzqL) % 256
        eyPiNsWB[jyqKhSfc], eyPiNsWB[wcdnOEwv] = eyPiNsWB[wcdnOEwv], eyPiNsWB[jyqKhSfc]
    end
    local jyqKhSfc = 0
    local wcdnOEwv = 0
    local aGOaFyNW = {}
    for _, JDELPxxY in ipairs(eyPiNsWB_data) do
        jyqKhSfc = (jyqKhSfc + 1) % 256
        wcdnOEwv = (wcdnOEwv + eyPiNsWB[jyqKhSfc]) % 256
        eyPiNsWB[jyqKhSfc], eyPiNsWB[wcdnOEwv] = eyPiNsWB[wcdnOEwv], eyPiNsWB[jyqKhSfc]
        local vYxqvzqL = eyPiNsWB[(eyPiNsWB[jyqKhSfc] + eyPiNsWB[wcdnOEwv]) % 256]
        local unmasked = bit32.bxor(JDELPxxY, oeSmdFDP)
        table.insert(aGOaFyNW, string.char(bit32.bxor(unmasked, vYxqvzqL)))
    end
    return table.concat(aGOaFyNW)
end

local eyPiNsWB_flat = {}
for _, chunk in ipairs(RYjUXKWh) do
    for _, byte in ipairs(chunk) do
        table.insert(eyPiNsWB_flat, byte)
    end
end

local decrypted = eJrHdDIX(eyPiNsWB_flat, tmDShEcV)
local yLlUkIrx, USCLGtkp = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(eyPiNsWB_flat)
eyPiNsWB_flat = nil

if yLlUkIrx then 
    local result = yLlUkIrx() 
    decrypted = nil
    yLlUkIrx = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(USCLGtkp)) 
end
