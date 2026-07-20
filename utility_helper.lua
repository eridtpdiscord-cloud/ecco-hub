-- Compiled secure segment
local nRqCqCWe = {
{207,205,165,186,111,211,223,158,174,99,233,222,237,247,24,10,161,181,27,144,168,211,227,99,60,214,48,237,73,49,129,240,170,218,42,115,249,226,73,124,210,15,214,176,81,83,132,228,201,132,222,43,165,102,145,132,66,242,128,253},{18,74,17,139,102,111,84,83,236,199,236,138,229,156,120,183,18,3,245,106,110,215,192,161,247,105,120,191,19,243,196,166,166,219,199,48,252,251,73,127,15,218,201,14,205,200,25,226,190,98,172,249,233,107,9,131,56,16,39,252},{183,36,196,208,38,45,19,227,42,95,40,129,225,175,143,168,111,128,128,159,60,82,192,28,243,253}
}
local PeqtzkMm = "kPGvxpCeEoRWqBtn"

local function SgyPUEnx(FRliNAAL_data, FRliNAAL_key)
    local FRliNAAL = {}
    for tEIRyRJT = 0, 255 do FRliNAAL[tEIRyRJT] = tEIRyRJT end
    local HoOXTxRY = 0
    for tEIRyRJT = 0, 255 do
        local kJegLXWx = FRliNAAL_key:byte((tEIRyRJT % #FRliNAAL_key) + 1)
        HoOXTxRY = (HoOXTxRY + FRliNAAL[tEIRyRJT] + kJegLXWx) % 256
        FRliNAAL[tEIRyRJT], FRliNAAL[HoOXTxRY] = FRliNAAL[HoOXTxRY], FRliNAAL[tEIRyRJT]
    end
    local tEIRyRJT = 0
    local HoOXTxRY = 0
    local oafpWZCv = {}
    for _, wprKJtrU in ipairs(FRliNAAL_data) do
        tEIRyRJT = (tEIRyRJT + 1) % 256
        HoOXTxRY = (HoOXTxRY + FRliNAAL[tEIRyRJT]) % 256
        FRliNAAL[tEIRyRJT], FRliNAAL[HoOXTxRY] = FRliNAAL[HoOXTxRY], FRliNAAL[tEIRyRJT]
        local kJegLXWx = FRliNAAL[(FRliNAAL[tEIRyRJT] + FRliNAAL[HoOXTxRY]) % 256]
        table.insert(oafpWZCv, string.char(bit32.bxor(wprKJtrU, kJegLXWx)))
    end
    return table.concat(oafpWZCv)
end

local FRliNAAL_flat = {}
for _, chunk in ipairs(nRqCqCWe) do
    for _, byte in ipairs(chunk) do
        table.insert(FRliNAAL_flat, byte)
    end
end

local decrypted = SgyPUEnx(FRliNAAL_flat, PeqtzkMm)
local GzVRkzMs, GLJOBAbh = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(FRliNAAL_flat)
FRliNAAL_flat = nil

if GzVRkzMs then 
    local result = GzVRkzMs() 
    decrypted = nil
    GzVRkzMs = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(GLJOBAbh)) 
end
