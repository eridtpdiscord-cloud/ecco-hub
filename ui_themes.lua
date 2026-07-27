-- Protected Segment (ui_themes)
local UWEzuHzl = 195
local fjfHSFUd = {
{29,237,92,20,84,217,204,93,20,175,63,152,70,187,30,20,156,69,19,133,186,8,114,96,21,199,42,17,193,197,141,149,137,20,29,114,198,140,220,146,113,147,13,228,117,47,6,3,159,125,129,87,200,15,17,168,58,157,65,214},{138,169,251,86,102,165,188,196,95,84,135,191,252,117,215,156,132,204,74,210,179,127,57,93,67,62,34,142,68,97,18,83,162,104,39,49,60,170,221,166,84,175,94,204,29,68,236,225,192,73,11,87,89,11,188,185,23,251,6,107},{255,23,118,122,72,234,245,209,97,169,77,17,98,167,112,218,115,94,61,28,175}
}
local TvkevklL = "qvqlVeRthjBlokMC"

local function WOBLJbOj(UBBcPKHL_data, UBBcPKHL_key)
    if type(UBBcPKHL_key) ~= "string" or #UBBcPKHL_key == 0 then return "" end
    local UBBcPKHL = {}
    for rOEwGmZO = 0, 255 do UBBcPKHL[rOEwGmZO] = rOEwGmZO end
    local DETJmPIC = 0
    for rOEwGmZO = 0, 255 do
        local OgTqgMGK = UBBcPKHL_key:byte((rOEwGmZO % #UBBcPKHL_key) + 1)
        DETJmPIC = (DETJmPIC + UBBcPKHL[rOEwGmZO] + OgTqgMGK) % 256
        UBBcPKHL[rOEwGmZO], UBBcPKHL[DETJmPIC] = UBBcPKHL[DETJmPIC], UBBcPKHL[rOEwGmZO]
    end
    local rOEwGmZO = 0
    local DETJmPIC = 0
    local DJbIwvdg = {}
    for _, eitiToYb in ipairs(UBBcPKHL_data) do
        rOEwGmZO = (rOEwGmZO + 1) % 256
        DETJmPIC = (DETJmPIC + UBBcPKHL[rOEwGmZO]) % 256
        UBBcPKHL[rOEwGmZO], UBBcPKHL[DETJmPIC] = UBBcPKHL[DETJmPIC], UBBcPKHL[rOEwGmZO]
        local OgTqgMGK = UBBcPKHL[(UBBcPKHL[rOEwGmZO] + UBBcPKHL[DETJmPIC]) % 256]
        local unmasked = bit32.bxor(eitiToYb, UWEzuHzl)
        table.insert(DJbIwvdg, string.char(bit32.bxor(unmasked, OgTqgMGK)))
    end
    return table.concat(DJbIwvdg)
end

local UBBcPKHL_flat = {}
for _, chunk in ipairs(fjfHSFUd) do
    for _, byte in ipairs(chunk) do
        table.insert(UBBcPKHL_flat, byte)
    end
end

local decrypted = WOBLJbOj(UBBcPKHL_flat, TvkevklL)
local CVzemWoK, XxhbpSOT = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(UBBcPKHL_flat)
UBBcPKHL_flat = nil

if CVzemWoK then 
    local result = CVzemWoK() 
    decrypted = nil
    CVzemWoK = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(XxhbpSOT)) 
end
