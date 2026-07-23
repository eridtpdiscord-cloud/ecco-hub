-- Protected Segment (utility_helper)
local dbkkTWrO = 187
local hGkswQSt = {
{121,102,152,88,162,206,130,130,185,96,126,218,17,2,194,78,154,20,120,138,127,155,9,22,217,32,60,71,141,116,61,236,10,15,118,141,195,71,72,228,166,3,150,153,154,94,109,185,59,253,66,121,39,202,243,211,117,12,250,187},{119,129,96,52,158,56,7,128,209,222,194,86,124,170,252,233,56,160,215,241,121,106,88,25,239,137,253,167,42,143,155,122,86,55,27,70,186,151,219,36,173,77,147,58,62,168,163,31,181,32,123,190,119,219,117,223,124,23,255,69},{64,189,171,192,226,149,126,119,156,249,106,97,171,69,19,155,176,211,192,175,9,51,181,152,181,180}
}
local mTVuytGH = "JprZRwmvSYeNWnqa"

local function txjFDjvK(iiwVdMQE_data, iiwVdMQE_key)
    if type(iiwVdMQE_key) ~= "string" or #iiwVdMQE_key == 0 then return "" end
    local iiwVdMQE = {}
    for cbHoywVM = 0, 255 do iiwVdMQE[cbHoywVM] = cbHoywVM end
    local XnnCMKNg = 0
    for cbHoywVM = 0, 255 do
        local CHJuyEeq = iiwVdMQE_key:byte((cbHoywVM % #iiwVdMQE_key) + 1)
        XnnCMKNg = (XnnCMKNg + iiwVdMQE[cbHoywVM] + CHJuyEeq) % 256
        iiwVdMQE[cbHoywVM], iiwVdMQE[XnnCMKNg] = iiwVdMQE[XnnCMKNg], iiwVdMQE[cbHoywVM]
    end
    local cbHoywVM = 0
    local XnnCMKNg = 0
    local rpuXdWnG = {}
    for _, vJkCRocJ in ipairs(iiwVdMQE_data) do
        cbHoywVM = (cbHoywVM + 1) % 256
        XnnCMKNg = (XnnCMKNg + iiwVdMQE[cbHoywVM]) % 256
        iiwVdMQE[cbHoywVM], iiwVdMQE[XnnCMKNg] = iiwVdMQE[XnnCMKNg], iiwVdMQE[cbHoywVM]
        local CHJuyEeq = iiwVdMQE[(iiwVdMQE[cbHoywVM] + iiwVdMQE[XnnCMKNg]) % 256]
        local unmasked = bit32.bxor(vJkCRocJ, dbkkTWrO)
        table.insert(rpuXdWnG, string.char(bit32.bxor(unmasked, CHJuyEeq)))
    end
    return table.concat(rpuXdWnG)
end

local iiwVdMQE_flat = {}
for _, chunk in ipairs(hGkswQSt) do
    for _, byte in ipairs(chunk) do
        table.insert(iiwVdMQE_flat, byte)
    end
end

local decrypted = txjFDjvK(iiwVdMQE_flat, mTVuytGH)
local nMHkidEN, QTiREQYR = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(iiwVdMQE_flat)
iiwVdMQE_flat = nil

if nMHkidEN then 
    local result = nMHkidEN() 
    decrypted = nil
    nMHkidEN = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(QTiREQYR)) 
end
