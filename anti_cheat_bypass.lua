-- Protected Segment (anti_cheat_bypass)
local SqfiWAao = 42
local ZJvdxqmc = {
{204,27,195,55,124,168,70,127,39,105,231,238,139,57,139,58,49,74,203,112,231,27,147,235,145,205,16,248,187,54,46,129,49,185,228,5,82,52,48,12,70,251,214,226,6,25,123,25,22,90,77,104,32,53,160,14,223,104,61,226},{145,131,97,119,167,134,156,247,206,245,105,11,212,131,103,20,92,81,243,50,148,61,242,110,255,6,81,58,138,2,251,252,151,240,41,206,131,201,39,54,167,112,94,102,243,202,87,30,205,23,32,155,132,21,163,210,204,75,206,126},{164,123,107,152,105,150,195,87,204,134,217,224,10,189,73,199,6,251,110,105,44,162,166,60,89,26,66,152,84}
}
local LFhTqCqr = "dDxTjaOIETtyAeBV"

local function VdgQeIDy(MtoRCnfM_data, MtoRCnfM_key)
    if type(MtoRCnfM_key) ~= "string" or #MtoRCnfM_key == 0 then return "" end
    local MtoRCnfM = {}
    for spmOPZlb = 0, 255 do MtoRCnfM[spmOPZlb] = spmOPZlb end
    local fkkoIOZr = 0
    for spmOPZlb = 0, 255 do
        local qqbsfbvQ = MtoRCnfM_key:byte((spmOPZlb % #MtoRCnfM_key) + 1)
        fkkoIOZr = (fkkoIOZr + MtoRCnfM[spmOPZlb] + qqbsfbvQ) % 256
        MtoRCnfM[spmOPZlb], MtoRCnfM[fkkoIOZr] = MtoRCnfM[fkkoIOZr], MtoRCnfM[spmOPZlb]
    end
    local spmOPZlb = 0
    local fkkoIOZr = 0
    local qOnpqYTk = {}
    for _, nfYYkgdR in ipairs(MtoRCnfM_data) do
        spmOPZlb = (spmOPZlb + 1) % 256
        fkkoIOZr = (fkkoIOZr + MtoRCnfM[spmOPZlb]) % 256
        MtoRCnfM[spmOPZlb], MtoRCnfM[fkkoIOZr] = MtoRCnfM[fkkoIOZr], MtoRCnfM[spmOPZlb]
        local qqbsfbvQ = MtoRCnfM[(MtoRCnfM[spmOPZlb] + MtoRCnfM[fkkoIOZr]) % 256]
        local unmasked = bit32.bxor(nfYYkgdR, SqfiWAao)
        table.insert(qOnpqYTk, string.char(bit32.bxor(unmasked, qqbsfbvQ)))
    end
    return table.concat(qOnpqYTk)
end

local MtoRCnfM_flat = {}
for _, chunk in ipairs(ZJvdxqmc) do
    for _, byte in ipairs(chunk) do
        table.insert(MtoRCnfM_flat, byte)
    end
end

local decrypted = VdgQeIDy(MtoRCnfM_flat, LFhTqCqr)
local CCgQBEfB, gpqSJkec = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(MtoRCnfM_flat)
MtoRCnfM_flat = nil

if CCgQBEfB then 
    local result = CCgQBEfB() 
    decrypted = nil
    CCgQBEfB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(gpqSJkec)) 
end
