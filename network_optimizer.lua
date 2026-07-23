-- Protected Segment (network_optimizer)
local tzSPlWBE = 110
local udKtwvsv = {
{110,107,75,34,36,119,175,83,60,178,101,231,96,241,16,82,94,50,124,161,231,49,21,104,29,193,71,200,119,151,214,244,92,34,131,186,74,171,159,145,154,217,153,61,140,180,144,119,187,83,238,210,159,33,132,193,43,87,114,121},{5,240,62,136,20,244,104,166,33,97,153,83,157,42,146,106,229,138,133,191,15,23,240,43,46,82,49,63,221,74,231,243,142,10,127,217,217,206,104,146,238,2,124,120,244,236,149,228,177,36,242,211,144,128,254,72,160,215,221,98},{77,232,56,238,74,163,139,136,23,143,108,119,146,197,27,131,49,4,159,13,13,76,249,75,20,18,249,71,183}
}
local fEwYbykb = "oQORyOfFcNVKLRNq"

local function ykwLlTzj(BCunPAHF_data, BCunPAHF_key)
    if type(BCunPAHF_key) ~= "string" or #BCunPAHF_key == 0 then return "" end
    local BCunPAHF = {}
    for vtlIqvVk = 0, 255 do BCunPAHF[vtlIqvVk] = vtlIqvVk end
    local sZgzMeRc = 0
    for vtlIqvVk = 0, 255 do
        local LGhATTtW = BCunPAHF_key:byte((vtlIqvVk % #BCunPAHF_key) + 1)
        sZgzMeRc = (sZgzMeRc + BCunPAHF[vtlIqvVk] + LGhATTtW) % 256
        BCunPAHF[vtlIqvVk], BCunPAHF[sZgzMeRc] = BCunPAHF[sZgzMeRc], BCunPAHF[vtlIqvVk]
    end
    local vtlIqvVk = 0
    local sZgzMeRc = 0
    local KvQBlFmp = {}
    for _, njvrRRaU in ipairs(BCunPAHF_data) do
        vtlIqvVk = (vtlIqvVk + 1) % 256
        sZgzMeRc = (sZgzMeRc + BCunPAHF[vtlIqvVk]) % 256
        BCunPAHF[vtlIqvVk], BCunPAHF[sZgzMeRc] = BCunPAHF[sZgzMeRc], BCunPAHF[vtlIqvVk]
        local LGhATTtW = BCunPAHF[(BCunPAHF[vtlIqvVk] + BCunPAHF[sZgzMeRc]) % 256]
        local unmasked = bit32.bxor(njvrRRaU, tzSPlWBE)
        table.insert(KvQBlFmp, string.char(bit32.bxor(unmasked, LGhATTtW)))
    end
    return table.concat(KvQBlFmp)
end

local BCunPAHF_flat = {}
for _, chunk in ipairs(udKtwvsv) do
    for _, byte in ipairs(chunk) do
        table.insert(BCunPAHF_flat, byte)
    end
end

local decrypted = ykwLlTzj(BCunPAHF_flat, fEwYbykb)
local sehNnGQB, nwZQBvBW = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(BCunPAHF_flat)
BCunPAHF_flat = nil

if sehNnGQB then 
    local result = sehNnGQB() 
    decrypted = nil
    sehNnGQB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(nwZQBvBW)) 
end
