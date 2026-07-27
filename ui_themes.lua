-- Protected Segment (ui_themes)
local zgedbMnk = 120
local DwEFWKHp = {
{66,194,128,52,32,234,76,175,149,5,102,164,182,27,202,164,129,238,14,96,226,197,23,22,21,55,232,69,255,233,88,25,253,39,212,255,117,9,73,188,224,27,38,60,140,200,195,28,247,69,217,241,8,224,82,234,93,25,88,201},{152,205,242,42,218,100,101,50,210,57,41,167,221,197,224,219,56,18,165,74,16,13,164,187,244,78,227,46,86,181,237,113,227,129,24,231,12,69,20,88,68,140,254,36,21,76,21,130,25,92,110,198,86,161,68,159,33,218,205,111},{149,194,63,199,212,32,130,110,179,204,82,29,129,37,194,20,96,140,112,255,136}
}
local UNKiXppy = "UxIcNeJFChaXkSpy"

local function IOnaUwCb(RayHfzTn_data, RayHfzTn_key)
    if type(RayHfzTn_key) ~= "string" or #RayHfzTn_key == 0 then return "" end
    local RayHfzTn = {}
    for jTIxYaci = 0, 255 do RayHfzTn[jTIxYaci] = jTIxYaci end
    local NPTMXmRj = 0
    for jTIxYaci = 0, 255 do
        local WerNwQOF = RayHfzTn_key:byte((jTIxYaci % #RayHfzTn_key) + 1)
        NPTMXmRj = (NPTMXmRj + RayHfzTn[jTIxYaci] + WerNwQOF) % 256
        RayHfzTn[jTIxYaci], RayHfzTn[NPTMXmRj] = RayHfzTn[NPTMXmRj], RayHfzTn[jTIxYaci]
    end
    local jTIxYaci = 0
    local NPTMXmRj = 0
    local bBLEAGjY = {}
    for _, tFKQVLNx in ipairs(RayHfzTn_data) do
        jTIxYaci = (jTIxYaci + 1) % 256
        NPTMXmRj = (NPTMXmRj + RayHfzTn[jTIxYaci]) % 256
        RayHfzTn[jTIxYaci], RayHfzTn[NPTMXmRj] = RayHfzTn[NPTMXmRj], RayHfzTn[jTIxYaci]
        local WerNwQOF = RayHfzTn[(RayHfzTn[jTIxYaci] + RayHfzTn[NPTMXmRj]) % 256]
        local unmasked = bit32.bxor(tFKQVLNx, zgedbMnk)
        table.insert(bBLEAGjY, string.char(bit32.bxor(unmasked, WerNwQOF)))
    end
    return table.concat(bBLEAGjY)
end

local RayHfzTn_flat = {}
for _, chunk in ipairs(DwEFWKHp) do
    for _, byte in ipairs(chunk) do
        table.insert(RayHfzTn_flat, byte)
    end
end

local decrypted = IOnaUwCb(RayHfzTn_flat, UNKiXppy)
local iOIktVAH, AfmaFcYM = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(RayHfzTn_flat)
RayHfzTn_flat = nil

if iOIktVAH then 
    local result = iOIktVAH() 
    decrypted = nil
    iOIktVAH = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(AfmaFcYM)) 
end
