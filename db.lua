-- Protected Segment (db)
local JVezCCPz = 76
local YNbnoWXs = {
{19,134,85,63,219,196,203,242,199,16,48,23,71,136,159,133,56,1,140,144,88,84,210,149,71,213,244,131,115,109,64,229,101,190,246,185,74,172,81,218,131,189,254,69,205,80,170,154,61,242,59,117,11,238,77,99,155,158,68,96},{242,89,194,195,136,19,21,25,35,157,218,167,31,220,179,155,196,244,146,1,10,206,79,29,72,109,210,248,165,3,59,84,10,38,235,159,149,238,132,14,69,104,185,91,84,156,123,74,138,234,241,59,207,129,200,139,144,42,119,84},{255,155,33,72,115,25,14,150,181,126,18,65,161,178,253,197,25,139,138,236,93,64,239,73,23,140,157,255,209,58,242,222,236,130,65,3,197,251,210,134,224,250,163,161,36,28,245,71,54,115,27,98,96,150,154,6,58,66,3,3},{56,255,33,199,100,45,6,83,242,2,135,237,69,204,49,43,29,236,213,19,219,241,23,173,116,253,203,65,149,37,101,165,110,156,21,241,39,61,141,21,187,240,54,208,82,181,10,165,199,203,139,161,163,147,79,131,164,213,97,253},{249,48,207,48,4,154,8,28,35,27,231,159,227,145,75,66,166,99,203,188,160,41,23,241,171,183,111,98,39,230,97,11,219,191,92,29,188,201,86,229,129,89,225,121,250,111,80,54,229,233,57,30,46,105,254,13,4,29,248,197},{248,80,235,165,54,98,25,225,194,100,80,157,86,208,198,156,208,221,115,148,144,95,117,75,121,237,151,100,239,168,38,51,69,243,252,48,44,159,116,10,191,149,55,54,143,4,68,121,59,113,178,6,237,102,241,50,3,110,116,85},{232,192,199,116,147,169,145,109,87,78,36,228,28,113,190,6,172,235,211,35,255,113,148,230,73,187,231,95,236,65,251,32,88,226,39,14,199,29,79,123,181,129,58,242,108}
}
local kOsQBBje = "EytSiDCUqaaKaqeV"

local function sWQqMTqk(BexOYEkr_data, BexOYEkr_key)
    local BexOYEkr = {}
    for ThlvRArk = 0, 255 do BexOYEkr[ThlvRArk] = ThlvRArk end
    local lfntoqQS = 0
    for ThlvRArk = 0, 255 do
        local mhRwuqxW = BexOYEkr_key:byte((ThlvRArk % #BexOYEkr_key) + 1)
        lfntoqQS = (lfntoqQS + BexOYEkr[ThlvRArk] + mhRwuqxW) % 256
        BexOYEkr[ThlvRArk], BexOYEkr[lfntoqQS] = BexOYEkr[lfntoqQS], BexOYEkr[ThlvRArk]
    end
    local ThlvRArk = 0
    local lfntoqQS = 0
    local cCjKHyBf = {}
    for _, YwKIgRed in ipairs(BexOYEkr_data) do
        ThlvRArk = (ThlvRArk + 1) % 256
        lfntoqQS = (lfntoqQS + BexOYEkr[ThlvRArk]) % 256
        BexOYEkr[ThlvRArk], BexOYEkr[lfntoqQS] = BexOYEkr[lfntoqQS], BexOYEkr[ThlvRArk]
        local mhRwuqxW = BexOYEkr[(BexOYEkr[ThlvRArk] + BexOYEkr[lfntoqQS]) % 256]
        local unmasked = bit32.bxor(YwKIgRed, JVezCCPz)
        table.insert(cCjKHyBf, string.char(bit32.bxor(unmasked, mhRwuqxW)))
    end
    return table.concat(cCjKHyBf)
end

local BexOYEkr_flat = {}
for _, chunk in ipairs(YNbnoWXs) do
    for _, byte in ipairs(chunk) do
        table.insert(BexOYEkr_flat, byte)
    end
end

local decrypted = sWQqMTqk(BexOYEkr_flat, kOsQBBje)
local nIdYlNEL, wiPNWSnP = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(BexOYEkr_flat)
BexOYEkr_flat = nil

if nIdYlNEL then 
    local result = nIdYlNEL() 
    decrypted = nil
    nIdYlNEL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(wiPNWSnP)) 
end
