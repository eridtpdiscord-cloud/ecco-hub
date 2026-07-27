-- Protected Segment (db)
local iraSFMGX = 53
local aagurYUq = {
{52,67,225,27,63,94,218,156,192,174,47,174,158,166,141,7,87,147,169,104,92,209,87,173,173,174,146,36,70,55,160,191,64,151,86,11,139,16,55,251,227,210,244,233,87,114,61,84,18,220,150,21,161,90,209,121,117,78,206,41},{193,209,206,101,43,168,10,200,35,33,173,221,104,181,147,248,222,168,221,29,215,7,39,115,12,101,90,235,109,52,50,77,133,77,68,199,5,249,42,173,143,10,89,222,34,244,243,168,245,2,38,31,204,132,18,29,246,6,147,231},{156,154,190,241,35,68,91,165,79,122,245,138,97,141,38,47,171,52,23,30,221,12,44,223,84,40,162,207,148,151,99,254,112,16,201,33,160,57,38,54,77,43,15,172,121,194,129,118,111,100,148,204,147,142,188,62,162,24,88,119},{94,29,63,225,198,44,226,122,36,161,232,62,208,82,32,15,97,245,190,247,9,175,109,81,98,30,116,113,39,144,165,71,209,173,105,159,174,255,146,97,36,180,40,127,168,102,185,200,233,128,129,160,185,33,190,123,184,81,87,31},{52,91,152,102,190,13,117,10,197,45,67,36,47,2,97,80,227,120,144,63,198,60,173,8,163,33,252,176,31,136,217,69,108,25,251,171,57,227,243,48,9,90,98,134,188,169,34,8,222,39,28,183,159,193,21,70,230,190,146,14},{59,179,255,64,21,108,22,87,54,156,168,113,87,51,170,232,122,129,5,63,123,92,187,30,28,147,142,194,53,161,107,114,81,167,28,70,154,86,108,102,183,190,115,158,83,122,129,85,124,66,63,54,111,248,209,66,124,230,115,111},{74,227,112,137,189,153,79,13,25,229,182,8,207,83,176,245,150,32,162,19,250,206,254,210,66,148,84,165,210,231,203,87,73,50,180,50,239,112,199,121,83,228,98,48,251,190,137,23,214,14,114,21,101,211,90,222,89,231,197,115},{16,171,108,131,49,227,86,100,65,1,71,208,196,248,63,54,62,167,58,191,170,127,209,222,66,39,209,180,202,146,145,253,121,250,152,203,95,123,71,30}
}
local tlnPFjTu = "EMFJXFwWBhseMLcq"

local function MniphPav(HqJMUqSY_data, HqJMUqSY_key)
    if type(HqJMUqSY_key) ~= "string" or #HqJMUqSY_key == 0 then return "" end
    local HqJMUqSY = {}
    for GbgGjwzr = 0, 255 do HqJMUqSY[GbgGjwzr] = GbgGjwzr end
    local ffUAizzt = 0
    for GbgGjwzr = 0, 255 do
        local rSsvmEyE = HqJMUqSY_key:byte((GbgGjwzr % #HqJMUqSY_key) + 1)
        ffUAizzt = (ffUAizzt + HqJMUqSY[GbgGjwzr] + rSsvmEyE) % 256
        HqJMUqSY[GbgGjwzr], HqJMUqSY[ffUAizzt] = HqJMUqSY[ffUAizzt], HqJMUqSY[GbgGjwzr]
    end
    local GbgGjwzr = 0
    local ffUAizzt = 0
    local iZnyHBae = {}
    for _, audBHUhN in ipairs(HqJMUqSY_data) do
        GbgGjwzr = (GbgGjwzr + 1) % 256
        ffUAizzt = (ffUAizzt + HqJMUqSY[GbgGjwzr]) % 256
        HqJMUqSY[GbgGjwzr], HqJMUqSY[ffUAizzt] = HqJMUqSY[ffUAizzt], HqJMUqSY[GbgGjwzr]
        local rSsvmEyE = HqJMUqSY[(HqJMUqSY[GbgGjwzr] + HqJMUqSY[ffUAizzt]) % 256]
        local unmasked = bit32.bxor(audBHUhN, iraSFMGX)
        table.insert(iZnyHBae, string.char(bit32.bxor(unmasked, rSsvmEyE)))
    end
    return table.concat(iZnyHBae)
end

local HqJMUqSY_flat = {}
for _, chunk in ipairs(aagurYUq) do
    for _, byte in ipairs(chunk) do
        table.insert(HqJMUqSY_flat, byte)
    end
end

local decrypted = MniphPav(HqJMUqSY_flat, tlnPFjTu)
local DxDqqWwx, teuOHSCB = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(HqJMUqSY_flat)
HqJMUqSY_flat = nil

if DxDqqWwx then 
    local result = DxDqqWwx() 
    decrypted = nil
    DxDqqWwx = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(teuOHSCB)) 
end
