-- Protected Segment (utility_helper)
local MwmTQplQ = 206
local iJDYgFMC = {
{254,247,43,89,153,64,109,249,0,243,119,184,17,68,169,233,165,90,102,10,156,75,247,81,255,5,222,41,154,74,109,201,42,158,50,216,235,120,210,49,174,173,133,100,155,200,154,200,14,249,237,229,187,132,148,107,197,59,120,79},{147,22,205,255,103,190,11,254,192,160,33,51,75,207,136,194,152,225,76,202,100,118,124,20,41,44,108,51,66,9,71,38,229,51,136,177,76,133,224,150,136,252,49,129,0,123,207,38,118,76,179,196,140,96,43,82,247,114,160,55},{248,43,147,198,139,230,91,83,159,39,255,209,31,195,202,55,7,104,41,146,153,242,141,188,224,242}
}
local TbybBlbN = "cexITLmiNRDywOzy"

local function ktGyGTHZ(WIbWYEIB_data, WIbWYEIB_key)
    local WIbWYEIB = {}
    for llxFskGv = 0, 255 do WIbWYEIB[llxFskGv] = llxFskGv end
    local mMomVzMT = 0
    for llxFskGv = 0, 255 do
        local AHfqZmck = WIbWYEIB_key:byte((llxFskGv % #WIbWYEIB_key) + 1)
        mMomVzMT = (mMomVzMT + WIbWYEIB[llxFskGv] + AHfqZmck) % 256
        WIbWYEIB[llxFskGv], WIbWYEIB[mMomVzMT] = WIbWYEIB[mMomVzMT], WIbWYEIB[llxFskGv]
    end
    local llxFskGv = 0
    local mMomVzMT = 0
    local xSwfVwSe = {}
    for _, RcPscMPA in ipairs(WIbWYEIB_data) do
        llxFskGv = (llxFskGv + 1) % 256
        mMomVzMT = (mMomVzMT + WIbWYEIB[llxFskGv]) % 256
        WIbWYEIB[llxFskGv], WIbWYEIB[mMomVzMT] = WIbWYEIB[mMomVzMT], WIbWYEIB[llxFskGv]
        local AHfqZmck = WIbWYEIB[(WIbWYEIB[llxFskGv] + WIbWYEIB[mMomVzMT]) % 256]
        local unmasked = bit32.bxor(RcPscMPA, MwmTQplQ)
        table.insert(xSwfVwSe, string.char(bit32.bxor(unmasked, AHfqZmck)))
    end
    return table.concat(xSwfVwSe)
end

local WIbWYEIB_flat = {}
for _, chunk in ipairs(iJDYgFMC) do
    for _, byte in ipairs(chunk) do
        table.insert(WIbWYEIB_flat, byte)
    end
end

local decrypted = ktGyGTHZ(WIbWYEIB_flat, TbybBlbN)
local mUuVLJbn, ynwuJPqc = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(WIbWYEIB_flat)
WIbWYEIB_flat = nil

if mUuVLJbn then 
    local result = mUuVLJbn() 
    decrypted = nil
    mUuVLJbn = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(ynwuJPqc)) 
end
