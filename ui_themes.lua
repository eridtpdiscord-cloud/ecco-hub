-- Compiled secure segment
local AKvkikTd = {
{141,185,5,192,221,203,157,238,228,78,208,170,127,167,61,167,45,180,181,65,105,172,3,243,182,163,33,188,200,69,50,27,50,4,25,212,182,198,25,244,72,152,46,134,111,238,40,12,51,173,190,96,171,7,48,154,51,193,37,182},{145,104,67,164,127,240,11,110,80,67,120,213,35,97,42,100,194,106,176,71,21,138,172,237,69,166,85,147,183,94,64,241,102,156,232,138,87,224,157,150,231,46,115,217,100,47,69,185,114,49,219,41,174,162,135,32,231,117,128,250},{166,198,245,244,221,198,202,21,107,65,69,193,124,33,163,194,164,49,133,102,221}
}
local XgoFEPXL = "abxZOVjcAFbdowVV"

local function HeyUWuYe(TojxqiwZ_data, TojxqiwZ_key)
    local TojxqiwZ = {}
    for IplQCbxJ = 0, 255 do TojxqiwZ[IplQCbxJ] = IplQCbxJ end
    local sTGJLfDG = 0
    for IplQCbxJ = 0, 255 do
        local KfypSlLD = TojxqiwZ_key:byte((IplQCbxJ % #TojxqiwZ_key) + 1)
        sTGJLfDG = (sTGJLfDG + TojxqiwZ[IplQCbxJ] + KfypSlLD) % 256
        TojxqiwZ[IplQCbxJ], TojxqiwZ[sTGJLfDG] = TojxqiwZ[sTGJLfDG], TojxqiwZ[IplQCbxJ]
    end
    local IplQCbxJ = 0
    local sTGJLfDG = 0
    local CsAIgKoz = {}
    for _, vCNnXffS in ipairs(TojxqiwZ_data) do
        IplQCbxJ = (IplQCbxJ + 1) % 256
        sTGJLfDG = (sTGJLfDG + TojxqiwZ[IplQCbxJ]) % 256
        TojxqiwZ[IplQCbxJ], TojxqiwZ[sTGJLfDG] = TojxqiwZ[sTGJLfDG], TojxqiwZ[IplQCbxJ]
        local KfypSlLD = TojxqiwZ[(TojxqiwZ[IplQCbxJ] + TojxqiwZ[sTGJLfDG]) % 256]
        table.insert(CsAIgKoz, string.char(bit32.bxor(vCNnXffS, KfypSlLD)))
    end
    return table.concat(CsAIgKoz)
end

local TojxqiwZ_flat = {}
for _, chunk in ipairs(AKvkikTd) do
    for _, byte in ipairs(chunk) do
        table.insert(TojxqiwZ_flat, byte)
    end
end

local decrypted = HeyUWuYe(TojxqiwZ_flat, XgoFEPXL)
local TxFIOnvR, XUBffYed = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(TojxqiwZ_flat)
TojxqiwZ_flat = nil

if TxFIOnvR then 
    local result = TxFIOnvR() 
    decrypted = nil
    TxFIOnvR = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(XUBffYed)) 
end
