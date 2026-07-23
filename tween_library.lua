-- Protected Segment (tween_library)
local yYidfRTB = 13
local MSKpBUNK = {
{159,25,193,32,255,28,143,87,206,130,233,165,144,61,24,141,5,192,102,23,144,85,177,180,233,76,219,223,19,150,53,228,173,126,55,147,233,222,136,211,120,38,38,250,153,19,148,72,32,197,95,227,172,134,91,160,216,31,170,157},{233,173,31,63,244,48,207,51,71,94,56,147,191,39,8,29,6,121,211,163,116,176,243,171,89,31,232,213,181,189,111,205,50,157,247,143,207,55,234,253,226,134,129,215,228,223,192,64,39,181,92,195,205,193,117,125,143,124,127,232},{144,218,11,95,138,8,108,159,209,179,9,92,106,125,42,25,32,219,202,56,228,51,187,65,74}
}
local adMMtsOZ = "kYnqvqvfPswwfrpT"

local function JDeWazjz(GdznwDmq_data, GdznwDmq_key)
    if type(GdznwDmq_key) ~= "string" or #GdznwDmq_key == 0 then return "" end
    local GdznwDmq = {}
    for VdbxzbsV = 0, 255 do GdznwDmq[VdbxzbsV] = VdbxzbsV end
    local iDpsaQTW = 0
    for VdbxzbsV = 0, 255 do
        local sGTkkIly = GdznwDmq_key:byte((VdbxzbsV % #GdznwDmq_key) + 1)
        iDpsaQTW = (iDpsaQTW + GdznwDmq[VdbxzbsV] + sGTkkIly) % 256
        GdznwDmq[VdbxzbsV], GdznwDmq[iDpsaQTW] = GdznwDmq[iDpsaQTW], GdznwDmq[VdbxzbsV]
    end
    local VdbxzbsV = 0
    local iDpsaQTW = 0
    local iorljxPy = {}
    for _, aNmquiRP in ipairs(GdznwDmq_data) do
        VdbxzbsV = (VdbxzbsV + 1) % 256
        iDpsaQTW = (iDpsaQTW + GdznwDmq[VdbxzbsV]) % 256
        GdznwDmq[VdbxzbsV], GdznwDmq[iDpsaQTW] = GdznwDmq[iDpsaQTW], GdznwDmq[VdbxzbsV]
        local sGTkkIly = GdznwDmq[(GdznwDmq[VdbxzbsV] + GdznwDmq[iDpsaQTW]) % 256]
        local unmasked = bit32.bxor(aNmquiRP, yYidfRTB)
        table.insert(iorljxPy, string.char(bit32.bxor(unmasked, sGTkkIly)))
    end
    return table.concat(iorljxPy)
end

local GdznwDmq_flat = {}
for _, chunk in ipairs(MSKpBUNK) do
    for _, byte in ipairs(chunk) do
        table.insert(GdznwDmq_flat, byte)
    end
end

local decrypted = JDeWazjz(GdznwDmq_flat, adMMtsOZ)
local EsSievXx, GpYcgKkx = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(GdznwDmq_flat)
GdznwDmq_flat = nil

if EsSievXx then 
    local result = EsSievXx() 
    decrypted = nil
    EsSievXx = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(GpYcgKkx)) 
end
