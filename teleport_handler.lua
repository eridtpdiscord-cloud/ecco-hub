-- Protected Segment (teleport_handler)
local kKxRaoFS = 60
local aNdMAyVD = {
{61,107,64,190,76,168,212,216,91,87,26,149,233,196,67,141,121,23,55,132,147,53,20,154,31,152,155,11,88,176,239,252,11,209,121,170,13,200,155,143,79,133,201,182,159,148,146,102,108,82,130,190,226,176,17,201,11,165,167,43},{252,64,58,248,145,117,110,59,67,170,119,7,147,28,120,187,81,47,164,6,19,12,83,35,138,46,158,119,131,110,238,227,128,188,123,45,171,168,144,198,58,253,28,99,72,5,244,246,76,0,84,226,21,197,58,109,196,110,213,172},{74,161,49,67,119,60,246,189,8,31,64,131,237,14,177,179,36,55,95,97,71,119,171,56,255,161,252,70}
}
local WfsRAAoW = "TRgMKWqwkyAKCFFL"

local function TfTRWmrM(FinFesJj_data, FinFesJj_key)
    if type(FinFesJj_key) ~= "string" or #FinFesJj_key == 0 then return "" end
    local FinFesJj = {}
    for xcWajBFN = 0, 255 do FinFesJj[xcWajBFN] = xcWajBFN end
    local YtSeZRRk = 0
    for xcWajBFN = 0, 255 do
        local DXRUGuus = FinFesJj_key:byte((xcWajBFN % #FinFesJj_key) + 1)
        YtSeZRRk = (YtSeZRRk + FinFesJj[xcWajBFN] + DXRUGuus) % 256
        FinFesJj[xcWajBFN], FinFesJj[YtSeZRRk] = FinFesJj[YtSeZRRk], FinFesJj[xcWajBFN]
    end
    local xcWajBFN = 0
    local YtSeZRRk = 0
    local LZNzzMRZ = {}
    for _, CKeMJBWq in ipairs(FinFesJj_data) do
        xcWajBFN = (xcWajBFN + 1) % 256
        YtSeZRRk = (YtSeZRRk + FinFesJj[xcWajBFN]) % 256
        FinFesJj[xcWajBFN], FinFesJj[YtSeZRRk] = FinFesJj[YtSeZRRk], FinFesJj[xcWajBFN]
        local DXRUGuus = FinFesJj[(FinFesJj[xcWajBFN] + FinFesJj[YtSeZRRk]) % 256]
        local unmasked = bit32.bxor(CKeMJBWq, kKxRaoFS)
        table.insert(LZNzzMRZ, string.char(bit32.bxor(unmasked, DXRUGuus)))
    end
    return table.concat(LZNzzMRZ)
end

local FinFesJj_flat = {}
for _, chunk in ipairs(aNdMAyVD) do
    for _, byte in ipairs(chunk) do
        table.insert(FinFesJj_flat, byte)
    end
end

local decrypted = TfTRWmrM(FinFesJj_flat, WfsRAAoW)
local DQEZvinV, mvAsMaHm = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(FinFesJj_flat)
FinFesJj_flat = nil

if DQEZvinV then 
    local result = DQEZvinV() 
    decrypted = nil
    DQEZvinV = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(mvAsMaHm)) 
end
