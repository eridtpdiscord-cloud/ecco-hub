-- Protected Segment (db)
local wXADGZFG = 167
local HGESUpwu = {
{5,26,102,92,77,111,115,136,157,71,66,146,94,5,71,119,249,82,210,105,69,203,130,144,206,104,95,238,85,178,82,155,49,222,137,183,8,167,255,215,31,152,58,52,12,156,56,249,34,22,22,246,212,128,185,37,232,167,199,246},{190,129,110,55,200,25,115,41,113,240,205,6,155,105,131,213,140,252,138,251,186,130,88,184,221,97,162,244,175,69,23,208,209,135,199,188,0,219,108,204,143,156,130,224,244,118,68,136,134,1,251,124,217,134,251,249,93,26,253,79},{41,72,52,30,22,206,0,71,82,210,19,80,54,9,238,65,128,169,99,65,99,78,156,73,18,4,202,154,26,240,162,158,164,202,232,205,103,220,111,36,30,48,142,144,36,111,236,9,219,50,58,84,193,217,99,131,208,104,208,248},{189,30,131,43,24,164,167,219,38,113,231,205,47,174,132,107,207,27,98,221,207,152,121,41,21,13,206,214,196,172,21,100,74,253,219,55,253,209,183,50,68,131,108,75,233,94,40,96,185,47,217,242,65,14,91,227,220,103,43,219},{40,251,205,205,26,136,140,5,12,141,14,107,50,83,107,79,153,245,66,29,220,154,166,120,229,180,101,176,129,25,140,105,220,219,244,128,9,26,95,13,255,60,250,15,156,49,78,130,184,129,57,61,91,98,203,116,73,205,94,152},{178,110,1,148,138,196,44,111,213,93,104,149,0,11,168,97,75,140,157,154,212,252,130,116,88,79,238,179,129,148,15,50,180,15,34,87,104,32,44,253,184,202,93,253,5,137,42,20,167,202,54,228,64,249,245,104,159,165,174,190},{252,115,221,172,239,76,234,109,148,121,150,48,0,114,158,70,119,51,203,187,136,243,221,54,73,79,162,109,80,137,203,153,224,58,213,126,107,71,182,220,145,63,131,5,33}
}
local TJNyapGI = "jaxmQZBCwSavCKif"

local function eyMefOtU(aTNfrCOc_data, aTNfrCOc_key)
    local aTNfrCOc = {}
    for veMeJFil = 0, 255 do aTNfrCOc[veMeJFil] = veMeJFil end
    local tzcGoRjo = 0
    for veMeJFil = 0, 255 do
        local idePVQwV = aTNfrCOc_key:byte((veMeJFil % #aTNfrCOc_key) + 1)
        tzcGoRjo = (tzcGoRjo + aTNfrCOc[veMeJFil] + idePVQwV) % 256
        aTNfrCOc[veMeJFil], aTNfrCOc[tzcGoRjo] = aTNfrCOc[tzcGoRjo], aTNfrCOc[veMeJFil]
    end
    local veMeJFil = 0
    local tzcGoRjo = 0
    local BvwNEdIQ = {}
    for _, WNymEGvL in ipairs(aTNfrCOc_data) do
        veMeJFil = (veMeJFil + 1) % 256
        tzcGoRjo = (tzcGoRjo + aTNfrCOc[veMeJFil]) % 256
        aTNfrCOc[veMeJFil], aTNfrCOc[tzcGoRjo] = aTNfrCOc[tzcGoRjo], aTNfrCOc[veMeJFil]
        local idePVQwV = aTNfrCOc[(aTNfrCOc[veMeJFil] + aTNfrCOc[tzcGoRjo]) % 256]
        local unmasked = bit32.bxor(WNymEGvL, wXADGZFG)
        table.insert(BvwNEdIQ, string.char(bit32.bxor(unmasked, idePVQwV)))
    end
    return table.concat(BvwNEdIQ)
end

local aTNfrCOc_flat = {}
for _, chunk in ipairs(HGESUpwu) do
    for _, byte in ipairs(chunk) do
        table.insert(aTNfrCOc_flat, byte)
    end
end

local decrypted = eyMefOtU(aTNfrCOc_flat, TJNyapGI)
local TEgEOxoK, GYFXowaf = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(aTNfrCOc_flat)
aTNfrCOc_flat = nil

if TEgEOxoK then 
    local result = TEgEOxoK() 
    decrypted = nil
    TEgEOxoK = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(GYFXowaf)) 
end
