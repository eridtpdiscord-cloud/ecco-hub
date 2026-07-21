-- Compiled secure segment
local ycPLLYPH = {
{212,202,49,199,52,160,44,28,252,101,44,211,164,164,100,173,141,137,132,126,29,171,255,142,172,61,78,128,51,134,250,19,192,54,21,218,201,96,86,169,61,96,94,121,227,59,205,191,80,214,55,0,100,32,255,177,163,124,42,162},{49,150,50,221,161,214,42,53,140,131,124,139,26,111,134,157,145,200,117,68,119,181,44,50,202,227,71,164,102,10,84,240,184,192,131,36,84,80,233,234,43,132,224,243,217,67,8,116,149,253,20,220,149,10,212,89,234,247,136,133},{200,197,33,252,14,254,56,129,42,19,53,179,83,133,64,69,131,188,10,23,208,29,14,68,232,3,71,207,19,120,87,150,192,102,61,59,147,61,123,177,114,166,49,221,172,76,15,212,144,8,171,25,26,237,128,38,99,254,90,224},{96,41,33,186,70,169,78,244,68,220,98,52,57,6,133,66,67,172,218,180,129,252,177,229,58,230,113,166,101,119,27,10,71,214,99,242,8,172,78,116,124,194,128,244,1,24,99,164,162,47,185,59,228,89,171,127,226,202,225,126},{163,160,157,79,1,113,83,48,111,222,122,239,194,22,113,157,149,6,204,193,135,0,139,8,67,117,241,10,91,168,73,129,16,134,192,199,54,13,35,201,24,49,155,229,149,19,211,86,229,227,194,156,101,113,96,245,137,125,62,209},{102,224,161,153,221,58,230,227,4,190,136,158,246,146,173,140,24,228,148,72,13,93,127,253,148,55,51,116,179,229,198,203,169,191,96,170,238,111,98,127,142,186,103,179,193,218,235,132,137,131,190,121,69,60,224,1,130,84,207,89},{94,38,174,187,4,49,71,113,247,195,1,34,37,133,121,235,215,193,41,117,153,138,101,36,8,133,94,39,207,69,175,17,154,74,233,20,156,53,221,193,149,211,57,59,214}
}
local EQGVAtZT = "hWXJodLVPbQPgvLb"

local function ufzjLEfM(pXYlyykc_data, pXYlyykc_key)
    local pXYlyykc = {}
    for uhRYGCpv = 0, 255 do pXYlyykc[uhRYGCpv] = uhRYGCpv end
    local JgcHyhPU = 0
    for uhRYGCpv = 0, 255 do
        local dVzfcoFI = pXYlyykc_key:byte((uhRYGCpv % #pXYlyykc_key) + 1)
        JgcHyhPU = (JgcHyhPU + pXYlyykc[uhRYGCpv] + dVzfcoFI) % 256
        pXYlyykc[uhRYGCpv], pXYlyykc[JgcHyhPU] = pXYlyykc[JgcHyhPU], pXYlyykc[uhRYGCpv]
    end
    local uhRYGCpv = 0
    local JgcHyhPU = 0
    local ZjQJzwie = {}
    for _, LOclMsvl in ipairs(pXYlyykc_data) do
        uhRYGCpv = (uhRYGCpv + 1) % 256
        JgcHyhPU = (JgcHyhPU + pXYlyykc[uhRYGCpv]) % 256
        pXYlyykc[uhRYGCpv], pXYlyykc[JgcHyhPU] = pXYlyykc[JgcHyhPU], pXYlyykc[uhRYGCpv]
        local dVzfcoFI = pXYlyykc[(pXYlyykc[uhRYGCpv] + pXYlyykc[JgcHyhPU]) % 256]
        table.insert(ZjQJzwie, string.char(bit32.bxor(LOclMsvl, dVzfcoFI)))
    end
    return table.concat(ZjQJzwie)
end

local pXYlyykc_flat = {}
for _, chunk in ipairs(ycPLLYPH) do
    for _, byte in ipairs(chunk) do
        table.insert(pXYlyykc_flat, byte)
    end
end

local decrypted = ufzjLEfM(pXYlyykc_flat, EQGVAtZT)
local iyzmAsiS, qpJudniY = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(pXYlyykc_flat)
pXYlyykc_flat = nil

if iyzmAsiS then 
    local result = iyzmAsiS() 
    decrypted = nil
    iyzmAsiS = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(qpJudniY)) 
end
