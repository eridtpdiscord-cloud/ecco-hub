-- Protected Segment (db)
local eSHUUmsY = 110
local QAnkQXeX = {
{49,164,104,47,198,86,99,46,187,235,151,63,163,86,225,130,143,153,221,197,45,66,233,243,167,245,117,162,165,82,249,28,44,195,113,115,254,199,187,90,173,114,55,209,53,239,81,9,182,125,36,50,210,30,51,190,67,209,125,52},{112,28,89,52,140,157,143,155,166,151,239,197,142,206,73,103,37,141,173,189,224,92,237,101,180,220,80,207,80,116,221,69,235,200,211,223,23,38,186,108,232,120,245,1,131,217,147,68,122,43,123,96,250,155,161,175,82,46,59,10},{230,163,58,72,133,226,243,127,141,151,30,3,148,88,252,185,55,100,34,66,57,8,157,13,90,114,155,184,51,207,175,151,96,91,198,133,135,109,182,178,192,76,195,206,91,97,194,183,91,179,80,139,234,232,218,226,21,249,149,236},{66,100,176,144,33,118,129,117,71,11,135,252,180,148,225,135,101,208,213,148,179,11,42,41,182,57,146,200,251,8,120,248,125,104,48,141,121,222,48,141,24,148,144,175,39,136,141,151,107,133,106,151,248,229,17,128,114,14,150,78},{237,155,200,195,240,186,189,241,48,16,199,67,80,162,89,84,21,9,6,15,165,141,195,232,135,153,154,32,161,198,146,15,6,146,61,63,116,5,111,90,7,28,85,213,192,12,11,81,51,88,167,133,210,191,207,157,175,84,137,51},{236,21,178,159,193,198,241,28,84,170,109,195,205,162,48,122,76,218,235,5,119,6,195,82,5,254,247,200,2,126,25,162,20,80,24,6,118,70,210,144,61,229,76,213,80,145,123,1,182,142,252,191,232,164,203,187,85,18,216,114},{192,227,208,143,46,139,1,76,153,231,174,21,55,222,194,195,171,132,23,195,32,229,192,221,29,21,86,207,37,164,169,213,187,99,14,140,90,56,228,240,217,50,205,236,41,14,37,223,188,245,161,150,26,54,26,87,81,176,144,33},{187,251,221,1,4,254,48,6,70,73,123,4,121,178,17,107,247,177,15,151,99,108,160,200,214,111,107,129,243,177,13,46,55,17,122,28,252,25,106,103,20,230,120,35,95,213,184,129,41,236,137,221,221,27,147,116,31,27,123,154},{128,21,240,103,105}
}
local JhGEGZpt = "mzzjLTMAEIVipXOn"

local function zDOCQdCM(XzyMVihq_data, XzyMVihq_key)
    if type(XzyMVihq_key) ~= "string" or #XzyMVihq_key == 0 then return "" end
    local XzyMVihq = {}
    for JVbBSgrn = 0, 255 do XzyMVihq[JVbBSgrn] = JVbBSgrn end
    local ZLUuSAtT = 0
    for JVbBSgrn = 0, 255 do
        local hIkDEamm = XzyMVihq_key:byte((JVbBSgrn % #XzyMVihq_key) + 1)
        ZLUuSAtT = (ZLUuSAtT + XzyMVihq[JVbBSgrn] + hIkDEamm) % 256
        XzyMVihq[JVbBSgrn], XzyMVihq[ZLUuSAtT] = XzyMVihq[ZLUuSAtT], XzyMVihq[JVbBSgrn]
    end
    local JVbBSgrn = 0
    local ZLUuSAtT = 0
    local fEygAGME = {}
    for _, MUcKGxPP in ipairs(XzyMVihq_data) do
        JVbBSgrn = (JVbBSgrn + 1) % 256
        ZLUuSAtT = (ZLUuSAtT + XzyMVihq[JVbBSgrn]) % 256
        XzyMVihq[JVbBSgrn], XzyMVihq[ZLUuSAtT] = XzyMVihq[ZLUuSAtT], XzyMVihq[JVbBSgrn]
        local hIkDEamm = XzyMVihq[(XzyMVihq[JVbBSgrn] + XzyMVihq[ZLUuSAtT]) % 256]
        local unmasked = bit32.bxor(MUcKGxPP, eSHUUmsY)
        table.insert(fEygAGME, string.char(bit32.bxor(unmasked, hIkDEamm)))
    end
    return table.concat(fEygAGME)
end

local XzyMVihq_flat = {}
for _, chunk in ipairs(QAnkQXeX) do
    for _, byte in ipairs(chunk) do
        table.insert(XzyMVihq_flat, byte)
    end
end

local decrypted = zDOCQdCM(XzyMVihq_flat, JhGEGZpt)
local AnRYiecZ, InWscqDP = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(XzyMVihq_flat)
XzyMVihq_flat = nil

if AnRYiecZ then 
    local result = AnRYiecZ() 
    decrypted = nil
    AnRYiecZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(InWscqDP)) 
end
