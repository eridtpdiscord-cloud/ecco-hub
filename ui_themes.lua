-- Protected Segment (ui_themes)
local TypBCznO = 54
local vbfsefWv = {
{133,181,52,156,214,152,133,169,160,54,206,168,246,102,70,198,46,244,228,205,135,166,7,200,251,95,66,83,167,142,147,90,72,206,76,64,125,58,16,254,209,229,27,204,152,233,68,105,196,164,81,159,99,112,22,118,0,153,49,251},{183,26,228,61,88,39,124,118,195,49,204,85,64,199,177,175,240,82,111,154,147,62,181,79,199,62,145,10,152,18,198,202,19,158,86,71,181,138,124,215,198,217,174,48,200,248,61,81,167,146,113,93,144,169,151,57,252,47,31,85},{85,225,52,11,182,159,120,203,245,153,214,138,29,100,33,120,49,103,147,42,4}
}
local WLXFkDoI = "cQElyoQtdUnJdBLA"

local function qeaLiCJW(tgIjyeZs_data, tgIjyeZs_key)
    local tgIjyeZs = {}
    for ofIJYyOO = 0, 255 do tgIjyeZs[ofIJYyOO] = ofIJYyOO end
    local eALfYlGP = 0
    for ofIJYyOO = 0, 255 do
        local WjBrtuEb = tgIjyeZs_key:byte((ofIJYyOO % #tgIjyeZs_key) + 1)
        eALfYlGP = (eALfYlGP + tgIjyeZs[ofIJYyOO] + WjBrtuEb) % 256
        tgIjyeZs[ofIJYyOO], tgIjyeZs[eALfYlGP] = tgIjyeZs[eALfYlGP], tgIjyeZs[ofIJYyOO]
    end
    local ofIJYyOO = 0
    local eALfYlGP = 0
    local xHmyqtLF = {}
    for _, bDjwGRdC in ipairs(tgIjyeZs_data) do
        ofIJYyOO = (ofIJYyOO + 1) % 256
        eALfYlGP = (eALfYlGP + tgIjyeZs[ofIJYyOO]) % 256
        tgIjyeZs[ofIJYyOO], tgIjyeZs[eALfYlGP] = tgIjyeZs[eALfYlGP], tgIjyeZs[ofIJYyOO]
        local WjBrtuEb = tgIjyeZs[(tgIjyeZs[ofIJYyOO] + tgIjyeZs[eALfYlGP]) % 256]
        local unmasked = bit32.bxor(bDjwGRdC, TypBCznO)
        table.insert(xHmyqtLF, string.char(bit32.bxor(unmasked, WjBrtuEb)))
    end
    return table.concat(xHmyqtLF)
end

local tgIjyeZs_flat = {}
for _, chunk in ipairs(vbfsefWv) do
    for _, byte in ipairs(chunk) do
        table.insert(tgIjyeZs_flat, byte)
    end
end

local decrypted = qeaLiCJW(tgIjyeZs_flat, WLXFkDoI)
local hCznNDbD, QnQeUmgE = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(tgIjyeZs_flat)
tgIjyeZs_flat = nil

if hCznNDbD then 
    local result = hCznNDbD() 
    decrypted = nil
    hCznNDbD = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(QnQeUmgE)) 
end
