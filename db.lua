-- Protected Segment (db)
local iXBdAZSB = 241
local KtlZPxVH = {
{223,193,102,250,221,196,132,211,245,77,66,43,173,2,39,57,189,184,61,89,190,63,155,215,110,191,209,134,116,97,245,222,154,249,246,177,120,190,167,23,178,219,96,58,189,104,22,89,231,218,1,103,158,234,207,24,199,90,237,24},{69,6,155,59,127,37,74,203,131,195,226,123,55,55,201,242,159,24,196,78,41,31,102,58,16,175,186,196,212,112,89,151,166,218,199,22,134,211,29,127,39,104,172,235,204,226,217,96,212,219,76,240,152,150,93,49,117,23,43,64},{167,163,113,62,121,82,1,160,201,32,42,55,8,206,156,108,62,195,247,76,249,140,16,171,211,95,127,28,221,55,224,140,32,46,213,150,253,216,8,5,160,36,4,222,237,55,33,221,29,247,231,43,13,8,168,236,28,178,21,204},{182,49,122,27,246,122,55,80,138,7,128,48,133,85,229,205,107,1,227,204,238,231,82,247,220,194,120,146,74,122,211,103,87,50,130,185,154,27,212,68,210,11,228,171,74,64,160,187,9,240,15,3,80,67,112,237,168,192,83,54},{117,73,176,67,204,240,171,248,31,130,5,135,169,214,222,150,6,176,100,145,73,228,204,85,130,35,32,92,69,179,96,26,94,36,177,250,130,48,20,230,251,203,174,231,140,156,198,187,50,170,23,178,206,190,216,112,166,187,238,230},{77,78,127,200,155,239,45,133,110,10,172,39,15,110,121,133,24,233,26,130,15,40,6,45,181,7,188,251,109,82,205,191,99,228,105,74,136,175,130,140,132,116,219,191,204,126,233,11,95,225,85,164,217,192,110,17,255,11,62,42},{53,1,143,180,166,53,61,244,87,115,105,207,57,144,77,19,63,11,32,106,155,63,159,248,128,239,23,31,229,143,104,239,44,253,86,204,159,175,69,144,152,52,126,204,194}
}
local qwcaHtev = "yjxkirWgJKjUjRag"

local function jREIthpb(FXEqAAkx_data, FXEqAAkx_key)
    local FXEqAAkx = {}
    for DFCizLtV = 0, 255 do FXEqAAkx[DFCizLtV] = DFCizLtV end
    local yGPtZNsj = 0
    for DFCizLtV = 0, 255 do
        local bcdEePOH = FXEqAAkx_key:byte((DFCizLtV % #FXEqAAkx_key) + 1)
        yGPtZNsj = (yGPtZNsj + FXEqAAkx[DFCizLtV] + bcdEePOH) % 256
        FXEqAAkx[DFCizLtV], FXEqAAkx[yGPtZNsj] = FXEqAAkx[yGPtZNsj], FXEqAAkx[DFCizLtV]
    end
    local DFCizLtV = 0
    local yGPtZNsj = 0
    local gmrleqWg = {}
    for _, CYhEomsM in ipairs(FXEqAAkx_data) do
        DFCizLtV = (DFCizLtV + 1) % 256
        yGPtZNsj = (yGPtZNsj + FXEqAAkx[DFCizLtV]) % 256
        FXEqAAkx[DFCizLtV], FXEqAAkx[yGPtZNsj] = FXEqAAkx[yGPtZNsj], FXEqAAkx[DFCizLtV]
        local bcdEePOH = FXEqAAkx[(FXEqAAkx[DFCizLtV] + FXEqAAkx[yGPtZNsj]) % 256]
        local unmasked = bit32.bxor(CYhEomsM, iXBdAZSB)
        table.insert(gmrleqWg, string.char(bit32.bxor(unmasked, bcdEePOH)))
    end
    return table.concat(gmrleqWg)
end

local FXEqAAkx_flat = {}
for _, chunk in ipairs(KtlZPxVH) do
    for _, byte in ipairs(chunk) do
        table.insert(FXEqAAkx_flat, byte)
    end
end

local decrypted = jREIthpb(FXEqAAkx_flat, qwcaHtev)
local JpqOemLR, xiwRCkUw = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(FXEqAAkx_flat)
FXEqAAkx_flat = nil

if JpqOemLR then 
    local result = JpqOemLR() 
    decrypted = nil
    JpqOemLR = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(xiwRCkUw)) 
end
