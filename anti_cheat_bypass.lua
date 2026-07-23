-- Protected Segment (anti_cheat_bypass)
local ESkLlzVz = 97
local pmUuYJRc = {
{218,15,115,67,29,55,153,71,143,71,132,24,140,104,126,66,203,229,210,254,98,178,26,230,78,8,72,162,239,18,206,236,11,68,11,50,204,204,233,252,60,36,93,16,160,85,71,146,8,30,89,224,15,10,196,110,34,39,162,60},{246,181,170,72,148,129,113,84,131,37,24,231,129,63,125,13,58,111,194,146,79,0,108,17,67,111,160,211,113,68,108,135,38,124,52,129,252,175,64,83,193,56,216,160,146,215,70,145,43,98,234,168,124,77,194,4,148,80,37,246},{234,187,191,211,212,99,249,227,218,35,35,58,232,250,184,50,65,139,219,231,33,152,14,14,106,47,24,243,153}
}
local LDgmtUsM = "TmlNwsIXZPqREBZh"

local function aifFWgyv(RQPNhqFX_data, RQPNhqFX_key)
    if type(RQPNhqFX_key) ~= "string" or #RQPNhqFX_key == 0 then return "" end
    local RQPNhqFX = {}
    for DVZYXEYM = 0, 255 do RQPNhqFX[DVZYXEYM] = DVZYXEYM end
    local RDkWCCez = 0
    for DVZYXEYM = 0, 255 do
        local IAUYDyYT = RQPNhqFX_key:byte((DVZYXEYM % #RQPNhqFX_key) + 1)
        RDkWCCez = (RDkWCCez + RQPNhqFX[DVZYXEYM] + IAUYDyYT) % 256
        RQPNhqFX[DVZYXEYM], RQPNhqFX[RDkWCCez] = RQPNhqFX[RDkWCCez], RQPNhqFX[DVZYXEYM]
    end
    local DVZYXEYM = 0
    local RDkWCCez = 0
    local QcexCiEB = {}
    for _, YTaKoOHs in ipairs(RQPNhqFX_data) do
        DVZYXEYM = (DVZYXEYM + 1) % 256
        RDkWCCez = (RDkWCCez + RQPNhqFX[DVZYXEYM]) % 256
        RQPNhqFX[DVZYXEYM], RQPNhqFX[RDkWCCez] = RQPNhqFX[RDkWCCez], RQPNhqFX[DVZYXEYM]
        local IAUYDyYT = RQPNhqFX[(RQPNhqFX[DVZYXEYM] + RQPNhqFX[RDkWCCez]) % 256]
        local unmasked = bit32.bxor(YTaKoOHs, ESkLlzVz)
        table.insert(QcexCiEB, string.char(bit32.bxor(unmasked, IAUYDyYT)))
    end
    return table.concat(QcexCiEB)
end

local RQPNhqFX_flat = {}
for _, chunk in ipairs(pmUuYJRc) do
    for _, byte in ipairs(chunk) do
        table.insert(RQPNhqFX_flat, byte)
    end
end

local decrypted = aifFWgyv(RQPNhqFX_flat, LDgmtUsM)
local AvsBuLDr, NPXKMjYn = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(RQPNhqFX_flat)
RQPNhqFX_flat = nil

if AvsBuLDr then 
    local result = AvsBuLDr() 
    decrypted = nil
    AvsBuLDr = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(NPXKMjYn)) 
end
