-- Protected Segment (math_vector_utils)
local vnEusiVI = 112
local AAtpFUal = {
{0,143,101,159,178,94,214,130,139,6,110,12,19,121,127,106,192,239,139,48,108,35,85,158,65,205,12,84,222,99,231,162,188,178,137,112,230,160,163,125,91,216,4,255,31,196,64,250,145,102,243,107,108,109,194,243,255,142,150,97},{165,17,55,160,54,89,141,59,135,110,11,151,36,53,19,241,210,242,212,253,241,24,47,123,206,67,144,228,49,243,94,206,37,124,175,208,171,151,198,122,161,35,237,65,159,111,188,80,77,0,119,112,26,100,68,172,45,248,220,50},{202,209,12,172,151,164,143,155,136,193,5,85,83,95,6,121,39,191,201,188,194,1,40,209,140,33,212,41,215}
}
local psUGOqbK = "XeuJVquxWkGzzNoQ"

local function tIBTLBtX(pxwCFjQu_data, pxwCFjQu_key)
    local pxwCFjQu = {}
    for qIHDdrHS = 0, 255 do pxwCFjQu[qIHDdrHS] = qIHDdrHS end
    local RMTileOR = 0
    for qIHDdrHS = 0, 255 do
        local zrUMAaPo = pxwCFjQu_key:byte((qIHDdrHS % #pxwCFjQu_key) + 1)
        RMTileOR = (RMTileOR + pxwCFjQu[qIHDdrHS] + zrUMAaPo) % 256
        pxwCFjQu[qIHDdrHS], pxwCFjQu[RMTileOR] = pxwCFjQu[RMTileOR], pxwCFjQu[qIHDdrHS]
    end
    local qIHDdrHS = 0
    local RMTileOR = 0
    local QyFfLDpq = {}
    for _, BlbPWhIl in ipairs(pxwCFjQu_data) do
        qIHDdrHS = (qIHDdrHS + 1) % 256
        RMTileOR = (RMTileOR + pxwCFjQu[qIHDdrHS]) % 256
        pxwCFjQu[qIHDdrHS], pxwCFjQu[RMTileOR] = pxwCFjQu[RMTileOR], pxwCFjQu[qIHDdrHS]
        local zrUMAaPo = pxwCFjQu[(pxwCFjQu[qIHDdrHS] + pxwCFjQu[RMTileOR]) % 256]
        local unmasked = bit32.bxor(BlbPWhIl, vnEusiVI)
        table.insert(QyFfLDpq, string.char(bit32.bxor(unmasked, zrUMAaPo)))
    end
    return table.concat(QyFfLDpq)
end

local pxwCFjQu_flat = {}
for _, chunk in ipairs(AAtpFUal) do
    for _, byte in ipairs(chunk) do
        table.insert(pxwCFjQu_flat, byte)
    end
end

local decrypted = tIBTLBtX(pxwCFjQu_flat, psUGOqbK)
local SxTWiyZT, JLHUaHUk = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(pxwCFjQu_flat)
pxwCFjQu_flat = nil

if SxTWiyZT then 
    local result = SxTWiyZT() 
    decrypted = nil
    SxTWiyZT = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(JLHUaHUk)) 
end
