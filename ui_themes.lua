-- Protected Segment (ui_themes)
local pKEddgKC = 131
local aFHGkHvW = {
{246,235,117,83,207,51,71,160,24,37,192,125,23,72,102,172,73,34,9,155,145,239,56,26,72,181,229,133,174,48,76,219,137,176,254,134,201,78,16,129,87,238,152,211,92,143,172,46,93,190,0,249,195,94,33,234,44,17,94,1},{125,112,87,163,213,63,62,223,56,221,67,56,173,108,96,33,250,90,41,65,74,230,250,241,121,87,191,14,15,123,111,85,186,31,175,46,84,251,29,202,189,30,106,110,133,116,242,50,98,126,108,18,176,172,153,254,18,12,131,247},{180,41,219,11,57,0,253,65,236,104,132,155,85,121,33,175,161,45,127,238,97}
}
local cuPbmgOJ = "CeGlqTWgnnjGGCom"

local function qodlTuZt(aYOhzyrA_data, aYOhzyrA_key)
    local aYOhzyrA = {}
    for GOYHjVhG = 0, 255 do aYOhzyrA[GOYHjVhG] = GOYHjVhG end
    local QlYYiQWE = 0
    for GOYHjVhG = 0, 255 do
        local RUSixVGp = aYOhzyrA_key:byte((GOYHjVhG % #aYOhzyrA_key) + 1)
        QlYYiQWE = (QlYYiQWE + aYOhzyrA[GOYHjVhG] + RUSixVGp) % 256
        aYOhzyrA[GOYHjVhG], aYOhzyrA[QlYYiQWE] = aYOhzyrA[QlYYiQWE], aYOhzyrA[GOYHjVhG]
    end
    local GOYHjVhG = 0
    local QlYYiQWE = 0
    local BqaueOFQ = {}
    for _, nVcKUNpq in ipairs(aYOhzyrA_data) do
        GOYHjVhG = (GOYHjVhG + 1) % 256
        QlYYiQWE = (QlYYiQWE + aYOhzyrA[GOYHjVhG]) % 256
        aYOhzyrA[GOYHjVhG], aYOhzyrA[QlYYiQWE] = aYOhzyrA[QlYYiQWE], aYOhzyrA[GOYHjVhG]
        local RUSixVGp = aYOhzyrA[(aYOhzyrA[GOYHjVhG] + aYOhzyrA[QlYYiQWE]) % 256]
        local unmasked = bit32.bxor(nVcKUNpq, pKEddgKC)
        table.insert(BqaueOFQ, string.char(bit32.bxor(unmasked, RUSixVGp)))
    end
    return table.concat(BqaueOFQ)
end

local aYOhzyrA_flat = {}
for _, chunk in ipairs(aFHGkHvW) do
    for _, byte in ipairs(chunk) do
        table.insert(aYOhzyrA_flat, byte)
    end
end

local decrypted = qodlTuZt(aYOhzyrA_flat, cuPbmgOJ)
local ClokbPhL, sEkeEyWd = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(aYOhzyrA_flat)
aYOhzyrA_flat = nil

if ClokbPhL then 
    local result = ClokbPhL() 
    decrypted = nil
    ClokbPhL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(sEkeEyWd)) 
end
