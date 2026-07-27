-- Protected Segment (tween_library)
local oqzoAOto = 72
local EhKEHHeV = {
{1,14,71,219,211,192,103,119,46,133,109,82,231,131,100,133,21,211,138,38,214,1,42,204,6,96,170,175,138,154,147,9,107,193,33,7,48,59,42,229,130,56,120,41,83,153,137,34,147,24,200,16,226,69,123,129,22,169,9,200},{107,97,78,91,216,67,226,80,224,63,236,5,226,223,119,61,240,235,173,249,95,100,142,50,59,98,31,27,203,203,154,98,110,106,147,7,4,133,166,244,246,159,74,218,88,46,234,174,124,96,128,203,152,232,155,113,211,6,134,133},{99,172,79,86,12,115,253,144,215,100,226,125,34,163,152,125,18,140,161,250,18,74,60,117,189}
}
local jOxpftVP = "zAiifafrjKLUNwyy"

local function CwsQrakp(tbRJhZCm_data, tbRJhZCm_key)
    if type(tbRJhZCm_key) ~= "string" or #tbRJhZCm_key == 0 then return "" end
    local tbRJhZCm = {}
    for vMCQHyXK = 0, 255 do tbRJhZCm[vMCQHyXK] = vMCQHyXK end
    local kfilUeaB = 0
    for vMCQHyXK = 0, 255 do
        local gdKkyTZn = tbRJhZCm_key:byte((vMCQHyXK % #tbRJhZCm_key) + 1)
        kfilUeaB = (kfilUeaB + tbRJhZCm[vMCQHyXK] + gdKkyTZn) % 256
        tbRJhZCm[vMCQHyXK], tbRJhZCm[kfilUeaB] = tbRJhZCm[kfilUeaB], tbRJhZCm[vMCQHyXK]
    end
    local vMCQHyXK = 0
    local kfilUeaB = 0
    local pUGwewge = {}
    for _, PtfefUvW in ipairs(tbRJhZCm_data) do
        vMCQHyXK = (vMCQHyXK + 1) % 256
        kfilUeaB = (kfilUeaB + tbRJhZCm[vMCQHyXK]) % 256
        tbRJhZCm[vMCQHyXK], tbRJhZCm[kfilUeaB] = tbRJhZCm[kfilUeaB], tbRJhZCm[vMCQHyXK]
        local gdKkyTZn = tbRJhZCm[(tbRJhZCm[vMCQHyXK] + tbRJhZCm[kfilUeaB]) % 256]
        local unmasked = bit32.bxor(PtfefUvW, oqzoAOto)
        table.insert(pUGwewge, string.char(bit32.bxor(unmasked, gdKkyTZn)))
    end
    return table.concat(pUGwewge)
end

local tbRJhZCm_flat = {}
for _, chunk in ipairs(EhKEHHeV) do
    for _, byte in ipairs(chunk) do
        table.insert(tbRJhZCm_flat, byte)
    end
end

local decrypted = CwsQrakp(tbRJhZCm_flat, jOxpftVP)
local nUMaYSyQ, zrnAJYuX = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(tbRJhZCm_flat)
tbRJhZCm_flat = nil

if nUMaYSyQ then 
    local result = nUMaYSyQ() 
    decrypted = nil
    nUMaYSyQ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(zrnAJYuX)) 
end
