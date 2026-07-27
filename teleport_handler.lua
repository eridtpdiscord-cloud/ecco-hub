-- Protected Segment (teleport_handler)
local bnsczhHY = 60
local gfyrtbqW = {
{140,149,57,175,124,66,68,238,116,47,233,211,161,81,6,84,255,107,117,118,93,70,179,158,189,26,172,7,138,116,137,64,168,17,104,112,239,229,216,61,242,200,50,168,213,35,4,83,97,62,228,120,153,38,164,0,62,235,127,230},{143,237,168,86,103,90,16,73,67,14,117,222,42,7,50,51,209,188,44,196,110,217,34,9,184,196,232,164,59,78,181,52,54,11,85,70,120,25,160,119,172,181,120,130,68,117,57,251,15,225,68,169,81,102,127,143,54,150,120,99},{188,240,54,178,10,107,195,159,69,243,113,80,108,57,200,206,60,213,1,130,92,243,43,216,99,89,28,186}
}
local EIPKWApC = "TTAwEMCNQinogXek"

local function OTdsDedS(InKgjPCC_data, InKgjPCC_key)
    if type(InKgjPCC_key) ~= "string" or #InKgjPCC_key == 0 then return "" end
    local InKgjPCC = {}
    for YjHnDmMi = 0, 255 do InKgjPCC[YjHnDmMi] = YjHnDmMi end
    local DhPudYIh = 0
    for YjHnDmMi = 0, 255 do
        local HiXxybFD = InKgjPCC_key:byte((YjHnDmMi % #InKgjPCC_key) + 1)
        DhPudYIh = (DhPudYIh + InKgjPCC[YjHnDmMi] + HiXxybFD) % 256
        InKgjPCC[YjHnDmMi], InKgjPCC[DhPudYIh] = InKgjPCC[DhPudYIh], InKgjPCC[YjHnDmMi]
    end
    local YjHnDmMi = 0
    local DhPudYIh = 0
    local QbsrejMJ = {}
    for _, cMBcnKOm in ipairs(InKgjPCC_data) do
        YjHnDmMi = (YjHnDmMi + 1) % 256
        DhPudYIh = (DhPudYIh + InKgjPCC[YjHnDmMi]) % 256
        InKgjPCC[YjHnDmMi], InKgjPCC[DhPudYIh] = InKgjPCC[DhPudYIh], InKgjPCC[YjHnDmMi]
        local HiXxybFD = InKgjPCC[(InKgjPCC[YjHnDmMi] + InKgjPCC[DhPudYIh]) % 256]
        local unmasked = bit32.bxor(cMBcnKOm, bnsczhHY)
        table.insert(QbsrejMJ, string.char(bit32.bxor(unmasked, HiXxybFD)))
    end
    return table.concat(QbsrejMJ)
end

local InKgjPCC_flat = {}
for _, chunk in ipairs(gfyrtbqW) do
    for _, byte in ipairs(chunk) do
        table.insert(InKgjPCC_flat, byte)
    end
end

local decrypted = OTdsDedS(InKgjPCC_flat, EIPKWApC)
local zCunOsyD, zthjPUef = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(InKgjPCC_flat)
InKgjPCC_flat = nil

if zCunOsyD then 
    local result = zCunOsyD() 
    decrypted = nil
    zCunOsyD = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(zthjPUef)) 
end
