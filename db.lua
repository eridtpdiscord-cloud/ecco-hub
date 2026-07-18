-- Compiled secure segment
local yMGFwjJD = {
{162,161,78,115,118,217,207,6,5,22,228,148,191,253,114,224,43,106,102,14,92,221,68,55,199,201,213,117,59,203,87,241,3,139,36,207,226,58,26,73,141,104,4,41,227,15,103,189,183,116,174,40,41,226,122,63,221,106,87,78},{208,143,6,221,59,238,86,158,57,3,240,0,59,148,242,1,15,172,243,99,82,25,230,60,15,102,225,84,38,0,96,74,196,24,6,31,58,130,174,40,24,242,63,69,63,201,176,232,108,173,203,187,143,66,190,241,119,180,33,146},{147,213,94,33,200,93,155,193,105,161,109,86,195,146,26,180,82,145,194,85,208,119,187,196,157,191,127,17,39,196,112,27,162,168,216,96,246,246,125,188,240,36,222,64,63,249,78,246,192,165,200,70,208,19,46,196,235,58,61,78},{253,107,253,98,123,198,249,184,165,162,114,226,64,139,50,166,74,66,0,165,16,184,172,236,177,167,219,148,237,138,182,234,225,231,74,26,159,79,107,229,192,233,221,95,158,213,159,131,249,74,157,97,203,209,157,43,37,6,142,239},{5,187,66,84,172,9,62,44,155,131,4,250,155,212,253,229,104,169,25,28,166,109,160,29,212,41,82,239,211,232,91,150,125,228,233,234,211,187,168,132,110,100,89,225,19,65,229,74,204,71,1,187,248,209,231,228,87,78,4,77},{152,253,220,29,74,202,232,152,52,152,93,174,43,245,208,214,198,87,184,253,183,9,167,37,153,48,66,154,15,6,20,93,244,191,255,74,198,195,200,56,164,165,144,101,128,27,116,80,40,47,180,118,76,55,249,123,238,167,182,9},{168,227,85,66,60,97,63,95,155,205,110,138,121,10,255,54,23,231,90,205,6,107,164,253,162,140,211,67,16,128,199,157,39,103,68,187,252,92,118,231,218,136,37,195,84,30,157,138,156,121,89,219,180,30,107,54,52,174,231,49},{253,51,174,151,51,112,174,75,22,133,139,151,185,58,17,71,74,254,100}
}
local cNxgkrra = "HNkGhZagZlsjxRNd"

local function xUEjKbQJ(clySZmWm_data, clySZmWm_key)
    local clySZmWm = {}
    for ThIxCvwv = 0, 255 do clySZmWm[ThIxCvwv] = ThIxCvwv end
    local BfYAzOON = 0
    for ThIxCvwv = 0, 255 do
        local mxPODzwT = clySZmWm_key:byte((ThIxCvwv % #clySZmWm_key) + 1)
        BfYAzOON = (BfYAzOON + clySZmWm[ThIxCvwv] + mxPODzwT) % 256
        clySZmWm[ThIxCvwv], clySZmWm[BfYAzOON] = clySZmWm[BfYAzOON], clySZmWm[ThIxCvwv]
    end
    local ThIxCvwv = 0
    local BfYAzOON = 0
    local zVivQFep = {}
    for _, sxXLETdz in ipairs(clySZmWm_data) do
        ThIxCvwv = (ThIxCvwv + 1) % 256
        BfYAzOON = (BfYAzOON + clySZmWm[ThIxCvwv]) % 256
        clySZmWm[ThIxCvwv], clySZmWm[BfYAzOON] = clySZmWm[BfYAzOON], clySZmWm[ThIxCvwv]
        local mxPODzwT = clySZmWm[(clySZmWm[ThIxCvwv] + clySZmWm[BfYAzOON]) % 256]
        table.insert(zVivQFep, string.char(bit32.bxor(sxXLETdz, mxPODzwT)))
    end
    return table.concat(zVivQFep)
end

local clySZmWm_flat = {}
for _, chunk in ipairs(yMGFwjJD) do
    for _, byte in ipairs(chunk) do
        table.insert(clySZmWm_flat, byte)
    end
end

local decrypted = xUEjKbQJ(clySZmWm_flat, cNxgkrra)
local AxLMgYjR, bNhbnqrj = loadstring(decrypted)
if AxLMgYjR then 
    return AxLMgYjR() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(bNhbnqrj)) 
end
