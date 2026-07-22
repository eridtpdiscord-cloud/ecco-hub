-- Protected Segment (db)
local uEUdikAA = 77
local aGjHuJhH = {
{211,36,37,20,37,250,191,81,49,120,219,72,74,137,88,191,214,213,57,38,235,70,205,150,192,199,197,96,227,180,231,243,99,0,54,98,135,86,33,0,245,151,104,35,53,122,96,238,253,237,227,149,220,227,186,165,56,56,249,111},{16,116,182,4,229,182,48,79,102,220,93,11,112,134,184,99,6,24,14,229,31,83,232,220,56,68,83,165,170,227,139,233,135,156,75,15,105,171,3,31,65,194,225,210,27,185,228,237,222,86,125,97,245,83,113,163,163,5,134,216},{179,229,197,88,0,120,234,120,26,190,109,0,149,252,42,239,182,127,133,231,112,128,2,166,37,190,222,116,247,49,34,207,241,56,140,55,77,241,80,184,229,167,254,99,184,147,210,177,135,40,238,152,218,127,139,57,111,224,9,123},{183,17,49,113,134,141,55,62,130,8,62,71,183,68,203,177,41,162,224,141,243,58,45,134,234,181,196,149,40,41,210,108,119,43,182,128,69,10,119,188,91,99,185,65,162,143,183,124,61,171,226,134,193,127,72,233,248,24,235,234},{85,56,183,132,45,182,100,211,12,228,183,107,219,82,102,243,162,89,62,141,216,217,77,195,123,19,35,61,134,172,92,222,56,178,214,105,4,224,98,63,251,82,184,117,178,200,16,29,193,215,47,87,227,234,153,204,7,176,56,74},{132,219,26,173,35,29,41,142,66,146,215,30,160,194,119,147,23,195,215,7,243,214,136,205,52,3,91,37,244,217,65,235,31,188,129,65,34,8,193,51,224,139,227,32,217,200,74,133,128,36,144,247,10,119,104,85,144,230,237,105},{91,105,230,229,63,46,87,110,240,143,107,240,237,11,141,161,58,29,192,8,154,247,91,98,80,18,182,87,33,52,101,133,76,125,198,36,120,25,178,148,4,71,101,239,187,227,44,198,77,179,142,88,2,200,234,134,223,154,59,210},{76,78,87,101,162,241,2,102,162,174,232,42,211,187,107,248,211,13,221,138,76,85,211,9,251,226,66,96,28,137,38,155,53,201,160,238,94,212,87,90,59,144,62,221,154,18,229,44,185,228,37,253,224,122,45,121,181,228,102,192}
}
local VvCFbdag = "yPPGJXrbyTXflvZQ"

local function UWXGpThe(llngmHKK_data, llngmHKK_key)
    local llngmHKK = {}
    for tysqPruP = 0, 255 do llngmHKK[tysqPruP] = tysqPruP end
    local vWQDZOxi = 0
    for tysqPruP = 0, 255 do
        local FpnTHZMh = llngmHKK_key:byte((tysqPruP % #llngmHKK_key) + 1)
        vWQDZOxi = (vWQDZOxi + llngmHKK[tysqPruP] + FpnTHZMh) % 256
        llngmHKK[tysqPruP], llngmHKK[vWQDZOxi] = llngmHKK[vWQDZOxi], llngmHKK[tysqPruP]
    end
    local tysqPruP = 0
    local vWQDZOxi = 0
    local xQuiWebk = {}
    for _, qOxtPZVu in ipairs(llngmHKK_data) do
        tysqPruP = (tysqPruP + 1) % 256
        vWQDZOxi = (vWQDZOxi + llngmHKK[tysqPruP]) % 256
        llngmHKK[tysqPruP], llngmHKK[vWQDZOxi] = llngmHKK[vWQDZOxi], llngmHKK[tysqPruP]
        local FpnTHZMh = llngmHKK[(llngmHKK[tysqPruP] + llngmHKK[vWQDZOxi]) % 256]
        local unmasked = bit32.bxor(qOxtPZVu, uEUdikAA)
        table.insert(xQuiWebk, string.char(bit32.bxor(unmasked, FpnTHZMh)))
    end
    return table.concat(xQuiWebk)
end

local llngmHKK_flat = {}
for _, chunk in ipairs(aGjHuJhH) do
    for _, byte in ipairs(chunk) do
        table.insert(llngmHKK_flat, byte)
    end
end

local decrypted = UWXGpThe(llngmHKK_flat, VvCFbdag)
local omLsXKMg, PjpkDgJj = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(llngmHKK_flat)
llngmHKK_flat = nil

if omLsXKMg then 
    local result = omLsXKMg() 
    decrypted = nil
    omLsXKMg = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(PjpkDgJj)) 
end
