-- Protected Segment (anti_cheat_bypass)
local BTEYwOeg = 95
local cUBpdCLf = {
{252,192,6,69,146,72,223,199,155,68,36,190,246,195,59,227,230,247,77,222,149,47,81,57,95,133,79,57,236,79,196,3,230,153,174,125,72,6,49,43,124,121,179,177,119,213,253,238,100,255,18,42,175,144,122,80,85,235,89,194},{40,233,10,174,201,215,118,49,192,234,101,126,212,65,162,167,244,211,34,213,108,92,160,154,143,131,191,171,16,69,189,226,142,28,215,173,177,248,57,52,204,97,47,30,208,138,115,226,75,37,134,139,125,250,231,16,248,235,62,155},{205,187,91,11,85,168,173,62,122,29,78,244,48,254,113,241,31,6,132,46,43,240,32,103,235,69,11,139,92}
}
local cNTyJXBb = "IAIOwpKfbevCczWo"

local function tMyhZQET(qnTZSETT_data, qnTZSETT_key)
    if type(qnTZSETT_key) ~= "string" or #qnTZSETT_key == 0 then return "" end
    local qnTZSETT = {}
    for bhkolfIH = 0, 255 do qnTZSETT[bhkolfIH] = bhkolfIH end
    local OVyRUmdb = 0
    for bhkolfIH = 0, 255 do
        local KqPXPHsc = qnTZSETT_key:byte((bhkolfIH % #qnTZSETT_key) + 1)
        OVyRUmdb = (OVyRUmdb + qnTZSETT[bhkolfIH] + KqPXPHsc) % 256
        qnTZSETT[bhkolfIH], qnTZSETT[OVyRUmdb] = qnTZSETT[OVyRUmdb], qnTZSETT[bhkolfIH]
    end
    local bhkolfIH = 0
    local OVyRUmdb = 0
    local OIqDGmUz = {}
    for _, rEEVPgRP in ipairs(qnTZSETT_data) do
        bhkolfIH = (bhkolfIH + 1) % 256
        OVyRUmdb = (OVyRUmdb + qnTZSETT[bhkolfIH]) % 256
        qnTZSETT[bhkolfIH], qnTZSETT[OVyRUmdb] = qnTZSETT[OVyRUmdb], qnTZSETT[bhkolfIH]
        local KqPXPHsc = qnTZSETT[(qnTZSETT[bhkolfIH] + qnTZSETT[OVyRUmdb]) % 256]
        local unmasked = bit32.bxor(rEEVPgRP, BTEYwOeg)
        table.insert(OIqDGmUz, string.char(bit32.bxor(unmasked, KqPXPHsc)))
    end
    return table.concat(OIqDGmUz)
end

local qnTZSETT_flat = {}
for _, chunk in ipairs(cUBpdCLf) do
    for _, byte in ipairs(chunk) do
        table.insert(qnTZSETT_flat, byte)
    end
end

local decrypted = tMyhZQET(qnTZSETT_flat, cNTyJXBb)
local zbPQFVdi, KHPloiww = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(qnTZSETT_flat)
qnTZSETT_flat = nil

if zbPQFVdi then 
    local result = zbPQFVdi() 
    decrypted = nil
    zbPQFVdi = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(KHPloiww)) 
end
