-- Compiled secure segment
local PXZhCXYV = {
{70,11,113,216,113,94,221,208,229,138,128,129,142,211,254,2,49,155,76,85,112,9,216,219,76,214,206,155,254,131,233,233,41,189,81,61,76,56,127,153,124,8,244,216,253,167,92,229,135,243,107,149,38,11,194,150,202,168,66,100},{244,118,51,51,94,176,221,247,66,45,88,111,52,137,35,60,0,198,240,241,10,169,195,126,231,24,82,159,209,232,83,176,229,70,45,63,160,15,213,177,60,215,148,199,110,98,217,179,249,165,184,254,230,115,26,122,240,151,155,104},{176,166,13,203,7,227,132,154,49,196,67,35,127,105,138,149,101,136,138,136,131,135,159,129,225,96,160,146,167}
}
local CTFOYJyG = "EdcxOpFaIHupyJHa"

local function PFedqRuM(mFYNYQiL_data, mFYNYQiL_key)
    local mFYNYQiL = {}
    for OiOtoZer = 0, 255 do mFYNYQiL[OiOtoZer] = OiOtoZer end
    local tgdxJDXa = 0
    for OiOtoZer = 0, 255 do
        local PkBYIflf = mFYNYQiL_key:byte((OiOtoZer % #mFYNYQiL_key) + 1)
        tgdxJDXa = (tgdxJDXa + mFYNYQiL[OiOtoZer] + PkBYIflf) % 256
        mFYNYQiL[OiOtoZer], mFYNYQiL[tgdxJDXa] = mFYNYQiL[tgdxJDXa], mFYNYQiL[OiOtoZer]
    end
    local OiOtoZer = 0
    local tgdxJDXa = 0
    local MHeVWMrN = {}
    for _, YnuQOhIC in ipairs(mFYNYQiL_data) do
        OiOtoZer = (OiOtoZer + 1) % 256
        tgdxJDXa = (tgdxJDXa + mFYNYQiL[OiOtoZer]) % 256
        mFYNYQiL[OiOtoZer], mFYNYQiL[tgdxJDXa] = mFYNYQiL[tgdxJDXa], mFYNYQiL[OiOtoZer]
        local PkBYIflf = mFYNYQiL[(mFYNYQiL[OiOtoZer] + mFYNYQiL[tgdxJDXa]) % 256]
        table.insert(MHeVWMrN, string.char(bit32.bxor(YnuQOhIC, PkBYIflf)))
    end
    return table.concat(MHeVWMrN)
end

local mFYNYQiL_flat = {}
for _, chunk in ipairs(PXZhCXYV) do
    for _, byte in ipairs(chunk) do
        table.insert(mFYNYQiL_flat, byte)
    end
end

local decrypted = PFedqRuM(mFYNYQiL_flat, CTFOYJyG)
local PpOttEpW, oKALVSHa = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(mFYNYQiL_flat)
mFYNYQiL_flat = nil

if PpOttEpW then 
    local result = PpOttEpW() 
    decrypted = nil
    PpOttEpW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(oKALVSHa)) 
end
