-- Protected Segment (network_optimizer)
local NiqQiaph = 58
local OTcOvrUT = {
{210,255,29,126,135,124,150,168,9,37,114,254,102,190,79,237,60,49,11,59,155,222,90,58,37,104,174,72,55,75,244,45,254,42,88,221,134,29,100,7,209,17,161,65,105,156,20,218,96,156,220,145,194,126,17,122,79,160,1,190},{155,121,132,9,211,75,131,192,238,149,14,234,54,230,71,230,164,21,2,171,77,164,205,63,47,91,127,156,175,62,189,90,64,9,155,32,166,223,126,113,30,45,184,151,153,151,68,239,146,38,130,128,89,238,2,62,91,61,134,220},{155,236,71,205,159,217,39,57,157,21,176,173,164,85,110,198,205,249,181,53,183,31,105,27,224,137,88,126,28}
}
local HhNWZlEQ = "KqhunPVrVvEbOrEw"

local function AdluEaCQ(iJQDAtIH_data, iJQDAtIH_key)
    if type(iJQDAtIH_key) ~= "string" or #iJQDAtIH_key == 0 then return "" end
    local iJQDAtIH = {}
    for zOhPQmag = 0, 255 do iJQDAtIH[zOhPQmag] = zOhPQmag end
    local LooHnvqI = 0
    for zOhPQmag = 0, 255 do
        local ocfXkmdF = iJQDAtIH_key:byte((zOhPQmag % #iJQDAtIH_key) + 1)
        LooHnvqI = (LooHnvqI + iJQDAtIH[zOhPQmag] + ocfXkmdF) % 256
        iJQDAtIH[zOhPQmag], iJQDAtIH[LooHnvqI] = iJQDAtIH[LooHnvqI], iJQDAtIH[zOhPQmag]
    end
    local zOhPQmag = 0
    local LooHnvqI = 0
    local MswqnYhT = {}
    for _, oVRFuUTZ in ipairs(iJQDAtIH_data) do
        zOhPQmag = (zOhPQmag + 1) % 256
        LooHnvqI = (LooHnvqI + iJQDAtIH[zOhPQmag]) % 256
        iJQDAtIH[zOhPQmag], iJQDAtIH[LooHnvqI] = iJQDAtIH[LooHnvqI], iJQDAtIH[zOhPQmag]
        local ocfXkmdF = iJQDAtIH[(iJQDAtIH[zOhPQmag] + iJQDAtIH[LooHnvqI]) % 256]
        local unmasked = bit32.bxor(oVRFuUTZ, NiqQiaph)
        table.insert(MswqnYhT, string.char(bit32.bxor(unmasked, ocfXkmdF)))
    end
    return table.concat(MswqnYhT)
end

local iJQDAtIH_flat = {}
for _, chunk in ipairs(OTcOvrUT) do
    for _, byte in ipairs(chunk) do
        table.insert(iJQDAtIH_flat, byte)
    end
end

local decrypted = AdluEaCQ(iJQDAtIH_flat, HhNWZlEQ)
local MPwnehWn, SiASENqC = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(iJQDAtIH_flat)
iJQDAtIH_flat = nil

if MPwnehWn then 
    local result = MPwnehWn() 
    decrypted = nil
    MPwnehWn = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(SiASENqC)) 
end
