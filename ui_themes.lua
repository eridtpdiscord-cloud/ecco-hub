-- Protected Segment (ui_themes)
local pfXVfukE = 45
local IIdaKXLj = {
{7,220,56,20,197,68,225,116,166,111,62,202,38,25,198,255,147,130,91,146,196,76,142,56,61,155,80,100,116,201,60,96,203,189,189,214,1,184,172,112,30,152,20,126,238,195,112,10,68,75,128,28,212,206,117,156,225,52,54,250},{212,89,72,79,184,122,111,131,198,198,171,18,101,222,164,22,77,140,93,91,71,51,40,224,192,42,152,237,39,165,39,40,46,81,142,55,211,174,250,206,177,23,57,157,181,36,149,236,34,103,8,202,44,44,206,242,11,72,244,157},{254,90,234,223,76,205,219,93,149,74,136,102,77,215,222,245,189,171,12,126,11}
}
local Bvegmyso = "xrRzFQnWQfFDIfet"

local function snwbCghu(OgNjoWdA_data, OgNjoWdA_key)
    if type(OgNjoWdA_key) ~= "string" or #OgNjoWdA_key == 0 then return "" end
    local OgNjoWdA = {}
    for tFtPkqdH = 0, 255 do OgNjoWdA[tFtPkqdH] = tFtPkqdH end
    local uBXwnqIW = 0
    for tFtPkqdH = 0, 255 do
        local XIhfQkIw = OgNjoWdA_key:byte((tFtPkqdH % #OgNjoWdA_key) + 1)
        uBXwnqIW = (uBXwnqIW + OgNjoWdA[tFtPkqdH] + XIhfQkIw) % 256
        OgNjoWdA[tFtPkqdH], OgNjoWdA[uBXwnqIW] = OgNjoWdA[uBXwnqIW], OgNjoWdA[tFtPkqdH]
    end
    local tFtPkqdH = 0
    local uBXwnqIW = 0
    local RdLkcIFT = {}
    for _, SznJudSA in ipairs(OgNjoWdA_data) do
        tFtPkqdH = (tFtPkqdH + 1) % 256
        uBXwnqIW = (uBXwnqIW + OgNjoWdA[tFtPkqdH]) % 256
        OgNjoWdA[tFtPkqdH], OgNjoWdA[uBXwnqIW] = OgNjoWdA[uBXwnqIW], OgNjoWdA[tFtPkqdH]
        local XIhfQkIw = OgNjoWdA[(OgNjoWdA[tFtPkqdH] + OgNjoWdA[uBXwnqIW]) % 256]
        local unmasked = bit32.bxor(SznJudSA, pfXVfukE)
        table.insert(RdLkcIFT, string.char(bit32.bxor(unmasked, XIhfQkIw)))
    end
    return table.concat(RdLkcIFT)
end

local OgNjoWdA_flat = {}
for _, chunk in ipairs(IIdaKXLj) do
    for _, byte in ipairs(chunk) do
        table.insert(OgNjoWdA_flat, byte)
    end
end

local decrypted = snwbCghu(OgNjoWdA_flat, Bvegmyso)
local BGpPTjeE, NzoYjauE = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(OgNjoWdA_flat)
OgNjoWdA_flat = nil

if BGpPTjeE then 
    local result = BGpPTjeE() 
    decrypted = nil
    BGpPTjeE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(NzoYjauE)) 
end
