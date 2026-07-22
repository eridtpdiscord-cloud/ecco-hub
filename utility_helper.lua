-- Protected Segment (utility_helper)
local dIwNuMos = 106
local snhPFXoL = {
{35,58,51,74,213,56,39,160,80,120,249,39,231,240,159,113,64,193,46,106,97,126,205,206,28,233,70,111,42,118,91,205,6,61,27,198,185,173,128,33,131,84,225,233,173,46,76,101,193,240,60,164,185,93,48,70,39,65,75,71},{75,120,182,105,247,59,199,227,142,253,44,212,96,169,156,66,130,246,169,77,104,215,224,170,76,140,133,65,228,161,152,231,58,1,46,74,76,20,237,74,126,94,49,160,151,84,91,138,31,101,14,192,1,61,86,23,151,65,255,17},{171,51,162,57,187,15,208,116,119,206,238,75,69,28,109,195,219,197,150,163,68,237,64,102,37,57}
}
local OMThaKuW = "ijGvEEPnYzBGqcZV"

local function prQyfGYP(UPGkYiYP_data, UPGkYiYP_key)
    local UPGkYiYP = {}
    for vCVteFSa = 0, 255 do UPGkYiYP[vCVteFSa] = vCVteFSa end
    local dhAVmNxu = 0
    for vCVteFSa = 0, 255 do
        local xGizXdUk = UPGkYiYP_key:byte((vCVteFSa % #UPGkYiYP_key) + 1)
        dhAVmNxu = (dhAVmNxu + UPGkYiYP[vCVteFSa] + xGizXdUk) % 256
        UPGkYiYP[vCVteFSa], UPGkYiYP[dhAVmNxu] = UPGkYiYP[dhAVmNxu], UPGkYiYP[vCVteFSa]
    end
    local vCVteFSa = 0
    local dhAVmNxu = 0
    local FueFTVXY = {}
    for _, prvRGnph in ipairs(UPGkYiYP_data) do
        vCVteFSa = (vCVteFSa + 1) % 256
        dhAVmNxu = (dhAVmNxu + UPGkYiYP[vCVteFSa]) % 256
        UPGkYiYP[vCVteFSa], UPGkYiYP[dhAVmNxu] = UPGkYiYP[dhAVmNxu], UPGkYiYP[vCVteFSa]
        local xGizXdUk = UPGkYiYP[(UPGkYiYP[vCVteFSa] + UPGkYiYP[dhAVmNxu]) % 256]
        local unmasked = bit32.bxor(prvRGnph, dIwNuMos)
        table.insert(FueFTVXY, string.char(bit32.bxor(unmasked, xGizXdUk)))
    end
    return table.concat(FueFTVXY)
end

local UPGkYiYP_flat = {}
for _, chunk in ipairs(snhPFXoL) do
    for _, byte in ipairs(chunk) do
        table.insert(UPGkYiYP_flat, byte)
    end
end

local decrypted = prQyfGYP(UPGkYiYP_flat, OMThaKuW)
local nzCsvmGe, agYlojKS = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(UPGkYiYP_flat)
UPGkYiYP_flat = nil

if nzCsvmGe then 
    local result = nzCsvmGe() 
    decrypted = nil
    nzCsvmGe = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(agYlojKS)) 
end
