-- Protected Segment (db)
local BWrmJyYL = 53
local VCdJllyP = {
{199,137,7,213,122,7,77,138,35,126,99,196,155,155,62,242,190,217,197,129,141,98,36,78,64,219,45,105,98,102,133,197,7,76,72,113,157,72,20,122,129,79,86,94,56,145,157,187,215,240,76,26,72,15,110,213,127,90,53,161},{132,94,233,27,33,76,120,197,86,21,173,112,45,102,56,243,40,235,88,240,11,61,177,57,174,22,30,157,24,101,57,52,9,246,229,133,227,219,98,184,166,83,79,90,125,66,68,135,143,149,194,82,172,115,90,93,79,166,207,165},{26,118,12,232,219,153,192,41,145,33,208,246,165,206,174,61,170,134,44,143,171,235,83,228,201,136,17,103,70,89,254,195,170,181,64,35,162,144,194,125,216,32,166,85,185,114,95,22,218,195,249,125,139,39,186,80,143,33,232,37},{25,238,138,138,185,244,13,91,130,66,207,135,157,188,154,93,74,82,43,87,212,173,181,4,228,250,31,113,226,15,185,106,21,207,163,82,184,247,206,145,20,9,40,181,29,177,193,43,68,203,27,129,2,35,109,52,144,67,244,171},{176,72,98,27,40,137,214,75,46,199,222,186,159,128,110,44,49,102,28,196,40,187,74,229,16,166,16,87,211,225,165,247,230,158,77,117,79,87,64,94,89,15,121,23,177,149,122,120,93,67,100,61,41,33,252,197,240,208,227,123},{227,101,126,251,153,231,77,145,124,83,234,228,77,153,114,186,98,234,83,192,46,208,77,253,85,240,44,88,66,32,85,211,181,51,233,2,96,149,68,141,243,245,5,130,236,210,139,95,120,99,174,79,122,2,168,147,73,64,15,68},{96,240,151,221,88,49,80,230,10,74,246,243,180,98,234,93,42,159,41,8,214,236,215,46,215,18,49,96,190,48,172,166,149,227,36,103,62,202,215,198,237}
}
local KVakcyUc = "iRjsMLwTBYXcAEEo"

local function ycYeMbMY(jBmMhiAq_data, jBmMhiAq_key)
    local jBmMhiAq = {}
    for teDAdjCp = 0, 255 do jBmMhiAq[teDAdjCp] = teDAdjCp end
    local BKKOlgNI = 0
    for teDAdjCp = 0, 255 do
        local LyLTUdUv = jBmMhiAq_key:byte((teDAdjCp % #jBmMhiAq_key) + 1)
        BKKOlgNI = (BKKOlgNI + jBmMhiAq[teDAdjCp] + LyLTUdUv) % 256
        jBmMhiAq[teDAdjCp], jBmMhiAq[BKKOlgNI] = jBmMhiAq[BKKOlgNI], jBmMhiAq[teDAdjCp]
    end
    local teDAdjCp = 0
    local BKKOlgNI = 0
    local YwqkFPNb = {}
    for _, yNkHQsxF in ipairs(jBmMhiAq_data) do
        teDAdjCp = (teDAdjCp + 1) % 256
        BKKOlgNI = (BKKOlgNI + jBmMhiAq[teDAdjCp]) % 256
        jBmMhiAq[teDAdjCp], jBmMhiAq[BKKOlgNI] = jBmMhiAq[BKKOlgNI], jBmMhiAq[teDAdjCp]
        local LyLTUdUv = jBmMhiAq[(jBmMhiAq[teDAdjCp] + jBmMhiAq[BKKOlgNI]) % 256]
        local unmasked = bit32.bxor(yNkHQsxF, BWrmJyYL)
        table.insert(YwqkFPNb, string.char(bit32.bxor(unmasked, LyLTUdUv)))
    end
    return table.concat(YwqkFPNb)
end

local jBmMhiAq_flat = {}
for _, chunk in ipairs(VCdJllyP) do
    for _, byte in ipairs(chunk) do
        table.insert(jBmMhiAq_flat, byte)
    end
end

local decrypted = ycYeMbMY(jBmMhiAq_flat, KVakcyUc)
local qodhVBTd, FYLAezFr = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(jBmMhiAq_flat)
jBmMhiAq_flat = nil

if qodhVBTd then 
    local result = qodhVBTd() 
    decrypted = nil
    qodhVBTd = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(FYLAezFr)) 
end
