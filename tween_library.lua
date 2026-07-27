-- Protected Segment (tween_library)
local IppTirqY = 126
local qCfWTUEM = {
{246,153,88,171,250,215,74,195,44,190,58,176,34,101,227,168,68,138,204,88,236,127,244,166,201,37,96,63,151,163,86,26,168,1,2,59,98,4,141,209,213,166,113,31,24,125,143,57,32,232,41,253,232,201,250,215,109,152,69,115},{82,216,3,222,38,149,89,162,107,242,215,161,217,8,70,35,122,33,68,107,183,189,218,70,160,0,121,247,225,131,122,201,37,114,92,86,48,23,69,246,85,111,246,58,212,0,194,84,154,71,117,191,38,138,231,69,149,124,94,231},{180,125,198,7,114,51,184,239,175,247,61,72,101,248,248,79,176,211,107,242,59,127,246,163,74}
}
local wnodryik = "lbgiIJvEvUhWlvRq"

local function CRQRFaII(eSavslqw_data, eSavslqw_key)
    if type(eSavslqw_key) ~= "string" or #eSavslqw_key == 0 then return "" end
    local eSavslqw = {}
    for EZoNxRBB = 0, 255 do eSavslqw[EZoNxRBB] = EZoNxRBB end
    local hZRkGrxV = 0
    for EZoNxRBB = 0, 255 do
        local sZokxnFi = eSavslqw_key:byte((EZoNxRBB % #eSavslqw_key) + 1)
        hZRkGrxV = (hZRkGrxV + eSavslqw[EZoNxRBB] + sZokxnFi) % 256
        eSavslqw[EZoNxRBB], eSavslqw[hZRkGrxV] = eSavslqw[hZRkGrxV], eSavslqw[EZoNxRBB]
    end
    local EZoNxRBB = 0
    local hZRkGrxV = 0
    local PcprWFuo = {}
    for _, cFIFLZtw in ipairs(eSavslqw_data) do
        EZoNxRBB = (EZoNxRBB + 1) % 256
        hZRkGrxV = (hZRkGrxV + eSavslqw[EZoNxRBB]) % 256
        eSavslqw[EZoNxRBB], eSavslqw[hZRkGrxV] = eSavslqw[hZRkGrxV], eSavslqw[EZoNxRBB]
        local sZokxnFi = eSavslqw[(eSavslqw[EZoNxRBB] + eSavslqw[hZRkGrxV]) % 256]
        local unmasked = bit32.bxor(cFIFLZtw, IppTirqY)
        table.insert(PcprWFuo, string.char(bit32.bxor(unmasked, sZokxnFi)))
    end
    return table.concat(PcprWFuo)
end

local eSavslqw_flat = {}
for _, chunk in ipairs(qCfWTUEM) do
    for _, byte in ipairs(chunk) do
        table.insert(eSavslqw_flat, byte)
    end
end

local decrypted = CRQRFaII(eSavslqw_flat, wnodryik)
local dxnuQEjq, mRXMRoxh = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(eSavslqw_flat)
eSavslqw_flat = nil

if dxnuQEjq then 
    local result = dxnuQEjq() 
    decrypted = nil
    dxnuQEjq = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(mRXMRoxh)) 
end
