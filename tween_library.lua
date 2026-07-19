-- Compiled secure segment
local EUeKHAvz = {
{99,55,57,224,114,56,154,7,63,188,67,190,15,57,190,106,222,18,5,196,161,8,96,178,72,131,239,187,160,78,34,104,43,65,219,220,124,44,220,253,225,18,124,97,79,108,189,130,0,6,110,35,28,185,163,78,175,125,190,49},{210,45,217,240,175,210,23,83,131,246,111,56,96,134,28,245,76,26,45,10,95,12,115,93,146,72,83,13,102,220,244,110,218,76,111,15,28,37,248,2,196,49,0,61,173,52,72,86,51,100,6,184,45,85,60,127,156,250,246,199},{95,211,22,29,139,10,95,252,195,108,125,236,86,154,223,230,18,93,64,85,76,63,203,67,241}
}
local uXFmwcnF = "ixaIngDtrFOQzYPU"

local function UxLZZYTN(VzVeUWZP_data, VzVeUWZP_key)
    local VzVeUWZP = {}
    for iRORttcP = 0, 255 do VzVeUWZP[iRORttcP] = iRORttcP end
    local RUdRvaUP = 0
    for iRORttcP = 0, 255 do
        local dYbnXFhb = VzVeUWZP_key:byte((iRORttcP % #VzVeUWZP_key) + 1)
        RUdRvaUP = (RUdRvaUP + VzVeUWZP[iRORttcP] + dYbnXFhb) % 256
        VzVeUWZP[iRORttcP], VzVeUWZP[RUdRvaUP] = VzVeUWZP[RUdRvaUP], VzVeUWZP[iRORttcP]
    end
    local iRORttcP = 0
    local RUdRvaUP = 0
    local vkDucSuj = {}
    for _, XzTMUmbD in ipairs(VzVeUWZP_data) do
        iRORttcP = (iRORttcP + 1) % 256
        RUdRvaUP = (RUdRvaUP + VzVeUWZP[iRORttcP]) % 256
        VzVeUWZP[iRORttcP], VzVeUWZP[RUdRvaUP] = VzVeUWZP[RUdRvaUP], VzVeUWZP[iRORttcP]
        local dYbnXFhb = VzVeUWZP[(VzVeUWZP[iRORttcP] + VzVeUWZP[RUdRvaUP]) % 256]
        table.insert(vkDucSuj, string.char(bit32.bxor(XzTMUmbD, dYbnXFhb)))
    end
    return table.concat(vkDucSuj)
end

local VzVeUWZP_flat = {}
for _, chunk in ipairs(EUeKHAvz) do
    for _, byte in ipairs(chunk) do
        table.insert(VzVeUWZP_flat, byte)
    end
end

local decrypted = UxLZZYTN(VzVeUWZP_flat, uXFmwcnF)
local URGeUOfn, TVYrmVbz = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(VzVeUWZP_flat)
VzVeUWZP_flat = nil

if URGeUOfn then 
    local result = URGeUOfn() 
    decrypted = nil
    URGeUOfn = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(TVYrmVbz)) 
end
