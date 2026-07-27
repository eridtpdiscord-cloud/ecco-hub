-- Protected Segment (teleport_handler)
local AGertuPL = 69
local xcFNRqEy = {
{124,158,178,235,125,154,247,135,249,175,149,232,168,247,176,173,125,231,6,192,248,28,251,236,207,190,131,162,102,123,254,103,15,217,250,174,203,179,151,31,254,52,0,251,169,226,110,102,131,205,202,81,243,106,124,220,166,220,33,80},{16,210,195,223,241,94,154,95,202,29,92,165,151,89,102,62,59,175,118,165,91,117,138,127,36,24,62,240,7,102,173,251,119,169,143,101,60,120,191,130,91,122,70,40,145,34,200,10,7,194,21,219,231,229,67,119,194,137,237,124},{96,195,73,122,249,121,225,151,224,65,39,57,149,38,5,192,34,132,106,186,177,125,157,159,85,53,45,55}
}
local XmYxHpUe = "acZQodmpnPfSpVdk"

local function qvMarfdU(uJfhiaTl_data, uJfhiaTl_key)
    if type(uJfhiaTl_key) ~= "string" or #uJfhiaTl_key == 0 then return "" end
    local uJfhiaTl = {}
    for HNnBWfKi = 0, 255 do uJfhiaTl[HNnBWfKi] = HNnBWfKi end
    local TCPGnSkq = 0
    for HNnBWfKi = 0, 255 do
        local akEjrXPR = uJfhiaTl_key:byte((HNnBWfKi % #uJfhiaTl_key) + 1)
        TCPGnSkq = (TCPGnSkq + uJfhiaTl[HNnBWfKi] + akEjrXPR) % 256
        uJfhiaTl[HNnBWfKi], uJfhiaTl[TCPGnSkq] = uJfhiaTl[TCPGnSkq], uJfhiaTl[HNnBWfKi]
    end
    local HNnBWfKi = 0
    local TCPGnSkq = 0
    local VvyCxyru = {}
    for _, rmoAhDuz in ipairs(uJfhiaTl_data) do
        HNnBWfKi = (HNnBWfKi + 1) % 256
        TCPGnSkq = (TCPGnSkq + uJfhiaTl[HNnBWfKi]) % 256
        uJfhiaTl[HNnBWfKi], uJfhiaTl[TCPGnSkq] = uJfhiaTl[TCPGnSkq], uJfhiaTl[HNnBWfKi]
        local akEjrXPR = uJfhiaTl[(uJfhiaTl[HNnBWfKi] + uJfhiaTl[TCPGnSkq]) % 256]
        local unmasked = bit32.bxor(rmoAhDuz, AGertuPL)
        table.insert(VvyCxyru, string.char(bit32.bxor(unmasked, akEjrXPR)))
    end
    return table.concat(VvyCxyru)
end

local uJfhiaTl_flat = {}
for _, chunk in ipairs(xcFNRqEy) do
    for _, byte in ipairs(chunk) do
        table.insert(uJfhiaTl_flat, byte)
    end
end

local decrypted = qvMarfdU(uJfhiaTl_flat, XmYxHpUe)
local qEDXqyUl, zeTwFDrw = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(uJfhiaTl_flat)
uJfhiaTl_flat = nil

if qEDXqyUl then 
    local result = qEDXqyUl() 
    decrypted = nil
    qEDXqyUl = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(zeTwFDrw)) 
end
