-- Protected Segment (ui_themes)
local KLyFDsjj = 156
local daIJXXcq = {
{240,130,227,97,97,193,131,236,232,132,124,91,247,112,26,61,114,229,112,164,94,122,143,7,88,167,167,132,241,219,197,201,172,220,232,77,227,233,156,61,126,52,44,137,182,112,51,15,161,107,96,253,74,217,153,228,3,160,104,194},{191,73,160,107,25,163,166,225,97,41,171,10,40,109,250,125,203,34,161,171,89,154,7,235,206,146,98,50,115,223,177,34,136,198,46,2,244,16,145,90,16,154,138,87,209,60,121,118,80,149,70,245,15,92,64,249,216,41,198,154},{246,174,126,95,199,210,251,54,235,79,45,179,60,68,224,182,117,208,234,79,82}
}
local nEVveHQz = "KoGsHRWANkLFWvbz"

local function WnNlawTh(dvAqLbUY_data, dvAqLbUY_key)
    local dvAqLbUY = {}
    for huNieBdv = 0, 255 do dvAqLbUY[huNieBdv] = huNieBdv end
    local mgmsdhqK = 0
    for huNieBdv = 0, 255 do
        local wTqpvtay = dvAqLbUY_key:byte((huNieBdv % #dvAqLbUY_key) + 1)
        mgmsdhqK = (mgmsdhqK + dvAqLbUY[huNieBdv] + wTqpvtay) % 256
        dvAqLbUY[huNieBdv], dvAqLbUY[mgmsdhqK] = dvAqLbUY[mgmsdhqK], dvAqLbUY[huNieBdv]
    end
    local huNieBdv = 0
    local mgmsdhqK = 0
    local MSXehVlr = {}
    for _, GRxbzFij in ipairs(dvAqLbUY_data) do
        huNieBdv = (huNieBdv + 1) % 256
        mgmsdhqK = (mgmsdhqK + dvAqLbUY[huNieBdv]) % 256
        dvAqLbUY[huNieBdv], dvAqLbUY[mgmsdhqK] = dvAqLbUY[mgmsdhqK], dvAqLbUY[huNieBdv]
        local wTqpvtay = dvAqLbUY[(dvAqLbUY[huNieBdv] + dvAqLbUY[mgmsdhqK]) % 256]
        local unmasked = bit32.bxor(GRxbzFij, KLyFDsjj)
        table.insert(MSXehVlr, string.char(bit32.bxor(unmasked, wTqpvtay)))
    end
    return table.concat(MSXehVlr)
end

local dvAqLbUY_flat = {}
for _, chunk in ipairs(daIJXXcq) do
    for _, byte in ipairs(chunk) do
        table.insert(dvAqLbUY_flat, byte)
    end
end

local decrypted = WnNlawTh(dvAqLbUY_flat, nEVveHQz)
local aouOXWlx, VZQeqWQZ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(dvAqLbUY_flat)
dvAqLbUY_flat = nil

if aouOXWlx then 
    local result = aouOXWlx() 
    decrypted = nil
    aouOXWlx = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(VZQeqWQZ)) 
end
