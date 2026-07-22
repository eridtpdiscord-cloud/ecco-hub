-- Protected Segment (db)
local QCJOZGGl = 195
local zmaWuPKk = {
{116,57,65,228,228,155,120,138,231,161,215,142,17,49,102,117,8,31,195,216,4,83,231,4,151,57,247,129,177,21,55,148,34,34,35,251,6,12,63,201,139,176,59,179,94,199,245,234,56,223,42,70,101,130,120,95,161,162,107,66},{190,199,115,11,151,37,110,241,22,76,141,19,223,48,52,254,81,249,136,154,57,208,66,24,38,191,121,213,55,129,113,83,177,140,147,19,174,7,30,155,52,144,24,164,109,43,190,58,229,143,152,171,135,199,29,137,145,62,111,114},{165,199,181,97,230,247,88,74,25,50,146,147,229,229,39,158,200,68,201,55,224,19,75,33,240,63,157,137,225,171,245,10,191,200,113,82,168,245,225,9,141,29,33,183,241,119,247,73,17,72,181,233,68,68,223,210,152,74,157,122},{130,24,146,57,87,24,12,123,147,239,245,63,6,58,94,96,169,189,102,151,73,85,67,119,237,219,111,41,125,101,126,2,168,158,236,28,14,118,210,209,216,94,42,248,115,97,181,186,127,20,28,32,20,139,50,206,103,30,22,111},{0,147,164,201,18,226,185,188,149,37,98,14,247,159,92,65,130,204,143,239,73,202,135,221,210,236,247,243,65,199,60,93,188,227,212,176,49,106,16,205,250,189,158,169,249,165,237,111,115,140,79,18,70,214,252,24,50,245,137,130},{132,138,64,136,16,164,4,235,11,155,246,172,37,87,5,21,197,15,147,70,19,204,216,21,236,42,223,25,247,241,196,223,175,124,79,162,213,37,224,107,252,69,57,124,231,107,89,245,7,209,225,177,205,74,109,35,223,155,56,43},{203,65,108,124,101,203,125,219,172,4,192,60,65,27,81,238,16,8,201,22,36,28,124,187,172,186,90,102,126,44,238,216,26,170,217,127,228,221,6,221,22,132,165,129,233,10,166,234,155,159,180,2,254,254,44,228,251,77,195,227},{245,57,175,189,125,114,153,93,53,165,181,175,6,158,109,106,127,69,0,52,187,118,97,102,208,140,218,248,161,197,154,46,100,176,209,247,132,155,20,244,155,154,116,208,116,182,40,201,73,44,35,134,43,92,33,106,118,17,247}
}
local iqxzXRdD = "BCPXDBKUjGFuTSHG"

local function UlNYfaFX(RrHWfkuG_data, RrHWfkuG_key)
    local RrHWfkuG = {}
    for DClwemUc = 0, 255 do RrHWfkuG[DClwemUc] = DClwemUc end
    local FxNakSpO = 0
    for DClwemUc = 0, 255 do
        local hlOMLTDb = RrHWfkuG_key:byte((DClwemUc % #RrHWfkuG_key) + 1)
        FxNakSpO = (FxNakSpO + RrHWfkuG[DClwemUc] + hlOMLTDb) % 256
        RrHWfkuG[DClwemUc], RrHWfkuG[FxNakSpO] = RrHWfkuG[FxNakSpO], RrHWfkuG[DClwemUc]
    end
    local DClwemUc = 0
    local FxNakSpO = 0
    local hntrWASt = {}
    for _, TVYSGTSR in ipairs(RrHWfkuG_data) do
        DClwemUc = (DClwemUc + 1) % 256
        FxNakSpO = (FxNakSpO + RrHWfkuG[DClwemUc]) % 256
        RrHWfkuG[DClwemUc], RrHWfkuG[FxNakSpO] = RrHWfkuG[FxNakSpO], RrHWfkuG[DClwemUc]
        local hlOMLTDb = RrHWfkuG[(RrHWfkuG[DClwemUc] + RrHWfkuG[FxNakSpO]) % 256]
        local unmasked = bit32.bxor(TVYSGTSR, QCJOZGGl)
        table.insert(hntrWASt, string.char(bit32.bxor(unmasked, hlOMLTDb)))
    end
    return table.concat(hntrWASt)
end

local RrHWfkuG_flat = {}
for _, chunk in ipairs(zmaWuPKk) do
    for _, byte in ipairs(chunk) do
        table.insert(RrHWfkuG_flat, byte)
    end
end

local decrypted = UlNYfaFX(RrHWfkuG_flat, iqxzXRdD)
local alNQRRgO, pIbvZyiI = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(RrHWfkuG_flat)
RrHWfkuG_flat = nil

if alNQRRgO then 
    local result = alNQRRgO() 
    decrypted = nil
    alNQRRgO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(pIbvZyiI)) 
end
