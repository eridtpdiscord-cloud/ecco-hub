-- Compiled secure segment
local AJViVMQb = {
{133,144,91,77,46,165,231,252,158,140,7,62,195,20,233,77,68,31,164,210,1,121,101,30,145,40,57,172,127,1,5,169,244,58,40,117,159,2,90,112,223,53,233,177,124,124,12,212,164,53,69,125,155,209,30,48,177,85,97,81},{113,235,114,91,87,126,19,193,141,175,88,99,147,112,27,140,63,101,193,162,62,96,105,204,26,66,23,186,62,86,233,93,62,179,54,88,15,119,223,9,16,90,149,104,39,201,78,246,90,206,137,16,3,95,151,37,192,74,234,134},{82,70,108,140,222,151,183,131,108,202,212,237,24,249,126,84,255,191,177,40,149,78,165,74,112,171}
}
local fQIUozRZ = "LIiAPRgBroVxKpNl"

local function GawQviUV(AxwYdeyQ_data, AxwYdeyQ_key)
    local AxwYdeyQ = {}
    for oggidzpp = 0, 255 do AxwYdeyQ[oggidzpp] = oggidzpp end
    local DppydGPh = 0
    for oggidzpp = 0, 255 do
        local bZGXBbIW = AxwYdeyQ_key:byte((oggidzpp % #AxwYdeyQ_key) + 1)
        DppydGPh = (DppydGPh + AxwYdeyQ[oggidzpp] + bZGXBbIW) % 256
        AxwYdeyQ[oggidzpp], AxwYdeyQ[DppydGPh] = AxwYdeyQ[DppydGPh], AxwYdeyQ[oggidzpp]
    end
    local oggidzpp = 0
    local DppydGPh = 0
    local GjALxRLt = {}
    for _, tTuLVXDS in ipairs(AxwYdeyQ_data) do
        oggidzpp = (oggidzpp + 1) % 256
        DppydGPh = (DppydGPh + AxwYdeyQ[oggidzpp]) % 256
        AxwYdeyQ[oggidzpp], AxwYdeyQ[DppydGPh] = AxwYdeyQ[DppydGPh], AxwYdeyQ[oggidzpp]
        local bZGXBbIW = AxwYdeyQ[(AxwYdeyQ[oggidzpp] + AxwYdeyQ[DppydGPh]) % 256]
        table.insert(GjALxRLt, string.char(bit32.bxor(tTuLVXDS, bZGXBbIW)))
    end
    return table.concat(GjALxRLt)
end

local AxwYdeyQ_flat = {}
for _, chunk in ipairs(AJViVMQb) do
    for _, byte in ipairs(chunk) do
        table.insert(AxwYdeyQ_flat, byte)
    end
end

local decrypted = GawQviUV(AxwYdeyQ_flat, fQIUozRZ)
local bcbwOqeW, axtFwhpP = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(AxwYdeyQ_flat)
AxwYdeyQ_flat = nil

if bcbwOqeW then 
    local result = bcbwOqeW() 
    decrypted = nil
    bcbwOqeW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(axtFwhpP)) 
end
