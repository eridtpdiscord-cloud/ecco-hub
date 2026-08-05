-- Protected Segment (db)
local tnWvCzgH = 166
local WpqNNppD = {
{30,220,39,174,3,65,178,188,243,13,170,171,14,73,64,1,197,27,87,151,62,146,245,132,26,148,132,234,187,43,195,233,226,168,78,194,95,100,210,245,122,122,163,157,154,133,116,197,90,206,118,44,79,189,209,171,19,59,101,212},{107,69,121,137,229,95,142,251,159,119,118,124,242,66,191,87,48,110,19,108,105,236,92,132,241,161,22,7,27,174,13,86,71,124,246,73,167,194,86,58,70,144,247,9,68,25,185,234,137,13,75,54,108,4,164,107,53,185,232,47},{188,58,216,113,190,9,204,211,94,85,29,102,30,110,246,189,223,122,241,144,234,222,47,206,88,125,176,0,86,50,50,150,10,53,15,88,102,87,208,224,226,122,110,231,9,220,52,180,29,87,210,249,227,116,186,153,234,55,126,56},{76,135,74,162,106,97,106,29,96,202,97,147,16,56,65,4,103,124,154,44,109,202,117,135,144,218,77,238,172,120,24,187,113,100,221,203,81,132,198,139,78,6,236,25,32,187,60,38,192,87,252,86,246,29,176,89,155,112,76,158},{37,26,63,121,162,16,213,244,41,198,122,250,62,98,255,76,250,9,106,91,95,189,246,44,78,102,95,15,157,179,46,17,77,59,79,177,11,254,1,55,183,165,146,216,218,202,202,126,199,163,245,122,79,1,182,240,48,183,105,119},{250,28,240,220,186,141,27,254,230,240,103,111,85,91,42,30,178,31,150,6,239,239,11,118,145,221,161,108,12,86,134,156,49,5,178,103,87,24,183,191,249,230,229,48,144,43,237,255,97,120,174,142,224,100,89,147,252,128,138,112},{212,255,132,244,251,223,48,217,233,14,105,110,159,219,55,149,209,89,24,46,59,105,89,100,175,141,110,137,202,56,22,134,174,204,15,134,75,127,228,134,106,184,69,238,208,178,247,8,10,41,145,236,175,27,108,251,49,91,176,221},{43,238,113,176,67,246,166,15,53,101,188,122,144,218,232,34,30,1,243,78,123,206,162,123,157,129,41,14,14,5,234,212,187,137,42,190,254,184,49,73,56,164,133,150,243,204,246,94,143,29,30,16,220,199,200,204,93,29,0,29},{253,33,63,187,55}
}
local YrnRltyN = "hhjMoQajpauCoVAd"

local function ABUyHGjZ(CPrOglFq_data, CPrOglFq_key)
    if type(CPrOglFq_key) ~= "string" or #CPrOglFq_key == 0 then return "" end
    local CPrOglFq = {}
    for mxOthfZz = 0, 255 do CPrOglFq[mxOthfZz] = mxOthfZz end
    local yBoZRCrp = 0
    for mxOthfZz = 0, 255 do
        local lXxgzfbc = CPrOglFq_key:byte((mxOthfZz % #CPrOglFq_key) + 1)
        yBoZRCrp = (yBoZRCrp + CPrOglFq[mxOthfZz] + lXxgzfbc) % 256
        CPrOglFq[mxOthfZz], CPrOglFq[yBoZRCrp] = CPrOglFq[yBoZRCrp], CPrOglFq[mxOthfZz]
    end
    local mxOthfZz = 0
    local yBoZRCrp = 0
    local WtiTfUKH = {}
    for _, OqTeQZqq in ipairs(CPrOglFq_data) do
        mxOthfZz = (mxOthfZz + 1) % 256
        yBoZRCrp = (yBoZRCrp + CPrOglFq[mxOthfZz]) % 256
        CPrOglFq[mxOthfZz], CPrOglFq[yBoZRCrp] = CPrOglFq[yBoZRCrp], CPrOglFq[mxOthfZz]
        local lXxgzfbc = CPrOglFq[(CPrOglFq[mxOthfZz] + CPrOglFq[yBoZRCrp]) % 256]
        local unmasked = bit32.bxor(OqTeQZqq, tnWvCzgH)
        table.insert(WtiTfUKH, string.char(bit32.bxor(unmasked, lXxgzfbc)))
    end
    return table.concat(WtiTfUKH)
end

local CPrOglFq_flat = {}
for _, chunk in ipairs(WpqNNppD) do
    for _, byte in ipairs(chunk) do
        table.insert(CPrOglFq_flat, byte)
    end
end

local decrypted = ABUyHGjZ(CPrOglFq_flat, YrnRltyN)
local GqtuCRiy, vPGltQpI = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(CPrOglFq_flat)
CPrOglFq_flat = nil

if GqtuCRiy then 
    local result = GqtuCRiy() 
    decrypted = nil
    GqtuCRiy = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(vPGltQpI)) 
end
