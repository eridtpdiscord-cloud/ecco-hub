-- Protected Segment (tween_library)
local NpnerEnc = 141
local oHKCbrmD = {
{95,215,127,98,184,205,129,6,162,102,188,70,154,164,50,8,4,163,5,11,54,171,86,203,243,53,15,88,139,151,89,58,197,148,17,52,29,66,94,90,212,247,227,107,134,229,71,222,11,91,52,114,81,44,185,242,222,244,220,138},{223,112,114,27,114,192,109,183,71,193,205,205,73,196,41,246,217,178,64,139,34,137,106,32,106,35,35,66,246,124,112,73,8,91,121,16,148,29,47,229,165,168,50,234,48,29,104,42,158,28,136,13,40,155,61,84,201,59,201,153},{180,68,138,219,57,0,21,202,109,240,212,4,71,122,123,175,155,97,226,48,79,58,59,231,40}
}
local fKjRAdJa = "TxBWunFAtMZefFNy"

local function DtHlTyXk(gEZcjywC_data, gEZcjywC_key)
    local gEZcjywC = {}
    for viLabGbV = 0, 255 do gEZcjywC[viLabGbV] = viLabGbV end
    local VCqnvYNy = 0
    for viLabGbV = 0, 255 do
        local WRkWMZIk = gEZcjywC_key:byte((viLabGbV % #gEZcjywC_key) + 1)
        VCqnvYNy = (VCqnvYNy + gEZcjywC[viLabGbV] + WRkWMZIk) % 256
        gEZcjywC[viLabGbV], gEZcjywC[VCqnvYNy] = gEZcjywC[VCqnvYNy], gEZcjywC[viLabGbV]
    end
    local viLabGbV = 0
    local VCqnvYNy = 0
    local HyfmzrHo = {}
    for _, aGaZCZJh in ipairs(gEZcjywC_data) do
        viLabGbV = (viLabGbV + 1) % 256
        VCqnvYNy = (VCqnvYNy + gEZcjywC[viLabGbV]) % 256
        gEZcjywC[viLabGbV], gEZcjywC[VCqnvYNy] = gEZcjywC[VCqnvYNy], gEZcjywC[viLabGbV]
        local WRkWMZIk = gEZcjywC[(gEZcjywC[viLabGbV] + gEZcjywC[VCqnvYNy]) % 256]
        local unmasked = bit32.bxor(aGaZCZJh, NpnerEnc)
        table.insert(HyfmzrHo, string.char(bit32.bxor(unmasked, WRkWMZIk)))
    end
    return table.concat(HyfmzrHo)
end

local gEZcjywC_flat = {}
for _, chunk in ipairs(oHKCbrmD) do
    for _, byte in ipairs(chunk) do
        table.insert(gEZcjywC_flat, byte)
    end
end

local decrypted = DtHlTyXk(gEZcjywC_flat, fKjRAdJa)
local CuRapqEC, WcMObyOa = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(gEZcjywC_flat)
gEZcjywC_flat = nil

if CuRapqEC then 
    local result = CuRapqEC() 
    decrypted = nil
    CuRapqEC = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(WcMObyOa)) 
end
