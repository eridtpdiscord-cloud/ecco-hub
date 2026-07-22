-- Protected Segment (tween_library)
local gilpnSDQ = 199
local mwKHsfQd = {
{80,143,238,15,118,166,56,37,81,171,232,203,218,138,43,236,52,66,49,232,230,122,177,104,91,89,189,14,119,187,95,231,139,16,65,239,205,88,220,142,18,163,49,75,125,41,41,131,226,173,61,58,158,121,205,74,76,242,36,34},{242,104,140,236,12,149,85,25,220,83,225,24,45,174,202,161,77,28,82,212,104,232,0,26,204,192,223,175,69,15,135,9,242,85,138,171,242,202,244,248,84,222,221,120,44,140,33,224,79,123,228,51,122,176,111,168,94,3,130,247},{221,37,161,163,16,60,229,105,4,77,186,41,0,239,73,212,42,20,230,126,2,189,25,152,119}
}
local WUMKPECm = "YpbyOgnducFBwgIY"

local function oaHIIBLs(MgytuwdM_data, MgytuwdM_key)
    local MgytuwdM = {}
    for nzxmwpfL = 0, 255 do MgytuwdM[nzxmwpfL] = nzxmwpfL end
    local ONDtqLpq = 0
    for nzxmwpfL = 0, 255 do
        local kQyInuYu = MgytuwdM_key:byte((nzxmwpfL % #MgytuwdM_key) + 1)
        ONDtqLpq = (ONDtqLpq + MgytuwdM[nzxmwpfL] + kQyInuYu) % 256
        MgytuwdM[nzxmwpfL], MgytuwdM[ONDtqLpq] = MgytuwdM[ONDtqLpq], MgytuwdM[nzxmwpfL]
    end
    local nzxmwpfL = 0
    local ONDtqLpq = 0
    local RhLtSDuK = {}
    for _, Cyisctdm in ipairs(MgytuwdM_data) do
        nzxmwpfL = (nzxmwpfL + 1) % 256
        ONDtqLpq = (ONDtqLpq + MgytuwdM[nzxmwpfL]) % 256
        MgytuwdM[nzxmwpfL], MgytuwdM[ONDtqLpq] = MgytuwdM[ONDtqLpq], MgytuwdM[nzxmwpfL]
        local kQyInuYu = MgytuwdM[(MgytuwdM[nzxmwpfL] + MgytuwdM[ONDtqLpq]) % 256]
        local unmasked = bit32.bxor(Cyisctdm, gilpnSDQ)
        table.insert(RhLtSDuK, string.char(bit32.bxor(unmasked, kQyInuYu)))
    end
    return table.concat(RhLtSDuK)
end

local MgytuwdM_flat = {}
for _, chunk in ipairs(mwKHsfQd) do
    for _, byte in ipairs(chunk) do
        table.insert(MgytuwdM_flat, byte)
    end
end

local decrypted = oaHIIBLs(MgytuwdM_flat, WUMKPECm)
local ynwtYCxE, QHPxrxRi = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(MgytuwdM_flat)
MgytuwdM_flat = nil

if ynwtYCxE then 
    local result = ynwtYCxE() 
    decrypted = nil
    ynwtYCxE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(QHPxrxRi)) 
end
