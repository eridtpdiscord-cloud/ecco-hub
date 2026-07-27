-- Protected Segment (cache_invalidation)
local PolhTrku = 75
local dnQXaKYj = {
{57,221,206,125,159,85,13,31,178,16,99,114,206,153,200,13,206,0,171,251,36,52,189,61,59,140,213,255,134,32,103,94,51,71,62,105,219,44,12,13,93,227,252,202,79,125,222,32,98,149,8,121,242,115,63,173,124,0,81,51},{60,215,251,3,194,88,150,155,75,84,153,136,112,157,9,189,164,119,196,136,223,241,131,184,24,193,30,229,120,70,105,194,129,116,150,163,56,42,102,4,242,144,103,250,52,80,243,137,17,118,87,57,198,253,234,65,69,58,127,123},{208,143,80,176,230,219,22,217,190,16,47,145,150,147,240,210,168,6,166,157,195,98,191,250,184,54,244,137,184,77}
}
local KOaxNAOG = "KUHIcPUJfYdvwYTz"

local function RJiJBrTt(DqAWXrsP_data, DqAWXrsP_key)
    if type(DqAWXrsP_key) ~= "string" or #DqAWXrsP_key == 0 then return "" end
    local DqAWXrsP = {}
    for FxlckNiR = 0, 255 do DqAWXrsP[FxlckNiR] = FxlckNiR end
    local ZIXBIoGf = 0
    for FxlckNiR = 0, 255 do
        local DurcLkkE = DqAWXrsP_key:byte((FxlckNiR % #DqAWXrsP_key) + 1)
        ZIXBIoGf = (ZIXBIoGf + DqAWXrsP[FxlckNiR] + DurcLkkE) % 256
        DqAWXrsP[FxlckNiR], DqAWXrsP[ZIXBIoGf] = DqAWXrsP[ZIXBIoGf], DqAWXrsP[FxlckNiR]
    end
    local FxlckNiR = 0
    local ZIXBIoGf = 0
    local OFpGTSNO = {}
    for _, SGMxIsMi in ipairs(DqAWXrsP_data) do
        FxlckNiR = (FxlckNiR + 1) % 256
        ZIXBIoGf = (ZIXBIoGf + DqAWXrsP[FxlckNiR]) % 256
        DqAWXrsP[FxlckNiR], DqAWXrsP[ZIXBIoGf] = DqAWXrsP[ZIXBIoGf], DqAWXrsP[FxlckNiR]
        local DurcLkkE = DqAWXrsP[(DqAWXrsP[FxlckNiR] + DqAWXrsP[ZIXBIoGf]) % 256]
        local unmasked = bit32.bxor(SGMxIsMi, PolhTrku)
        table.insert(OFpGTSNO, string.char(bit32.bxor(unmasked, DurcLkkE)))
    end
    return table.concat(OFpGTSNO)
end

local DqAWXrsP_flat = {}
for _, chunk in ipairs(dnQXaKYj) do
    for _, byte in ipairs(chunk) do
        table.insert(DqAWXrsP_flat, byte)
    end
end

local decrypted = RJiJBrTt(DqAWXrsP_flat, KOaxNAOG)
local GZSsstfF, UchEtGpX = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(DqAWXrsP_flat)
DqAWXrsP_flat = nil

if GZSsstfF then 
    local result = GZSsstfF() 
    decrypted = nil
    GZSsstfF = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(UchEtGpX)) 
end
