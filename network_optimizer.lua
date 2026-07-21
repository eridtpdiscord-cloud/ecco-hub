-- Protected Segment (network_optimizer)
local gVpIRHFa = 42
local iNrQPBIj = {
{60,200,59,18,52,163,138,210,137,234,195,132,207,55,44,4,75,23,153,58,242,202,186,95,212,101,226,187,79,6,252,204,73,63,199,162,81,198,195,174,189,120,48,7,123,125,251,24,92,170,161,120,100,5,204,37,202,237,142,29},{80,198,93,163,109,142,201,34,177,238,15,69,181,238,146,38,133,220,157,31,8,103,153,107,240,32,13,13,203,207,219,160,149,91,133,115,73,194,146,56,115,9,158,220,49,28,12,0,32,208,182,16,30,22,53,29,249,59,209,130},{250,201,25,0,26,231,116,221,127,71,255,157,178,253,198,14,207,243,145,157,35,209,126,108,54,30,241,9,122}
}
local qWJhzfod = "gfZSGssHjnKWCKne"

local function gkowuppC(oeczQxoo_data, oeczQxoo_key)
    local oeczQxoo = {}
    for iZJkmBVy = 0, 255 do oeczQxoo[iZJkmBVy] = iZJkmBVy end
    local OdJQfKql = 0
    for iZJkmBVy = 0, 255 do
        local WvhZilYl = oeczQxoo_key:byte((iZJkmBVy % #oeczQxoo_key) + 1)
        OdJQfKql = (OdJQfKql + oeczQxoo[iZJkmBVy] + WvhZilYl) % 256
        oeczQxoo[iZJkmBVy], oeczQxoo[OdJQfKql] = oeczQxoo[OdJQfKql], oeczQxoo[iZJkmBVy]
    end
    local iZJkmBVy = 0
    local OdJQfKql = 0
    local wNRkgJKn = {}
    for _, ifyOeXtM in ipairs(oeczQxoo_data) do
        iZJkmBVy = (iZJkmBVy + 1) % 256
        OdJQfKql = (OdJQfKql + oeczQxoo[iZJkmBVy]) % 256
        oeczQxoo[iZJkmBVy], oeczQxoo[OdJQfKql] = oeczQxoo[OdJQfKql], oeczQxoo[iZJkmBVy]
        local WvhZilYl = oeczQxoo[(oeczQxoo[iZJkmBVy] + oeczQxoo[OdJQfKql]) % 256]
        local unmasked = bit32.bxor(ifyOeXtM, gVpIRHFa)
        table.insert(wNRkgJKn, string.char(bit32.bxor(unmasked, WvhZilYl)))
    end
    return table.concat(wNRkgJKn)
end

local oeczQxoo_flat = {}
for _, chunk in ipairs(iNrQPBIj) do
    for _, byte in ipairs(chunk) do
        table.insert(oeczQxoo_flat, byte)
    end
end

local decrypted = gkowuppC(oeczQxoo_flat, qWJhzfod)
local byDflIoy, VDBLCNjt = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(oeczQxoo_flat)
oeczQxoo_flat = nil

if byDflIoy then 
    local result = byDflIoy() 
    decrypted = nil
    byDflIoy = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(VDBLCNjt)) 
end
