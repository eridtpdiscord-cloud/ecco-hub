-- Protected Segment (math_vector_utils)
local ukbAoAnn = 175
local PavQyUWD = {
{117,210,243,224,131,250,122,76,61,213,156,76,31,224,234,152,90,147,4,241,137,227,249,109,188,31,145,49,43,37,157,123,120,137,68,34,1,243,184,7,129,74,203,169,247,143,211,143,111,138,17,96,93,16,176,132,126,204,39,236},{250,203,93,13,102,230,148,172,238,182,57,36,172,104,144,158,198,177,246,204,133,126,27,4,172,5,236,53,30,68,134,90,255,62,123,145,184,141,128,37,40,189,109,13,91,106,113,146,122,80,175,123,128,142,83,111,217,183,142,227},{228,60,96,198,146,160,65,254,141,195,209,228,41,230,118,88,63,2,52,215,102,156,216,146,140,148,32,36,113}
}
local lDmIfNth = "YfoTDKpfekcNTpCS"

local function gcVLZdEQ(BPkLqBPE_data, BPkLqBPE_key)
    local BPkLqBPE = {}
    for VKKgtwoJ = 0, 255 do BPkLqBPE[VKKgtwoJ] = VKKgtwoJ end
    local fDVIZdZX = 0
    for VKKgtwoJ = 0, 255 do
        local mGwRxCOg = BPkLqBPE_key:byte((VKKgtwoJ % #BPkLqBPE_key) + 1)
        fDVIZdZX = (fDVIZdZX + BPkLqBPE[VKKgtwoJ] + mGwRxCOg) % 256
        BPkLqBPE[VKKgtwoJ], BPkLqBPE[fDVIZdZX] = BPkLqBPE[fDVIZdZX], BPkLqBPE[VKKgtwoJ]
    end
    local VKKgtwoJ = 0
    local fDVIZdZX = 0
    local JNwcHJSt = {}
    for _, DllGcVMM in ipairs(BPkLqBPE_data) do
        VKKgtwoJ = (VKKgtwoJ + 1) % 256
        fDVIZdZX = (fDVIZdZX + BPkLqBPE[VKKgtwoJ]) % 256
        BPkLqBPE[VKKgtwoJ], BPkLqBPE[fDVIZdZX] = BPkLqBPE[fDVIZdZX], BPkLqBPE[VKKgtwoJ]
        local mGwRxCOg = BPkLqBPE[(BPkLqBPE[VKKgtwoJ] + BPkLqBPE[fDVIZdZX]) % 256]
        local unmasked = bit32.bxor(DllGcVMM, ukbAoAnn)
        table.insert(JNwcHJSt, string.char(bit32.bxor(unmasked, mGwRxCOg)))
    end
    return table.concat(JNwcHJSt)
end

local BPkLqBPE_flat = {}
for _, chunk in ipairs(PavQyUWD) do
    for _, byte in ipairs(chunk) do
        table.insert(BPkLqBPE_flat, byte)
    end
end

local decrypted = gcVLZdEQ(BPkLqBPE_flat, lDmIfNth)
local pTkiXSOl, BWgKaqwy = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(BPkLqBPE_flat)
BPkLqBPE_flat = nil

if pTkiXSOl then 
    local result = pTkiXSOl() 
    decrypted = nil
    pTkiXSOl = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(BWgKaqwy)) 
end
