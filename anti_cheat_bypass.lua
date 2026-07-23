-- Protected Segment (anti_cheat_bypass)
local JpISANDU = 85
local bnBMakJi = {
{185,243,58,0,185,170,212,102,7,165,226,132,23,186,232,211,125,117,95,134,105,14,55,144,5,33,206,95,165,162,1,222,77,226,159,55,112,85,66,254,124,186,15,205,113,182,187,18,39,212,123,246,136,27,93,116,148,165,196,97},{101,91,147,11,56,182,32,44,124,116,71,218,137,182,97,165,244,153,38,154,1,1,216,174,250,82,157,67,238,94,177,34,183,178,50,255,0,103,248,49,103,192,52,23,228,159,42,83,62,149,71,80,128,92,57,65,163,59,3,106},{162,204,148,51,223,5,196,242,228,16,13,61,177,81,52,19,62,150,189,183,113,74,148,54,116,71,124,185,107}
}
local OjnKSwFj = "AtqfpgQYRgNYXwbb"

local function ELvHEUJg(EXwfMDRQ_data, EXwfMDRQ_key)
    if type(EXwfMDRQ_key) ~= "string" or #EXwfMDRQ_key == 0 then return "" end
    local EXwfMDRQ = {}
    for bhyYZPZM = 0, 255 do EXwfMDRQ[bhyYZPZM] = bhyYZPZM end
    local gUYzVhwa = 0
    for bhyYZPZM = 0, 255 do
        local doYkLWuX = EXwfMDRQ_key:byte((bhyYZPZM % #EXwfMDRQ_key) + 1)
        gUYzVhwa = (gUYzVhwa + EXwfMDRQ[bhyYZPZM] + doYkLWuX) % 256
        EXwfMDRQ[bhyYZPZM], EXwfMDRQ[gUYzVhwa] = EXwfMDRQ[gUYzVhwa], EXwfMDRQ[bhyYZPZM]
    end
    local bhyYZPZM = 0
    local gUYzVhwa = 0
    local fHsUhnlx = {}
    for _, tcOjEmtk in ipairs(EXwfMDRQ_data) do
        bhyYZPZM = (bhyYZPZM + 1) % 256
        gUYzVhwa = (gUYzVhwa + EXwfMDRQ[bhyYZPZM]) % 256
        EXwfMDRQ[bhyYZPZM], EXwfMDRQ[gUYzVhwa] = EXwfMDRQ[gUYzVhwa], EXwfMDRQ[bhyYZPZM]
        local doYkLWuX = EXwfMDRQ[(EXwfMDRQ[bhyYZPZM] + EXwfMDRQ[gUYzVhwa]) % 256]
        local unmasked = bit32.bxor(tcOjEmtk, JpISANDU)
        table.insert(fHsUhnlx, string.char(bit32.bxor(unmasked, doYkLWuX)))
    end
    return table.concat(fHsUhnlx)
end

local EXwfMDRQ_flat = {}
for _, chunk in ipairs(bnBMakJi) do
    for _, byte in ipairs(chunk) do
        table.insert(EXwfMDRQ_flat, byte)
    end
end

local decrypted = ELvHEUJg(EXwfMDRQ_flat, OjnKSwFj)
local KzHZSDxM, AlCJKBBK = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(EXwfMDRQ_flat)
EXwfMDRQ_flat = nil

if KzHZSDxM then 
    local result = KzHZSDxM() 
    decrypted = nil
    KzHZSDxM = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(AlCJKBBK)) 
end
