-- Protected Segment (teleport_handler)
local jXMcNAVo = 114
local RpmYaeIR = {
{178,129,124,196,92,17,24,188,242,82,14,140,5,42,235,52,181,46,224,173,231,178,151,119,97,82,142,244,181,49,68,51,134,165,203,162,88,220,148,59,71,114,170,195,35,144,194,91,255,97,63,74,200,176,215,37,183,223,105,176},{129,69,146,239,123,185,23,44,67,139,106,194,122,133,246,211,148,154,255,141,194,82,169,59,144,39,54,248,198,2,44,30,93,195,107,74,226,217,227,121,35,90,170,204,174,245,153,139,215,89,30,111,112,173,60,244,116,148,115,176},{79,158,48,18,113,215,39,66,244,200,116,102,114,99,105,122,10,126,175,120,7,28,196,38,81,128,102,13}
}
local plMUqOSF = "WemEPJEeIedEvONn"

local function ZpecQEFe(slEBMtOC_data, slEBMtOC_key)
    if type(slEBMtOC_key) ~= "string" or #slEBMtOC_key == 0 then return "" end
    local slEBMtOC = {}
    for tBSxGAfj = 0, 255 do slEBMtOC[tBSxGAfj] = tBSxGAfj end
    local rnFjbhHz = 0
    for tBSxGAfj = 0, 255 do
        local QOYcGMgM = slEBMtOC_key:byte((tBSxGAfj % #slEBMtOC_key) + 1)
        rnFjbhHz = (rnFjbhHz + slEBMtOC[tBSxGAfj] + QOYcGMgM) % 256
        slEBMtOC[tBSxGAfj], slEBMtOC[rnFjbhHz] = slEBMtOC[rnFjbhHz], slEBMtOC[tBSxGAfj]
    end
    local tBSxGAfj = 0
    local rnFjbhHz = 0
    local gcbWWoSn = {}
    for _, BgKdsimm in ipairs(slEBMtOC_data) do
        tBSxGAfj = (tBSxGAfj + 1) % 256
        rnFjbhHz = (rnFjbhHz + slEBMtOC[tBSxGAfj]) % 256
        slEBMtOC[tBSxGAfj], slEBMtOC[rnFjbhHz] = slEBMtOC[rnFjbhHz], slEBMtOC[tBSxGAfj]
        local QOYcGMgM = slEBMtOC[(slEBMtOC[tBSxGAfj] + slEBMtOC[rnFjbhHz]) % 256]
        local unmasked = bit32.bxor(BgKdsimm, jXMcNAVo)
        table.insert(gcbWWoSn, string.char(bit32.bxor(unmasked, QOYcGMgM)))
    end
    return table.concat(gcbWWoSn)
end

local slEBMtOC_flat = {}
for _, chunk in ipairs(RpmYaeIR) do
    for _, byte in ipairs(chunk) do
        table.insert(slEBMtOC_flat, byte)
    end
end

local decrypted = ZpecQEFe(slEBMtOC_flat, plMUqOSF)
local UObQurTk, XJxndzee = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(slEBMtOC_flat)
slEBMtOC_flat = nil

if UObQurTk then 
    local result = UObQurTk() 
    decrypted = nil
    UObQurTk = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(XJxndzee)) 
end
