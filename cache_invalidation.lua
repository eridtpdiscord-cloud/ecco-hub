-- Protected Segment (cache_invalidation)
local dpfIxAIc = 180
local zkGldBCh = {
{129,217,217,34,6,78,16,58,185,188,209,150,228,166,91,178,41,226,210,69,165,213,104,8,203,89,33,102,243,178,140,179,182,201,0,67,20,108,91,168,20,5,60,52,198,80,123,31,100,252,56,24,151,116,68,8,139,175,162,213},{104,240,140,94,28,181,45,206,62,197,87,56,99,190,32,55,225,118,66,50,226,222,229,235,178,22,184,207,105,228,136,245,248,165,8,248,155,28,172,200,54,238,226,101,213,218,80,6,115,125,79,0,177,2,145,76,43,105,26,72},{84,100,220,234,110,218,83,178,17,241,139,83,75,105,44,66,185,109,152,135,169,26,41,130,5,235,236,89,153,212}
}
local KefeDTzN = "iazKFWAScZYEHzDu"

local function TuTkkKtQ(oNLpIkGL_data, oNLpIkGL_key)
    if type(oNLpIkGL_key) ~= "string" or #oNLpIkGL_key == 0 then return "" end
    local oNLpIkGL = {}
    for PStZvxyU = 0, 255 do oNLpIkGL[PStZvxyU] = PStZvxyU end
    local DjkRCYJi = 0
    for PStZvxyU = 0, 255 do
        local jnnKuTmC = oNLpIkGL_key:byte((PStZvxyU % #oNLpIkGL_key) + 1)
        DjkRCYJi = (DjkRCYJi + oNLpIkGL[PStZvxyU] + jnnKuTmC) % 256
        oNLpIkGL[PStZvxyU], oNLpIkGL[DjkRCYJi] = oNLpIkGL[DjkRCYJi], oNLpIkGL[PStZvxyU]
    end
    local PStZvxyU = 0
    local DjkRCYJi = 0
    local LROxDzqZ = {}
    for _, sobxGZWL in ipairs(oNLpIkGL_data) do
        PStZvxyU = (PStZvxyU + 1) % 256
        DjkRCYJi = (DjkRCYJi + oNLpIkGL[PStZvxyU]) % 256
        oNLpIkGL[PStZvxyU], oNLpIkGL[DjkRCYJi] = oNLpIkGL[DjkRCYJi], oNLpIkGL[PStZvxyU]
        local jnnKuTmC = oNLpIkGL[(oNLpIkGL[PStZvxyU] + oNLpIkGL[DjkRCYJi]) % 256]
        local unmasked = bit32.bxor(sobxGZWL, dpfIxAIc)
        table.insert(LROxDzqZ, string.char(bit32.bxor(unmasked, jnnKuTmC)))
    end
    return table.concat(LROxDzqZ)
end

local oNLpIkGL_flat = {}
for _, chunk in ipairs(zkGldBCh) do
    for _, byte in ipairs(chunk) do
        table.insert(oNLpIkGL_flat, byte)
    end
end

local decrypted = TuTkkKtQ(oNLpIkGL_flat, KefeDTzN)
local RaroytuK, mQFetYYn = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(oNLpIkGL_flat)
oNLpIkGL_flat = nil

if RaroytuK then 
    local result = RaroytuK() 
    decrypted = nil
    RaroytuK = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(mQFetYYn)) 
end
