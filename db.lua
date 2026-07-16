-- Compiled secure segment
local BLCoSVeQ = {
{231,201,65,102,182,50,17,156,138,204,17,247,164,131,118,123,244,84,212,114,177,198,168,69,84,57,251,226,175,45,151,236,72,139,252,161,85,155,143,150,181,36,105,191,213,215,59,177,73,48,226,45,57,187,87,241,205,176,158,246},{136,111,49,218,106,38,17,35,144,250,160,160,222,176,140,91,22,29,8,152,65,188,77,239,49,7,177,213,59,242,58,127,238,246,230,202,225,157,194,5,128,253,54,195,211,197,237,182,234,88,59,127,207,219,255,20,33,209,103,19},{72,222,218,69,30,35,15,207,120,102,229,232,4,240,166,164,191,78,216,81,47,241,36,139,149,128,112,134,193,39,179,196,145,102,115,239,6,194,122,163,215,63,131,86,116,185,219,70,85,93,143,143,82,219,204,49,128,185,171,87},{67,86,176,77,216,193,210,200,208,83,171,159,151,231,217,147,97,230,9,166,108,153,88,159,120,2,134,246,80,117,199,128,123,121,122,81,14,82,59,238,206,139,105,41,126,57,245,108,211,174,4,41,244,173,242,219}
}
local XUuLddmD = "rkHZCpXExsarVnZg"

local function jOwZlYBS(ZlfaotbI_data, ZlfaotbI_key)
    local ZlfaotbI = {}
    for ltUwedUD = 0, 255 do ZlfaotbI[ltUwedUD] = ltUwedUD end
    local RhXOhlKX = 0
    for ltUwedUD = 0, 255 do
        local rOExaWmV = ZlfaotbI_key:byte((ltUwedUD % #ZlfaotbI_key) + 1)
        RhXOhlKX = (RhXOhlKX + ZlfaotbI[ltUwedUD] + rOExaWmV) % 256
        ZlfaotbI[ltUwedUD], ZlfaotbI[RhXOhlKX] = ZlfaotbI[RhXOhlKX], ZlfaotbI[ltUwedUD]
    end
    local ltUwedUD = 0
    local RhXOhlKX = 0
    local EflzHYxR = {}
    for _, fdTcnYQc in ipairs(ZlfaotbI_data) do
        ltUwedUD = (ltUwedUD + 1) % 256
        RhXOhlKX = (RhXOhlKX + ZlfaotbI[ltUwedUD]) % 256
        ZlfaotbI[ltUwedUD], ZlfaotbI[RhXOhlKX] = ZlfaotbI[RhXOhlKX], ZlfaotbI[ltUwedUD]
        local rOExaWmV = ZlfaotbI[(ZlfaotbI[ltUwedUD] + ZlfaotbI[RhXOhlKX]) % 256]
        table.insert(EflzHYxR, string.char(bit32.bxor(fdTcnYQc, rOExaWmV)))
    end
    return table.concat(EflzHYxR)
end

local ZlfaotbI_flat = {}
for _, chunk in ipairs(BLCoSVeQ) do
    for _, byte in ipairs(chunk) do
        table.insert(ZlfaotbI_flat, byte)
    end
end

local decrypted = jOwZlYBS(ZlfaotbI_flat, XUuLddmD)
local AZYEDyQE, BeWXNKJA = loadstring(decrypted)
if AZYEDyQE then 
    return AZYEDyQE() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(BeWXNKJA)) 
end
