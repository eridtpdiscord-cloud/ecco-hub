-- Protected Segment (teleport_handler)
local QjNsWVLf = 9
local GCUSDcdu = {
{82,164,68,27,247,227,210,181,154,73,164,251,47,183,53,163,252,249,51,183,230,178,47,245,232,70,201,193,23,176,153,55,73,108,43,23,6,217,181,23,85,94,86,45,73,75,31,239,188,28,127,108,171,239,157,225,51,122,50,14},{127,98,199,61,94,56,30,113,243,35,120,230,251,27,87,145,126,83,70,2,58,227,137,76,99,218,13,74,112,32,184,1,35,15,115,47,229,39,41,91,190,183,185,192,231,163,234,151,113,103,180,65,33,199,38,33,171,43,25,183},{128,144,104,177,163,158,104,216,246,174,94,255,144,174,14,182,9,62,166,56,237,24,161,88,173,118,18,179}
}
local gPyCymhb = "bZjlSsDExKOVoXzm"

local function liDdYtIV(EmHgEWMa_data, EmHgEWMa_key)
    local EmHgEWMa = {}
    for aVveVtcO = 0, 255 do EmHgEWMa[aVveVtcO] = aVveVtcO end
    local YPebEhdt = 0
    for aVveVtcO = 0, 255 do
        local vufntTyd = EmHgEWMa_key:byte((aVveVtcO % #EmHgEWMa_key) + 1)
        YPebEhdt = (YPebEhdt + EmHgEWMa[aVveVtcO] + vufntTyd) % 256
        EmHgEWMa[aVveVtcO], EmHgEWMa[YPebEhdt] = EmHgEWMa[YPebEhdt], EmHgEWMa[aVveVtcO]
    end
    local aVveVtcO = 0
    local YPebEhdt = 0
    local KTkVMTkR = {}
    for _, xbyHGsOf in ipairs(EmHgEWMa_data) do
        aVveVtcO = (aVveVtcO + 1) % 256
        YPebEhdt = (YPebEhdt + EmHgEWMa[aVveVtcO]) % 256
        EmHgEWMa[aVveVtcO], EmHgEWMa[YPebEhdt] = EmHgEWMa[YPebEhdt], EmHgEWMa[aVveVtcO]
        local vufntTyd = EmHgEWMa[(EmHgEWMa[aVveVtcO] + EmHgEWMa[YPebEhdt]) % 256]
        local unmasked = bit32.bxor(xbyHGsOf, QjNsWVLf)
        table.insert(KTkVMTkR, string.char(bit32.bxor(unmasked, vufntTyd)))
    end
    return table.concat(KTkVMTkR)
end

local EmHgEWMa_flat = {}
for _, chunk in ipairs(GCUSDcdu) do
    for _, byte in ipairs(chunk) do
        table.insert(EmHgEWMa_flat, byte)
    end
end

local decrypted = liDdYtIV(EmHgEWMa_flat, gPyCymhb)
local SgLVYdye, quVJbPbQ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(EmHgEWMa_flat)
EmHgEWMa_flat = nil

if SgLVYdye then 
    local result = SgLVYdye() 
    decrypted = nil
    SgLVYdye = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(quVJbPbQ)) 
end
