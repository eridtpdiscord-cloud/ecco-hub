-- Protected Segment (tween_library)
local xbjcoqux = 37
local ZtwlFBCG = {
{9,234,45,250,69,208,204,191,5,209,76,81,143,38,244,9,109,229,61,95,75,10,106,160,138,71,69,190,95,127,172,142,145,90,2,163,203,170,212,189,174,195,232,40,48,32,58,206,237,178,236,114,236,205,84,230,213,60,253,7},{199,227,125,138,162,124,247,255,66,232,7,189,31,116,211,158,212,32,230,139,65,194,253,181,211,67,138,163,127,24,210,182,93,147,241,197,253,125,89,168,209,210,113,195,2,210,49,119,83,165,51,242,121,55,61,212,3,253,8,145},{66,45,49,155,2,16,9,5,227,231,83,102,129,66,120,192,218,75,14,107,220,74,83,130,60}
}
local LVMbZbbR = "dQsCeTTKtMpIOeUI"

local function tMYQhKYa(xAKBLbQb_data, xAKBLbQb_key)
    local xAKBLbQb = {}
    for umVwdVYp = 0, 255 do xAKBLbQb[umVwdVYp] = umVwdVYp end
    local tBFJueTb = 0
    for umVwdVYp = 0, 255 do
        local vVrUsaSa = xAKBLbQb_key:byte((umVwdVYp % #xAKBLbQb_key) + 1)
        tBFJueTb = (tBFJueTb + xAKBLbQb[umVwdVYp] + vVrUsaSa) % 256
        xAKBLbQb[umVwdVYp], xAKBLbQb[tBFJueTb] = xAKBLbQb[tBFJueTb], xAKBLbQb[umVwdVYp]
    end
    local umVwdVYp = 0
    local tBFJueTb = 0
    local NjrTgDaT = {}
    for _, wnywcHks in ipairs(xAKBLbQb_data) do
        umVwdVYp = (umVwdVYp + 1) % 256
        tBFJueTb = (tBFJueTb + xAKBLbQb[umVwdVYp]) % 256
        xAKBLbQb[umVwdVYp], xAKBLbQb[tBFJueTb] = xAKBLbQb[tBFJueTb], xAKBLbQb[umVwdVYp]
        local vVrUsaSa = xAKBLbQb[(xAKBLbQb[umVwdVYp] + xAKBLbQb[tBFJueTb]) % 256]
        local unmasked = bit32.bxor(wnywcHks, xbjcoqux)
        table.insert(NjrTgDaT, string.char(bit32.bxor(unmasked, vVrUsaSa)))
    end
    return table.concat(NjrTgDaT)
end

local xAKBLbQb_flat = {}
for _, chunk in ipairs(ZtwlFBCG) do
    for _, byte in ipairs(chunk) do
        table.insert(xAKBLbQb_flat, byte)
    end
end

local decrypted = tMYQhKYa(xAKBLbQb_flat, LVMbZbbR)
local HDQMWbRZ, PosqBwTL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(xAKBLbQb_flat)
xAKBLbQb_flat = nil

if HDQMWbRZ then 
    local result = HDQMWbRZ() 
    decrypted = nil
    HDQMWbRZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(PosqBwTL)) 
end
