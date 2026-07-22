-- Protected Segment (math_vector_utils)
local rrqNwCOk = 153
local OjxQvOSc = {
{132,23,191,221,14,37,219,59,71,59,82,83,227,223,45,7,24,26,185,35,240,29,137,89,85,62,198,198,53,97,175,28,197,130,207,119,239,56,215,113,121,37,20,83,52,196,45,20,138,110,28,56,200,154,141,209,220,145,234,196},{170,199,20,41,64,186,136,255,237,247,39,143,181,133,15,54,100,133,29,230,166,207,153,24,111,88,42,253,165,237,140,140,59,97,196,246,184,92,238,93,134,210,230,199,0,160,170,8,152,178,24,217,94,226,42,0,121,38,219,86},{218,9,8,188,23,189,104,23,120,94,102,26,157,160,243,216,91,164,61,31,96,138,208,171,202,102,183,32,48}
}
local eGRYNyAJ = "oFpsITkMUfUuITnp"

local function KFIttgAG(qqjgQMgT_data, qqjgQMgT_key)
    local qqjgQMgT = {}
    for fgadnXCB = 0, 255 do qqjgQMgT[fgadnXCB] = fgadnXCB end
    local lMbcSvfR = 0
    for fgadnXCB = 0, 255 do
        local BSyNgKga = qqjgQMgT_key:byte((fgadnXCB % #qqjgQMgT_key) + 1)
        lMbcSvfR = (lMbcSvfR + qqjgQMgT[fgadnXCB] + BSyNgKga) % 256
        qqjgQMgT[fgadnXCB], qqjgQMgT[lMbcSvfR] = qqjgQMgT[lMbcSvfR], qqjgQMgT[fgadnXCB]
    end
    local fgadnXCB = 0
    local lMbcSvfR = 0
    local pPweUwYN = {}
    for _, ShshrePS in ipairs(qqjgQMgT_data) do
        fgadnXCB = (fgadnXCB + 1) % 256
        lMbcSvfR = (lMbcSvfR + qqjgQMgT[fgadnXCB]) % 256
        qqjgQMgT[fgadnXCB], qqjgQMgT[lMbcSvfR] = qqjgQMgT[lMbcSvfR], qqjgQMgT[fgadnXCB]
        local BSyNgKga = qqjgQMgT[(qqjgQMgT[fgadnXCB] + qqjgQMgT[lMbcSvfR]) % 256]
        local unmasked = bit32.bxor(ShshrePS, rrqNwCOk)
        table.insert(pPweUwYN, string.char(bit32.bxor(unmasked, BSyNgKga)))
    end
    return table.concat(pPweUwYN)
end

local qqjgQMgT_flat = {}
for _, chunk in ipairs(OjxQvOSc) do
    for _, byte in ipairs(chunk) do
        table.insert(qqjgQMgT_flat, byte)
    end
end

local decrypted = KFIttgAG(qqjgQMgT_flat, eGRYNyAJ)
local KPZXGLFb, dPAnDqec = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(qqjgQMgT_flat)
qqjgQMgT_flat = nil

if KPZXGLFb then 
    local result = KPZXGLFb() 
    decrypted = nil
    KPZXGLFb = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(dPAnDqec)) 
end
