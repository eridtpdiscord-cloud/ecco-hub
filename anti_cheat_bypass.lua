-- Compiled secure segment
local UJDfPKpk = {
{155,71,137,120,169,221,142,164,130,142,107,74,74,91,117,166,2,170,126,83,98,175,162,27,96,178,217,184,6,130,76,59,175,139,102,248,111,87,211,32,54,117,89,42,84,207,115,223,223,138,13,45,221,39,228,184,207,69,115,225},{172,17,168,20,177,228,46,138,116,5,205,114,188,245,90,165,117,181,37,215,194,163,195,203,236,85,173,20,133,35,239,197,174,144,98,22,107,206,108,55,36,17,156,122,174,172,91,32,71,106,136,46,144,23,190,51,233,80,212,243},{236,150,188,253,17,197,235,103,38,61,25,181,97,180,227,167,176,18,22,175,9,153,224,222,80,39,246,80,118}
}
local yYZFpnLe = "UMCiGrAsaqaxJLtz"

local function mitTOMbT(tBmoILcq_data, tBmoILcq_key)
    local tBmoILcq = {}
    for paGmOOeq = 0, 255 do tBmoILcq[paGmOOeq] = paGmOOeq end
    local XwxRgqAU = 0
    for paGmOOeq = 0, 255 do
        local sBwznnPp = tBmoILcq_key:byte((paGmOOeq % #tBmoILcq_key) + 1)
        XwxRgqAU = (XwxRgqAU + tBmoILcq[paGmOOeq] + sBwznnPp) % 256
        tBmoILcq[paGmOOeq], tBmoILcq[XwxRgqAU] = tBmoILcq[XwxRgqAU], tBmoILcq[paGmOOeq]
    end
    local paGmOOeq = 0
    local XwxRgqAU = 0
    local HUnCAwRt = {}
    for _, HUBoHpRw in ipairs(tBmoILcq_data) do
        paGmOOeq = (paGmOOeq + 1) % 256
        XwxRgqAU = (XwxRgqAU + tBmoILcq[paGmOOeq]) % 256
        tBmoILcq[paGmOOeq], tBmoILcq[XwxRgqAU] = tBmoILcq[XwxRgqAU], tBmoILcq[paGmOOeq]
        local sBwznnPp = tBmoILcq[(tBmoILcq[paGmOOeq] + tBmoILcq[XwxRgqAU]) % 256]
        table.insert(HUnCAwRt, string.char(bit32.bxor(HUBoHpRw, sBwznnPp)))
    end
    return table.concat(HUnCAwRt)
end

local tBmoILcq_flat = {}
for _, chunk in ipairs(UJDfPKpk) do
    for _, byte in ipairs(chunk) do
        table.insert(tBmoILcq_flat, byte)
    end
end

local decrypted = mitTOMbT(tBmoILcq_flat, yYZFpnLe)
local TyyODABf, Vqlyqvth = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(tBmoILcq_flat)
tBmoILcq_flat = nil

if TyyODABf then 
    local result = TyyODABf() 
    decrypted = nil
    TyyODABf = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(Vqlyqvth)) 
end
