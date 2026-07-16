-- Compiled secure segment
local egoKoGIM = {
{231,102,43,220,83,85,123,112,246,154,101,248,1,252,154,205,38,213,235,24,75,222,52,178,64,253,42,200,126,214,43,160,108,195,126,120,1,100,147,217,117,218,174,203,224,146,139,26,66,216,17,62,165,211,238,50,82,166,84,0},{60,156,218,64,231,116,21,221,131,79,75,122,186,119,83,175,154,94,209,154,57,222,26,161,148,173,12,32,75,4,24,72,121,20,213,5,93,170,36,127,86,80,19,67,128,205,86,135,247,73,81,240,121,156,12,108,166,213,90,130},{164,26,111,45,52,129,229,38,8,138,196,91,21,225,130,134,244,79,189,25,85,192,117,133,234,211,112,104,247,214,98,172,199,139,47,113,10,43,248,176,77,197,2,67,27,86,236,189,84,89,135,92,132,160,240,252,205,48,220,163},{119,54,208,8,46,106,181,188,68,254,110,40,200,9,251,136,220,179,186,15,238,114,130,7,163,114,142,6,252,90,98,24,161,75,99,74,0,46,185,107,186,56,234,143,136,143,79,230,221,22,54,65,20,159,128,236}
}
local xiRfgPEQ = "zWXaMiMTdszSnGlp"

local function MDBqyxrA(nfZrwYSm_data, nfZrwYSm_key)
    local nfZrwYSm = {}
    for HaUIPxUU = 0, 255 do nfZrwYSm[HaUIPxUU] = HaUIPxUU end
    local LCPQjXZb = 0
    for HaUIPxUU = 0, 255 do
        local UScYLEub = nfZrwYSm_key:byte((HaUIPxUU % #nfZrwYSm_key) + 1)
        LCPQjXZb = (LCPQjXZb + nfZrwYSm[HaUIPxUU] + UScYLEub) % 256
        nfZrwYSm[HaUIPxUU], nfZrwYSm[LCPQjXZb] = nfZrwYSm[LCPQjXZb], nfZrwYSm[HaUIPxUU]
    end
    local HaUIPxUU = 0
    local LCPQjXZb = 0
    local qUVABUon = {}
    for _, lMtJfmGF in ipairs(nfZrwYSm_data) do
        HaUIPxUU = (HaUIPxUU + 1) % 256
        LCPQjXZb = (LCPQjXZb + nfZrwYSm[HaUIPxUU]) % 256
        nfZrwYSm[HaUIPxUU], nfZrwYSm[LCPQjXZb] = nfZrwYSm[LCPQjXZb], nfZrwYSm[HaUIPxUU]
        local UScYLEub = nfZrwYSm[(nfZrwYSm[HaUIPxUU] + nfZrwYSm[LCPQjXZb]) % 256]
        table.insert(qUVABUon, string.char(bit32.bxor(lMtJfmGF, UScYLEub)))
    end
    return table.concat(qUVABUon)
end

local nfZrwYSm_flat = {}
for _, chunk in ipairs(egoKoGIM) do
    for _, byte in ipairs(chunk) do
        table.insert(nfZrwYSm_flat, byte)
    end
end

local decrypted = MDBqyxrA(nfZrwYSm_flat, xiRfgPEQ)
local cjQjgnWU, rcukUvRn = loadstring(decrypted)
if cjQjgnWU then 
    return cjQjgnWU() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(rcukUvRn)) 
end
