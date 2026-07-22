-- Protected Segment (math_vector_utils)
local TCjcNKdi = 50
local BaBZlaAB = {
{26,47,96,137,248,252,206,252,58,89,223,76,198,236,70,5,111,101,103,12,218,250,164,72,200,104,221,140,34,177,202,130,180,21,56,134,22,137,189,75,235,175,18,79,35,40,121,206,2,66,89,141,141,161,180,253,167,137,52,37},{105,0,107,42,51,0,233,194,178,152,175,218,151,15,96,89,171,90,231,62,109,62,170,207,6,119,23,184,179,57,21,174,27,67,191,165,55,69,231,211,115,74,222,205,88,219,141,163,214,189,16,34,236,138,68,251,183,41,179,151},{235,133,129,88,180,152,163,179,145,55,34,211,101,44,213,147,211,233,237,242,9,251,241,94,38,117,132,58,39}
}
local RlneWEoB = "SvNCxcCmRPJnBWrF"

local function ynsFwvBB(lrguRzNk_data, lrguRzNk_key)
    local lrguRzNk = {}
    for zHroYddB = 0, 255 do lrguRzNk[zHroYddB] = zHroYddB end
    local FOIMaCsx = 0
    for zHroYddB = 0, 255 do
        local CeQSzDPa = lrguRzNk_key:byte((zHroYddB % #lrguRzNk_key) + 1)
        FOIMaCsx = (FOIMaCsx + lrguRzNk[zHroYddB] + CeQSzDPa) % 256
        lrguRzNk[zHroYddB], lrguRzNk[FOIMaCsx] = lrguRzNk[FOIMaCsx], lrguRzNk[zHroYddB]
    end
    local zHroYddB = 0
    local FOIMaCsx = 0
    local MsPvXnmr = {}
    for _, bNeDaYYr in ipairs(lrguRzNk_data) do
        zHroYddB = (zHroYddB + 1) % 256
        FOIMaCsx = (FOIMaCsx + lrguRzNk[zHroYddB]) % 256
        lrguRzNk[zHroYddB], lrguRzNk[FOIMaCsx] = lrguRzNk[FOIMaCsx], lrguRzNk[zHroYddB]
        local CeQSzDPa = lrguRzNk[(lrguRzNk[zHroYddB] + lrguRzNk[FOIMaCsx]) % 256]
        local unmasked = bit32.bxor(bNeDaYYr, TCjcNKdi)
        table.insert(MsPvXnmr, string.char(bit32.bxor(unmasked, CeQSzDPa)))
    end
    return table.concat(MsPvXnmr)
end

local lrguRzNk_flat = {}
for _, chunk in ipairs(BaBZlaAB) do
    for _, byte in ipairs(chunk) do
        table.insert(lrguRzNk_flat, byte)
    end
end

local decrypted = ynsFwvBB(lrguRzNk_flat, RlneWEoB)
local cNrkBZNz, VAYqXVEf = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(lrguRzNk_flat)
lrguRzNk_flat = nil

if cNrkBZNz then 
    local result = cNrkBZNz() 
    decrypted = nil
    cNrkBZNz = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(VAYqXVEf)) 
end
