-- Protected Segment (utility_helper)
local pnBXYVcy = 177
local QBOrlZkg = {
{125,110,2,209,240,56,55,244,24,242,105,157,202,24,60,106,229,183,119,33,189,55,62,135,144,247,139,230,78,100,246,243,6,130,243,117,209,213,31,106,2,12,17,150,23,242,134,39,181,72,149,137,243,106,209,135,154,213,106,207},{163,42,176,25,56,243,179,63,33,153,230,187,2,172,141,103,206,200,57,20,145,213,100,51,171,32,155,18,43,191,17,190,62,186,73,121,199,28,179,84,125,93,154,150,136,100,131,207,253,144,113,57,128,187,216,37,173,255,41,131},{149,105,175,8,197,5,194,6,234,65,188,199,176,16,97,110,231,170,115,42,0,28,206,133,42,86}
}
local PSGQkenZ = "mBVHvBlQankpqvsB"

local function YxehYIYj(jBtHRqqE_data, jBtHRqqE_key)
    local jBtHRqqE = {}
    for dROyASBy = 0, 255 do jBtHRqqE[dROyASBy] = dROyASBy end
    local ooOLeORS = 0
    for dROyASBy = 0, 255 do
        local HKizYoVq = jBtHRqqE_key:byte((dROyASBy % #jBtHRqqE_key) + 1)
        ooOLeORS = (ooOLeORS + jBtHRqqE[dROyASBy] + HKizYoVq) % 256
        jBtHRqqE[dROyASBy], jBtHRqqE[ooOLeORS] = jBtHRqqE[ooOLeORS], jBtHRqqE[dROyASBy]
    end
    local dROyASBy = 0
    local ooOLeORS = 0
    local mFeeHNBg = {}
    for _, vMPTGIdf in ipairs(jBtHRqqE_data) do
        dROyASBy = (dROyASBy + 1) % 256
        ooOLeORS = (ooOLeORS + jBtHRqqE[dROyASBy]) % 256
        jBtHRqqE[dROyASBy], jBtHRqqE[ooOLeORS] = jBtHRqqE[ooOLeORS], jBtHRqqE[dROyASBy]
        local HKizYoVq = jBtHRqqE[(jBtHRqqE[dROyASBy] + jBtHRqqE[ooOLeORS]) % 256]
        local unmasked = bit32.bxor(vMPTGIdf, pnBXYVcy)
        table.insert(mFeeHNBg, string.char(bit32.bxor(unmasked, HKizYoVq)))
    end
    return table.concat(mFeeHNBg)
end

local jBtHRqqE_flat = {}
for _, chunk in ipairs(QBOrlZkg) do
    for _, byte in ipairs(chunk) do
        table.insert(jBtHRqqE_flat, byte)
    end
end

local decrypted = YxehYIYj(jBtHRqqE_flat, PSGQkenZ)
local jXTKUIww, ozfBWwsi = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(jBtHRqqE_flat)
jBtHRqqE_flat = nil

if jXTKUIww then 
    local result = jXTKUIww() 
    decrypted = nil
    jXTKUIww = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(ozfBWwsi)) 
end
