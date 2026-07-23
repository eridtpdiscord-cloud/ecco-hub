-- Protected Segment (db)
local FpgkRKJM = 47
local hbNQyNVS = {
{241,104,91,247,140,98,223,46,238,161,165,110,4,77,202,104,69,150,170,230,71,21,73,71,97,89,240,178,114,118,58,195,225,179,9,104,219,108,54,223,206,97,87,233,48,59,86,131,151,73,111,122,51,45,18,191,22,109,80,88},{40,206,89,106,2,64,50,227,112,29,221,125,88,155,128,145,235,255,124,213,34,233,105,54,55,204,79,57,83,132,82,164,189,158,190,194,174,131,8,228,233,176,163,93,132,172,243,231,196,6,94,140,241,108,143,175,250,38,129,169},{1,175,205,47,80,122,210,24,80,194,238,43,52,117,128,14,110,161,186,142,223,9,226,93,204,155,1,213,151,173,106,42,1,23,124,16,1,140,242,103,80,24,11,172,176,163,12,49,122,245,51,242,209,237,154,46,196,75,225,112},{7,82,68,121,167,12,243,228,238,240,45,95,59,10,204,144,198,146,79,203,100,0,204,186,34,215,114,21,154,204,44,21,174,162,221,49,169,136,69,157,231,190,154,127,146,99,89,185,154,68,48,191,215,51,168,56,143,226,229,233},{144,220,203,186,128,76,155,192,230,151,241,32,192,96,48,135,151,202,181,57,193,34,98,170,236,204,53,118,1,225,187,16,201,187,91,119,166,155,111,155,247,237,80,130,87,146,60,249,202,26,34,10,174,243,182,69,213,94,137,12},{111,2,69,52,151,209,246,207,53,249,48,97,21,142,197,91,254,114,255,38,34,172,227,194,34,139,30,213,134,130,138,155,197,243,192,72,181,7,42,31,147,55,27,250,179,96,61,201,181,103,62,162,58,108,82,209,60,93,181,111},{9,63,52,160,39,125,117,16,212,21,111,223,106,227,232,28,164,158,117,219,187,71,224,43,29,48,65,172,36,200,199,8,206,197,226,171,169,37,141,179,71,151,52,61,9,3,91,68,174,251,252,196,140,25,15,37,118,93,45,27},{125,17,104,26,50,244,28,75,110,99,213,216,61,71,157,14,202,231,242,149,11,48,44,245,157,162,114,24,109,119,244,95,212,7,26,4,200,215,62,138,218,64,252,4,105,123,238,170,17,89,127,247,127,193,94,153,111,31,159}
}
local rtNKUrCH = "hwmJJpjZeSIBdQFd"

local function knhUCOCs(LFYJQwek_data, LFYJQwek_key)
    if type(LFYJQwek_key) ~= "string" or #LFYJQwek_key == 0 then return "" end
    local LFYJQwek = {}
    for UJtRjqZX = 0, 255 do LFYJQwek[UJtRjqZX] = UJtRjqZX end
    local ydNQneoi = 0
    for UJtRjqZX = 0, 255 do
        local CQasfOWR = LFYJQwek_key:byte((UJtRjqZX % #LFYJQwek_key) + 1)
        ydNQneoi = (ydNQneoi + LFYJQwek[UJtRjqZX] + CQasfOWR) % 256
        LFYJQwek[UJtRjqZX], LFYJQwek[ydNQneoi] = LFYJQwek[ydNQneoi], LFYJQwek[UJtRjqZX]
    end
    local UJtRjqZX = 0
    local ydNQneoi = 0
    local VTPMqsOX = {}
    for _, lUyOQIGC in ipairs(LFYJQwek_data) do
        UJtRjqZX = (UJtRjqZX + 1) % 256
        ydNQneoi = (ydNQneoi + LFYJQwek[UJtRjqZX]) % 256
        LFYJQwek[UJtRjqZX], LFYJQwek[ydNQneoi] = LFYJQwek[ydNQneoi], LFYJQwek[UJtRjqZX]
        local CQasfOWR = LFYJQwek[(LFYJQwek[UJtRjqZX] + LFYJQwek[ydNQneoi]) % 256]
        local unmasked = bit32.bxor(lUyOQIGC, FpgkRKJM)
        table.insert(VTPMqsOX, string.char(bit32.bxor(unmasked, CQasfOWR)))
    end
    return table.concat(VTPMqsOX)
end

local LFYJQwek_flat = {}
for _, chunk in ipairs(hbNQyNVS) do
    for _, byte in ipairs(chunk) do
        table.insert(LFYJQwek_flat, byte)
    end
end

local decrypted = knhUCOCs(LFYJQwek_flat, rtNKUrCH)
local PJTeIkmB, hqYkgXtT = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(LFYJQwek_flat)
LFYJQwek_flat = nil

if PJTeIkmB then 
    local result = PJTeIkmB() 
    decrypted = nil
    PJTeIkmB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(hqYkgXtT)) 
end
