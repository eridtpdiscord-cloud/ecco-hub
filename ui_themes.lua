-- Compiled secure segment
local hAMzjshW = {
{224,210,84,243,220,142,101,132,120,233,16,134,54,201,223,27,252,222,150,238,40,185,97,186,71,230,58,232,203,131,94,12,186,247,130,67,238,15,116,54,178,136,239,144,83,146,232,10,226,176,250,54,145,83,0,59,29,165,73,96},{5,165,244,228,197,212,222,20,173,203,96,219,107,172,46,220,198,91,196,108,7,74,119,250,252,50,123,120,58,180,120,243,194,85,194,35,249,133,181,239,210,148,5,219,155,66,7,65,229,160,123,226,209,74,131,72,213,43,138,100},{65,198,210,76,69,105,182,107,147,80,123,26,29,128,199,159,174,116,93,31,164}
}
local lOOgIVVA = "NgEGoSkWnIlItpby"

local function GMEArtBp(RMtMfUrj_data, RMtMfUrj_key)
    local RMtMfUrj = {}
    for KdbmglzT = 0, 255 do RMtMfUrj[KdbmglzT] = KdbmglzT end
    local VzPzVhTZ = 0
    for KdbmglzT = 0, 255 do
        local XEFLcKli = RMtMfUrj_key:byte((KdbmglzT % #RMtMfUrj_key) + 1)
        VzPzVhTZ = (VzPzVhTZ + RMtMfUrj[KdbmglzT] + XEFLcKli) % 256
        RMtMfUrj[KdbmglzT], RMtMfUrj[VzPzVhTZ] = RMtMfUrj[VzPzVhTZ], RMtMfUrj[KdbmglzT]
    end
    local KdbmglzT = 0
    local VzPzVhTZ = 0
    local DZFqmzPY = {}
    for _, DYKqiyKK in ipairs(RMtMfUrj_data) do
        KdbmglzT = (KdbmglzT + 1) % 256
        VzPzVhTZ = (VzPzVhTZ + RMtMfUrj[KdbmglzT]) % 256
        RMtMfUrj[KdbmglzT], RMtMfUrj[VzPzVhTZ] = RMtMfUrj[VzPzVhTZ], RMtMfUrj[KdbmglzT]
        local XEFLcKli = RMtMfUrj[(RMtMfUrj[KdbmglzT] + RMtMfUrj[VzPzVhTZ]) % 256]
        table.insert(DZFqmzPY, string.char(bit32.bxor(DYKqiyKK, XEFLcKli)))
    end
    return table.concat(DZFqmzPY)
end

local RMtMfUrj_flat = {}
for _, chunk in ipairs(hAMzjshW) do
    for _, byte in ipairs(chunk) do
        table.insert(RMtMfUrj_flat, byte)
    end
end

local decrypted = GMEArtBp(RMtMfUrj_flat, lOOgIVVA)
local wOqtYvHT, MTBKxfVr = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(RMtMfUrj_flat)
RMtMfUrj_flat = nil

if wOqtYvHT then 
    local result = wOqtYvHT() 
    decrypted = nil
    wOqtYvHT = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(MTBKxfVr)) 
end
