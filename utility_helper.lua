-- Protected Segment (utility_helper)
local npxTQdjy = 21
local IUKbRUPW = {
{252,192,252,249,54,64,170,166,27,99,4,253,88,31,135,233,63,6,104,1,187,208,96,23,20,223,175,40,80,132,105,110,201,193,55,217,171,212,182,131,4,161,254,1,55,13,98,124,19,141,231,156,44,127,188,233,236,96,22,19},{108,164,144,18,127,20,57,46,110,112,50,209,201,92,210,143,151,146,51,28,5,126,169,72,28,162,38,156,103,0,87,100,85,226,92,105,254,93,252,47,210,201,210,114,68,121,164,24,85,102,191,250,107,1,220,142,117,135,152,65},{3,183,244,135,182,174,218,36,83,171,211,232,49,34,5,41,243,9,215,133,134,155,103,205,187,79}
}
local cmKnyqPd = "DhLYtPvbpIMEmzes"

local function YoPCGYrn(oiXLqnoT_data, oiXLqnoT_key)
    if type(oiXLqnoT_key) ~= "string" or #oiXLqnoT_key == 0 then return "" end
    local oiXLqnoT = {}
    for tMuFlZmM = 0, 255 do oiXLqnoT[tMuFlZmM] = tMuFlZmM end
    local cvoPGZOC = 0
    for tMuFlZmM = 0, 255 do
        local eRIOLJnd = oiXLqnoT_key:byte((tMuFlZmM % #oiXLqnoT_key) + 1)
        cvoPGZOC = (cvoPGZOC + oiXLqnoT[tMuFlZmM] + eRIOLJnd) % 256
        oiXLqnoT[tMuFlZmM], oiXLqnoT[cvoPGZOC] = oiXLqnoT[cvoPGZOC], oiXLqnoT[tMuFlZmM]
    end
    local tMuFlZmM = 0
    local cvoPGZOC = 0
    local WMgtgKyd = {}
    for _, paybAlkX in ipairs(oiXLqnoT_data) do
        tMuFlZmM = (tMuFlZmM + 1) % 256
        cvoPGZOC = (cvoPGZOC + oiXLqnoT[tMuFlZmM]) % 256
        oiXLqnoT[tMuFlZmM], oiXLqnoT[cvoPGZOC] = oiXLqnoT[cvoPGZOC], oiXLqnoT[tMuFlZmM]
        local eRIOLJnd = oiXLqnoT[(oiXLqnoT[tMuFlZmM] + oiXLqnoT[cvoPGZOC]) % 256]
        local unmasked = bit32.bxor(paybAlkX, npxTQdjy)
        table.insert(WMgtgKyd, string.char(bit32.bxor(unmasked, eRIOLJnd)))
    end
    return table.concat(WMgtgKyd)
end

local oiXLqnoT_flat = {}
for _, chunk in ipairs(IUKbRUPW) do
    for _, byte in ipairs(chunk) do
        table.insert(oiXLqnoT_flat, byte)
    end
end

local decrypted = YoPCGYrn(oiXLqnoT_flat, cmKnyqPd)
local qhGpfarA, IdBBlUdj = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(oiXLqnoT_flat)
oiXLqnoT_flat = nil

if qhGpfarA then 
    local result = qhGpfarA() 
    decrypted = nil
    qhGpfarA = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(IdBBlUdj)) 
end
