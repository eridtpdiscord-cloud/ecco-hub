-- Compiled secure segment
local KttUGLXH = {
{60,160,60,146,216,167,39,51,78,97,247,32,182,155,72,27,228,214,63,55,154,131,122,226,227,197,119,56,142,192,208,86,44,179,63,45,43,177,204,41,36,103,6,11,108,145,173,251,191,14,164,112,83,100,226,78,143,48,200,181},{124,158,75,66,112,21,68,250,157,195,220,221,90,69,23,127,235,232,246,105,103,61,57,227,95,191,79,65,154,160,238,49,176,82,71,200,153,185,171,209,219,98,210,133,209,194,173,68,255,175,87,156,28,203,66,246,87,241,218,192},{255,51,190,182,170,227,110,78,10,168,233,108,224,242,57,30,166,50,217,171,194,56,209,5,118,197,255,150,203}
}
local VzcHViQl = "AAjYezFngYJdGWIj"

local function LiyOrYsv(ceiWYlDx_data, ceiWYlDx_key)
    local ceiWYlDx = {}
    for bQTyoZXY = 0, 255 do ceiWYlDx[bQTyoZXY] = bQTyoZXY end
    local JQZiapIs = 0
    for bQTyoZXY = 0, 255 do
        local AEVRvUOO = ceiWYlDx_key:byte((bQTyoZXY % #ceiWYlDx_key) + 1)
        JQZiapIs = (JQZiapIs + ceiWYlDx[bQTyoZXY] + AEVRvUOO) % 256
        ceiWYlDx[bQTyoZXY], ceiWYlDx[JQZiapIs] = ceiWYlDx[JQZiapIs], ceiWYlDx[bQTyoZXY]
    end
    local bQTyoZXY = 0
    local JQZiapIs = 0
    local IaxeAECM = {}
    for _, zXpsjvPY in ipairs(ceiWYlDx_data) do
        bQTyoZXY = (bQTyoZXY + 1) % 256
        JQZiapIs = (JQZiapIs + ceiWYlDx[bQTyoZXY]) % 256
        ceiWYlDx[bQTyoZXY], ceiWYlDx[JQZiapIs] = ceiWYlDx[JQZiapIs], ceiWYlDx[bQTyoZXY]
        local AEVRvUOO = ceiWYlDx[(ceiWYlDx[bQTyoZXY] + ceiWYlDx[JQZiapIs]) % 256]
        table.insert(IaxeAECM, string.char(bit32.bxor(zXpsjvPY, AEVRvUOO)))
    end
    return table.concat(IaxeAECM)
end

local ceiWYlDx_flat = {}
for _, chunk in ipairs(KttUGLXH) do
    for _, byte in ipairs(chunk) do
        table.insert(ceiWYlDx_flat, byte)
    end
end

local decrypted = LiyOrYsv(ceiWYlDx_flat, VzcHViQl)
local uhAkabbu, hwuvhgAU = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(ceiWYlDx_flat)
ceiWYlDx_flat = nil

if uhAkabbu then 
    local result = uhAkabbu() 
    decrypted = nil
    uhAkabbu = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(hwuvhgAU)) 
end
