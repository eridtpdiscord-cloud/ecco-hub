-- Protected Segment (db)
local LufVYSNk = 80
local rQHeIDvI = {
{1,172,248,191,252,56,241,84,73,214,215,191,211,173,49,186,140,103,119,71,43,90,66,67,126,51,190,45,106,126,171,180,248,163,50,245,65,234,174,205,24,106,181,213,61,41,47,93,115,182,129,107,23,246,5,67,178,27,85,227},{251,142,113,173,63,76,59,86,113,18,251,240,232,175,14,101,151,188,176,12,106,69,91,61,246,173,22,109,106,0,136,241,116,229,244,196,199,20,241,239,6,95,253,216,135,219,203,107,25,178,118,19,27,195,236,30,211,15,212,214},{243,77,97,134,76,143,50,216,214,195,196,149,233,26,233,21,249,91,244,90,86,54,112,124,60,29,2,167,22,41,15,144,181,221,78,211,235,159,50,91,82,22,190,140,133,137,142,67,22,10,81,146,34,176,181,66,117,214,90,71},{211,211,183,187,190,208,69,182,180,21,42,187,17,88,167,63,188,137,221,210,49,181,202,152,64,17,91,165,65,138,1,26,207,127,57,9,215,90,178,232,66,237,59,109,228,203,126,87,2,113,37,97,90,189,75,44,33,177,69,189},{51,109,223,112,104,213,105,216,179,126,117,187,174,86,67,93,174,62,102,200,223,126,119,20,212,60,28,90,126,124,119,52,133,117,152,55,210,15,48,163,31,193,210,45,245,172,31,49,83,67,220,232,74,198,19,226,140,210,210,180},{37,200,251,133,223,167,183,152,210,108,177,144,236,94,34,77,51,5,130,44,96,240,201,2,117,220,115,126,5,59,228,85,34,202,1,122,57,243,154,65,251,160,105,199,102,98,9,84,185,4,237,180,253,71,177,63,26,113,95,43},{253,140,53,64,175,124,50,65,99,172,241,44,4,29,158,185,52,91,254,17,106,204,195,226,127,11,220,104,221,117,109,78,122,26,218,213,98,88,77,67,223}
}
local NdkuQRFP = "qvVmbDjMhrNqTJLa"

local function EHdvcQwo(NXnSNUrf_data, NXnSNUrf_key)
    local NXnSNUrf = {}
    for tCcNSQzK = 0, 255 do NXnSNUrf[tCcNSQzK] = tCcNSQzK end
    local cqQFTdUA = 0
    for tCcNSQzK = 0, 255 do
        local oMIEUkPG = NXnSNUrf_key:byte((tCcNSQzK % #NXnSNUrf_key) + 1)
        cqQFTdUA = (cqQFTdUA + NXnSNUrf[tCcNSQzK] + oMIEUkPG) % 256
        NXnSNUrf[tCcNSQzK], NXnSNUrf[cqQFTdUA] = NXnSNUrf[cqQFTdUA], NXnSNUrf[tCcNSQzK]
    end
    local tCcNSQzK = 0
    local cqQFTdUA = 0
    local boKGrniw = {}
    for _, QuTVXFbf in ipairs(NXnSNUrf_data) do
        tCcNSQzK = (tCcNSQzK + 1) % 256
        cqQFTdUA = (cqQFTdUA + NXnSNUrf[tCcNSQzK]) % 256
        NXnSNUrf[tCcNSQzK], NXnSNUrf[cqQFTdUA] = NXnSNUrf[cqQFTdUA], NXnSNUrf[tCcNSQzK]
        local oMIEUkPG = NXnSNUrf[(NXnSNUrf[tCcNSQzK] + NXnSNUrf[cqQFTdUA]) % 256]
        local unmasked = bit32.bxor(QuTVXFbf, LufVYSNk)
        table.insert(boKGrniw, string.char(bit32.bxor(unmasked, oMIEUkPG)))
    end
    return table.concat(boKGrniw)
end

local NXnSNUrf_flat = {}
for _, chunk in ipairs(rQHeIDvI) do
    for _, byte in ipairs(chunk) do
        table.insert(NXnSNUrf_flat, byte)
    end
end

local decrypted = EHdvcQwo(NXnSNUrf_flat, NdkuQRFP)
local uXvNSesF, YgeewZMI = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(NXnSNUrf_flat)
NXnSNUrf_flat = nil

if uXvNSesF then 
    local result = uXvNSesF() 
    decrypted = nil
    uXvNSesF = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(YgeewZMI)) 
end
