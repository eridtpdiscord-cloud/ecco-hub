-- Protected Segment (cache_invalidation)
local FsnwjNEI = 114
local cxjnRcVZ = {
{163,138,100,109,61,83,253,237,49,77,14,197,85,232,10,21,73,242,121,28,218,8,109,40,191,17,175,165,245,181,167,167,125,231,189,70,50,49,63,134,63,94,231,87,58,252,101,202,135,191,50,252,227,53,198,40,89,114,90,28},{115,116,242,253,128,208,116,205,162,191,188,86,43,112,125,91,202,78,145,10,18,145,139,183,77,65,165,74,41,4,116,182,249,153,92,124,207,155,80,221,58,102,217,95,92,213,161,205,12,69,78,220,33,93,15,95,255,205,121,253},{149,225,212,184,44,137,38,31,142,164,246,23,250,191,20,82,71,180,253,46,129,194,221,176,184,247,56,16,77,98}
}
local JCSQGRra = "bgytcLayNORykXEd"

local function yghmFnEk(bajZBPGx_data, bajZBPGx_key)
    local bajZBPGx = {}
    for YINvyDXn = 0, 255 do bajZBPGx[YINvyDXn] = YINvyDXn end
    local fFLeBZAp = 0
    for YINvyDXn = 0, 255 do
        local MIbbysXD = bajZBPGx_key:byte((YINvyDXn % #bajZBPGx_key) + 1)
        fFLeBZAp = (fFLeBZAp + bajZBPGx[YINvyDXn] + MIbbysXD) % 256
        bajZBPGx[YINvyDXn], bajZBPGx[fFLeBZAp] = bajZBPGx[fFLeBZAp], bajZBPGx[YINvyDXn]
    end
    local YINvyDXn = 0
    local fFLeBZAp = 0
    local aIMxDwfW = {}
    for _, OYdSpjhQ in ipairs(bajZBPGx_data) do
        YINvyDXn = (YINvyDXn + 1) % 256
        fFLeBZAp = (fFLeBZAp + bajZBPGx[YINvyDXn]) % 256
        bajZBPGx[YINvyDXn], bajZBPGx[fFLeBZAp] = bajZBPGx[fFLeBZAp], bajZBPGx[YINvyDXn]
        local MIbbysXD = bajZBPGx[(bajZBPGx[YINvyDXn] + bajZBPGx[fFLeBZAp]) % 256]
        local unmasked = bit32.bxor(OYdSpjhQ, FsnwjNEI)
        table.insert(aIMxDwfW, string.char(bit32.bxor(unmasked, MIbbysXD)))
    end
    return table.concat(aIMxDwfW)
end

local bajZBPGx_flat = {}
for _, chunk in ipairs(cxjnRcVZ) do
    for _, byte in ipairs(chunk) do
        table.insert(bajZBPGx_flat, byte)
    end
end

local decrypted = yghmFnEk(bajZBPGx_flat, JCSQGRra)
local STMPBQPD, cPShRvDc = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(bajZBPGx_flat)
bajZBPGx_flat = nil

if STMPBQPD then 
    local result = STMPBQPD() 
    decrypted = nil
    STMPBQPD = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(cPShRvDc)) 
end
