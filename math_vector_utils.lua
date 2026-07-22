-- Protected Segment (math_vector_utils)
local orIsLSBd = 137
local VJTpEuUU = {
{6,41,212,108,141,227,123,60,13,29,126,176,210,230,215,136,62,97,142,210,37,22,201,153,242,241,66,97,126,70,237,230,249,230,155,11,222,147,38,29,68,206,187,9,106,57,166,184,203,251,237,75,84,123,159,209,188,7,169,212},{191,102,255,64,59,124,134,82,125,96,87,15,104,147,195,154,30,104,182,176,218,146,221,157,210,21,42,166,102,204,67,158,246,233,90,223,64,205,143,118,18,89,194,159,138,34,249,12,214,212,55,105,86,241,46,176,242,229,254,21},{121,201,125,119,237,219,63,114,194,204,88,75,168,82,43,126,225,213,99,88,65,87,187,32,4,4,48,33,127}
}
local DOylVcXT = "aXQSGFlAxcubuxKr"

local function rHAmlmQS(baurUIPb_data, baurUIPb_key)
    local baurUIPb = {}
    for EqauUJug = 0, 255 do baurUIPb[EqauUJug] = EqauUJug end
    local NWAwtfwV = 0
    for EqauUJug = 0, 255 do
        local vMmeeAOy = baurUIPb_key:byte((EqauUJug % #baurUIPb_key) + 1)
        NWAwtfwV = (NWAwtfwV + baurUIPb[EqauUJug] + vMmeeAOy) % 256
        baurUIPb[EqauUJug], baurUIPb[NWAwtfwV] = baurUIPb[NWAwtfwV], baurUIPb[EqauUJug]
    end
    local EqauUJug = 0
    local NWAwtfwV = 0
    local PsrznAwn = {}
    for _, bvXuKXmn in ipairs(baurUIPb_data) do
        EqauUJug = (EqauUJug + 1) % 256
        NWAwtfwV = (NWAwtfwV + baurUIPb[EqauUJug]) % 256
        baurUIPb[EqauUJug], baurUIPb[NWAwtfwV] = baurUIPb[NWAwtfwV], baurUIPb[EqauUJug]
        local vMmeeAOy = baurUIPb[(baurUIPb[EqauUJug] + baurUIPb[NWAwtfwV]) % 256]
        local unmasked = bit32.bxor(bvXuKXmn, orIsLSBd)
        table.insert(PsrznAwn, string.char(bit32.bxor(unmasked, vMmeeAOy)))
    end
    return table.concat(PsrznAwn)
end

local baurUIPb_flat = {}
for _, chunk in ipairs(VJTpEuUU) do
    for _, byte in ipairs(chunk) do
        table.insert(baurUIPb_flat, byte)
    end
end

local decrypted = rHAmlmQS(baurUIPb_flat, DOylVcXT)
local czyKpqJC, VSzraWhz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(baurUIPb_flat)
baurUIPb_flat = nil

if czyKpqJC then 
    local result = czyKpqJC() 
    decrypted = nil
    czyKpqJC = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(VSzraWhz)) 
end
