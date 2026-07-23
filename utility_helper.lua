-- Protected Segment (utility_helper)
local NtWrihvH = 32
local peTgyFdA = {
{190,12,40,60,73,105,242,48,94,224,131,179,219,214,220,251,59,122,124,249,248,68,165,154,123,160,53,31,31,137,12,111,240,158,151,3,175,85,142,73,222,58,20,112,169,78,101,118,5,190,61,177,215,238,56,130,108,215,92,96},{217,57,1,176,187,216,76,81,28,32,3,60,137,227,139,202,29,97,149,205,171,106,168,22,211,229,140,157,16,57,189,26,102,85,105,21,82,20,226,106,43,222,252,229,50,21,209,155,143,35,55,10,44,221,0,160,236,197,45,189},{106,181,249,40,17,32,183,152,99,141,71,9,35,13,42,168,27,200,105,14,46,247,188,198,30,24}
}
local QSIURDAn = "AKKILOBZdIYynEdL"

local function gLDhQLJs(VkBllEGH_data, VkBllEGH_key)
    if type(VkBllEGH_key) ~= "string" or #VkBllEGH_key == 0 then return "" end
    local VkBllEGH = {}
    for PQTPpDch = 0, 255 do VkBllEGH[PQTPpDch] = PQTPpDch end
    local JJfUfmGl = 0
    for PQTPpDch = 0, 255 do
        local voRPekbb = VkBllEGH_key:byte((PQTPpDch % #VkBllEGH_key) + 1)
        JJfUfmGl = (JJfUfmGl + VkBllEGH[PQTPpDch] + voRPekbb) % 256
        VkBllEGH[PQTPpDch], VkBllEGH[JJfUfmGl] = VkBllEGH[JJfUfmGl], VkBllEGH[PQTPpDch]
    end
    local PQTPpDch = 0
    local JJfUfmGl = 0
    local VMuiYfVH = {}
    for _, Vmluorsz in ipairs(VkBllEGH_data) do
        PQTPpDch = (PQTPpDch + 1) % 256
        JJfUfmGl = (JJfUfmGl + VkBllEGH[PQTPpDch]) % 256
        VkBllEGH[PQTPpDch], VkBllEGH[JJfUfmGl] = VkBllEGH[JJfUfmGl], VkBllEGH[PQTPpDch]
        local voRPekbb = VkBllEGH[(VkBllEGH[PQTPpDch] + VkBllEGH[JJfUfmGl]) % 256]
        local unmasked = bit32.bxor(Vmluorsz, NtWrihvH)
        table.insert(VMuiYfVH, string.char(bit32.bxor(unmasked, voRPekbb)))
    end
    return table.concat(VMuiYfVH)
end

local VkBllEGH_flat = {}
for _, chunk in ipairs(peTgyFdA) do
    for _, byte in ipairs(chunk) do
        table.insert(VkBllEGH_flat, byte)
    end
end

local decrypted = gLDhQLJs(VkBllEGH_flat, QSIURDAn)
local VLwZwIbE, JJruWBXL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(VkBllEGH_flat)
VkBllEGH_flat = nil

if VLwZwIbE then 
    local result = VLwZwIbE() 
    decrypted = nil
    VLwZwIbE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(JJruWBXL)) 
end
