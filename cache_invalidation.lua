-- Compiled secure segment
local AOWtjGgl = {
{164,88,219,84,83,229,202,153,121,71,151,190,208,92,124,78,77,251,232,65,33,101,59,195,185,76,104,184,225,30,78,152,182,255,210,27,107,83,105,226,58,254,3,215,142,48,85,161,168,50,243,204,111,161,83,242,162,197,43,55},{62,154,105,225,23,9,182,91,109,64,67,78,10,75,140,13,250,1,212,207,191,142,232,223,222,22,94,187,92,137,210,204,198,169,219,29,46,3,36,225,219,100,97,199,27,66,254,166,11,239,19,210,46,162,25,152,85,30,98,101},{50,166,152,2,183,190,155,146,164,253,56,209,184,32,244,116,120,137,174,191,11,12,177,207,133,75,57,145,146,84}
}
local sYTNULYZ = "uDuxJsWAYbLgkEFE"

local function oDykAIuh(UWSHxiKZ_data, UWSHxiKZ_key)
    local UWSHxiKZ = {}
    for liRRqFzS = 0, 255 do UWSHxiKZ[liRRqFzS] = liRRqFzS end
    local dsGSRmLT = 0
    for liRRqFzS = 0, 255 do
        local FbzXBZjb = UWSHxiKZ_key:byte((liRRqFzS % #UWSHxiKZ_key) + 1)
        dsGSRmLT = (dsGSRmLT + UWSHxiKZ[liRRqFzS] + FbzXBZjb) % 256
        UWSHxiKZ[liRRqFzS], UWSHxiKZ[dsGSRmLT] = UWSHxiKZ[dsGSRmLT], UWSHxiKZ[liRRqFzS]
    end
    local liRRqFzS = 0
    local dsGSRmLT = 0
    local qyerGaGZ = {}
    for _, wtLijdkv in ipairs(UWSHxiKZ_data) do
        liRRqFzS = (liRRqFzS + 1) % 256
        dsGSRmLT = (dsGSRmLT + UWSHxiKZ[liRRqFzS]) % 256
        UWSHxiKZ[liRRqFzS], UWSHxiKZ[dsGSRmLT] = UWSHxiKZ[dsGSRmLT], UWSHxiKZ[liRRqFzS]
        local FbzXBZjb = UWSHxiKZ[(UWSHxiKZ[liRRqFzS] + UWSHxiKZ[dsGSRmLT]) % 256]
        table.insert(qyerGaGZ, string.char(bit32.bxor(wtLijdkv, FbzXBZjb)))
    end
    return table.concat(qyerGaGZ)
end

local UWSHxiKZ_flat = {}
for _, chunk in ipairs(AOWtjGgl) do
    for _, byte in ipairs(chunk) do
        table.insert(UWSHxiKZ_flat, byte)
    end
end

local decrypted = oDykAIuh(UWSHxiKZ_flat, sYTNULYZ)
local QSeqPLCT, DOFuLWjA = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(UWSHxiKZ_flat)
UWSHxiKZ_flat = nil

if QSeqPLCT then 
    local result = QSeqPLCT() 
    decrypted = nil
    QSeqPLCT = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(DOFuLWjA)) 
end
