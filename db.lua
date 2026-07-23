-- Protected Segment (db)
local zfRQMdty = 6
local aYhoRUHL = {
{199,49,181,42,40,89,200,189,111,183,71,144,178,78,195,233,97,205,81,251,116,74,63,28,187,56,10,152,98,77,11,25,171,174,179,148,35,131,64,204,26,51,33,162,135,79,43,234,184,171,3,42,67,199,251,71,12,135,218,233},{105,102,236,199,129,92,76,227,254,227,31,48,1,29,174,82,23,42,126,4,143,61,43,89,253,67,134,80,142,41,67,200,211,240,128,116,188,143,179,133,215,202,176,5,74,102,7,4,26,165,66,15,129,254,42,17,93,53,150,164},{2,198,244,112,231,147,104,93,247,164,229,215,4,2,8,86,142,66,24,119,142,199,115,12,141,78,179,207,6,125,133,51,178,150,67,229,110,19,136,7,48,226,72,111,205,132,167,110,44,145,21,151,84,7,232,31,25,206,159,14},{153,111,38,42,154,188,19,22,236,196,159,104,89,82,163,225,198,3,97,147,159,6,243,254,168,189,227,171,55,226,194,59,39,2,50,180,183,184,211,46,16,253,11,34,37,229,121,93,20,58,85,128,44,52,151,250,106,148,176,59},{26,36,249,4,140,230,249,139,219,59,123,208,23,220,103,45,173,194,99,59,230,94,89,162,46,98,207,179,163,136,226,10,254,67,24,204,161,179,117,188,78,187,164,196,99,97,32,237,243,157,161,205,25,199,122,72,199,195,204,221},{207,235,13,129,189,222,106,72,193,102,220,84,254,78,29,39,135,104,34,209,208,196,40,122,173,54,68,230,66,246,93,254,182,17,96,224,242,253,67,9,184,158,141,198,233,91,189,127,3,240,137,223,219,26,189,135,215,112,120,147},{213,43,7,111,239,14,137,51,34,50,24,202,202,244,171,155,32,79,255,79,222,14,17,69,180,154,159,130,90,1,96,134,21,93,244,110,181,167,90,246,213,117,160,22,210,253,232,67,139,91,35,168,234,208,121,108,47,36,27,221},{247,143,245,96,11,148,135,172,230,159,117,69,164,19,73,50,205,31,3,1,170,233,52,137,138,112,143,215,145,139,48,254,132,90,221,65,109,198,90,38,85,72,78,71,240,106,98,112,149,116,155,101,141,19,157,183,140,97,131}
}
local FyLLKhPG = "lQQsAVcIyKOqxRmc"

local function oWwMJPok(qVCYgQnH_data, qVCYgQnH_key)
    if type(qVCYgQnH_key) ~= "string" or #qVCYgQnH_key == 0 then return "" end
    local qVCYgQnH = {}
    for QueqXwmm = 0, 255 do qVCYgQnH[QueqXwmm] = QueqXwmm end
    local XVMjVPUP = 0
    for QueqXwmm = 0, 255 do
        local ZInqniDJ = qVCYgQnH_key:byte((QueqXwmm % #qVCYgQnH_key) + 1)
        XVMjVPUP = (XVMjVPUP + qVCYgQnH[QueqXwmm] + ZInqniDJ) % 256
        qVCYgQnH[QueqXwmm], qVCYgQnH[XVMjVPUP] = qVCYgQnH[XVMjVPUP], qVCYgQnH[QueqXwmm]
    end
    local QueqXwmm = 0
    local XVMjVPUP = 0
    local YubkwErw = {}
    for _, DRpNqdGk in ipairs(qVCYgQnH_data) do
        QueqXwmm = (QueqXwmm + 1) % 256
        XVMjVPUP = (XVMjVPUP + qVCYgQnH[QueqXwmm]) % 256
        qVCYgQnH[QueqXwmm], qVCYgQnH[XVMjVPUP] = qVCYgQnH[XVMjVPUP], qVCYgQnH[QueqXwmm]
        local ZInqniDJ = qVCYgQnH[(qVCYgQnH[QueqXwmm] + qVCYgQnH[XVMjVPUP]) % 256]
        local unmasked = bit32.bxor(DRpNqdGk, zfRQMdty)
        table.insert(YubkwErw, string.char(bit32.bxor(unmasked, ZInqniDJ)))
    end
    return table.concat(YubkwErw)
end

local qVCYgQnH_flat = {}
for _, chunk in ipairs(aYhoRUHL) do
    for _, byte in ipairs(chunk) do
        table.insert(qVCYgQnH_flat, byte)
    end
end

local decrypted = oWwMJPok(qVCYgQnH_flat, FyLLKhPG)
local dwEbkwJi, xExwSqEx = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(qVCYgQnH_flat)
qVCYgQnH_flat = nil

if dwEbkwJi then 
    local result = dwEbkwJi() 
    decrypted = nil
    dwEbkwJi = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(xExwSqEx)) 
end
