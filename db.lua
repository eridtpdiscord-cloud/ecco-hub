-- Protected Segment (db)
local hmeLiQHm = 54
local pTHcthDp = {
{182,233,0,225,172,226,141,16,110,190,116,97,103,95,163,15,178,173,229,192,245,207,219,40,29,66,192,239,156,111,10,92,176,91,158,108,87,172,44,90,250,228,252,192,51,227,204,164,186,189,191,76,57,58,93,35,101,141,182,252},{129,228,56,208,223,166,84,212,69,174,119,21,173,252,57,28,91,14,58,61,239,32,119,218,188,30,87,193,165,168,60,191,168,23,11,44,232,52,200,242,75,88,248,57,22,77,187,87,253,147,131,155,29,37,206,66,70,203,227,183},{91,164,234,192,197,171,253,1,109,181,196,98,106,174,210,203,252,1,94,123,77,121,157,69,184,128,241,1,138,148,58,240,92,169,190,79,34,198,85,15,26,237,203,208,42,47,153,192,27,117,164,22,32,248,54,209,105,88,120,85},{43,175,113,0,151,196,136,188,0,111,221,87,9,106,182,183,29,10,28,12,32,199,239,190,85,82,166,36,26,44,40,81,193,5,163,207,72,41,6,156,209,46,24,43,225,52,224,155,156,68,144,78,161,229,143,39,192,167,247,98},{100,47,133,61,102,1,213,253,145,237,28,144,227,133,230,221,246,103,172,59,142,236,247,119,165,213,100,255,111,181,212,251,5,97,7,31,116,140,24,231,206,224,145,33,202,25,16,200,38,103,188,205,79,30,180,113,221,80,130,30},{214,204,65,124,225,20,71,227,1,83,72,226,198,191,16,181,118,157,227,224,174,188,42,132,94,60,240,192,52,49,239,203,122,5,98,90,16,68,159,6,237,225,198,71,58,30,180,191,187,30,228,163,239,147,2,103,206,11,251,184},{48,125,23,178,127,24,93,225,30,87,66,220,240,29,181,64,191,94,252,99,112,153,103,236,36,142,66,186,175,172,133,204,217,219,122,217,219,39,135,25,234,69,20,92,11,248,226,241}
}
local iVlXfOGH = "YXgPrBPZnkyeCZZo"

local function nBpHoJuC(BaHIdmMw_data, BaHIdmMw_key)
    local BaHIdmMw = {}
    for JJnLRJZh = 0, 255 do BaHIdmMw[JJnLRJZh] = JJnLRJZh end
    local cnFLFAtu = 0
    for JJnLRJZh = 0, 255 do
        local gIqbVTsD = BaHIdmMw_key:byte((JJnLRJZh % #BaHIdmMw_key) + 1)
        cnFLFAtu = (cnFLFAtu + BaHIdmMw[JJnLRJZh] + gIqbVTsD) % 256
        BaHIdmMw[JJnLRJZh], BaHIdmMw[cnFLFAtu] = BaHIdmMw[cnFLFAtu], BaHIdmMw[JJnLRJZh]
    end
    local JJnLRJZh = 0
    local cnFLFAtu = 0
    local blcwnhts = {}
    for _, TtzuBEoV in ipairs(BaHIdmMw_data) do
        JJnLRJZh = (JJnLRJZh + 1) % 256
        cnFLFAtu = (cnFLFAtu + BaHIdmMw[JJnLRJZh]) % 256
        BaHIdmMw[JJnLRJZh], BaHIdmMw[cnFLFAtu] = BaHIdmMw[cnFLFAtu], BaHIdmMw[JJnLRJZh]
        local gIqbVTsD = BaHIdmMw[(BaHIdmMw[JJnLRJZh] + BaHIdmMw[cnFLFAtu]) % 256]
        local unmasked = bit32.bxor(TtzuBEoV, hmeLiQHm)
        table.insert(blcwnhts, string.char(bit32.bxor(unmasked, gIqbVTsD)))
    end
    return table.concat(blcwnhts)
end

local BaHIdmMw_flat = {}
for _, chunk in ipairs(pTHcthDp) do
    for _, byte in ipairs(chunk) do
        table.insert(BaHIdmMw_flat, byte)
    end
end

local decrypted = nBpHoJuC(BaHIdmMw_flat, iVlXfOGH)
local orOvaskd, LoykGWBm = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(BaHIdmMw_flat)
BaHIdmMw_flat = nil

if orOvaskd then 
    local result = orOvaskd() 
    decrypted = nil
    orOvaskd = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(LoykGWBm)) 
end
