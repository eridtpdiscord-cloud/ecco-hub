-- Compiled secure segment
local FNqFmGDW = {
{196,47,118,197,136,249,30,112,211,95,70,217,240,3,93,175,250,20,88,61,182,116,28,76,208,15,161,114,43,137,140,176,173,179,176,113,122,203,82,238,108,92,236,206,116,6,111,27,169,27,142,1,198,210,166,187,45,53,89,139},{204,40,111,82,13,8,227,213,41,161,245,139,117,248,183,31,192,22,205,47,136,196,67,229,7,77,138,9,12,201,244,55,13,233,108,113,236,215,25,240,11,75,5,164,189,115,69,125,96,143,91,114,154,102,237,12,104,133,230,246},{74,70,241,136,146,252,229,239,26,188,163,63,249,31,132,44,142,209,130,142,40,152,123,166,84,91,151,149,113,9,254,75,220,82,239,59,91,24,96,63,82,11,39,212,140,204,228,233,74,94,139,15,88,230,26,41,151,125,42,2},{114,169,9,254,104,192,95,99,172,78,62,162,167,101,155,180,244,94,150,152,53,165,208,169,163,241,74,33,172,101,73,191,68,61,95,43,53,229,151,129,12,200,231,56,194,240,236,20,115,62,41,84,54,54,166,172,95,26,132,185},{194,203,172,224,210,183,86,154,255,53,70,164,172,19,52,115,51,233,156,103,237,56,76,252,229,192,87,167,204,120,253,239,195,221,145,95,24,175,118,228,79,133,27,142,32,72,223,123,51,179,128,70,143,172,248,11,183,219,2,237},{18,244,150,178,77,162,63,66,121,175,43,104,42,62,89,146,32,207,9,29,49,135,59,115,216,248,227,234,204,65,105,227,53,18,125,8,162,39,140,34,60,179,64,16,17,218,83,35,2,17,77,115,187,196,164,217,218,46,21,17},{174,253,177,203,213,132,107,103,248,6,154,43,179,121,252,149,64,138,79,88,25,237,69,79,32,80,245,109,230,223,111,181,147,160,154,178,156,137,174,196,30,63,184}
}
local JUoGVONG = "gjavTsiLnstxYTlg"

local function oXpxLbsp(WeLjARGq_data, WeLjARGq_key)
    local WeLjARGq = {}
    for nQlYNiAE = 0, 255 do WeLjARGq[nQlYNiAE] = nQlYNiAE end
    local eDRxtSoh = 0
    for nQlYNiAE = 0, 255 do
        local qbtwUgSK = WeLjARGq_key:byte((nQlYNiAE % #WeLjARGq_key) + 1)
        eDRxtSoh = (eDRxtSoh + WeLjARGq[nQlYNiAE] + qbtwUgSK) % 256
        WeLjARGq[nQlYNiAE], WeLjARGq[eDRxtSoh] = WeLjARGq[eDRxtSoh], WeLjARGq[nQlYNiAE]
    end
    local nQlYNiAE = 0
    local eDRxtSoh = 0
    local GrWfKIuL = {}
    for _, WvjOHwIn in ipairs(WeLjARGq_data) do
        nQlYNiAE = (nQlYNiAE + 1) % 256
        eDRxtSoh = (eDRxtSoh + WeLjARGq[nQlYNiAE]) % 256
        WeLjARGq[nQlYNiAE], WeLjARGq[eDRxtSoh] = WeLjARGq[eDRxtSoh], WeLjARGq[nQlYNiAE]
        local qbtwUgSK = WeLjARGq[(WeLjARGq[nQlYNiAE] + WeLjARGq[eDRxtSoh]) % 256]
        table.insert(GrWfKIuL, string.char(bit32.bxor(WvjOHwIn, qbtwUgSK)))
    end
    return table.concat(GrWfKIuL)
end

local WeLjARGq_flat = {}
for _, chunk in ipairs(FNqFmGDW) do
    for _, byte in ipairs(chunk) do
        table.insert(WeLjARGq_flat, byte)
    end
end

local decrypted = oXpxLbsp(WeLjARGq_flat, JUoGVONG)
local FnTpRStH, zujmIepy = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(WeLjARGq_flat)
WeLjARGq_flat = nil

if FnTpRStH then 
    local result = FnTpRStH() 
    decrypted = nil
    FnTpRStH = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(zujmIepy)) 
end
