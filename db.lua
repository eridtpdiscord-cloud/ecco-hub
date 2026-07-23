-- Protected Segment (db)
local KIFIxssH = 210
local ftiXNAxD = {
{42,176,96,62,111,190,29,62,233,185,175,135,80,214,137,192,11,107,119,42,121,48,169,229,146,48,125,24,121,223,97,147,253,182,139,124,217,177,88,236,124,175,108,53,66,196,127,165,142,97,252,137,28,103,218,63,56,172,68,217},{163,249,43,74,185,84,40,138,38,140,120,168,16,20,118,207,216,131,95,215,140,134,36,161,214,100,144,158,184,211,64,31,51,176,8,70,140,50,80,197,144,114,17,38,179,69,69,175,105,10,88,39,156,175,166,39,124,237,1,82},{228,153,49,158,211,153,182,248,49,48,158,250,114,90,61,255,65,182,115,104,70,124,246,235,251,213,0,186,197,250,158,98,29,140,169,160,40,183,58,74,216,90,246,187,21,19,14,112,3,33,116,50,147,214,140,33,17,49,194,223},{45,51,27,192,164,138,232,112,11,91,114,232,127,82,1,111,25,25,100,2,19,90,16,113,60,88,228,99,68,95,49,138,85,99,251,244,82,31,25,105,155,143,239,121,221,167,218,197,180,193,202,220,107,222,202,249,60,51,141,235},{105,127,132,164,186,202,228,29,107,25,121,176,238,205,110,13,226,16,100,123,232,47,229,145,88,219,116,57,206,25,216,17,218,221,101,24,192,78,248,179,37,22,126,181,236,10,67,238,189,61,218,18,166,148,16,110,181,68,30,140},{193,100,0,120,14,149,148,226,162,101,202,38,37,66,234,95,22,93,135,195,151,107,53,94,70,198,160,10,136,130,244,126,198,7,104,56,94,237,19,46,51,20,174,8,206,12,42,151,217,212,170,99,21,116,118,144,219,162,90,3},{170,230,121,249,210,134,9,205,233,178,13,176,54,133,164,178,138,198,26,113,101,255,76,154,138,136,193,229,151,65,130,50,33,9,156,16,89,111,180,1,239,202,96,139,188,234,193,73,2,102,60,24,152,119,123,16,153,96,224,160},{166,219,146,102,161,147,6,28,126,227,22,30,233,228,218,51,44,102,242,16,37,254,113,30,230,176,151,3,218,202,90,70,234,83,104,85,76,101,158,51,55,235,192,226,244,26,217,148,41,143,69,5,83,28,130,207,114,203,92}
}
local FIwoNjLv = "ybDQaRJhVcUHXGgu"

local function KVSZpdVL(sqJUCWkR_data, sqJUCWkR_key)
    if type(sqJUCWkR_key) ~= "string" or #sqJUCWkR_key == 0 then return "" end
    local sqJUCWkR = {}
    for dRubEfIJ = 0, 255 do sqJUCWkR[dRubEfIJ] = dRubEfIJ end
    local NFgtOTgw = 0
    for dRubEfIJ = 0, 255 do
        local KVefyvrC = sqJUCWkR_key:byte((dRubEfIJ % #sqJUCWkR_key) + 1)
        NFgtOTgw = (NFgtOTgw + sqJUCWkR[dRubEfIJ] + KVefyvrC) % 256
        sqJUCWkR[dRubEfIJ], sqJUCWkR[NFgtOTgw] = sqJUCWkR[NFgtOTgw], sqJUCWkR[dRubEfIJ]
    end
    local dRubEfIJ = 0
    local NFgtOTgw = 0
    local vvymRaKd = {}
    for _, mGCKsYgO in ipairs(sqJUCWkR_data) do
        dRubEfIJ = (dRubEfIJ + 1) % 256
        NFgtOTgw = (NFgtOTgw + sqJUCWkR[dRubEfIJ]) % 256
        sqJUCWkR[dRubEfIJ], sqJUCWkR[NFgtOTgw] = sqJUCWkR[NFgtOTgw], sqJUCWkR[dRubEfIJ]
        local KVefyvrC = sqJUCWkR[(sqJUCWkR[dRubEfIJ] + sqJUCWkR[NFgtOTgw]) % 256]
        local unmasked = bit32.bxor(mGCKsYgO, KIFIxssH)
        table.insert(vvymRaKd, string.char(bit32.bxor(unmasked, KVefyvrC)))
    end
    return table.concat(vvymRaKd)
end

local sqJUCWkR_flat = {}
for _, chunk in ipairs(ftiXNAxD) do
    for _, byte in ipairs(chunk) do
        table.insert(sqJUCWkR_flat, byte)
    end
end

local decrypted = KVSZpdVL(sqJUCWkR_flat, FIwoNjLv)
local mRpEFdIg, qOKCGQub = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(sqJUCWkR_flat)
sqJUCWkR_flat = nil

if mRpEFdIg then 
    local result = mRpEFdIg() 
    decrypted = nil
    mRpEFdIg = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(qOKCGQub)) 
end
