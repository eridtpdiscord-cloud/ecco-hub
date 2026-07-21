-- Compiled secure segment
local Iquspzwb = {
{38,232,52,22,26,10,246,147,202,175,5,246,230,71,185,195,10,12,102,169,230,207,131,115,186,134,232,95,234,80,92,228,71,179,2,205,47,132,197,239,70,57,222,103,66,223,204,101,147,38,164,236,1,164,221,154,65,190,118,166},{155,53,90,100,36,60,127,162,168,182,59,106,141,173,88,238,29,210,109,114,12,208,44,170,72,165,140,133,209,160,131,76,191,107,203,57,77,183,242,102,171,113,128,244,209,78,205,99,190,76,111,129,88,110,134,193,178,4,54,205},{206,233,104,102,49,230,165,230,154,86,15,118,233,47,178,10,205,51,5,13,41,253,193,4,232,142,84,152,98,44,235,194,229,243,134,199,253,162,77,134,74,220,95,78,43,246,132,88,227,58,177,222,94,79,102,156,147,230,24,243},{63,217,66,156,75,167,158,154,10,53,163,210,49,45,222,153,178,98,123,47,140,56,253,48,73,122,243,96,92,98,150,61,10,107,105,46,67,82,235,143,14,15,187,243,20,213,254,255,38,179,76,30,124,232,254,197,60,159,236,21},{198,78,248,67,124,64,142,226,201,170,252,105,52,98,58,45,148,133,101,37,153,17,178,188,110,208,95,75,159,180,213,144,109,128,51,149,239,13,62,103,249,10,249,197,53,251,233,173,231,190,0,107,85,187,107,173,1,75,116,204},{31,136,198,151,234,72,16,66,39,234,85,16,38,56,73,58,157,85,253,221,42,169,171,177,208,223,22,64,213,156,49,32,37,149,179,123,3,142,33,9,197,18,119,101,129,155,165,20,33,32,17,188,149,152,48,235,153,253,93,133},{71,229,116,226,223,114,197,68,223,235,122,188,149,250,6,215,183,172,157,26,154,232,251,153,205,101,123,197,236,178,247,90,161,224,245,137,21,245,234,79,226,42,249,178,171,121,18,90}
}
local cwvFTQYt = "QixunxFCbTcaLMzb"

local function XRvDZSbs(KSrYdHTb_data, KSrYdHTb_key)
    local KSrYdHTb = {}
    for ujUrLPZu = 0, 255 do KSrYdHTb[ujUrLPZu] = ujUrLPZu end
    local SWhlsvea = 0
    for ujUrLPZu = 0, 255 do
        local ABfUUkVk = KSrYdHTb_key:byte((ujUrLPZu % #KSrYdHTb_key) + 1)
        SWhlsvea = (SWhlsvea + KSrYdHTb[ujUrLPZu] + ABfUUkVk) % 256
        KSrYdHTb[ujUrLPZu], KSrYdHTb[SWhlsvea] = KSrYdHTb[SWhlsvea], KSrYdHTb[ujUrLPZu]
    end
    local ujUrLPZu = 0
    local SWhlsvea = 0
    local TkgSyRSI = {}
    for _, GlEkwUND in ipairs(KSrYdHTb_data) do
        ujUrLPZu = (ujUrLPZu + 1) % 256
        SWhlsvea = (SWhlsvea + KSrYdHTb[ujUrLPZu]) % 256
        KSrYdHTb[ujUrLPZu], KSrYdHTb[SWhlsvea] = KSrYdHTb[SWhlsvea], KSrYdHTb[ujUrLPZu]
        local ABfUUkVk = KSrYdHTb[(KSrYdHTb[ujUrLPZu] + KSrYdHTb[SWhlsvea]) % 256]
        table.insert(TkgSyRSI, string.char(bit32.bxor(GlEkwUND, ABfUUkVk)))
    end
    return table.concat(TkgSyRSI)
end

local KSrYdHTb_flat = {}
for _, chunk in ipairs(Iquspzwb) do
    for _, byte in ipairs(chunk) do
        table.insert(KSrYdHTb_flat, byte)
    end
end

local decrypted = XRvDZSbs(KSrYdHTb_flat, cwvFTQYt)
local VeLmDRcg, QijcDeal = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(KSrYdHTb_flat)
KSrYdHTb_flat = nil

if VeLmDRcg then 
    local result = VeLmDRcg() 
    decrypted = nil
    VeLmDRcg = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(QijcDeal)) 
end
