-- Protected Segment (tween_library)
local nibTDcys = 162
local jiMdfXlO = {
{117,98,90,4,108,28,80,20,159,157,228,231,111,179,23,28,153,255,169,22,242,77,174,133,44,210,187,56,194,80,202,55,163,127,11,146,160,247,87,151,191,229,184,8,139,190,2,161,2,232,143,41,120,162,203,185,97,236,190,12},{224,188,51,74,107,154,25,164,43,235,71,26,170,98,163,61,201,53,85,230,47,181,181,98,227,177,91,10,189,132,168,122,16,136,64,219,81,74,187,105,48,107,117,112,113,180,83,250,34,232,227,216,49,90,195,83,55,91,75,238},{73,101,36,180,211,226,46,28,165,103,169,124,89,118,53,166,146,240,53,37,30,235,246,117,70}
}
local ZXQYqohm = "dsLlrRkmKQjnCPnx"

local function OkbsNuQU(NSqycGrr_data, NSqycGrr_key)
    local NSqycGrr = {}
    for fDLAksuF = 0, 255 do NSqycGrr[fDLAksuF] = fDLAksuF end
    local yXOItLOJ = 0
    for fDLAksuF = 0, 255 do
        local QKLMUScZ = NSqycGrr_key:byte((fDLAksuF % #NSqycGrr_key) + 1)
        yXOItLOJ = (yXOItLOJ + NSqycGrr[fDLAksuF] + QKLMUScZ) % 256
        NSqycGrr[fDLAksuF], NSqycGrr[yXOItLOJ] = NSqycGrr[yXOItLOJ], NSqycGrr[fDLAksuF]
    end
    local fDLAksuF = 0
    local yXOItLOJ = 0
    local rawZhHjw = {}
    for _, yQpiBQTm in ipairs(NSqycGrr_data) do
        fDLAksuF = (fDLAksuF + 1) % 256
        yXOItLOJ = (yXOItLOJ + NSqycGrr[fDLAksuF]) % 256
        NSqycGrr[fDLAksuF], NSqycGrr[yXOItLOJ] = NSqycGrr[yXOItLOJ], NSqycGrr[fDLAksuF]
        local QKLMUScZ = NSqycGrr[(NSqycGrr[fDLAksuF] + NSqycGrr[yXOItLOJ]) % 256]
        local unmasked = bit32.bxor(yQpiBQTm, nibTDcys)
        table.insert(rawZhHjw, string.char(bit32.bxor(unmasked, QKLMUScZ)))
    end
    return table.concat(rawZhHjw)
end

local NSqycGrr_flat = {}
for _, chunk in ipairs(jiMdfXlO) do
    for _, byte in ipairs(chunk) do
        table.insert(NSqycGrr_flat, byte)
    end
end

local decrypted = OkbsNuQU(NSqycGrr_flat, ZXQYqohm)
local BhWTGNOe, SbQBTcFJ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(NSqycGrr_flat)
NSqycGrr_flat = nil

if BhWTGNOe then 
    local result = BhWTGNOe() 
    decrypted = nil
    BhWTGNOe = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(SbQBTcFJ)) 
end
