-- Protected Segment (ui_themes)
local LpQriUIJ = 171
local bvhgWRcr = {
{116,154,24,108,0,253,62,19,108,157,100,192,211,73,76,173,151,97,186,166,237,36,139,196,216,87,115,218,197,179,145,67,220,222,174,147,144,29,65,169,176,1,226,68,86,99,164,234,249,209,240,220,35,81,228,144,85,120,107,250},{16,31,180,191,61,34,137,139,82,170,89,67,23,148,127,77,180,126,56,156,37,216,188,131,4,161,203,101,61,237,205,126,107,71,69,154,8,200,189,46,119,158,172,191,51,222,230,100,188,136,96,66,95,199,170,108,238,98,89,238},{167,126,78,97,182,75,147,249,68,46,208,160,63,177,155,196,234,222,176,25,206}
}
local wYgdqzIc = "batjBwzLPYawlgeF"

local function kbCpvBIF(FdqXDdQz_data, FdqXDdQz_key)
    local FdqXDdQz = {}
    for vfeixIAa = 0, 255 do FdqXDdQz[vfeixIAa] = vfeixIAa end
    local gGYOVpyd = 0
    for vfeixIAa = 0, 255 do
        local iiPAPCga = FdqXDdQz_key:byte((vfeixIAa % #FdqXDdQz_key) + 1)
        gGYOVpyd = (gGYOVpyd + FdqXDdQz[vfeixIAa] + iiPAPCga) % 256
        FdqXDdQz[vfeixIAa], FdqXDdQz[gGYOVpyd] = FdqXDdQz[gGYOVpyd], FdqXDdQz[vfeixIAa]
    end
    local vfeixIAa = 0
    local gGYOVpyd = 0
    local hHEJLZMN = {}
    for _, EOpmwgbR in ipairs(FdqXDdQz_data) do
        vfeixIAa = (vfeixIAa + 1) % 256
        gGYOVpyd = (gGYOVpyd + FdqXDdQz[vfeixIAa]) % 256
        FdqXDdQz[vfeixIAa], FdqXDdQz[gGYOVpyd] = FdqXDdQz[gGYOVpyd], FdqXDdQz[vfeixIAa]
        local iiPAPCga = FdqXDdQz[(FdqXDdQz[vfeixIAa] + FdqXDdQz[gGYOVpyd]) % 256]
        local unmasked = bit32.bxor(EOpmwgbR, LpQriUIJ)
        table.insert(hHEJLZMN, string.char(bit32.bxor(unmasked, iiPAPCga)))
    end
    return table.concat(hHEJLZMN)
end

local FdqXDdQz_flat = {}
for _, chunk in ipairs(bvhgWRcr) do
    for _, byte in ipairs(chunk) do
        table.insert(FdqXDdQz_flat, byte)
    end
end

local decrypted = kbCpvBIF(FdqXDdQz_flat, wYgdqzIc)
local JuGGIYCs, ppJePvxY = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(FdqXDdQz_flat)
FdqXDdQz_flat = nil

if JuGGIYCs then 
    local result = JuGGIYCs() 
    decrypted = nil
    JuGGIYCs = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(ppJePvxY)) 
end
