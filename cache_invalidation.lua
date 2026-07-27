-- Protected Segment (cache_invalidation)
local BmDApgsj = 166
local NUXEEDnC = {
{143,31,102,112,183,213,126,154,110,107,31,76,57,170,60,104,14,203,148,44,70,131,38,234,234,205,52,17,24,203,29,146,245,94,183,77,87,190,125,244,184,123,17,234,238,64,80,115,77,27,96,212,151,70,29,181,183,26,151,79},{77,252,129,221,226,166,249,76,80,17,99,223,213,142,52,22,217,136,121,169,132,75,155,170,181,171,245,66,240,169,70,30,84,103,186,162,185,193,225,162,186,120,24,58,141,239,79,186,188,2,219,168,78,54,122,159,26,159,104,24},{176,198,149,172,84,127,170,8,217,159,164,168,27,48,173,177,240,199,152,216,155,105,240,69,132,167,26,246,243,57}
}
local GPPDygZn = "frXhiulIFApHSfev"

local function OVVqQLul(xglIGejC_data, xglIGejC_key)
    if type(xglIGejC_key) ~= "string" or #xglIGejC_key == 0 then return "" end
    local xglIGejC = {}
    for eDlRBElk = 0, 255 do xglIGejC[eDlRBElk] = eDlRBElk end
    local tgQKCVwO = 0
    for eDlRBElk = 0, 255 do
        local mBFEtiZZ = xglIGejC_key:byte((eDlRBElk % #xglIGejC_key) + 1)
        tgQKCVwO = (tgQKCVwO + xglIGejC[eDlRBElk] + mBFEtiZZ) % 256
        xglIGejC[eDlRBElk], xglIGejC[tgQKCVwO] = xglIGejC[tgQKCVwO], xglIGejC[eDlRBElk]
    end
    local eDlRBElk = 0
    local tgQKCVwO = 0
    local ZJSQVmGm = {}
    for _, khmmpKPg in ipairs(xglIGejC_data) do
        eDlRBElk = (eDlRBElk + 1) % 256
        tgQKCVwO = (tgQKCVwO + xglIGejC[eDlRBElk]) % 256
        xglIGejC[eDlRBElk], xglIGejC[tgQKCVwO] = xglIGejC[tgQKCVwO], xglIGejC[eDlRBElk]
        local mBFEtiZZ = xglIGejC[(xglIGejC[eDlRBElk] + xglIGejC[tgQKCVwO]) % 256]
        local unmasked = bit32.bxor(khmmpKPg, BmDApgsj)
        table.insert(ZJSQVmGm, string.char(bit32.bxor(unmasked, mBFEtiZZ)))
    end
    return table.concat(ZJSQVmGm)
end

local xglIGejC_flat = {}
for _, chunk in ipairs(NUXEEDnC) do
    for _, byte in ipairs(chunk) do
        table.insert(xglIGejC_flat, byte)
    end
end

local decrypted = OVVqQLul(xglIGejC_flat, GPPDygZn)
local aTPrhquN, bONMFOps = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(xglIGejC_flat)
xglIGejC_flat = nil

if aTPrhquN then 
    local result = aTPrhquN() 
    decrypted = nil
    aTPrhquN = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(bONMFOps)) 
end
