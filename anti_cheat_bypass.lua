-- Protected Segment (anti_cheat_bypass)
local uUTsknRB = 243
local uZQUqGFo = {
{82,119,59,129,117,181,80,32,52,206,45,243,116,249,56,153,245,10,88,91,66,154,192,239,30,174,251,130,19,213,13,142,204,203,4,127,250,228,115,27,31,46,254,66,29,89,89,170,195,205,64,97,144,0,215,166,169,216,26,194},{188,52,61,41,179,225,126,179,5,190,181,171,116,210,119,120,101,118,204,165,242,138,124,7,77,108,44,125,138,187,223,19,225,120,30,3,2,58,202,253,76,205,90,229,31,100,90,226,204,23,227,127,187,169,58,151,208,61,8,138},{141,19,15,80,99,105,126,13,180,172,186,191,140,87,192,204,112,185,189,75,227,240,32,100,70,37,26,252,49}
}
local QFdfPIgw = "rQOCSAXMkwtUxTpd"

local function srmvbcLc(cVSkUpdN_data, cVSkUpdN_key)
    if type(cVSkUpdN_key) ~= "string" or #cVSkUpdN_key == 0 then return "" end
    local cVSkUpdN = {}
    for quKcuKGT = 0, 255 do cVSkUpdN[quKcuKGT] = quKcuKGT end
    local nwFIfKci = 0
    for quKcuKGT = 0, 255 do
        local XalOQEdE = cVSkUpdN_key:byte((quKcuKGT % #cVSkUpdN_key) + 1)
        nwFIfKci = (nwFIfKci + cVSkUpdN[quKcuKGT] + XalOQEdE) % 256
        cVSkUpdN[quKcuKGT], cVSkUpdN[nwFIfKci] = cVSkUpdN[nwFIfKci], cVSkUpdN[quKcuKGT]
    end
    local quKcuKGT = 0
    local nwFIfKci = 0
    local uPrOSfEZ = {}
    for _, HnIRGaEU in ipairs(cVSkUpdN_data) do
        quKcuKGT = (quKcuKGT + 1) % 256
        nwFIfKci = (nwFIfKci + cVSkUpdN[quKcuKGT]) % 256
        cVSkUpdN[quKcuKGT], cVSkUpdN[nwFIfKci] = cVSkUpdN[nwFIfKci], cVSkUpdN[quKcuKGT]
        local XalOQEdE = cVSkUpdN[(cVSkUpdN[quKcuKGT] + cVSkUpdN[nwFIfKci]) % 256]
        local unmasked = bit32.bxor(HnIRGaEU, uUTsknRB)
        table.insert(uPrOSfEZ, string.char(bit32.bxor(unmasked, XalOQEdE)))
    end
    return table.concat(uPrOSfEZ)
end

local cVSkUpdN_flat = {}
for _, chunk in ipairs(uZQUqGFo) do
    for _, byte in ipairs(chunk) do
        table.insert(cVSkUpdN_flat, byte)
    end
end

local decrypted = srmvbcLc(cVSkUpdN_flat, QFdfPIgw)
local BamAHsSQ, WlWCFAmw = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(cVSkUpdN_flat)
cVSkUpdN_flat = nil

if BamAHsSQ then 
    local result = BamAHsSQ() 
    decrypted = nil
    BamAHsSQ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(WlWCFAmw)) 
end
