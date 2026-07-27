-- Protected Segment (db)
local FhORZcbF = 207
local CqDvolEm = {
{22,232,72,166,99,209,36,57,185,208,131,162,129,166,95,137,87,153,15,235,105,105,32,47,174,58,132,112,212,36,255,79,169,53,240,129,189,135,137,89,196,116,146,14,17,200,188,206,65,253,119,132,151,227,221,180,248,7,180,57},{180,64,186,111,34,177,16,23,69,174,140,124,144,202,32,72,209,106,172,110,123,242,47,35,82,162,72,32,3,180,186,121,152,82,0,106,82,158,169,205,163,121,197,20,206,49,0,240,122,92,77,64,205,254,223,76,171,95,225,201},{172,223,127,33,145,182,145,82,236,58,124,247,141,253,4,184,115,129,106,165,176,148,13,228,199,150,124,238,222,158,227,188,239,165,82,74,96,36,222,123,147,142,32,92,179,218,201,156,154,1,136,172,90,194,184,65,55,158,101,16},{26,160,218,150,62,161,108,198,81,30,141,239,41,216,96,75,202,132,236,86,181,80,100,67,48,30,246,88,80,148,66,77,84,189,167,194,183,59,236,186,188,52,171,152,202,164,121,24,78,126,91,181,90,193,14,216,216,161,23,240},{131,242,34,7,242,205,225,77,108,43,213,146,156,43,179,98,80,67,206,153,79,103,107,16,179,246,79,252,30,2,10,204,4,232,40,5,123,99,217,74,39,31,61,69,65,113,61,105,16,26,119,233,164,167,184,240,197,20,162,161},{116,63,91,237,232,140,77,155,98,54,30,161,209,93,164,56,172,243,24,74,116,43,78,113,200,207,38,185,91,88,184,176,60,11,254,201,30,54,143,103,100,195,24,136,241,76,46,20,255,33,189,11,98,206,167,147,72,76,69,212},{212,173,109,165,249,209,15,116,43,185,219,176,241,178,109,122,111,133,34,246,137,168,79,113,220,4,205,101,139,254,128,225,11,100,19,17,255,123,71,61,22,10,230,137,43,243,206,88,164,37,12,63,126,26,125,13,208,13,216,183},{250,112,2,77,210,34,16,231,162,122,38,153,110,111,85,22,135,57,133,214,255,120,249,53,136,216,122,196,228,151,252,105,214,11,133,185,172,130,133}
}
local IAkwiFOt = "HLyFiaSGLjDUzDHo"

local function FqkJBKLS(vTTdMVWq_data, vTTdMVWq_key)
    if type(vTTdMVWq_key) ~= "string" or #vTTdMVWq_key == 0 then return "" end
    local vTTdMVWq = {}
    for ohGqiemM = 0, 255 do vTTdMVWq[ohGqiemM] = ohGqiemM end
    local aigKNQeQ = 0
    for ohGqiemM = 0, 255 do
        local ZSkTRpNe = vTTdMVWq_key:byte((ohGqiemM % #vTTdMVWq_key) + 1)
        aigKNQeQ = (aigKNQeQ + vTTdMVWq[ohGqiemM] + ZSkTRpNe) % 256
        vTTdMVWq[ohGqiemM], vTTdMVWq[aigKNQeQ] = vTTdMVWq[aigKNQeQ], vTTdMVWq[ohGqiemM]
    end
    local ohGqiemM = 0
    local aigKNQeQ = 0
    local KDcDMYPa = {}
    for _, vmSaSKzu in ipairs(vTTdMVWq_data) do
        ohGqiemM = (ohGqiemM + 1) % 256
        aigKNQeQ = (aigKNQeQ + vTTdMVWq[ohGqiemM]) % 256
        vTTdMVWq[ohGqiemM], vTTdMVWq[aigKNQeQ] = vTTdMVWq[aigKNQeQ], vTTdMVWq[ohGqiemM]
        local ZSkTRpNe = vTTdMVWq[(vTTdMVWq[ohGqiemM] + vTTdMVWq[aigKNQeQ]) % 256]
        local unmasked = bit32.bxor(vmSaSKzu, FhORZcbF)
        table.insert(KDcDMYPa, string.char(bit32.bxor(unmasked, ZSkTRpNe)))
    end
    return table.concat(KDcDMYPa)
end

local vTTdMVWq_flat = {}
for _, chunk in ipairs(CqDvolEm) do
    for _, byte in ipairs(chunk) do
        table.insert(vTTdMVWq_flat, byte)
    end
end

local decrypted = FqkJBKLS(vTTdMVWq_flat, IAkwiFOt)
local ONGFcBoY, HjIENUpL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(vTTdMVWq_flat)
vTTdMVWq_flat = nil

if ONGFcBoY then 
    local result = ONGFcBoY() 
    decrypted = nil
    ONGFcBoY = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(HjIENUpL)) 
end
