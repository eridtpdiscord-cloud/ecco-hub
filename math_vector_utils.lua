-- Protected Segment (math_vector_utils)
local vuoFbyuz = 140
local MyaFlcVw = {
{250,160,134,244,227,101,249,79,199,1,205,29,167,215,49,10,124,226,47,9,216,195,196,77,60,52,125,214,221,123,130,81,150,248,116,133,208,201,192,184,250,17,145,37,210,224,68,92,138,54,19,73,13,76,48,70,153,179,169,231},{34,108,63,119,132,32,232,149,66,16,0,188,43,246,57,27,109,64,169,43,126,107,179,13,36,127,173,98,116,38,50,244,161,64,97,185,94,21,167,105,208,140,11,22,111,24,215,61,199,132,107,78,64,220,143,174,29,166,136,243},{146,37,238,176,48,75,187,72,61,34,245,117,251,145,255,232,78,206,30,61,218,144,230,25,154,190,234,142,93}
}
local NNwZVMCH = "SAsOcItOIImsJACY"

local function VJknzDyB(pdxyeEtt_data, pdxyeEtt_key)
    local pdxyeEtt = {}
    for LxROCKjZ = 0, 255 do pdxyeEtt[LxROCKjZ] = LxROCKjZ end
    local wewuoQhm = 0
    for LxROCKjZ = 0, 255 do
        local JeBVIsGC = pdxyeEtt_key:byte((LxROCKjZ % #pdxyeEtt_key) + 1)
        wewuoQhm = (wewuoQhm + pdxyeEtt[LxROCKjZ] + JeBVIsGC) % 256
        pdxyeEtt[LxROCKjZ], pdxyeEtt[wewuoQhm] = pdxyeEtt[wewuoQhm], pdxyeEtt[LxROCKjZ]
    end
    local LxROCKjZ = 0
    local wewuoQhm = 0
    local iGpcsKjV = {}
    for _, WvuJvFMH in ipairs(pdxyeEtt_data) do
        LxROCKjZ = (LxROCKjZ + 1) % 256
        wewuoQhm = (wewuoQhm + pdxyeEtt[LxROCKjZ]) % 256
        pdxyeEtt[LxROCKjZ], pdxyeEtt[wewuoQhm] = pdxyeEtt[wewuoQhm], pdxyeEtt[LxROCKjZ]
        local JeBVIsGC = pdxyeEtt[(pdxyeEtt[LxROCKjZ] + pdxyeEtt[wewuoQhm]) % 256]
        local unmasked = bit32.bxor(WvuJvFMH, vuoFbyuz)
        table.insert(iGpcsKjV, string.char(bit32.bxor(unmasked, JeBVIsGC)))
    end
    return table.concat(iGpcsKjV)
end

local pdxyeEtt_flat = {}
for _, chunk in ipairs(MyaFlcVw) do
    for _, byte in ipairs(chunk) do
        table.insert(pdxyeEtt_flat, byte)
    end
end

local decrypted = VJknzDyB(pdxyeEtt_flat, NNwZVMCH)
local PykRFmDt, sTtsCaKS = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(pdxyeEtt_flat)
pdxyeEtt_flat = nil

if PykRFmDt then 
    local result = PykRFmDt() 
    decrypted = nil
    PykRFmDt = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(sTtsCaKS)) 
end
