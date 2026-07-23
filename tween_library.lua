-- Protected Segment (tween_library)
local wqgyYtnc = 44
local UXPYRNRb = {
{205,82,207,144,137,220,235,149,107,62,203,118,244,126,57,147,218,38,129,76,54,100,205,130,233,37,159,55,189,96,203,76,95,71,4,32,82,49,143,110,241,67,185,158,230,148,67,43,204,130,79,108,231,131,49,118,128,38,183,54},{50,125,44,254,16,54,179,191,241,117,144,250,244,169,197,181,131,40,47,23,51,221,75,241,57,17,123,91,70,191,102,79,82,140,117,163,96,247,33,57,244,226,217,5,86,61,251,37,101,160,188,125,102,77,97,132,237,33,106,73},{144,155,187,138,177,75,156,88,23,191,19,120,235,226,23,242,184,216,179,50,209,245,236,101,218}
}
local MuQAafBL = "lGXSBNZZKBdIDBmo"

local function ZzmKKzlW(JPGPzxbR_data, JPGPzxbR_key)
    if type(JPGPzxbR_key) ~= "string" or #JPGPzxbR_key == 0 then return "" end
    local JPGPzxbR = {}
    for TUEkGYdv = 0, 255 do JPGPzxbR[TUEkGYdv] = TUEkGYdv end
    local ZBfsMfxA = 0
    for TUEkGYdv = 0, 255 do
        local VJTYOsBw = JPGPzxbR_key:byte((TUEkGYdv % #JPGPzxbR_key) + 1)
        ZBfsMfxA = (ZBfsMfxA + JPGPzxbR[TUEkGYdv] + VJTYOsBw) % 256
        JPGPzxbR[TUEkGYdv], JPGPzxbR[ZBfsMfxA] = JPGPzxbR[ZBfsMfxA], JPGPzxbR[TUEkGYdv]
    end
    local TUEkGYdv = 0
    local ZBfsMfxA = 0
    local SoZHMdhj = {}
    for _, UurdHNHU in ipairs(JPGPzxbR_data) do
        TUEkGYdv = (TUEkGYdv + 1) % 256
        ZBfsMfxA = (ZBfsMfxA + JPGPzxbR[TUEkGYdv]) % 256
        JPGPzxbR[TUEkGYdv], JPGPzxbR[ZBfsMfxA] = JPGPzxbR[ZBfsMfxA], JPGPzxbR[TUEkGYdv]
        local VJTYOsBw = JPGPzxbR[(JPGPzxbR[TUEkGYdv] + JPGPzxbR[ZBfsMfxA]) % 256]
        local unmasked = bit32.bxor(UurdHNHU, wqgyYtnc)
        table.insert(SoZHMdhj, string.char(bit32.bxor(unmasked, VJTYOsBw)))
    end
    return table.concat(SoZHMdhj)
end

local JPGPzxbR_flat = {}
for _, chunk in ipairs(UXPYRNRb) do
    for _, byte in ipairs(chunk) do
        table.insert(JPGPzxbR_flat, byte)
    end
end

local decrypted = ZzmKKzlW(JPGPzxbR_flat, MuQAafBL)
local ZGWIuvlB, cnqLfyzl = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(JPGPzxbR_flat)
JPGPzxbR_flat = nil

if ZGWIuvlB then 
    local result = ZGWIuvlB() 
    decrypted = nil
    ZGWIuvlB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(cnqLfyzl)) 
end
