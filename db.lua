-- Protected Segment (db)
local ggiVnvhi = 110
local ZsnRghBv = {
{160,126,200,95,230,72,191,24,81,225,42,81,126,191,219,58,6,242,233,170,82,237,126,45,5,193,64,225,152,187,232,0,104,115,18,148,73,91,143,19,113,253,221,231,76,193,51,123,63,4,104,170,237,51,86,149,99,32,128,124},{151,204,88,145,214,55,104,190,208,56,1,16,104,77,206,53,139,181,85,178,232,135,171,143,49,178,8,49,221,217,248,13,249,235,44,87,233,65,127,40,58,146,50,17,43,179,120,147,255,43,152,223,142,137,75,163,86,245,243,244},{97,131,169,173,248,174,177,3,80,193,140,227,34,18,242,156,121,105,139,230,93,50,150,251,237,197,175,232,140,242,78,71,189,232,192,160,15,35,123,139,168,79,49,162,58,48,122,247,32,190,228,86,210,65,241,2,220,103,25,183},{99,226,225,45,126,6,56,249,4,84,13,137,249,63,153,10,172,107,49,3,227,11,95,44,203,114,26,227,26,186,104,54,146,163,72,107,113,176,202,9,19,14,153,210,95,10,194,240,184,206,48,187,217,213,57,11,137,33,127,210},{199,75,193,131,230,211,131,112,152,176,69,70,11,137,195,44,216,110,41,137,95,215,66,43,15,136,164,98,206,246,243,64,157,163,68,198,217,52,199,225,112,105,247,151,197,55,91,94,226,138,93,52,215,49,59,72,25,51,175,36},{200,17,122,163,142,33,234,61,194,233,173,139,127,44,175,105,183,206,146,24,93,74,200,209,97,82,146,131,224,113,108,161,84,37,12,127,92,224,115,78,223,241,114,106,197,204,61,100,79,26,47,42,12,86,59,13,83,133,12,67},{234,32,240,225,35,164,129,151,218,136,157,154,92,128,111,165,181,65,3,117,121,242,190,63,191,209,110,132,12,213,110,203,63,153,224,250,187,15,15,103,131,227,153,64,157,26}
}
local KgXLgQdH = "EiOZVejiwpJGbckP"

local function CDMBDwbO(PvbEbSIW_data, PvbEbSIW_key)
    local PvbEbSIW = {}
    for XjUHZImh = 0, 255 do PvbEbSIW[XjUHZImh] = XjUHZImh end
    local JcPbRpaV = 0
    for XjUHZImh = 0, 255 do
        local qNHoEUwd = PvbEbSIW_key:byte((XjUHZImh % #PvbEbSIW_key) + 1)
        JcPbRpaV = (JcPbRpaV + PvbEbSIW[XjUHZImh] + qNHoEUwd) % 256
        PvbEbSIW[XjUHZImh], PvbEbSIW[JcPbRpaV] = PvbEbSIW[JcPbRpaV], PvbEbSIW[XjUHZImh]
    end
    local XjUHZImh = 0
    local JcPbRpaV = 0
    local FchkEBNp = {}
    for _, XBiNveOH in ipairs(PvbEbSIW_data) do
        XjUHZImh = (XjUHZImh + 1) % 256
        JcPbRpaV = (JcPbRpaV + PvbEbSIW[XjUHZImh]) % 256
        PvbEbSIW[XjUHZImh], PvbEbSIW[JcPbRpaV] = PvbEbSIW[JcPbRpaV], PvbEbSIW[XjUHZImh]
        local qNHoEUwd = PvbEbSIW[(PvbEbSIW[XjUHZImh] + PvbEbSIW[JcPbRpaV]) % 256]
        local unmasked = bit32.bxor(XBiNveOH, ggiVnvhi)
        table.insert(FchkEBNp, string.char(bit32.bxor(unmasked, qNHoEUwd)))
    end
    return table.concat(FchkEBNp)
end

local PvbEbSIW_flat = {}
for _, chunk in ipairs(ZsnRghBv) do
    for _, byte in ipairs(chunk) do
        table.insert(PvbEbSIW_flat, byte)
    end
end

local decrypted = CDMBDwbO(PvbEbSIW_flat, KgXLgQdH)
local cQENckpD, dvwgxSgl = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(PvbEbSIW_flat)
PvbEbSIW_flat = nil

if cQENckpD then 
    local result = cQENckpD() 
    decrypted = nil
    cQENckpD = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(dvwgxSgl)) 
end
