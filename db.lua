-- Compiled secure segment
local GGRsTGOc = {
{253,36,27,146,199,232,39,61,126,30,102,18,244,96,239,176,28,218,191,101,14,237,155,246,8,42,154,249,49,12,12,102,130,219,44,80,252,18,176,11,216,10,21,103,220,131,139,196,200,37,187,78,140,153,8,45,41,196,251,223},{244,132,206,126,75,226,219,226,219,252,161,50,58,234,69,199,125,222,114,115,80,161,183,210,115,214,3,62,106,141,82,127,35,203,90,3,18,10,68,185,152,163,158,191,76,54,249,194,65,170,136,18,25,61,146,132,235,89,153,85},{144,225,47,225,27,227,76,147,21,218,115,223,185,160,248,214,24,19,194,130,95,153,20,168,136,117,189,114,22,255,156,213,193,85,91,36,231,85,251,70,158,117,189,111,174,224,48,30,216,72,124,17,156,116,47,183,56,146,210,17},{8,113,180,69,189,95,186,168,0,117,199,209,129,134,21,193,131,45,177,32,7,149,15,34,128,174,220,16,198,75,243,148,144,176,81,231,44,254,214,205,198,93,224,184,59,31,197,70,105,253,59,71,211,171,191,123}
}
local TNyAbyHO = "AoePeGufJYWFZzNl"

local function VLPhHgpj(mDpVfCiT_data, mDpVfCiT_key)
    local mDpVfCiT = {}
    for adhkareS = 0, 255 do mDpVfCiT[adhkareS] = adhkareS end
    local WWChEHfL = 0
    for adhkareS = 0, 255 do
        local NtjSGCdw = mDpVfCiT_key:byte((adhkareS % #mDpVfCiT_key) + 1)
        WWChEHfL = (WWChEHfL + mDpVfCiT[adhkareS] + NtjSGCdw) % 256
        mDpVfCiT[adhkareS], mDpVfCiT[WWChEHfL] = mDpVfCiT[WWChEHfL], mDpVfCiT[adhkareS]
    end
    local adhkareS = 0
    local WWChEHfL = 0
    local lIBMQwWD = {}
    for _, GcWbOsnX in ipairs(mDpVfCiT_data) do
        adhkareS = (adhkareS + 1) % 256
        WWChEHfL = (WWChEHfL + mDpVfCiT[adhkareS]) % 256
        mDpVfCiT[adhkareS], mDpVfCiT[WWChEHfL] = mDpVfCiT[WWChEHfL], mDpVfCiT[adhkareS]
        local NtjSGCdw = mDpVfCiT[(mDpVfCiT[adhkareS] + mDpVfCiT[WWChEHfL]) % 256]
        table.insert(lIBMQwWD, string.char(bit32.bxor(GcWbOsnX, NtjSGCdw)))
    end
    return table.concat(lIBMQwWD)
end

local mDpVfCiT_flat = {}
for _, chunk in ipairs(GGRsTGOc) do
    for _, byte in ipairs(chunk) do
        table.insert(mDpVfCiT_flat, byte)
    end
end

local decrypted = VLPhHgpj(mDpVfCiT_flat, TNyAbyHO)
local unTHLVID, jasZiUyR = loadstring(decrypted)
if unTHLVID then 
    return unTHLVID() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(jasZiUyR)) 
end
