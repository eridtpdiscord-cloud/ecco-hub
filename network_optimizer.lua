-- Protected Segment (network_optimizer)
local OOFhOJbK = 165
local YLGvuZcf = {
{12,254,118,221,254,128,128,90,175,204,223,6,60,185,173,244,189,199,139,194,77,40,198,181,152,113,239,201,249,111,3,127,215,207,219,242,68,217,117,94,38,76,229,197,55,100,250,184,175,9,75,151,60,251,24,155,15,207,62,30},{167,170,130,158,148,155,117,68,46,137,148,158,236,234,43,161,129,45,193,27,25,95,137,213,201,90,65,76,18,32,157,147,112,217,162,182,219,151,162,40,121,133,173,127,49,217,142,121,89,2,233,215,148,150,188,239,130,90,203,214},{236,201,54,45,76,241,76,217,60,159,111,37,61,3,179,224,129,123,148,121,47,19,51,69,79,215,200,96,198}
}
local jmardoEB = "jksXULujAuYbatkh"

local function ybWdFVlR(mAODrKhz_data, mAODrKhz_key)
    if type(mAODrKhz_key) ~= "string" or #mAODrKhz_key == 0 then return "" end
    local mAODrKhz = {}
    for olXUHmvf = 0, 255 do mAODrKhz[olXUHmvf] = olXUHmvf end
    local eLtdcOJa = 0
    for olXUHmvf = 0, 255 do
        local jueiLhNX = mAODrKhz_key:byte((olXUHmvf % #mAODrKhz_key) + 1)
        eLtdcOJa = (eLtdcOJa + mAODrKhz[olXUHmvf] + jueiLhNX) % 256
        mAODrKhz[olXUHmvf], mAODrKhz[eLtdcOJa] = mAODrKhz[eLtdcOJa], mAODrKhz[olXUHmvf]
    end
    local olXUHmvf = 0
    local eLtdcOJa = 0
    local TIxfNdZB = {}
    for _, VgXNOkKV in ipairs(mAODrKhz_data) do
        olXUHmvf = (olXUHmvf + 1) % 256
        eLtdcOJa = (eLtdcOJa + mAODrKhz[olXUHmvf]) % 256
        mAODrKhz[olXUHmvf], mAODrKhz[eLtdcOJa] = mAODrKhz[eLtdcOJa], mAODrKhz[olXUHmvf]
        local jueiLhNX = mAODrKhz[(mAODrKhz[olXUHmvf] + mAODrKhz[eLtdcOJa]) % 256]
        local unmasked = bit32.bxor(VgXNOkKV, OOFhOJbK)
        table.insert(TIxfNdZB, string.char(bit32.bxor(unmasked, jueiLhNX)))
    end
    return table.concat(TIxfNdZB)
end

local mAODrKhz_flat = {}
for _, chunk in ipairs(YLGvuZcf) do
    for _, byte in ipairs(chunk) do
        table.insert(mAODrKhz_flat, byte)
    end
end

local decrypted = ybWdFVlR(mAODrKhz_flat, jmardoEB)
local XEcRGcrP, nOOLdfRU = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(mAODrKhz_flat)
mAODrKhz_flat = nil

if XEcRGcrP then 
    local result = XEcRGcrP() 
    decrypted = nil
    XEcRGcrP = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(nOOLdfRU)) 
end
