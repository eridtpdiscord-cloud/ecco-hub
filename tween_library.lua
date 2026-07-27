-- Protected Segment (tween_library)
local RpqpbGOT = 61
local tMmiLgZy = {
{78,234,116,70,6,106,239,112,217,51,236,24,181,217,135,197,209,223,235,3,1,23,115,7,51,91,24,31,127,107,32,129,164,236,144,244,95,54,176,60,203,30,92,225,7,34,189,24,49,58,88,191,214,21,45,182,106,31,249,145},{132,150,55,208,158,128,47,46,246,231,252,238,63,185,87,65,193,95,101,178,188,209,250,128,152,241,10,166,40,158,197,21,194,44,24,54,66,230,180,110,73,47,48,149,233,136,120,177,211,83,54,3,20,184,150,46,93,117,153,180},{154,101,30,131,96,174,224,189,43,185,172,104,77,7,82,79,248,235,76,28,144,147,241,198,99}
}
local YLOtcnsf = "DIPPVyMsbFcXCnsx"

local function ZjdzTbzG(ZNeedNlu_data, ZNeedNlu_key)
    if type(ZNeedNlu_key) ~= "string" or #ZNeedNlu_key == 0 then return "" end
    local ZNeedNlu = {}
    for htEzNwic = 0, 255 do ZNeedNlu[htEzNwic] = htEzNwic end
    local DGkggBBs = 0
    for htEzNwic = 0, 255 do
        local mhYcogxo = ZNeedNlu_key:byte((htEzNwic % #ZNeedNlu_key) + 1)
        DGkggBBs = (DGkggBBs + ZNeedNlu[htEzNwic] + mhYcogxo) % 256
        ZNeedNlu[htEzNwic], ZNeedNlu[DGkggBBs] = ZNeedNlu[DGkggBBs], ZNeedNlu[htEzNwic]
    end
    local htEzNwic = 0
    local DGkggBBs = 0
    local epZyBSXw = {}
    for _, flFSnMbF in ipairs(ZNeedNlu_data) do
        htEzNwic = (htEzNwic + 1) % 256
        DGkggBBs = (DGkggBBs + ZNeedNlu[htEzNwic]) % 256
        ZNeedNlu[htEzNwic], ZNeedNlu[DGkggBBs] = ZNeedNlu[DGkggBBs], ZNeedNlu[htEzNwic]
        local mhYcogxo = ZNeedNlu[(ZNeedNlu[htEzNwic] + ZNeedNlu[DGkggBBs]) % 256]
        local unmasked = bit32.bxor(flFSnMbF, RpqpbGOT)
        table.insert(epZyBSXw, string.char(bit32.bxor(unmasked, mhYcogxo)))
    end
    return table.concat(epZyBSXw)
end

local ZNeedNlu_flat = {}
for _, chunk in ipairs(tMmiLgZy) do
    for _, byte in ipairs(chunk) do
        table.insert(ZNeedNlu_flat, byte)
    end
end

local decrypted = ZjdzTbzG(ZNeedNlu_flat, YLOtcnsf)
local RiEpntdf, GWfJQXGC = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ZNeedNlu_flat)
ZNeedNlu_flat = nil

if RiEpntdf then 
    local result = RiEpntdf() 
    decrypted = nil
    RiEpntdf = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(GWfJQXGC)) 
end
