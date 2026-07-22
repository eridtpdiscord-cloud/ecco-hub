-- Protected Segment (math_vector_utils)
local knnEeiRd = 254
local ELqMuRXV = {
{49,14,56,47,59,232,125,107,85,27,124,201,147,207,126,115,125,190,44,27,94,240,143,77,234,16,82,72,76,82,185,132,19,37,119,173,149,182,138,225,133,4,69,105,31,139,149,155,29,81,58,61,89,137,23,62,181,7,255,243},{173,73,115,49,203,213,4,113,125,147,249,179,134,227,43,86,235,189,177,219,151,130,54,82,158,242,109,1,81,3,236,252,28,224,128,12,247,24,106,71,33,218,234,80,201,125,217,75,208,60,61,162,6,235,195,204,12,121,137,136},{233,36,179,218,65,217,237,109,98,119,209,250,254,83,71,193,208,54,59,64,0,137,76,189,159,135,12,120,217}
}
local CLbWeTJL = "EuNPdIWnHmNyYpuW"

local function gzZEGyjs(ocJrKzoo_data, ocJrKzoo_key)
    local ocJrKzoo = {}
    for hnEsHDKa = 0, 255 do ocJrKzoo[hnEsHDKa] = hnEsHDKa end
    local dDpZZGCv = 0
    for hnEsHDKa = 0, 255 do
        local QYFeuvVG = ocJrKzoo_key:byte((hnEsHDKa % #ocJrKzoo_key) + 1)
        dDpZZGCv = (dDpZZGCv + ocJrKzoo[hnEsHDKa] + QYFeuvVG) % 256
        ocJrKzoo[hnEsHDKa], ocJrKzoo[dDpZZGCv] = ocJrKzoo[dDpZZGCv], ocJrKzoo[hnEsHDKa]
    end
    local hnEsHDKa = 0
    local dDpZZGCv = 0
    local TJZRMIjN = {}
    for _, DCdrDKss in ipairs(ocJrKzoo_data) do
        hnEsHDKa = (hnEsHDKa + 1) % 256
        dDpZZGCv = (dDpZZGCv + ocJrKzoo[hnEsHDKa]) % 256
        ocJrKzoo[hnEsHDKa], ocJrKzoo[dDpZZGCv] = ocJrKzoo[dDpZZGCv], ocJrKzoo[hnEsHDKa]
        local QYFeuvVG = ocJrKzoo[(ocJrKzoo[hnEsHDKa] + ocJrKzoo[dDpZZGCv]) % 256]
        local unmasked = bit32.bxor(DCdrDKss, knnEeiRd)
        table.insert(TJZRMIjN, string.char(bit32.bxor(unmasked, QYFeuvVG)))
    end
    return table.concat(TJZRMIjN)
end

local ocJrKzoo_flat = {}
for _, chunk in ipairs(ELqMuRXV) do
    for _, byte in ipairs(chunk) do
        table.insert(ocJrKzoo_flat, byte)
    end
end

local decrypted = gzZEGyjs(ocJrKzoo_flat, CLbWeTJL)
local zaXdCdgS, bwYmeKmd = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ocJrKzoo_flat)
ocJrKzoo_flat = nil

if zaXdCdgS then 
    local result = zaXdCdgS() 
    decrypted = nil
    zaXdCdgS = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(bwYmeKmd)) 
end
