-- Compiled secure segment
local EWUlaDtU = {
{2,87,91,3,47,75,19,36,159,38,15,120,13,194,68,98,216,168,250,13,119,21,48,208,105,57,158,249,64,34,67,163,247,178,136,115,178,40,163,2,212,76,94,70,236,196,131,85,38,55,127,155,55,208,3,145,128,105,215,204},{69,142,7,167,63,221,99,210,52,17,246,153,143,164,7,14,192,125,234,52,234,73,217,203,155,198,107,48,135,43,168,56,238,228,99,165,197,74,107,116,195,226,177,54,84,105,203,121,254,165,158,48,179,215,60,98,173,82,157,215},{117,60,1,101,184,117,149,26,128,42,64,46,82,214,223,139,147,26,19,247,122,159,13,148,31,46,129,139,152}
}
local CgQmptUW = "HcLxmsZKLImtGLID"

local function rQoUJfBz(avAHNRgM_data, avAHNRgM_key)
    local avAHNRgM = {}
    for xeHIyrsR = 0, 255 do avAHNRgM[xeHIyrsR] = xeHIyrsR end
    local GWhqzLGw = 0
    for xeHIyrsR = 0, 255 do
        local PUkHIdNP = avAHNRgM_key:byte((xeHIyrsR % #avAHNRgM_key) + 1)
        GWhqzLGw = (GWhqzLGw + avAHNRgM[xeHIyrsR] + PUkHIdNP) % 256
        avAHNRgM[xeHIyrsR], avAHNRgM[GWhqzLGw] = avAHNRgM[GWhqzLGw], avAHNRgM[xeHIyrsR]
    end
    local xeHIyrsR = 0
    local GWhqzLGw = 0
    local FjWIrHAN = {}
    for _, WvWKDVMe in ipairs(avAHNRgM_data) do
        xeHIyrsR = (xeHIyrsR + 1) % 256
        GWhqzLGw = (GWhqzLGw + avAHNRgM[xeHIyrsR]) % 256
        avAHNRgM[xeHIyrsR], avAHNRgM[GWhqzLGw] = avAHNRgM[GWhqzLGw], avAHNRgM[xeHIyrsR]
        local PUkHIdNP = avAHNRgM[(avAHNRgM[xeHIyrsR] + avAHNRgM[GWhqzLGw]) % 256]
        table.insert(FjWIrHAN, string.char(bit32.bxor(WvWKDVMe, PUkHIdNP)))
    end
    return table.concat(FjWIrHAN)
end

local avAHNRgM_flat = {}
for _, chunk in ipairs(EWUlaDtU) do
    for _, byte in ipairs(chunk) do
        table.insert(avAHNRgM_flat, byte)
    end
end

local decrypted = rQoUJfBz(avAHNRgM_flat, CgQmptUW)
local ASVaOVfL, LqRYhgnx = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(avAHNRgM_flat)
avAHNRgM_flat = nil

if ASVaOVfL then 
    local result = ASVaOVfL() 
    decrypted = nil
    ASVaOVfL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(LqRYhgnx)) 
end
