-- Protected Segment (utility_helper)
local SueAcpIx = 119
local UvSgDlMa = {
{123,196,142,97,187,132,205,190,253,249,177,4,134,140,180,64,253,59,213,91,212,239,195,123,192,185,128,34,92,97,175,38,221,79,235,223,104,58,90,3,121,141,132,204,200,174,219,73,251,122,98,215,13,71,175,73,119,42,119,49},{92,137,16,150,32,173,228,179,164,245,16,254,141,244,110,160,36,234,111,103,24,129,177,248,116,42,124,60,159,2,147,95,66,37,138,225,202,252,205,89,186,105,113,175,40,232,69,96,241,99,246,193,6,107,190,204,250,68,69,255},{101,132,66,126,121,206,66,211,124,189,116,210,57,43,50,80,160,236,68,197,90,19,37,142,89,86}
}
local mdsfYubN = "QunSqYvmFBXuwPQV"

local function VjAggXJX(qeTNwDqv_data, qeTNwDqv_key)
    if type(qeTNwDqv_key) ~= "string" or #qeTNwDqv_key == 0 then return "" end
    local qeTNwDqv = {}
    for asIrKcOw = 0, 255 do qeTNwDqv[asIrKcOw] = asIrKcOw end
    local zTvkhAkk = 0
    for asIrKcOw = 0, 255 do
        local dcSNohSW = qeTNwDqv_key:byte((asIrKcOw % #qeTNwDqv_key) + 1)
        zTvkhAkk = (zTvkhAkk + qeTNwDqv[asIrKcOw] + dcSNohSW) % 256
        qeTNwDqv[asIrKcOw], qeTNwDqv[zTvkhAkk] = qeTNwDqv[zTvkhAkk], qeTNwDqv[asIrKcOw]
    end
    local asIrKcOw = 0
    local zTvkhAkk = 0
    local zHESorkJ = {}
    for _, rUmZhenH in ipairs(qeTNwDqv_data) do
        asIrKcOw = (asIrKcOw + 1) % 256
        zTvkhAkk = (zTvkhAkk + qeTNwDqv[asIrKcOw]) % 256
        qeTNwDqv[asIrKcOw], qeTNwDqv[zTvkhAkk] = qeTNwDqv[zTvkhAkk], qeTNwDqv[asIrKcOw]
        local dcSNohSW = qeTNwDqv[(qeTNwDqv[asIrKcOw] + qeTNwDqv[zTvkhAkk]) % 256]
        local unmasked = bit32.bxor(rUmZhenH, SueAcpIx)
        table.insert(zHESorkJ, string.char(bit32.bxor(unmasked, dcSNohSW)))
    end
    return table.concat(zHESorkJ)
end

local qeTNwDqv_flat = {}
for _, chunk in ipairs(UvSgDlMa) do
    for _, byte in ipairs(chunk) do
        table.insert(qeTNwDqv_flat, byte)
    end
end

local decrypted = VjAggXJX(qeTNwDqv_flat, mdsfYubN)
local wudoXGUd, SkqMFiNs = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(qeTNwDqv_flat)
qeTNwDqv_flat = nil

if wudoXGUd then 
    local result = wudoXGUd() 
    decrypted = nil
    wudoXGUd = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(SkqMFiNs)) 
end
