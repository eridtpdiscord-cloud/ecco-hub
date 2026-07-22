-- Protected Segment (db)
local vVYIDndr = 18
local RbdENeuE = {
{35,61,184,100,215,230,198,237,18,221,136,4,5,253,69,211,37,133,72,165,252,118,155,3,188,141,125,11,97,80,86,85,204,151,192,151,52,8,114,64,223,194,219,125,223,90,202,237,148,72,47,176,49,45,2,229,181,189,100,42},{102,217,253,215,252,117,209,83,126,192,161,163,14,98,101,157,214,53,91,60,217,153,164,12,216,12,129,107,243,172,8,246,253,184,229,184,240,145,2,42,174,152,74,210,237,129,220,96,25,124,54,198,57,44,196,137,67,236,138,26},{107,91,32,202,192,40,168,84,111,199,190,223,62,182,217,238,243,123,53,228,183,158,212,220,230,145,50,124,61,220,20,76,17,208,10,14,111,124,218,28,39,203,16,195,143,68,8,154,191,28,51,144,238,233,231,145,89,86,12,188},{209,228,248,191,228,217,208,210,57,242,1,79,218,97,201,46,220,126,10,101,251,45,125,107,158,245,242,238,62,76,68,255,7,121,243,230,113,90,35,171,201,167,246,105,79,172,205,158,162,85,164,0,69,165,174,48,151,153,88,197},{14,205,111,163,215,188,229,180,4,1,49,15,39,50,85,29,21,56,161,104,101,237,86,131,99,24,50,53,238,76,24,68,241,88,83,229,9,231,100,83,151,39,123,226,98,9,11,238,133,224,156,174,228,12,184,27,110,106,63,71},{13,192,54,159,142,239,8,237,204,204,55,20,22,209,81,97,27,76,55,247,252,213,100,77,149,30,215,174,41,84,101,80,236,160,147,43,26,250,213,113,182,24,54,22,91,31,64,51,51,21,193,21,114,119,94,106,5,236,224,155},{226,99,29,154,251,178,78,27,216,47,180,228,147,12,194,123,209,213,73,199,222,115,136,76,148,65,15,240,130,67,48,90,190,64,81,184,186,70,83,218,213,142,0,100,1,142,49,122}
}
local kArlMcpd = "UYnQmvzznQoWcSYS"

local function hYCMEFVR(chHukvOC_data, chHukvOC_key)
    local chHukvOC = {}
    for lKODJfdw = 0, 255 do chHukvOC[lKODJfdw] = lKODJfdw end
    local TdNxOrZb = 0
    for lKODJfdw = 0, 255 do
        local yynIRyGU = chHukvOC_key:byte((lKODJfdw % #chHukvOC_key) + 1)
        TdNxOrZb = (TdNxOrZb + chHukvOC[lKODJfdw] + yynIRyGU) % 256
        chHukvOC[lKODJfdw], chHukvOC[TdNxOrZb] = chHukvOC[TdNxOrZb], chHukvOC[lKODJfdw]
    end
    local lKODJfdw = 0
    local TdNxOrZb = 0
    local cfTSgEix = {}
    for _, MRakEdKi in ipairs(chHukvOC_data) do
        lKODJfdw = (lKODJfdw + 1) % 256
        TdNxOrZb = (TdNxOrZb + chHukvOC[lKODJfdw]) % 256
        chHukvOC[lKODJfdw], chHukvOC[TdNxOrZb] = chHukvOC[TdNxOrZb], chHukvOC[lKODJfdw]
        local yynIRyGU = chHukvOC[(chHukvOC[lKODJfdw] + chHukvOC[TdNxOrZb]) % 256]
        local unmasked = bit32.bxor(MRakEdKi, vVYIDndr)
        table.insert(cfTSgEix, string.char(bit32.bxor(unmasked, yynIRyGU)))
    end
    return table.concat(cfTSgEix)
end

local chHukvOC_flat = {}
for _, chunk in ipairs(RbdENeuE) do
    for _, byte in ipairs(chunk) do
        table.insert(chHukvOC_flat, byte)
    end
end

local decrypted = hYCMEFVR(chHukvOC_flat, kArlMcpd)
local qrNItxgy, XwTfECCm = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(chHukvOC_flat)
chHukvOC_flat = nil

if qrNItxgy then 
    local result = qrNItxgy() 
    decrypted = nil
    qrNItxgy = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(XwTfECCm)) 
end
