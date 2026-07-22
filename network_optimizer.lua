-- Protected Segment (network_optimizer)
local AfBuyADu = 130
local rkjmWRHf = {
{118,219,85,105,179,150,211,26,4,217,140,124,210,66,176,157,252,95,223,152,217,83,247,9,32,84,253,120,76,89,180,52,227,19,225,163,250,106,107,28,207,78,174,46,127,160,0,76,71,166,248,248,236,155,24,175,242,191,0,163},{144,228,231,173,207,34,65,123,89,127,247,70,141,95,14,8,58,190,49,174,35,239,71,154,63,112,149,138,140,20,24,111,192,21,71,62,30,246,247,158,124,114,15,10,75,177,117,72,101,69,137,205,33,56,187,159,193,90,20,94},{236,61,100,153,45,146,127,32,50,179,181,139,132,169,130,115,97,81,242,29,27,236,125,123,202,175,4,55,106}
}
local TrrYbjhc = "PstzEesmzjBeYMAm"

local function EPGTmwJe(SKfifBLb_data, SKfifBLb_key)
    local SKfifBLb = {}
    for eqKCCZLn = 0, 255 do SKfifBLb[eqKCCZLn] = eqKCCZLn end
    local kTNgCGQb = 0
    for eqKCCZLn = 0, 255 do
        local UgPdnlZT = SKfifBLb_key:byte((eqKCCZLn % #SKfifBLb_key) + 1)
        kTNgCGQb = (kTNgCGQb + SKfifBLb[eqKCCZLn] + UgPdnlZT) % 256
        SKfifBLb[eqKCCZLn], SKfifBLb[kTNgCGQb] = SKfifBLb[kTNgCGQb], SKfifBLb[eqKCCZLn]
    end
    local eqKCCZLn = 0
    local kTNgCGQb = 0
    local ziQABGUP = {}
    for _, rQBUelMK in ipairs(SKfifBLb_data) do
        eqKCCZLn = (eqKCCZLn + 1) % 256
        kTNgCGQb = (kTNgCGQb + SKfifBLb[eqKCCZLn]) % 256
        SKfifBLb[eqKCCZLn], SKfifBLb[kTNgCGQb] = SKfifBLb[kTNgCGQb], SKfifBLb[eqKCCZLn]
        local UgPdnlZT = SKfifBLb[(SKfifBLb[eqKCCZLn] + SKfifBLb[kTNgCGQb]) % 256]
        local unmasked = bit32.bxor(rQBUelMK, AfBuyADu)
        table.insert(ziQABGUP, string.char(bit32.bxor(unmasked, UgPdnlZT)))
    end
    return table.concat(ziQABGUP)
end

local SKfifBLb_flat = {}
for _, chunk in ipairs(rkjmWRHf) do
    for _, byte in ipairs(chunk) do
        table.insert(SKfifBLb_flat, byte)
    end
end

local decrypted = EPGTmwJe(SKfifBLb_flat, TrrYbjhc)
local pMOHvpDJ, TtkQUsaf = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(SKfifBLb_flat)
SKfifBLb_flat = nil

if pMOHvpDJ then 
    local result = pMOHvpDJ() 
    decrypted = nil
    pMOHvpDJ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(TtkQUsaf)) 
end
