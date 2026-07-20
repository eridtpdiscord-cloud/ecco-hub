-- Compiled secure segment
local RaQPQFkZ = {
{34,98,112,105,113,180,172,164,107,226,159,101,144,183,219,178,100,230,246,44,207,44,15,138,10,132,218,89,95,29,144,183,119,106,214,14,8,99,0,28,160,76,168,54,244,101,94,165,214,11,42,218,127,31,150,45,236,108,142,109},{246,1,154,57,186,5,252,23,190,15,42,9,142,193,164,169,79,6,123,156,69,99,94,63,228,70,240,80,235,47,15,82,67,35,158,10,29,148,11,65,61,236,220,105,177,31,241,177,172,70,30,226,46,243,92,221,12,172,161,229},{227,125,117,79,251,183,225,131,250,90,82,34,220,180,251,203,76,114,164,171,219,250,116,179,38}
}
local zNPpjKzF = "nUOCnXeeUtxEBcfW"

local function HyoaGLuX(rzXXOigr_data, rzXXOigr_key)
    local rzXXOigr = {}
    for OMPIIXGk = 0, 255 do rzXXOigr[OMPIIXGk] = OMPIIXGk end
    local UmtgXclc = 0
    for OMPIIXGk = 0, 255 do
        local hlgNUsRX = rzXXOigr_key:byte((OMPIIXGk % #rzXXOigr_key) + 1)
        UmtgXclc = (UmtgXclc + rzXXOigr[OMPIIXGk] + hlgNUsRX) % 256
        rzXXOigr[OMPIIXGk], rzXXOigr[UmtgXclc] = rzXXOigr[UmtgXclc], rzXXOigr[OMPIIXGk]
    end
    local OMPIIXGk = 0
    local UmtgXclc = 0
    local DzhhiDqv = {}
    for _, SRtpmbse in ipairs(rzXXOigr_data) do
        OMPIIXGk = (OMPIIXGk + 1) % 256
        UmtgXclc = (UmtgXclc + rzXXOigr[OMPIIXGk]) % 256
        rzXXOigr[OMPIIXGk], rzXXOigr[UmtgXclc] = rzXXOigr[UmtgXclc], rzXXOigr[OMPIIXGk]
        local hlgNUsRX = rzXXOigr[(rzXXOigr[OMPIIXGk] + rzXXOigr[UmtgXclc]) % 256]
        table.insert(DzhhiDqv, string.char(bit32.bxor(SRtpmbse, hlgNUsRX)))
    end
    return table.concat(DzhhiDqv)
end

local rzXXOigr_flat = {}
for _, chunk in ipairs(RaQPQFkZ) do
    for _, byte in ipairs(chunk) do
        table.insert(rzXXOigr_flat, byte)
    end
end

local decrypted = HyoaGLuX(rzXXOigr_flat, zNPpjKzF)
local kaonnzxP, tiWhVhBa = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(rzXXOigr_flat)
rzXXOigr_flat = nil

if kaonnzxP then 
    local result = kaonnzxP() 
    decrypted = nil
    kaonnzxP = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(tiWhVhBa)) 
end
