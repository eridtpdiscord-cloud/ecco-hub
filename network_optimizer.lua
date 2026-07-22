-- Protected Segment (network_optimizer)
local IwcFtWHr = 19
local QipYzBab = {
{215,154,13,60,72,190,26,156,48,73,235,246,39,8,218,100,29,212,2,171,181,205,168,152,45,39,88,98,91,49,9,107,76,34,245,245,28,249,47,176,8,66,91,170,119,240,32,58,89,253,244,99,61,173,237,36,191,106,105,53},{228,232,235,58,6,28,204,146,245,117,156,120,37,22,127,150,239,39,253,72,70,152,95,242,247,51,5,167,25,38,155,80,212,106,40,45,176,228,69,202,17,176,166,222,139,236,45,128,247,183,181,175,214,61,4,3,19,56,234,54},{203,80,54,75,87,78,209,247,0,138,0,163,179,227,133,122,157,6,11,43,22,17,238,223,167,161,225,1,80}
}
local vmKmlgmT = "xsoYTgFPDREpGysF"

local function eMlkzDJq(ZTmsoxzJ_data, ZTmsoxzJ_key)
    local ZTmsoxzJ = {}
    for JXnHGFyT = 0, 255 do ZTmsoxzJ[JXnHGFyT] = JXnHGFyT end
    local vZFqwrMj = 0
    for JXnHGFyT = 0, 255 do
        local cmWbHFKs = ZTmsoxzJ_key:byte((JXnHGFyT % #ZTmsoxzJ_key) + 1)
        vZFqwrMj = (vZFqwrMj + ZTmsoxzJ[JXnHGFyT] + cmWbHFKs) % 256
        ZTmsoxzJ[JXnHGFyT], ZTmsoxzJ[vZFqwrMj] = ZTmsoxzJ[vZFqwrMj], ZTmsoxzJ[JXnHGFyT]
    end
    local JXnHGFyT = 0
    local vZFqwrMj = 0
    local XMjrzpVn = {}
    for _, wcDfrvCK in ipairs(ZTmsoxzJ_data) do
        JXnHGFyT = (JXnHGFyT + 1) % 256
        vZFqwrMj = (vZFqwrMj + ZTmsoxzJ[JXnHGFyT]) % 256
        ZTmsoxzJ[JXnHGFyT], ZTmsoxzJ[vZFqwrMj] = ZTmsoxzJ[vZFqwrMj], ZTmsoxzJ[JXnHGFyT]
        local cmWbHFKs = ZTmsoxzJ[(ZTmsoxzJ[JXnHGFyT] + ZTmsoxzJ[vZFqwrMj]) % 256]
        local unmasked = bit32.bxor(wcDfrvCK, IwcFtWHr)
        table.insert(XMjrzpVn, string.char(bit32.bxor(unmasked, cmWbHFKs)))
    end
    return table.concat(XMjrzpVn)
end

local ZTmsoxzJ_flat = {}
for _, chunk in ipairs(QipYzBab) do
    for _, byte in ipairs(chunk) do
        table.insert(ZTmsoxzJ_flat, byte)
    end
end

local decrypted = eMlkzDJq(ZTmsoxzJ_flat, vmKmlgmT)
local lEUmbnxL, DxKSANKH = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ZTmsoxzJ_flat)
ZTmsoxzJ_flat = nil

if lEUmbnxL then 
    local result = lEUmbnxL() 
    decrypted = nil
    lEUmbnxL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(DxKSANKH)) 
end
