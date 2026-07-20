-- Compiled secure segment
local ogjDWKfE = {
{33,244,142,40,55,143,127,107,58,52,255,12,116,149,125,112,220,235,5,229,233,50,77,23,232,156,163,35,50,6,94,25,19,254,160,171,150,220,142,15,82,135,13,180,242,77,126,35,87,130,77,222,99,48,165,126,8,197,54,69},{211,207,52,37,83,232,62,116,37,111,186,218,57,221,114,51,212,167,255,65,245,172,153,32,57,18,234,255,188,233,186,9,88,207,222,59,146,59,109,90,162,191,86,157,37,144,177,162,198,183,155,100,134,201,24,124,44,45,244,80},{176,133,162,114,26,69,51,186,151,78,54,27,73,197,188,165,67,31,93,130,7,96,218,245,153,237,251,215,253,59}
}
local VTAXtRXF = "UkIQtxTOGTRJjXWp"

local function kLAxgtZG(IMsmLVGr_data, IMsmLVGr_key)
    local IMsmLVGr = {}
    for TiKpiERG = 0, 255 do IMsmLVGr[TiKpiERG] = TiKpiERG end
    local ugUpHAIb = 0
    for TiKpiERG = 0, 255 do
        local HIWEyfgD = IMsmLVGr_key:byte((TiKpiERG % #IMsmLVGr_key) + 1)
        ugUpHAIb = (ugUpHAIb + IMsmLVGr[TiKpiERG] + HIWEyfgD) % 256
        IMsmLVGr[TiKpiERG], IMsmLVGr[ugUpHAIb] = IMsmLVGr[ugUpHAIb], IMsmLVGr[TiKpiERG]
    end
    local TiKpiERG = 0
    local ugUpHAIb = 0
    local vEzJJzQX = {}
    for _, oFFJPTYG in ipairs(IMsmLVGr_data) do
        TiKpiERG = (TiKpiERG + 1) % 256
        ugUpHAIb = (ugUpHAIb + IMsmLVGr[TiKpiERG]) % 256
        IMsmLVGr[TiKpiERG], IMsmLVGr[ugUpHAIb] = IMsmLVGr[ugUpHAIb], IMsmLVGr[TiKpiERG]
        local HIWEyfgD = IMsmLVGr[(IMsmLVGr[TiKpiERG] + IMsmLVGr[ugUpHAIb]) % 256]
        table.insert(vEzJJzQX, string.char(bit32.bxor(oFFJPTYG, HIWEyfgD)))
    end
    return table.concat(vEzJJzQX)
end

local IMsmLVGr_flat = {}
for _, chunk in ipairs(ogjDWKfE) do
    for _, byte in ipairs(chunk) do
        table.insert(IMsmLVGr_flat, byte)
    end
end

local decrypted = kLAxgtZG(IMsmLVGr_flat, VTAXtRXF)
local yDAAYdjz, VebwvZgJ = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(IMsmLVGr_flat)
IMsmLVGr_flat = nil

if yDAAYdjz then 
    local result = yDAAYdjz() 
    decrypted = nil
    yDAAYdjz = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(VebwvZgJ)) 
end
