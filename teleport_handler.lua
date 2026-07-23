-- Protected Segment (teleport_handler)
local QQomjBoP = 89
local bODvqNCf = {
{94,242,45,86,138,163,99,129,123,108,143,177,250,156,119,116,152,50,162,129,29,54,112,232,244,219,168,157,60,254,96,99,5,84,77,235,216,26,138,59,149,166,254,215,42,9,190,61,146,16,201,172,169,191,199,165,43,133,15,202},{19,243,244,91,86,191,123,18,205,61,87,64,206,29,10,35,93,85,222,226,96,200,204,195,214,201,204,7,10,23,16,158,194,244,84,34,143,145,246,243,65,92,144,147,198,105,139,168,239,7,182,150,93,229,110,247,197,49,209,175},{191,185,130,228,107,168,156,180,79,245,197,152,37,218,215,122,78,237,54,154,209,222,239,224,187,69,86,141}
}
local FAVjTsPs = "CRktDchGjgfnHtoG"

local function voBmlMpp(YsYOqrPW_data, YsYOqrPW_key)
    if type(YsYOqrPW_key) ~= "string" or #YsYOqrPW_key == 0 then return "" end
    local YsYOqrPW = {}
    for DLJhQZvA = 0, 255 do YsYOqrPW[DLJhQZvA] = DLJhQZvA end
    local IFJXmzcA = 0
    for DLJhQZvA = 0, 255 do
        local zKCfSlEt = YsYOqrPW_key:byte((DLJhQZvA % #YsYOqrPW_key) + 1)
        IFJXmzcA = (IFJXmzcA + YsYOqrPW[DLJhQZvA] + zKCfSlEt) % 256
        YsYOqrPW[DLJhQZvA], YsYOqrPW[IFJXmzcA] = YsYOqrPW[IFJXmzcA], YsYOqrPW[DLJhQZvA]
    end
    local DLJhQZvA = 0
    local IFJXmzcA = 0
    local pjUHsRbE = {}
    for _, KFxqgyiD in ipairs(YsYOqrPW_data) do
        DLJhQZvA = (DLJhQZvA + 1) % 256
        IFJXmzcA = (IFJXmzcA + YsYOqrPW[DLJhQZvA]) % 256
        YsYOqrPW[DLJhQZvA], YsYOqrPW[IFJXmzcA] = YsYOqrPW[IFJXmzcA], YsYOqrPW[DLJhQZvA]
        local zKCfSlEt = YsYOqrPW[(YsYOqrPW[DLJhQZvA] + YsYOqrPW[IFJXmzcA]) % 256]
        local unmasked = bit32.bxor(KFxqgyiD, QQomjBoP)
        table.insert(pjUHsRbE, string.char(bit32.bxor(unmasked, zKCfSlEt)))
    end
    return table.concat(pjUHsRbE)
end

local YsYOqrPW_flat = {}
for _, chunk in ipairs(bODvqNCf) do
    for _, byte in ipairs(chunk) do
        table.insert(YsYOqrPW_flat, byte)
    end
end

local decrypted = voBmlMpp(YsYOqrPW_flat, FAVjTsPs)
local FKDFqJbU, jeBiZYet = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(YsYOqrPW_flat)
YsYOqrPW_flat = nil

if FKDFqJbU then 
    local result = FKDFqJbU() 
    decrypted = nil
    FKDFqJbU = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(jeBiZYet)) 
end
