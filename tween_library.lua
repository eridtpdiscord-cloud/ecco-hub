-- Protected Segment (tween_library)
local jMMfSrjX = 213
local FVHsdJiG = {
{224,50,101,29,57,39,197,209,176,155,17,196,234,38,70,84,7,187,3,65,47,74,108,25,48,48,120,152,4,143,23,227,190,104,96,246,161,169,141,78,164,187,71,181,91,174,36,152,238,44,110,2,50,94,244,219,247,98,13,250},{238,7,66,85,28,79,60,94,54,8,206,106,192,114,224,197,246,49,202,248,228,235,17,111,98,89,81,152,34,224,197,161,198,25,45,215,197,91,151,10,68,106,55,45,29,219,128,43,216,146,241,91,60,128,64,35,223,167,186,184},{194,170,205,32,200,33,185,238,24,81,80,196,124,178,175,147,121,158,9,27,255,58,98,64,249}
}
local kdFjSuJG = "lOoKPgDxAkACWMaa"

local function zZqsbaBz(plFrvLBi_data, plFrvLBi_key)
    if type(plFrvLBi_key) ~= "string" or #plFrvLBi_key == 0 then return "" end
    local plFrvLBi = {}
    for vbCAOvAa = 0, 255 do plFrvLBi[vbCAOvAa] = vbCAOvAa end
    local aDeOEqAp = 0
    for vbCAOvAa = 0, 255 do
        local pgHdLrTy = plFrvLBi_key:byte((vbCAOvAa % #plFrvLBi_key) + 1)
        aDeOEqAp = (aDeOEqAp + plFrvLBi[vbCAOvAa] + pgHdLrTy) % 256
        plFrvLBi[vbCAOvAa], plFrvLBi[aDeOEqAp] = plFrvLBi[aDeOEqAp], plFrvLBi[vbCAOvAa]
    end
    local vbCAOvAa = 0
    local aDeOEqAp = 0
    local zfAeJpKC = {}
    for _, CbYMmizD in ipairs(plFrvLBi_data) do
        vbCAOvAa = (vbCAOvAa + 1) % 256
        aDeOEqAp = (aDeOEqAp + plFrvLBi[vbCAOvAa]) % 256
        plFrvLBi[vbCAOvAa], plFrvLBi[aDeOEqAp] = plFrvLBi[aDeOEqAp], plFrvLBi[vbCAOvAa]
        local pgHdLrTy = plFrvLBi[(plFrvLBi[vbCAOvAa] + plFrvLBi[aDeOEqAp]) % 256]
        local unmasked = bit32.bxor(CbYMmizD, jMMfSrjX)
        table.insert(zfAeJpKC, string.char(bit32.bxor(unmasked, pgHdLrTy)))
    end
    return table.concat(zfAeJpKC)
end

local plFrvLBi_flat = {}
for _, chunk in ipairs(FVHsdJiG) do
    for _, byte in ipairs(chunk) do
        table.insert(plFrvLBi_flat, byte)
    end
end

local decrypted = zZqsbaBz(plFrvLBi_flat, kdFjSuJG)
local gPrgbgpz, VDiHDpkb = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(plFrvLBi_flat)
plFrvLBi_flat = nil

if gPrgbgpz then 
    local result = gPrgbgpz() 
    decrypted = nil
    gPrgbgpz = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(VDiHDpkb)) 
end
