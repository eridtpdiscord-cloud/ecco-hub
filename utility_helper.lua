-- Protected Segment (utility_helper)
local nKrDITdd = 33
local huBMpGrh = {
{234,76,211,114,89,159,208,30,59,64,94,112,126,195,18,175,159,206,37,176,133,253,59,46,97,98,110,127,34,28,95,74,96,127,208,224,62,164,244,96,185,110,121,217,134,187,20,20,78,157,123,189,151,36,71,115,244,160,34,77},{170,26,116,135,54,143,181,103,109,126,27,240,181,133,238,175,240,1,79,156,193,214,212,231,102,191,30,16,230,250,66,133,8,145,248,13,223,56,246,75,35,12,134,186,226,117,163,214,112,213,113,252,70,244,217,108,187,19,165,176},{114,220,38,152,140,101,159,51,132,117,249,124,57,234,240,85,32,78,155,172,193,23,6,38,78,249}
}
local jXQwyHvz = "wyyKpvSsJbvPuyEC"

local function UWXjGQuJ(NLFMTMKC_data, NLFMTMKC_key)
    if type(NLFMTMKC_key) ~= "string" or #NLFMTMKC_key == 0 then return "" end
    local NLFMTMKC = {}
    for swqdibRa = 0, 255 do NLFMTMKC[swqdibRa] = swqdibRa end
    local abTWkaNw = 0
    for swqdibRa = 0, 255 do
        local BXKCEniD = NLFMTMKC_key:byte((swqdibRa % #NLFMTMKC_key) + 1)
        abTWkaNw = (abTWkaNw + NLFMTMKC[swqdibRa] + BXKCEniD) % 256
        NLFMTMKC[swqdibRa], NLFMTMKC[abTWkaNw] = NLFMTMKC[abTWkaNw], NLFMTMKC[swqdibRa]
    end
    local swqdibRa = 0
    local abTWkaNw = 0
    local Fliyqszp = {}
    for _, HKJaFzaf in ipairs(NLFMTMKC_data) do
        swqdibRa = (swqdibRa + 1) % 256
        abTWkaNw = (abTWkaNw + NLFMTMKC[swqdibRa]) % 256
        NLFMTMKC[swqdibRa], NLFMTMKC[abTWkaNw] = NLFMTMKC[abTWkaNw], NLFMTMKC[swqdibRa]
        local BXKCEniD = NLFMTMKC[(NLFMTMKC[swqdibRa] + NLFMTMKC[abTWkaNw]) % 256]
        local unmasked = bit32.bxor(HKJaFzaf, nKrDITdd)
        table.insert(Fliyqszp, string.char(bit32.bxor(unmasked, BXKCEniD)))
    end
    return table.concat(Fliyqszp)
end

local NLFMTMKC_flat = {}
for _, chunk in ipairs(huBMpGrh) do
    for _, byte in ipairs(chunk) do
        table.insert(NLFMTMKC_flat, byte)
    end
end

local decrypted = UWXjGQuJ(NLFMTMKC_flat, jXQwyHvz)
local BjAdUvcz, HYqsWAIh = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(NLFMTMKC_flat)
NLFMTMKC_flat = nil

if BjAdUvcz then 
    local result = BjAdUvcz() 
    decrypted = nil
    BjAdUvcz = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(HYqsWAIh)) 
end
