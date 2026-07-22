-- Protected Segment (tween_library)
local bHtncgNM = 29
local tIMKiSzq = {
{198,120,17,206,180,94,146,54,168,2,118,236,35,132,255,73,64,72,85,126,118,137,183,163,182,150,212,116,126,54,194,211,47,20,22,221,152,119,7,98,118,118,165,226,79,161,40,119,123,174,36,48,85,55,169,141,96,204,49,237},{137,189,43,83,39,111,152,124,235,173,174,225,151,104,218,34,211,96,149,210,152,115,134,228,61,191,60,223,109,216,114,33,193,59,164,24,173,177,101,194,178,66,142,23,165,250,186,0,143,233,177,154,122,203,248,19,142,97,133,42},{172,204,138,127,224,221,16,129,207,236,48,29,218,108,123,7,58,205,109,138,80,214,131,175,59}
}
local naryTxEr = "vigbijIuSlIAoRSf"

local function CoeQywzn(VdxzlWYM_data, VdxzlWYM_key)
    local VdxzlWYM = {}
    for nytwAarW = 0, 255 do VdxzlWYM[nytwAarW] = nytwAarW end
    local LMXKItnP = 0
    for nytwAarW = 0, 255 do
        local pZGzgpmG = VdxzlWYM_key:byte((nytwAarW % #VdxzlWYM_key) + 1)
        LMXKItnP = (LMXKItnP + VdxzlWYM[nytwAarW] + pZGzgpmG) % 256
        VdxzlWYM[nytwAarW], VdxzlWYM[LMXKItnP] = VdxzlWYM[LMXKItnP], VdxzlWYM[nytwAarW]
    end
    local nytwAarW = 0
    local LMXKItnP = 0
    local otmFkgdM = {}
    for _, kRDLzLOK in ipairs(VdxzlWYM_data) do
        nytwAarW = (nytwAarW + 1) % 256
        LMXKItnP = (LMXKItnP + VdxzlWYM[nytwAarW]) % 256
        VdxzlWYM[nytwAarW], VdxzlWYM[LMXKItnP] = VdxzlWYM[LMXKItnP], VdxzlWYM[nytwAarW]
        local pZGzgpmG = VdxzlWYM[(VdxzlWYM[nytwAarW] + VdxzlWYM[LMXKItnP]) % 256]
        local unmasked = bit32.bxor(kRDLzLOK, bHtncgNM)
        table.insert(otmFkgdM, string.char(bit32.bxor(unmasked, pZGzgpmG)))
    end
    return table.concat(otmFkgdM)
end

local VdxzlWYM_flat = {}
for _, chunk in ipairs(tIMKiSzq) do
    for _, byte in ipairs(chunk) do
        table.insert(VdxzlWYM_flat, byte)
    end
end

local decrypted = CoeQywzn(VdxzlWYM_flat, naryTxEr)
local wHesuAcL, WjLFZBKg = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(VdxzlWYM_flat)
VdxzlWYM_flat = nil

if wHesuAcL then 
    local result = wHesuAcL() 
    decrypted = nil
    wHesuAcL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(WjLFZBKg)) 
end
