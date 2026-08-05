-- Protected Segment (utility_helper)
local VXPSVoBy = 26
local BOsOiudm = {
{161,125,74,249,51,163,14,163,173,226,81,21,130,18,154,51,125,20,226,166,109,146,180,129,208,167,193,96,173,125,50,112,206,206,214,231,167,134,211,145,210,69,220,157,112,30,173,187,34,166,6,235,173,188,254,29,163,135,212,9},{107,35,140,137,88,192,111,68,248,3,34,84,196,232,70,12,221,195,239,39,176,93,224,36,97,35,47,12,129,31,96,174,65,47,236,82,247,3,102,196,249,79,173,125,193,186,182,255,120,226,21,49,4,15,15,195,206,62,102,199},{164,53,98,240,173,28,229,243,107,223,170,162,135,146,53,175,201,180,148,45,248,55,33,86,91,17}
}
local ikCsVTcG = "PQVMTiVWftpziOuT"

local function TeejcHEH(fQEZYZXT_data, fQEZYZXT_key)
    if type(fQEZYZXT_key) ~= "string" or #fQEZYZXT_key == 0 then return "" end
    local fQEZYZXT = {}
    for rReZSLGT = 0, 255 do fQEZYZXT[rReZSLGT] = rReZSLGT end
    local lkcoiluk = 0
    for rReZSLGT = 0, 255 do
        local RomPAVcO = fQEZYZXT_key:byte((rReZSLGT % #fQEZYZXT_key) + 1)
        lkcoiluk = (lkcoiluk + fQEZYZXT[rReZSLGT] + RomPAVcO) % 256
        fQEZYZXT[rReZSLGT], fQEZYZXT[lkcoiluk] = fQEZYZXT[lkcoiluk], fQEZYZXT[rReZSLGT]
    end
    local rReZSLGT = 0
    local lkcoiluk = 0
    local dMXjHHxn = {}
    for _, TlNojmBy in ipairs(fQEZYZXT_data) do
        rReZSLGT = (rReZSLGT + 1) % 256
        lkcoiluk = (lkcoiluk + fQEZYZXT[rReZSLGT]) % 256
        fQEZYZXT[rReZSLGT], fQEZYZXT[lkcoiluk] = fQEZYZXT[lkcoiluk], fQEZYZXT[rReZSLGT]
        local RomPAVcO = fQEZYZXT[(fQEZYZXT[rReZSLGT] + fQEZYZXT[lkcoiluk]) % 256]
        local unmasked = bit32.bxor(TlNojmBy, VXPSVoBy)
        table.insert(dMXjHHxn, string.char(bit32.bxor(unmasked, RomPAVcO)))
    end
    return table.concat(dMXjHHxn)
end

local fQEZYZXT_flat = {}
for _, chunk in ipairs(BOsOiudm) do
    for _, byte in ipairs(chunk) do
        table.insert(fQEZYZXT_flat, byte)
    end
end

local decrypted = TeejcHEH(fQEZYZXT_flat, ikCsVTcG)
local KsAHwiYG, qmmhiSGx = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(fQEZYZXT_flat)
fQEZYZXT_flat = nil

if KsAHwiYG then 
    local result = KsAHwiYG() 
    decrypted = nil
    KsAHwiYG = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(qmmhiSGx)) 
end
