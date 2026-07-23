-- Protected Segment (tween_library)
local pfJKkPzc = 95
local ALnFaMue = {
{81,246,221,136,134,194,211,218,93,232,101,93,214,72,32,158,247,1,2,79,217,231,38,38,51,186,97,106,116,72,141,202,9,170,8,42,151,141,171,65,70,183,161,242,234,158,228,68,52,69,233,153,209,59,100,113,32,165,158,242},{151,74,95,83,249,131,158,147,119,166,42,185,129,253,98,219,98,220,186,28,148,80,196,25,69,37,245,108,233,206,231,241,109,239,242,241,84,1,73,152,24,197,185,42,254,17,63,213,19,31,111,162,184,0,186,62,231,160,252,113},{68,225,230,132,79,34,170,124,245,125,16,68,20,182,244,79,117,146,178,250,197,87,125,203,70}
}
local wKqSgcCa = "VkdpTUqaKDCCFnCC"

local function UfxHwMyk(BoKrEeGd_data, BoKrEeGd_key)
    if type(BoKrEeGd_key) ~= "string" or #BoKrEeGd_key == 0 then return "" end
    local BoKrEeGd = {}
    for VSGdHzcs = 0, 255 do BoKrEeGd[VSGdHzcs] = VSGdHzcs end
    local RljBZbDu = 0
    for VSGdHzcs = 0, 255 do
        local bIesubyL = BoKrEeGd_key:byte((VSGdHzcs % #BoKrEeGd_key) + 1)
        RljBZbDu = (RljBZbDu + BoKrEeGd[VSGdHzcs] + bIesubyL) % 256
        BoKrEeGd[VSGdHzcs], BoKrEeGd[RljBZbDu] = BoKrEeGd[RljBZbDu], BoKrEeGd[VSGdHzcs]
    end
    local VSGdHzcs = 0
    local RljBZbDu = 0
    local WPVivVAV = {}
    for _, WNUwXCXx in ipairs(BoKrEeGd_data) do
        VSGdHzcs = (VSGdHzcs + 1) % 256
        RljBZbDu = (RljBZbDu + BoKrEeGd[VSGdHzcs]) % 256
        BoKrEeGd[VSGdHzcs], BoKrEeGd[RljBZbDu] = BoKrEeGd[RljBZbDu], BoKrEeGd[VSGdHzcs]
        local bIesubyL = BoKrEeGd[(BoKrEeGd[VSGdHzcs] + BoKrEeGd[RljBZbDu]) % 256]
        local unmasked = bit32.bxor(WNUwXCXx, pfJKkPzc)
        table.insert(WPVivVAV, string.char(bit32.bxor(unmasked, bIesubyL)))
    end
    return table.concat(WPVivVAV)
end

local BoKrEeGd_flat = {}
for _, chunk in ipairs(ALnFaMue) do
    for _, byte in ipairs(chunk) do
        table.insert(BoKrEeGd_flat, byte)
    end
end

local decrypted = UfxHwMyk(BoKrEeGd_flat, wKqSgcCa)
local xXzVXsdv, PLwAqwfe = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(BoKrEeGd_flat)
BoKrEeGd_flat = nil

if xXzVXsdv then 
    local result = xXzVXsdv() 
    decrypted = nil
    xXzVXsdv = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(PLwAqwfe)) 
end
