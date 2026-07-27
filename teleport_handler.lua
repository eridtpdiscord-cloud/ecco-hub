-- Protected Segment (teleport_handler)
local bRcCUfti = 99
local wrpQGiKM = {
{207,86,77,8,113,244,65,141,157,74,156,110,4,51,242,98,188,189,45,187,78,255,187,114,207,7,127,164,66,2,21,94,67,189,15,34,99,103,236,225,179,65,131,233,21,213,185,171,202,26,88,247,76,193,22,12,33,16,34,64},{56,45,168,69,83,55,254,23,163,154,5,98,180,109,127,74,151,231,18,225,118,22,255,223,158,159,134,216,203,161,116,198,10,240,59,177,5,195,243,20,89,228,41,64,173,25,6,43,193,247,184,129,99,143,9,253,234,66,56,20},{122,50,215,249,172,34,2,218,3,22,121,226,129,181,210,129,237,252,202,222,122,97,181,92,202,48,164,27}
}
local otNAWUiL = "wXRJUzAvquCYgliZ"

local function RpAQWMWX(ZSgeZoyE_data, ZSgeZoyE_key)
    if type(ZSgeZoyE_key) ~= "string" or #ZSgeZoyE_key == 0 then return "" end
    local ZSgeZoyE = {}
    for XkvvzGzT = 0, 255 do ZSgeZoyE[XkvvzGzT] = XkvvzGzT end
    local rOauNgYC = 0
    for XkvvzGzT = 0, 255 do
        local HHCPCFsW = ZSgeZoyE_key:byte((XkvvzGzT % #ZSgeZoyE_key) + 1)
        rOauNgYC = (rOauNgYC + ZSgeZoyE[XkvvzGzT] + HHCPCFsW) % 256
        ZSgeZoyE[XkvvzGzT], ZSgeZoyE[rOauNgYC] = ZSgeZoyE[rOauNgYC], ZSgeZoyE[XkvvzGzT]
    end
    local XkvvzGzT = 0
    local rOauNgYC = 0
    local SXwqNiOx = {}
    for _, JKjhMwpr in ipairs(ZSgeZoyE_data) do
        XkvvzGzT = (XkvvzGzT + 1) % 256
        rOauNgYC = (rOauNgYC + ZSgeZoyE[XkvvzGzT]) % 256
        ZSgeZoyE[XkvvzGzT], ZSgeZoyE[rOauNgYC] = ZSgeZoyE[rOauNgYC], ZSgeZoyE[XkvvzGzT]
        local HHCPCFsW = ZSgeZoyE[(ZSgeZoyE[XkvvzGzT] + ZSgeZoyE[rOauNgYC]) % 256]
        local unmasked = bit32.bxor(JKjhMwpr, bRcCUfti)
        table.insert(SXwqNiOx, string.char(bit32.bxor(unmasked, HHCPCFsW)))
    end
    return table.concat(SXwqNiOx)
end

local ZSgeZoyE_flat = {}
for _, chunk in ipairs(wrpQGiKM) do
    for _, byte in ipairs(chunk) do
        table.insert(ZSgeZoyE_flat, byte)
    end
end

local decrypted = RpAQWMWX(ZSgeZoyE_flat, otNAWUiL)
local WyEQYpev, jEfaHvgM = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ZSgeZoyE_flat)
ZSgeZoyE_flat = nil

if WyEQYpev then 
    local result = WyEQYpev() 
    decrypted = nil
    WyEQYpev = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(jEfaHvgM)) 
end
