-- Protected Segment (db)
local XPtFThVd = 243
local rgKEpFQd = {
{133,145,189,237,191,2,102,25,89,136,5,220,146,143,39,228,193,213,76,4,170,239,90,165,210,16,254,117,162,110,76,159,49,197,0,153,189,168,107,169,84,184,154,40,72,53,146,75,205,212,206,49,248,199,150,71,198,42,125,175},{31,153,157,56,35,42,63,7,173,93,76,194,136,237,63,11,163,210,64,52,49,201,242,124,177,169,152,196,168,71,196,116,176,95,85,100,9,80,188,88,222,92,155,201,72,97,157,147,255,255,88,4,37,136,5,195,18,119,30,18},{205,227,42,194,25,91,30,109,240,208,246,195,152,188,50,245,29,179,118,237,64,144,173,84,252,86,117,20,247,34,219,231,115,235,127,185,205,162,89,167,9,41,130,233,113,130,172,119,245,208,54,115,70,229,133,37,147,72,91,148},{217,49,233,40,123,119,113,129,185,60,41,167,187,174,132,71,163,36,4,23,17,251,34,63,10,157,53,148,180,241,77,47,20,100,78,162,180,138,77,241,62,153,105,223,224,97,5,158,32,199,93,223,48,149,217,218,182,220,252,226},{116,210,247,224,148,91,50,166,89,105,238,158,3,114,254,216,223,200,108,7,139,202,138,168,66,20,71,193,152,4,213,90,120,43,175,36,220,8,29,170,98,51,29,234,88,100,195,227,92,244,35,34,31,17,230,202,147,207,39,246},{218,243,46,40,132,104,23,92,159,190,106,118,87,91,42,52,255,64,143,116,42,131,15,136,166,236,82,156,215,198,84,99,70,88,93,111,76,243,11,117,54,210,167,115,118,157,178,157,154,195,113,216,121,124,243,91,217,9,255,241},{49,7,104,87,170,36,46,156,159,254,210,1,173,231,220,105,105,180,167,75,80,207,152,66,162,74,215,37,85,179,109,17,19,164,77,114,119,144,249,14,82,197,108,73,89}
}
local xNqzpnYe = "csHXZRgIBXzIpaHB"

local function KYhEMbrX(ZRVFgRBX_data, ZRVFgRBX_key)
    local ZRVFgRBX = {}
    for NjSEIAdk = 0, 255 do ZRVFgRBX[NjSEIAdk] = NjSEIAdk end
    local JRcfEEjC = 0
    for NjSEIAdk = 0, 255 do
        local MOEybNUM = ZRVFgRBX_key:byte((NjSEIAdk % #ZRVFgRBX_key) + 1)
        JRcfEEjC = (JRcfEEjC + ZRVFgRBX[NjSEIAdk] + MOEybNUM) % 256
        ZRVFgRBX[NjSEIAdk], ZRVFgRBX[JRcfEEjC] = ZRVFgRBX[JRcfEEjC], ZRVFgRBX[NjSEIAdk]
    end
    local NjSEIAdk = 0
    local JRcfEEjC = 0
    local EyvYDbaF = {}
    for _, zSONHLmz in ipairs(ZRVFgRBX_data) do
        NjSEIAdk = (NjSEIAdk + 1) % 256
        JRcfEEjC = (JRcfEEjC + ZRVFgRBX[NjSEIAdk]) % 256
        ZRVFgRBX[NjSEIAdk], ZRVFgRBX[JRcfEEjC] = ZRVFgRBX[JRcfEEjC], ZRVFgRBX[NjSEIAdk]
        local MOEybNUM = ZRVFgRBX[(ZRVFgRBX[NjSEIAdk] + ZRVFgRBX[JRcfEEjC]) % 256]
        local unmasked = bit32.bxor(zSONHLmz, XPtFThVd)
        table.insert(EyvYDbaF, string.char(bit32.bxor(unmasked, MOEybNUM)))
    end
    return table.concat(EyvYDbaF)
end

local ZRVFgRBX_flat = {}
for _, chunk in ipairs(rgKEpFQd) do
    for _, byte in ipairs(chunk) do
        table.insert(ZRVFgRBX_flat, byte)
    end
end

local decrypted = KYhEMbrX(ZRVFgRBX_flat, xNqzpnYe)
local uSgazHuj, sTOoxZHn = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ZRVFgRBX_flat)
ZRVFgRBX_flat = nil

if uSgazHuj then 
    local result = uSgazHuj() 
    decrypted = nil
    uSgazHuj = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(sTOoxZHn)) 
end
