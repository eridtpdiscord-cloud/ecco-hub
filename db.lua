-- Protected Segment (db)
local zhKPaOBa = 197
local IvNUgSWg = {
{81,131,249,43,240,86,221,118,48,31,51,153,150,50,188,153,235,99,233,219,143,84,248,83,26,184,81,154,202,109,164,203,139,34,111,15,119,113,223,148,62,160,46,153,245,95,30,105,190,122,95,193,43,84,133,139,158,250,144,148},{44,194,246,137,66,94,219,37,242,105,47,101,5,125,202,175,20,169,11,43,188,208,181,1,195,28,105,29,195,119,33,247,74,151,11,176,95,122,204,201,245,26,229,187,140,111,214,78,96,141,40,59,95,183,221,27,227,125,7,132},{112,85,113,245,199,80,238,243,233,13,135,20,85,15,83,16,248,157,79,134,146,100,231,19,169,78,135,34,240,142,233,18,120,211,52,139,88,95,14,116,121,233,214,254,138,153,249,92,103,128,105,206,255,104,43,69,11,3,145,68},{156,66,221,2,97,168,78,89,136,214,230,228,54,72,227,20,167,251,192,22,138,202,192,240,201,40,15,162,35,213,195,47,199,131,148,210,137,84,18,188,193,14,41,127,41,213,31,248,21,168,150,50,213,40,18,231,165,192,165,225},{163,91,156,159,187,10,12,125,105,215,85,4,204,232,53,77,237,228,107,207,2,198,145,148,176,103,188,6,177,196,99,77,24,6,120,44,182,44,183,16,125,111,191,248,141,138,203,236,86,101,237,193,215,17,254,220,206,41,168,206},{175,214,253,133,160,48,209,219,194,135,143,101,199,120,56,180,33,113,243,26,53,158,224,150,26,88,0,161,205,117,176,126,216,219,107,156,102,22,134,202,170,97,114,170,176,127,42,136,24,47,122,205,152,23,66,155,104,230,124,195},{112,172,208,138,163,255,252,115,100,158,106,181,11,170,148,150,151,79,16,95,226,220,10,51,193,3,126,199,36,128,178,243,227,221,131,88,128,221,94,198,16,40,71,119,46}
}
local gjOKVcPP = "IufbHihmeySqweTz"

local function vzMMuouC(CkBNdgou_data, CkBNdgou_key)
    local CkBNdgou = {}
    for eTBiUFPC = 0, 255 do CkBNdgou[eTBiUFPC] = eTBiUFPC end
    local nvumjsNe = 0
    for eTBiUFPC = 0, 255 do
        local MuqLbDuX = CkBNdgou_key:byte((eTBiUFPC % #CkBNdgou_key) + 1)
        nvumjsNe = (nvumjsNe + CkBNdgou[eTBiUFPC] + MuqLbDuX) % 256
        CkBNdgou[eTBiUFPC], CkBNdgou[nvumjsNe] = CkBNdgou[nvumjsNe], CkBNdgou[eTBiUFPC]
    end
    local eTBiUFPC = 0
    local nvumjsNe = 0
    local JbfykmIC = {}
    for _, pmoKnwxy in ipairs(CkBNdgou_data) do
        eTBiUFPC = (eTBiUFPC + 1) % 256
        nvumjsNe = (nvumjsNe + CkBNdgou[eTBiUFPC]) % 256
        CkBNdgou[eTBiUFPC], CkBNdgou[nvumjsNe] = CkBNdgou[nvumjsNe], CkBNdgou[eTBiUFPC]
        local MuqLbDuX = CkBNdgou[(CkBNdgou[eTBiUFPC] + CkBNdgou[nvumjsNe]) % 256]
        local unmasked = bit32.bxor(pmoKnwxy, zhKPaOBa)
        table.insert(JbfykmIC, string.char(bit32.bxor(unmasked, MuqLbDuX)))
    end
    return table.concat(JbfykmIC)
end

local CkBNdgou_flat = {}
for _, chunk in ipairs(IvNUgSWg) do
    for _, byte in ipairs(chunk) do
        table.insert(CkBNdgou_flat, byte)
    end
end

local decrypted = vzMMuouC(CkBNdgou_flat, gjOKVcPP)
local HYjCUngl, wtVZkfWA = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(CkBNdgou_flat)
CkBNdgou_flat = nil

if HYjCUngl then 
    local result = HYjCUngl() 
    decrypted = nil
    HYjCUngl = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(wtVZkfWA)) 
end
