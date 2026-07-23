-- Protected Segment (db)
local AnUmJRxq = 205
local bGHNSTpH = {
{137,88,233,18,96,53,239,55,120,251,72,210,117,121,24,231,234,68,151,214,15,195,245,190,40,84,105,162,133,207,23,223,113,167,123,186,30,154,50,67,163,223,58,107,120,65,176,60,145,172,178,230,228,247,89,189,107,59,101,148},{220,222,174,174,98,109,168,186,199,44,50,58,196,214,49,184,220,64,160,217,33,149,74,32,255,145,169,140,47,196,107,95,177,172,6,141,225,229,142,81,254,48,162,121,178,249,57,88,193,162,44,94,70,189,228,175,85,206,100,140},{85,226,72,178,252,197,138,105,176,91,122,96,68,87,53,70,32,121,170,106,60,210,203,228,129,205,49,89,16,145,176,39,65,145,252,110,153,219,179,200,109,233,190,115,188,92,83,0,164,169,26,213,44,65,80,222,246,20,30,230},{235,222,106,172,127,12,114,3,218,141,88,54,161,168,66,127,223,219,220,129,103,226,72,173,211,29,33,145,145,155,249,9,99,57,28,9,92,212,176,124,226,154,35,36,104,199,189,140,140,32,140,129,198,247,85,220,171,112,55,116},{146,245,74,50,44,128,231,169,191,0,143,101,30,231,83,202,51,71,218,210,188,9,177,120,102,187,163,179,47,127,78,0,228,103,112,8,114,160,183,228,65,112,193,124,87,35,125,248,168,90,42,98,116,205,83,134,245,143,211,191},{161,83,159,6,255,250,98,126,2,139,91,184,90,193,222,57,14,146,41,207,162,107,209,148,17,20,56,88,174,44,63,145,106,31,159,243,38,176,227,51,27,128,109,40,172,225,199,94,31,53,25,175,64,118,87,227,149,79,3,96},{203,146,205,227,161,67,153,113,169,24,149,37,104,222,179,177,74,223,211,124,164,24,247,238,192,233,58,194,63,39,205,35,247,162,105,172,84,117,189,218,166,119,19,120,133,150,55,220,251,63,132,13,96,19,155,232,146,111,213,63},{242,119,80,62,18,250,178,91,84,151,120,217,228,215,108,188,237,105,19,0,95,132,181,157,109,146,247,61,93,225,186,3,64,255,234,199,245,48,129,13,238,98,142,51,7,40,164,138,168,96,88,53,85,57,112,222,202,151,152}
}
local XoKKdvQm = "drcFugdnKjqgoZNc"

local function bhqVjaYE(ptBMffXg_data, ptBMffXg_key)
    if type(ptBMffXg_key) ~= "string" or #ptBMffXg_key == 0 then return "" end
    local ptBMffXg = {}
    for dqLEAzad = 0, 255 do ptBMffXg[dqLEAzad] = dqLEAzad end
    local SgwFQZeM = 0
    for dqLEAzad = 0, 255 do
        local BNIyOpdp = ptBMffXg_key:byte((dqLEAzad % #ptBMffXg_key) + 1)
        SgwFQZeM = (SgwFQZeM + ptBMffXg[dqLEAzad] + BNIyOpdp) % 256
        ptBMffXg[dqLEAzad], ptBMffXg[SgwFQZeM] = ptBMffXg[SgwFQZeM], ptBMffXg[dqLEAzad]
    end
    local dqLEAzad = 0
    local SgwFQZeM = 0
    local YNEkWuDM = {}
    for _, VmaZDSjb in ipairs(ptBMffXg_data) do
        dqLEAzad = (dqLEAzad + 1) % 256
        SgwFQZeM = (SgwFQZeM + ptBMffXg[dqLEAzad]) % 256
        ptBMffXg[dqLEAzad], ptBMffXg[SgwFQZeM] = ptBMffXg[SgwFQZeM], ptBMffXg[dqLEAzad]
        local BNIyOpdp = ptBMffXg[(ptBMffXg[dqLEAzad] + ptBMffXg[SgwFQZeM]) % 256]
        local unmasked = bit32.bxor(VmaZDSjb, AnUmJRxq)
        table.insert(YNEkWuDM, string.char(bit32.bxor(unmasked, BNIyOpdp)))
    end
    return table.concat(YNEkWuDM)
end

local ptBMffXg_flat = {}
for _, chunk in ipairs(bGHNSTpH) do
    for _, byte in ipairs(chunk) do
        table.insert(ptBMffXg_flat, byte)
    end
end

local decrypted = bhqVjaYE(ptBMffXg_flat, XoKKdvQm)
local joPjtPIF, FpcfbKvg = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ptBMffXg_flat)
ptBMffXg_flat = nil

if joPjtPIF then 
    local result = joPjtPIF() 
    decrypted = nil
    joPjtPIF = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(FpcfbKvg)) 
end
