-- Protected Segment (network_optimizer)
local gGxMCvTU = 189
local YFtExOgq = {
{41,120,182,26,59,164,27,111,82,242,189,125,130,227,16,132,166,221,66,135,155,239,83,90,135,170,184,58,70,147,106,16,144,245,243,95,247,42,114,36,93,59,27,61,182,136,128,163,36,162,81,108,254,247,198,189,92,54,54,1},{30,96,95,75,242,202,172,85,122,29,93,64,66,75,48,246,245,137,65,34,16,51,192,239,14,34,35,20,91,75,164,128,118,81,167,24,214,99,5,21,188,110,82,144,204,125,94,1,160,52,17,20,58,70,57,247,248,24,205,77},{59,164,185,161,70,91,55,252,68,119,80,254,170,51,9,111,253,117,172,162,188,199,50,63,210,99,200,87,226}
}
local MyGpLoaW = "WDfrIeOzFucPTOLA"

local function WIbwopoi(BtdyTDAY_data, BtdyTDAY_key)
    local BtdyTDAY = {}
    for kcewWTei = 0, 255 do BtdyTDAY[kcewWTei] = kcewWTei end
    local nnEbfqfF = 0
    for kcewWTei = 0, 255 do
        local mCNDFWAm = BtdyTDAY_key:byte((kcewWTei % #BtdyTDAY_key) + 1)
        nnEbfqfF = (nnEbfqfF + BtdyTDAY[kcewWTei] + mCNDFWAm) % 256
        BtdyTDAY[kcewWTei], BtdyTDAY[nnEbfqfF] = BtdyTDAY[nnEbfqfF], BtdyTDAY[kcewWTei]
    end
    local kcewWTei = 0
    local nnEbfqfF = 0
    local TOroVxfi = {}
    for _, PaUtKgzW in ipairs(BtdyTDAY_data) do
        kcewWTei = (kcewWTei + 1) % 256
        nnEbfqfF = (nnEbfqfF + BtdyTDAY[kcewWTei]) % 256
        BtdyTDAY[kcewWTei], BtdyTDAY[nnEbfqfF] = BtdyTDAY[nnEbfqfF], BtdyTDAY[kcewWTei]
        local mCNDFWAm = BtdyTDAY[(BtdyTDAY[kcewWTei] + BtdyTDAY[nnEbfqfF]) % 256]
        local unmasked = bit32.bxor(PaUtKgzW, gGxMCvTU)
        table.insert(TOroVxfi, string.char(bit32.bxor(unmasked, mCNDFWAm)))
    end
    return table.concat(TOroVxfi)
end

local BtdyTDAY_flat = {}
for _, chunk in ipairs(YFtExOgq) do
    for _, byte in ipairs(chunk) do
        table.insert(BtdyTDAY_flat, byte)
    end
end

local decrypted = WIbwopoi(BtdyTDAY_flat, MyGpLoaW)
local KJxAAQPm, xdKoSMhN = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(BtdyTDAY_flat)
BtdyTDAY_flat = nil

if KJxAAQPm then 
    local result = KJxAAQPm() 
    decrypted = nil
    KJxAAQPm = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(xdKoSMhN)) 
end
