-- Protected Segment (ui_themes)
local SZrZkmDf = 93
local CVkgwXog = {
{159,153,127,118,11,209,52,189,70,240,90,136,56,26,219,86,209,66,137,88,251,107,147,88,127,46,82,68,164,123,186,77,152,93,60,224,255,235,24,63,44,75,15,33,43,61,200,122,215,73,244,155,171,92,97,240,57,190,242,119},{12,10,121,86,188,229,22,222,233,132,145,25,25,112,70,39,158,77,139,202,47,158,61,125,145,123,250,3,41,13,78,27,4,55,126,7,126,14,223,182,233,121,182,107,176,108,110,81,231,21,122,95,17,74,181,23,11,128,130,225},{67,120,227,76,29,129,178,39,142,71,42,110,201,152,201,235,62,107,203,32,121}
}
local aBhVVjgi = "OkPQqtxnzZYFELvV"

local function TrqjhDID(KLQbYgdS_data, KLQbYgdS_key)
    local KLQbYgdS = {}
    for LsOHqjGM = 0, 255 do KLQbYgdS[LsOHqjGM] = LsOHqjGM end
    local oFeJqiKR = 0
    for LsOHqjGM = 0, 255 do
        local xfaTCmiL = KLQbYgdS_key:byte((LsOHqjGM % #KLQbYgdS_key) + 1)
        oFeJqiKR = (oFeJqiKR + KLQbYgdS[LsOHqjGM] + xfaTCmiL) % 256
        KLQbYgdS[LsOHqjGM], KLQbYgdS[oFeJqiKR] = KLQbYgdS[oFeJqiKR], KLQbYgdS[LsOHqjGM]
    end
    local LsOHqjGM = 0
    local oFeJqiKR = 0
    local qfHKfKZM = {}
    for _, KUkbPSTZ in ipairs(KLQbYgdS_data) do
        LsOHqjGM = (LsOHqjGM + 1) % 256
        oFeJqiKR = (oFeJqiKR + KLQbYgdS[LsOHqjGM]) % 256
        KLQbYgdS[LsOHqjGM], KLQbYgdS[oFeJqiKR] = KLQbYgdS[oFeJqiKR], KLQbYgdS[LsOHqjGM]
        local xfaTCmiL = KLQbYgdS[(KLQbYgdS[LsOHqjGM] + KLQbYgdS[oFeJqiKR]) % 256]
        local unmasked = bit32.bxor(KUkbPSTZ, SZrZkmDf)
        table.insert(qfHKfKZM, string.char(bit32.bxor(unmasked, xfaTCmiL)))
    end
    return table.concat(qfHKfKZM)
end

local KLQbYgdS_flat = {}
for _, chunk in ipairs(CVkgwXog) do
    for _, byte in ipairs(chunk) do
        table.insert(KLQbYgdS_flat, byte)
    end
end

local decrypted = TrqjhDID(KLQbYgdS_flat, aBhVVjgi)
local puJIrkjv, FXorsxnF = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(KLQbYgdS_flat)
KLQbYgdS_flat = nil

if puJIrkjv then 
    local result = puJIrkjv() 
    decrypted = nil
    puJIrkjv = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(FXorsxnF)) 
end
