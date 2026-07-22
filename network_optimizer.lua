-- Protected Segment (network_optimizer)
local cReytOXy = 132
local IQmlWGMm = {
{42,143,19,227,82,201,189,158,164,168,141,164,45,32,195,200,208,2,29,253,248,189,160,64,21,237,245,87,67,209,62,130,129,116,236,190,188,65,67,243,240,34,208,4,187,158,186,196,131,16,233,123,114,6,33,201,106,89,51,74},{97,190,40,168,224,128,201,10,74,193,189,52,130,224,80,28,181,239,63,122,209,105,200,52,48,28,56,12,114,37,43,170,189,210,90,206,154,65,56,194,187,208,85,253,216,161,29,0,77,255,191,207,187,52,24,146,18,221,34,123},{87,232,48,7,137,211,18,236,185,251,37,224,207,4,88,237,29,31,199,206,235,134,40,164,88,30,174,22,80}
}
local PibsXGlL = "cMdDXaSvHJXHxHqT"

local function LVlyBrWY(bwOSJXsp_data, bwOSJXsp_key)
    local bwOSJXsp = {}
    for GwbNDBhs = 0, 255 do bwOSJXsp[GwbNDBhs] = GwbNDBhs end
    local REridBhC = 0
    for GwbNDBhs = 0, 255 do
        local VXdPLhEa = bwOSJXsp_key:byte((GwbNDBhs % #bwOSJXsp_key) + 1)
        REridBhC = (REridBhC + bwOSJXsp[GwbNDBhs] + VXdPLhEa) % 256
        bwOSJXsp[GwbNDBhs], bwOSJXsp[REridBhC] = bwOSJXsp[REridBhC], bwOSJXsp[GwbNDBhs]
    end
    local GwbNDBhs = 0
    local REridBhC = 0
    local FEwPFrfz = {}
    for _, xWTrMcWs in ipairs(bwOSJXsp_data) do
        GwbNDBhs = (GwbNDBhs + 1) % 256
        REridBhC = (REridBhC + bwOSJXsp[GwbNDBhs]) % 256
        bwOSJXsp[GwbNDBhs], bwOSJXsp[REridBhC] = bwOSJXsp[REridBhC], bwOSJXsp[GwbNDBhs]
        local VXdPLhEa = bwOSJXsp[(bwOSJXsp[GwbNDBhs] + bwOSJXsp[REridBhC]) % 256]
        local unmasked = bit32.bxor(xWTrMcWs, cReytOXy)
        table.insert(FEwPFrfz, string.char(bit32.bxor(unmasked, VXdPLhEa)))
    end
    return table.concat(FEwPFrfz)
end

local bwOSJXsp_flat = {}
for _, chunk in ipairs(IQmlWGMm) do
    for _, byte in ipairs(chunk) do
        table.insert(bwOSJXsp_flat, byte)
    end
end

local decrypted = LVlyBrWY(bwOSJXsp_flat, PibsXGlL)
local kgghckVq, gLZVfUlW = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(bwOSJXsp_flat)
bwOSJXsp_flat = nil

if kgghckVq then 
    local result = kgghckVq() 
    decrypted = nil
    kgghckVq = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(gLZVfUlW)) 
end
