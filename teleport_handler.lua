-- Protected Segment (teleport_handler)
local unNPWeDm = 183
local gqowxASp = {
{8,62,105,189,109,43,89,214,110,104,182,0,26,60,154,25,181,144,185,54,103,106,83,31,54,68,115,193,180,229,122,35,153,83,56,28,49,62,116,69,46,90,182,92,47,179,210,138,232,240,222,152,96,196,82,144,132,246,245,52},{96,130,148,147,165,150,36,228,218,81,21,126,127,12,235,211,144,13,183,73,141,182,30,160,175,174,30,105,1,94,212,114,123,80,80,91,141,49,59,69,42,183,201,82,79,188,108,107,193,100,113,38,55,106,45,162,35,34,59,162},{147,119,121,96,179,159,45,34,115,117,168,19,53,117,15,74,211,92,13,202,22,168,19,210,241,11,207,58}
}
local EMsSnIbA = "OHCmRBOAgiOfIWuc"

local function hPlZoDCp(IOhyxpdY_data, IOhyxpdY_key)
    if type(IOhyxpdY_key) ~= "string" or #IOhyxpdY_key == 0 then return "" end
    local IOhyxpdY = {}
    for AqpxoAtL = 0, 255 do IOhyxpdY[AqpxoAtL] = AqpxoAtL end
    local BvuydCvh = 0
    for AqpxoAtL = 0, 255 do
        local rPsLifoy = IOhyxpdY_key:byte((AqpxoAtL % #IOhyxpdY_key) + 1)
        BvuydCvh = (BvuydCvh + IOhyxpdY[AqpxoAtL] + rPsLifoy) % 256
        IOhyxpdY[AqpxoAtL], IOhyxpdY[BvuydCvh] = IOhyxpdY[BvuydCvh], IOhyxpdY[AqpxoAtL]
    end
    local AqpxoAtL = 0
    local BvuydCvh = 0
    local NsNJoGsl = {}
    for _, idXAQSNA in ipairs(IOhyxpdY_data) do
        AqpxoAtL = (AqpxoAtL + 1) % 256
        BvuydCvh = (BvuydCvh + IOhyxpdY[AqpxoAtL]) % 256
        IOhyxpdY[AqpxoAtL], IOhyxpdY[BvuydCvh] = IOhyxpdY[BvuydCvh], IOhyxpdY[AqpxoAtL]
        local rPsLifoy = IOhyxpdY[(IOhyxpdY[AqpxoAtL] + IOhyxpdY[BvuydCvh]) % 256]
        local unmasked = bit32.bxor(idXAQSNA, unNPWeDm)
        table.insert(NsNJoGsl, string.char(bit32.bxor(unmasked, rPsLifoy)))
    end
    return table.concat(NsNJoGsl)
end

local IOhyxpdY_flat = {}
for _, chunk in ipairs(gqowxASp) do
    for _, byte in ipairs(chunk) do
        table.insert(IOhyxpdY_flat, byte)
    end
end

local decrypted = hPlZoDCp(IOhyxpdY_flat, EMsSnIbA)
local HcNDKylz, xPIToBeY = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(IOhyxpdY_flat)
IOhyxpdY_flat = nil

if HcNDKylz then 
    local result = HcNDKylz() 
    decrypted = nil
    HcNDKylz = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(xPIToBeY)) 
end
