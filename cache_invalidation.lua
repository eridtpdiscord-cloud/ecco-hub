-- Protected Segment (cache_invalidation)
local DIzpRnlF = 162
local jQHHRQSK = {
{196,14,214,37,35,127,253,11,102,160,159,236,113,79,124,52,89,98,198,242,93,182,120,200,113,206,63,171,84,229,208,95,55,213,200,63,91,249,190,131,74,71,105,202,31,189,141,19,189,202,223,108,255,217,183,212,206,219,87,86},{126,102,160,171,209,161,193,163,120,163,133,191,139,72,72,91,249,88,235,199,153,144,154,111,217,108,155,45,245,233,145,85,39,25,153,115,104,25,8,74,122,210,172,152,68,184,230,0,216,212,77,104,244,226,95,237,131,151,196,120},{78,11,238,171,160,253,143,187,250,109,71,146,48,36,195,61,93,43,96,1,42,13,162,65,245,237,47,212,13,76}
}
local fAeAakMs = "VxXqYrJnEVJFcIHL"

local function TYKwImZh(egWCqrMB_data, egWCqrMB_key)
    local egWCqrMB = {}
    for XlHsaJmB = 0, 255 do egWCqrMB[XlHsaJmB] = XlHsaJmB end
    local ueNwvWRZ = 0
    for XlHsaJmB = 0, 255 do
        local pZjeTELB = egWCqrMB_key:byte((XlHsaJmB % #egWCqrMB_key) + 1)
        ueNwvWRZ = (ueNwvWRZ + egWCqrMB[XlHsaJmB] + pZjeTELB) % 256
        egWCqrMB[XlHsaJmB], egWCqrMB[ueNwvWRZ] = egWCqrMB[ueNwvWRZ], egWCqrMB[XlHsaJmB]
    end
    local XlHsaJmB = 0
    local ueNwvWRZ = 0
    local ibLsrpoM = {}
    for _, qLziiwgS in ipairs(egWCqrMB_data) do
        XlHsaJmB = (XlHsaJmB + 1) % 256
        ueNwvWRZ = (ueNwvWRZ + egWCqrMB[XlHsaJmB]) % 256
        egWCqrMB[XlHsaJmB], egWCqrMB[ueNwvWRZ] = egWCqrMB[ueNwvWRZ], egWCqrMB[XlHsaJmB]
        local pZjeTELB = egWCqrMB[(egWCqrMB[XlHsaJmB] + egWCqrMB[ueNwvWRZ]) % 256]
        local unmasked = bit32.bxor(qLziiwgS, DIzpRnlF)
        table.insert(ibLsrpoM, string.char(bit32.bxor(unmasked, pZjeTELB)))
    end
    return table.concat(ibLsrpoM)
end

local egWCqrMB_flat = {}
for _, chunk in ipairs(jQHHRQSK) do
    for _, byte in ipairs(chunk) do
        table.insert(egWCqrMB_flat, byte)
    end
end

local decrypted = TYKwImZh(egWCqrMB_flat, fAeAakMs)
local mckxahAk, StHVCAAn = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(egWCqrMB_flat)
egWCqrMB_flat = nil

if mckxahAk then 
    local result = mckxahAk() 
    decrypted = nil
    mckxahAk = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(StHVCAAn)) 
end
