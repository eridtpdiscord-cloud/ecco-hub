-- Protected Segment (db)
local qtxLBEmy = 178
local zpWotfNB = {
{14,146,20,26,26,135,58,85,4,71,60,95,244,162,74,218,135,236,231,63,124,38,35,47,107,133,212,145,144,197,116,112,128,84,111,40,214,252,224,118,118,33,71,117,224,10,191,127,138,55,48,79,185,221,30,77,102,135,184,47},{173,236,138,52,6,17,152,48,237,70,38,73,60,90,173,136,230,77,65,5,249,191,204,188,136,14,196,196,7,176,215,64,133,188,65,102,176,190,118,181,238,82,122,193,249,158,155,32,179,203,214,126,160,15,196,36,74,154,238,198},{187,149,182,197,250,81,249,254,235,126,242,249,202,232,162,126,47,103,56,128,197,213,20,122,244,132,53,97,159,180,192,244,217,34,177,88,180,197,98,85,241,99,92,139,119,16,106,241,114,140,37,67,2,232,100,83,178,182,155,92},{112,220,118,153,49,139,163,71,57,227,183,100,168,83,109,14,248,237,68,20,8,108,136,110,61,173,222,186,191,226,195,162,20,10,143,117,45,80,21,88,2,113,177,99,205,55,206,192,128,252,145,116,26,197,13,179,130,88,61,222},{12,202,195,152,157,177,180,67,156,184,237,243,98,49,12,112,121,91,72,167,5,85,77,239,61,109,62,77,142,15,152,211,9,219,233,133,111,13,46,41,208,105,207,13,92,177,174,158,221,116,12,110,102,138,104,186,152,28,191,31},{225,187,127,51,181,194,111,176,142,37,141,124,9,126,22,141,134,206,50,108,93,147,160,126,133,59,175,185,99,54,3,127,114,178,150,4,233,21,99,157,3,255,29,10,167,38,211,4,239,195,165,102,167,123,185,94,122,49,73,110},{104,177,76,102,43,1,5,85,140,155,24,233,46,250,153,174,117,200,67,2,70,165,169,160,192,88,183,62,2,120,210,173,21,126,144,187,108,72,161,134,35,7,64,90,108,177,243,124,93,254,183,40,163,186,236,32,55,30,52,213},{87,244,208,191,104,164,193,116,41,240,3,133,215,146,108,110,220,181,87,99,139,154,32,133,14,234,105,152,166,79,135,174,85,234,99,159,218,157,75,183,117,33,33,172,154,63,236,43,213,109,57,94,109,124,127,119,191,232,100,30}
}
local XMgaDgIz = "EmhxuVCasCYqLRvo"

local function KxRrfpHm(IHeAQnlv_data, IHeAQnlv_key)
    local IHeAQnlv = {}
    for vxFXaTOj = 0, 255 do IHeAQnlv[vxFXaTOj] = vxFXaTOj end
    local nPLVydLm = 0
    for vxFXaTOj = 0, 255 do
        local QvJImjBN = IHeAQnlv_key:byte((vxFXaTOj % #IHeAQnlv_key) + 1)
        nPLVydLm = (nPLVydLm + IHeAQnlv[vxFXaTOj] + QvJImjBN) % 256
        IHeAQnlv[vxFXaTOj], IHeAQnlv[nPLVydLm] = IHeAQnlv[nPLVydLm], IHeAQnlv[vxFXaTOj]
    end
    local vxFXaTOj = 0
    local nPLVydLm = 0
    local obZcIGZw = {}
    for _, TKyjpwGt in ipairs(IHeAQnlv_data) do
        vxFXaTOj = (vxFXaTOj + 1) % 256
        nPLVydLm = (nPLVydLm + IHeAQnlv[vxFXaTOj]) % 256
        IHeAQnlv[vxFXaTOj], IHeAQnlv[nPLVydLm] = IHeAQnlv[nPLVydLm], IHeAQnlv[vxFXaTOj]
        local QvJImjBN = IHeAQnlv[(IHeAQnlv[vxFXaTOj] + IHeAQnlv[nPLVydLm]) % 256]
        local unmasked = bit32.bxor(TKyjpwGt, qtxLBEmy)
        table.insert(obZcIGZw, string.char(bit32.bxor(unmasked, QvJImjBN)))
    end
    return table.concat(obZcIGZw)
end

local IHeAQnlv_flat = {}
for _, chunk in ipairs(zpWotfNB) do
    for _, byte in ipairs(chunk) do
        table.insert(IHeAQnlv_flat, byte)
    end
end

local decrypted = KxRrfpHm(IHeAQnlv_flat, XMgaDgIz)
local ZIgilvNr, dItcRXYL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(IHeAQnlv_flat)
IHeAQnlv_flat = nil

if ZIgilvNr then 
    local result = ZIgilvNr() 
    decrypted = nil
    ZIgilvNr = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(dItcRXYL)) 
end
