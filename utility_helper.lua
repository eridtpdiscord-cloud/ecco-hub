-- Protected Segment (utility_helper)
local hzuGGTPo = 40
local hHuSRBLa = {
{190,45,127,239,197,103,20,235,90,137,11,218,219,29,88,232,239,1,214,140,25,218,151,150,198,214,153,154,191,20,59,159,98,158,26,130,131,2,79,162,12,132,190,121,214,50,202,244,77,29,67,74,120,3,71,155,108,68,221,128},{217,143,86,140,246,71,15,177,24,5,86,120,223,222,210,173,113,38,3,235,228,87,226,236,249,96,221,208,246,68,21,164,218,124,27,12,196,215,99,101,139,48,152,61,6,104,92,18,10,79,30,188,27,229,229,206,140,131,172,80},{213,236,207,56,32,102,84,188,31,193,48,35,69,16,140,67,61,133,91,236,52,19,116,249,218,233}
}
local JnLQQSZx = "XgCJUabUswMSKYGB"

local function UMdWpCzZ(hkGccjKh_data, hkGccjKh_key)
    if type(hkGccjKh_key) ~= "string" or #hkGccjKh_key == 0 then return "" end
    local hkGccjKh = {}
    for nSKxDoEZ = 0, 255 do hkGccjKh[nSKxDoEZ] = nSKxDoEZ end
    local yfLBerpa = 0
    for nSKxDoEZ = 0, 255 do
        local thiAIVNQ = hkGccjKh_key:byte((nSKxDoEZ % #hkGccjKh_key) + 1)
        yfLBerpa = (yfLBerpa + hkGccjKh[nSKxDoEZ] + thiAIVNQ) % 256
        hkGccjKh[nSKxDoEZ], hkGccjKh[yfLBerpa] = hkGccjKh[yfLBerpa], hkGccjKh[nSKxDoEZ]
    end
    local nSKxDoEZ = 0
    local yfLBerpa = 0
    local SqeGgLRx = {}
    for _, lMyFjgkh in ipairs(hkGccjKh_data) do
        nSKxDoEZ = (nSKxDoEZ + 1) % 256
        yfLBerpa = (yfLBerpa + hkGccjKh[nSKxDoEZ]) % 256
        hkGccjKh[nSKxDoEZ], hkGccjKh[yfLBerpa] = hkGccjKh[yfLBerpa], hkGccjKh[nSKxDoEZ]
        local thiAIVNQ = hkGccjKh[(hkGccjKh[nSKxDoEZ] + hkGccjKh[yfLBerpa]) % 256]
        local unmasked = bit32.bxor(lMyFjgkh, hzuGGTPo)
        table.insert(SqeGgLRx, string.char(bit32.bxor(unmasked, thiAIVNQ)))
    end
    return table.concat(SqeGgLRx)
end

local hkGccjKh_flat = {}
for _, chunk in ipairs(hHuSRBLa) do
    for _, byte in ipairs(chunk) do
        table.insert(hkGccjKh_flat, byte)
    end
end

local decrypted = UMdWpCzZ(hkGccjKh_flat, JnLQQSZx)
local fYHxjFQq, dLkdTpKI = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(hkGccjKh_flat)
hkGccjKh_flat = nil

if fYHxjFQq then 
    local result = fYHxjFQq() 
    decrypted = nil
    fYHxjFQq = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(dLkdTpKI)) 
end
