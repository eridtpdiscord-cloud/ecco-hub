-- Protected Segment (math_vector_utils)
local IuUfVuVp = 62
local uZfWNcVx = {
{53,204,54,32,53,173,36,86,176,27,244,63,235,140,217,173,33,228,122,228,30,217,137,63,241,85,90,13,229,128,177,146,246,35,45,194,60,103,92,138,191,202,62,94,136,86,30,194,177,240,59,113,6,3,62,226,42,77,29,231},{32,113,107,141,49,132,219,251,50,182,225,169,213,125,24,226,102,29,185,249,166,235,60,132,165,172,58,245,193,20,230,252,226,120,209,60,57,118,247,16,219,80,38,165,113,176,15,188,59,193,88,102,249,30,157,237,150,109,124,247},{248,136,11,249,56,131,240,113,11,61,65,78,135,137,100,55,219,156,194,204,25,133,138,10,22,184,54,167,210}
}
local ZenySyst = "BrZUJroJbRNgEqDB"

local function ddvLMJdG(vxSiHaeW_data, vxSiHaeW_key)
    if type(vxSiHaeW_key) ~= "string" or #vxSiHaeW_key == 0 then return "" end
    local vxSiHaeW = {}
    for EVqkzOnU = 0, 255 do vxSiHaeW[EVqkzOnU] = EVqkzOnU end
    local hewtqfhz = 0
    for EVqkzOnU = 0, 255 do
        local HmonYyFw = vxSiHaeW_key:byte((EVqkzOnU % #vxSiHaeW_key) + 1)
        hewtqfhz = (hewtqfhz + vxSiHaeW[EVqkzOnU] + HmonYyFw) % 256
        vxSiHaeW[EVqkzOnU], vxSiHaeW[hewtqfhz] = vxSiHaeW[hewtqfhz], vxSiHaeW[EVqkzOnU]
    end
    local EVqkzOnU = 0
    local hewtqfhz = 0
    local ugkpWzhv = {}
    for _, VwOWsbcn in ipairs(vxSiHaeW_data) do
        EVqkzOnU = (EVqkzOnU + 1) % 256
        hewtqfhz = (hewtqfhz + vxSiHaeW[EVqkzOnU]) % 256
        vxSiHaeW[EVqkzOnU], vxSiHaeW[hewtqfhz] = vxSiHaeW[hewtqfhz], vxSiHaeW[EVqkzOnU]
        local HmonYyFw = vxSiHaeW[(vxSiHaeW[EVqkzOnU] + vxSiHaeW[hewtqfhz]) % 256]
        local unmasked = bit32.bxor(VwOWsbcn, IuUfVuVp)
        table.insert(ugkpWzhv, string.char(bit32.bxor(unmasked, HmonYyFw)))
    end
    return table.concat(ugkpWzhv)
end

local vxSiHaeW_flat = {}
for _, chunk in ipairs(uZfWNcVx) do
    for _, byte in ipairs(chunk) do
        table.insert(vxSiHaeW_flat, byte)
    end
end

local decrypted = ddvLMJdG(vxSiHaeW_flat, ZenySyst)
local RdCBDOjp, GgcvrJQG = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(vxSiHaeW_flat)
vxSiHaeW_flat = nil

if RdCBDOjp then 
    local result = RdCBDOjp() 
    decrypted = nil
    RdCBDOjp = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(GgcvrJQG)) 
end
