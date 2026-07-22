-- Protected Segment (db)
local iYdrQRZZ = 81
local KPZRRpxV = {
{4,126,104,14,160,105,43,190,4,210,165,203,183,160,120,59,71,169,56,252,143,5,235,93,238,164,127,42,68,128,40,27,92,212,73,71,242,234,7,234,139,94,1,34,81,239,22,153,128,21,82,90,30,92,228,116,169,2,254,132},{210,14,177,58,80,67,1,255,225,209,162,87,248,91,228,37,210,240,180,30,203,186,102,204,96,201,179,216,63,229,155,30,64,40,194,186,212,123,129,26,250,171,119,69,26,241,217,171,89,20,207,21,116,179,12,135,25,229,42,113},{109,109,65,126,158,147,102,74,139,89,130,54,89,215,149,41,243,218,10,42,231,60,178,230,249,164,85,77,182,47,178,140,114,117,151,71,178,233,168,152,29,53,169,0,98,93,55,228,57,16,214,101,142,17,181,17,65,18,76,129},{36,109,50,123,232,88,134,117,23,83,120,253,51,178,140,142,170,122,137,106,15,50,113,221,245,85,243,124,224,24,63,248,60,154,107,167,64,216,234,60,61,15,177,8,174,54,110,188,95,26,102,119,31,118,221,252,5,71,28,43},{28,188,127,133,222,16,98,225,95,169,187,224,245,212,45,175,88,14,204,209,173,71,27,148,106,210,122,132,128,30,61,71,45,59,208,116,238,104,251,127,203,179,13,40,42,45,26,202,61,120,162,172,121,93,116,114,159,239,93,210},{99,45,241,134,162,246,185,163,2,28,33,92,7,46,161,137,163,221,83,71,147,148,114,174,230,181,26,234,234,149,248,185,141,209,145,53,39,92,221,191,204,6,31,190,125,190,255,55,27,24,192,209,133,146,251,158,217,167,193,53},{32,100,151,65,66,221,243,168,255,77,177,64,134,108,135,122,96,57,192,211,149,244,219,234,79,104,146,221,215,37,98,103,122,100,202,72,199,19,145,148,206,229,45,200,215}
}
local PtQLCxqU = "uXiTEWxBvWsYWHII"

local function SdjFmqlM(tlCofRiB_data, tlCofRiB_key)
    local tlCofRiB = {}
    for AOgIFurV = 0, 255 do tlCofRiB[AOgIFurV] = AOgIFurV end
    local FuwyLSAt = 0
    for AOgIFurV = 0, 255 do
        local nlSLPYQH = tlCofRiB_key:byte((AOgIFurV % #tlCofRiB_key) + 1)
        FuwyLSAt = (FuwyLSAt + tlCofRiB[AOgIFurV] + nlSLPYQH) % 256
        tlCofRiB[AOgIFurV], tlCofRiB[FuwyLSAt] = tlCofRiB[FuwyLSAt], tlCofRiB[AOgIFurV]
    end
    local AOgIFurV = 0
    local FuwyLSAt = 0
    local YeXKurwO = {}
    for _, bQdgiXWN in ipairs(tlCofRiB_data) do
        AOgIFurV = (AOgIFurV + 1) % 256
        FuwyLSAt = (FuwyLSAt + tlCofRiB[AOgIFurV]) % 256
        tlCofRiB[AOgIFurV], tlCofRiB[FuwyLSAt] = tlCofRiB[FuwyLSAt], tlCofRiB[AOgIFurV]
        local nlSLPYQH = tlCofRiB[(tlCofRiB[AOgIFurV] + tlCofRiB[FuwyLSAt]) % 256]
        local unmasked = bit32.bxor(bQdgiXWN, iYdrQRZZ)
        table.insert(YeXKurwO, string.char(bit32.bxor(unmasked, nlSLPYQH)))
    end
    return table.concat(YeXKurwO)
end

local tlCofRiB_flat = {}
for _, chunk in ipairs(KPZRRpxV) do
    for _, byte in ipairs(chunk) do
        table.insert(tlCofRiB_flat, byte)
    end
end

local decrypted = SdjFmqlM(tlCofRiB_flat, PtQLCxqU)
local zpaakZFL, WQcMRuvl = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(tlCofRiB_flat)
tlCofRiB_flat = nil

if zpaakZFL then 
    local result = zpaakZFL() 
    decrypted = nil
    zpaakZFL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(WQcMRuvl)) 
end
