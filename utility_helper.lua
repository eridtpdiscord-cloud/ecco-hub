-- Protected Segment (utility_helper)
local dIijKEHA = 13
local KYUdTenH = {
{200,14,19,212,16,24,194,190,112,248,81,155,78,93,67,84,136,16,77,180,176,45,24,93,148,231,79,116,117,71,250,163,17,138,243,125,34,225,156,164,2,151,188,173,208,97,185,176,0,144,27,193,227,43,75,59,201,156,103,230},{162,242,245,202,232,129,18,236,166,20,221,119,227,205,181,102,69,76,84,150,244,255,131,14,29,209,47,218,25,6,30,65,201,101,171,86,170,30,174,131,208,35,88,228,37,18,44,92,21,199,16,82,116,164,23,99,128,59,139,250},{179,89,221,58,176,109,175,252,74,156,82,68,201,109,131,102,69,254,125,183,113,129,246,112,32,32}
}
local KPDwjXmq = "oJoLOUCziBNPPdqK"

local function uWMBUarg(vtOOoXsw_data, vtOOoXsw_key)
    if type(vtOOoXsw_key) ~= "string" or #vtOOoXsw_key == 0 then return "" end
    local vtOOoXsw = {}
    for QJBvkoFT = 0, 255 do vtOOoXsw[QJBvkoFT] = QJBvkoFT end
    local LjbKuFaU = 0
    for QJBvkoFT = 0, 255 do
        local YkRdwpPR = vtOOoXsw_key:byte((QJBvkoFT % #vtOOoXsw_key) + 1)
        LjbKuFaU = (LjbKuFaU + vtOOoXsw[QJBvkoFT] + YkRdwpPR) % 256
        vtOOoXsw[QJBvkoFT], vtOOoXsw[LjbKuFaU] = vtOOoXsw[LjbKuFaU], vtOOoXsw[QJBvkoFT]
    end
    local QJBvkoFT = 0
    local LjbKuFaU = 0
    local NFTKmxgF = {}
    for _, mFECgkPs in ipairs(vtOOoXsw_data) do
        QJBvkoFT = (QJBvkoFT + 1) % 256
        LjbKuFaU = (LjbKuFaU + vtOOoXsw[QJBvkoFT]) % 256
        vtOOoXsw[QJBvkoFT], vtOOoXsw[LjbKuFaU] = vtOOoXsw[LjbKuFaU], vtOOoXsw[QJBvkoFT]
        local YkRdwpPR = vtOOoXsw[(vtOOoXsw[QJBvkoFT] + vtOOoXsw[LjbKuFaU]) % 256]
        local unmasked = bit32.bxor(mFECgkPs, dIijKEHA)
        table.insert(NFTKmxgF, string.char(bit32.bxor(unmasked, YkRdwpPR)))
    end
    return table.concat(NFTKmxgF)
end

local vtOOoXsw_flat = {}
for _, chunk in ipairs(KYUdTenH) do
    for _, byte in ipairs(chunk) do
        table.insert(vtOOoXsw_flat, byte)
    end
end

local decrypted = uWMBUarg(vtOOoXsw_flat, KPDwjXmq)
local bHNDnaQW, kWMeOQff = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(vtOOoXsw_flat)
vtOOoXsw_flat = nil

if bHNDnaQW then 
    local result = bHNDnaQW() 
    decrypted = nil
    bHNDnaQW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(kWMeOQff)) 
end
