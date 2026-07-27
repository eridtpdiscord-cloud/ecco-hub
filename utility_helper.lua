-- Protected Segment (utility_helper)
local AapUxWTl = 27
local DdXLktXd = {
{222,31,164,237,93,57,23,193,182,163,224,60,225,44,159,88,146,163,51,192,70,226,226,181,238,124,94,66,73,233,55,209,236,174,71,9,85,170,52,131,39,50,227,123,141,220,79,214,177,137,189,49,13,86,41,140,157,227,149,91},{132,173,147,23,24,16,124,195,233,221,98,104,231,185,78,135,82,167,36,190,147,147,78,89,153,217,66,139,185,101,27,101,46,247,29,163,93,24,160,90,8,229,118,9,197,4,214,193,49,255,41,142,82,217,12,214,152,202,119,197},{32,172,221,161,231,84,109,153,37,114,147,74,128,232,3,202,240,60,174,229,125,74,235,146,15,121}
}
local jEhGFbqO = "MfOltGjBvYsYIgDG"

local function SSofUIkO(aqPrGbMc_data, aqPrGbMc_key)
    if type(aqPrGbMc_key) ~= "string" or #aqPrGbMc_key == 0 then return "" end
    local aqPrGbMc = {}
    for vsekcXNA = 0, 255 do aqPrGbMc[vsekcXNA] = vsekcXNA end
    local CRTmxJlG = 0
    for vsekcXNA = 0, 255 do
        local RPylpuZS = aqPrGbMc_key:byte((vsekcXNA % #aqPrGbMc_key) + 1)
        CRTmxJlG = (CRTmxJlG + aqPrGbMc[vsekcXNA] + RPylpuZS) % 256
        aqPrGbMc[vsekcXNA], aqPrGbMc[CRTmxJlG] = aqPrGbMc[CRTmxJlG], aqPrGbMc[vsekcXNA]
    end
    local vsekcXNA = 0
    local CRTmxJlG = 0
    local EYBkcxYY = {}
    for _, cdZBcNhV in ipairs(aqPrGbMc_data) do
        vsekcXNA = (vsekcXNA + 1) % 256
        CRTmxJlG = (CRTmxJlG + aqPrGbMc[vsekcXNA]) % 256
        aqPrGbMc[vsekcXNA], aqPrGbMc[CRTmxJlG] = aqPrGbMc[CRTmxJlG], aqPrGbMc[vsekcXNA]
        local RPylpuZS = aqPrGbMc[(aqPrGbMc[vsekcXNA] + aqPrGbMc[CRTmxJlG]) % 256]
        local unmasked = bit32.bxor(cdZBcNhV, AapUxWTl)
        table.insert(EYBkcxYY, string.char(bit32.bxor(unmasked, RPylpuZS)))
    end
    return table.concat(EYBkcxYY)
end

local aqPrGbMc_flat = {}
for _, chunk in ipairs(DdXLktXd) do
    for _, byte in ipairs(chunk) do
        table.insert(aqPrGbMc_flat, byte)
    end
end

local decrypted = SSofUIkO(aqPrGbMc_flat, jEhGFbqO)
local noifZvjW, pxlXMxdz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(aqPrGbMc_flat)
aqPrGbMc_flat = nil

if noifZvjW then 
    local result = noifZvjW() 
    decrypted = nil
    noifZvjW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(pxlXMxdz)) 
end
