-- Protected Segment (db)
local ZZopXcMq = 132
local huhkDtLd = {
{203,158,53,16,216,248,228,201,204,110,71,110,98,129,7,237,177,201,47,82,156,48,110,186,12,144,13,108,150,27,218,26,127,178,3,114,92,98,212,220,202,226,56,180,243,61,196,105,124,164,115,109,22,65,174,229,143,198,96,216},{232,213,29,210,33,231,56,221,164,42,39,216,132,246,12,121,176,15,238,70,241,241,85,212,57,204,28,80,181,223,81,95,28,228,129,206,249,224,101,40,190,179,28,112,250,144,235,161,65,224,170,178,232,86,145,11,255,6,232,157},{9,254,120,237,121,105,9,110,151,176,123,52,12,205,167,179,30,52,248,242,222,175,172,178,194,72,210,81,21,235,15,13,254,183,72,161,250,49,57,54,154,168,17,97,13,139,198,33,247,77,170,98,87,166,5,186,173,182,20,17},{236,5,235,29,234,7,85,111,15,0,80,230,17,240,227,247,203,185,249,67,211,120,203,116,19,103,48,2,1,181,216,10,95,55,253,180,23,217,48,75,112,59,124,40,2,64,28,147,52,231,40,110,148,207,53,173,131,150,225,2},{142,52,139,237,7,231,44,125,199,159,108,172,19,101,206,65,75,212,93,136,236,217,28,0,206,170,207,33,167,44,165,247,15,223,186,16,52,139,92,232,248,232,234,165,135,196,163,218,205,47,237,102,183,61,119,22,88,203,50,40},{71,38,187,254,110,56,160,68,241,46,183,115,44,239,63,124,166,45,218,252,195,4,234,57,146,71,210,191,101,244,144,252,254,246,150,187,78,177,103,169,169,174,122,1,22,142,248,39,191,147,246,109,252,69,121,229,221,227,145,205},{205,213,143,117,249,76,21,81,6,178,120,203,113,193,76,23,240,68,48,181,21,132,123,220,229,98,41,163,120,185,179,145,15,234,207,140,52,104,245,13,99,254,113,204,9,76,42,238,30,114,207,197,255,25,35,22,80,106,187,4},{151,132,140,31,179,234,226,14,249,12,124,177,10,163,56,158,160,212,56,192,32,71,172,110,179,193,68,3,48,81,75,50,160,179,210,211,15,142,143,10,221,145,175,220,4,9,37,96,199,106,103,124,13,36,160,193,22,175,167,224}
}
local nWxSaYLz = "pFwbIAvgsNjebTmg"

local function LewctxGR(bgMqKgiX_data, bgMqKgiX_key)
    local bgMqKgiX = {}
    for TgUzXuvC = 0, 255 do bgMqKgiX[TgUzXuvC] = TgUzXuvC end
    local PhnFiMAJ = 0
    for TgUzXuvC = 0, 255 do
        local IuVGaBwK = bgMqKgiX_key:byte((TgUzXuvC % #bgMqKgiX_key) + 1)
        PhnFiMAJ = (PhnFiMAJ + bgMqKgiX[TgUzXuvC] + IuVGaBwK) % 256
        bgMqKgiX[TgUzXuvC], bgMqKgiX[PhnFiMAJ] = bgMqKgiX[PhnFiMAJ], bgMqKgiX[TgUzXuvC]
    end
    local TgUzXuvC = 0
    local PhnFiMAJ = 0
    local YntoOknh = {}
    for _, svFEntDY in ipairs(bgMqKgiX_data) do
        TgUzXuvC = (TgUzXuvC + 1) % 256
        PhnFiMAJ = (PhnFiMAJ + bgMqKgiX[TgUzXuvC]) % 256
        bgMqKgiX[TgUzXuvC], bgMqKgiX[PhnFiMAJ] = bgMqKgiX[PhnFiMAJ], bgMqKgiX[TgUzXuvC]
        local IuVGaBwK = bgMqKgiX[(bgMqKgiX[TgUzXuvC] + bgMqKgiX[PhnFiMAJ]) % 256]
        local unmasked = bit32.bxor(svFEntDY, ZZopXcMq)
        table.insert(YntoOknh, string.char(bit32.bxor(unmasked, IuVGaBwK)))
    end
    return table.concat(YntoOknh)
end

local bgMqKgiX_flat = {}
for _, chunk in ipairs(huhkDtLd) do
    for _, byte in ipairs(chunk) do
        table.insert(bgMqKgiX_flat, byte)
    end
end

local decrypted = LewctxGR(bgMqKgiX_flat, nWxSaYLz)
local pcCdOsgN, GACEkEoS = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(bgMqKgiX_flat)
bgMqKgiX_flat = nil

if pcCdOsgN then 
    local result = pcCdOsgN() 
    decrypted = nil
    pcCdOsgN = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(GACEkEoS)) 
end
