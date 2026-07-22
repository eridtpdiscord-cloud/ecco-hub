-- Protected Segment (network_optimizer)
local FNVHArLl = 67
local lUdTKlAY = {
{95,232,248,53,217,45,178,196,183,147,118,92,136,83,95,131,197,72,111,30,138,144,224,242,57,172,123,127,156,53,209,218,94,221,175,43,121,150,167,240,19,161,154,68,43,83,112,208,30,20,52,100,116,84,11,44,162,28,80,116},{135,185,235,232,255,54,26,157,158,118,165,233,151,103,43,165,46,4,102,147,111,4,128,106,13,132,218,240,45,26,79,79,102,172,232,80,81,45,188,4,168,128,160,76,86,186,161,115,109,27,64,34,70,125,254,49,118,48,155,188},{132,203,130,255,190,109,89,75,103,242,228,244,148,7,212,140,180,203,220,168,177,179,96,2,7,53,5,31,57}
}
local XfroLAVJ = "DnSBvISoZxJEbfxT"

local function FMsIWhaW(TQmRqlmL_data, TQmRqlmL_key)
    local TQmRqlmL = {}
    for raRIuUHD = 0, 255 do TQmRqlmL[raRIuUHD] = raRIuUHD end
    local lkqjJCwC = 0
    for raRIuUHD = 0, 255 do
        local CWQFCGhI = TQmRqlmL_key:byte((raRIuUHD % #TQmRqlmL_key) + 1)
        lkqjJCwC = (lkqjJCwC + TQmRqlmL[raRIuUHD] + CWQFCGhI) % 256
        TQmRqlmL[raRIuUHD], TQmRqlmL[lkqjJCwC] = TQmRqlmL[lkqjJCwC], TQmRqlmL[raRIuUHD]
    end
    local raRIuUHD = 0
    local lkqjJCwC = 0
    local ROgUlkfm = {}
    for _, tXuodHWs in ipairs(TQmRqlmL_data) do
        raRIuUHD = (raRIuUHD + 1) % 256
        lkqjJCwC = (lkqjJCwC + TQmRqlmL[raRIuUHD]) % 256
        TQmRqlmL[raRIuUHD], TQmRqlmL[lkqjJCwC] = TQmRqlmL[lkqjJCwC], TQmRqlmL[raRIuUHD]
        local CWQFCGhI = TQmRqlmL[(TQmRqlmL[raRIuUHD] + TQmRqlmL[lkqjJCwC]) % 256]
        local unmasked = bit32.bxor(tXuodHWs, FNVHArLl)
        table.insert(ROgUlkfm, string.char(bit32.bxor(unmasked, CWQFCGhI)))
    end
    return table.concat(ROgUlkfm)
end

local TQmRqlmL_flat = {}
for _, chunk in ipairs(lUdTKlAY) do
    for _, byte in ipairs(chunk) do
        table.insert(TQmRqlmL_flat, byte)
    end
end

local decrypted = FMsIWhaW(TQmRqlmL_flat, XfroLAVJ)
local HIjEnCAf, ftAlBJHi = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(TQmRqlmL_flat)
TQmRqlmL_flat = nil

if HIjEnCAf then 
    local result = HIjEnCAf() 
    decrypted = nil
    HIjEnCAf = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(ftAlBJHi)) 
end
