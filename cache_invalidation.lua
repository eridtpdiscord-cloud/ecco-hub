-- Protected Segment (cache_invalidation)
local IBETyPGU = 228
local kfKwhRDz = {
{3,90,28,163,47,236,180,34,169,78,104,253,249,80,139,103,80,186,16,21,173,58,102,122,198,37,108,115,105,241,218,46,208,172,99,162,118,235,11,35,100,93,168,102,234,32,159,137,242,69,116,134,100,65,70,196,56,255,181,130},{106,171,168,188,206,179,26,248,236,127,215,29,143,253,215,55,70,220,238,194,16,211,142,103,91,10,65,97,191,195,118,188,37,96,64,68,84,187,28,227,167,251,207,190,156,162,56,77,31,251,176,32,80,237,103,198,253,235,83,46},{147,30,27,163,224,213,206,209,65,62,67,86,51,192,23,226,207,191,98,1,60,64,108,244,38,202,202,248,82,36}
}
local rNqevWRk = "mEUszgRkKHiYQmQV"

local function NyhWMCYu(FIIeROCl_data, FIIeROCl_key)
    if type(FIIeROCl_key) ~= "string" or #FIIeROCl_key == 0 then return "" end
    local FIIeROCl = {}
    for EUvHXQpS = 0, 255 do FIIeROCl[EUvHXQpS] = EUvHXQpS end
    local IKvNDtYo = 0
    for EUvHXQpS = 0, 255 do
        local dGzCaLwV = FIIeROCl_key:byte((EUvHXQpS % #FIIeROCl_key) + 1)
        IKvNDtYo = (IKvNDtYo + FIIeROCl[EUvHXQpS] + dGzCaLwV) % 256
        FIIeROCl[EUvHXQpS], FIIeROCl[IKvNDtYo] = FIIeROCl[IKvNDtYo], FIIeROCl[EUvHXQpS]
    end
    local EUvHXQpS = 0
    local IKvNDtYo = 0
    local mjtFJdxN = {}
    for _, eyJgOBaN in ipairs(FIIeROCl_data) do
        EUvHXQpS = (EUvHXQpS + 1) % 256
        IKvNDtYo = (IKvNDtYo + FIIeROCl[EUvHXQpS]) % 256
        FIIeROCl[EUvHXQpS], FIIeROCl[IKvNDtYo] = FIIeROCl[IKvNDtYo], FIIeROCl[EUvHXQpS]
        local dGzCaLwV = FIIeROCl[(FIIeROCl[EUvHXQpS] + FIIeROCl[IKvNDtYo]) % 256]
        local unmasked = bit32.bxor(eyJgOBaN, IBETyPGU)
        table.insert(mjtFJdxN, string.char(bit32.bxor(unmasked, dGzCaLwV)))
    end
    return table.concat(mjtFJdxN)
end

local FIIeROCl_flat = {}
for _, chunk in ipairs(kfKwhRDz) do
    for _, byte in ipairs(chunk) do
        table.insert(FIIeROCl_flat, byte)
    end
end

local decrypted = NyhWMCYu(FIIeROCl_flat, rNqevWRk)
local eLbibKYd, TygAmouU = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(FIIeROCl_flat)
FIIeROCl_flat = nil

if eLbibKYd then 
    local result = eLbibKYd() 
    decrypted = nil
    eLbibKYd = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(TygAmouU)) 
end
