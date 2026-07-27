-- Protected Segment (db)
local jCqCFJwt = 162
local TRWSDBzJ = {
{90,111,3,164,194,7,5,228,238,216,224,180,113,109,54,76,238,9,85,77,249,8,14,102,144,163,68,239,162,42,180,108,162,89,41,110,9,104,173,143,174,39,52,201,26,177,57,228,178,237,219,169,185,195,239,201,198,207,54,28},{116,246,134,91,19,101,169,185,18,96,0,168,233,227,41,6,13,106,169,221,121,170,5,190,212,123,141,115,108,133,58,146,128,237,230,159,108,51,199,42,84,91,41,55,168,82,10,150,109,98,43,33,53,85,133,111,101,58,199,66},{197,26,171,147,139,82,114,71,113,155,108,214,43,120,93,65,161,133,124,164,86,161,161,77,183,231,70,52,10,118,219,176,89,219,147,37,28,241,168,142,74,117,74,179,119,55,103,28,17,164,101,142,60,78,78,111,117,219,249,255},{192,219,87,195,64,219,20,138,203,4,58,50,144,3,184,134,216,28,83,37,170,49,40,153,194,46,49,175,216,106,130,18,204,25,78,110,219,205,35,135,103,125,216,49,136,223,36,12,150,58,126,232,109,18,208,120,131,210,102,29},{161,70,76,93,64,30,227,57,145,199,240,34,55,118,202,95,193,110,50,2,228,178,124,79,250,245,14,13,23,0,76,204,150,136,17,93,239,60,156,210,91,170,57,122,50,155,18,160,130,13,45,28,119,22,124,162,251,180,91,226},{214,140,7,183,201,192,176,97,40,34,196,231,92,118,24,150,167,205,239,136,86,6,16,225,190,126,27,221,104,14,170,232,183,233,100,52,197,123,247,35,167,165,32,78,191,156,2,98,158,138,83,173,66,226,238,195,38,12,3,27},{119,123,228,207,100,43,63,150,164,45,151,154,236,47,227,44,114,251,81,136,178,206,2,29,201,164,59,171,174,125,11,203,140,119,226,207,141,204,250,109,145,17,85,251,144,0,233,8,192,249,180,14,169,17,127,144,117,247,15,214},{251,136,107,130,64,197,128,126,96,156,232,80,254,128,42,172,245,17,182,230,43,180,40,191,173,40,217,114,235,184,255,234,120,242,127,6,13,123,191,111,141,207,241,36,58,80,155,60,96,5,18,64,112,231,43,109,211,26,221}
}
local zuOQQfbQ = "gEEynQmFbftaidAL"

local function NhAqqFKr(JigiDikN_data, JigiDikN_key)
    if type(JigiDikN_key) ~= "string" or #JigiDikN_key == 0 then return "" end
    local JigiDikN = {}
    for kiveMjAX = 0, 255 do JigiDikN[kiveMjAX] = kiveMjAX end
    local tsjoaMtn = 0
    for kiveMjAX = 0, 255 do
        local fTgBPnOd = JigiDikN_key:byte((kiveMjAX % #JigiDikN_key) + 1)
        tsjoaMtn = (tsjoaMtn + JigiDikN[kiveMjAX] + fTgBPnOd) % 256
        JigiDikN[kiveMjAX], JigiDikN[tsjoaMtn] = JigiDikN[tsjoaMtn], JigiDikN[kiveMjAX]
    end
    local kiveMjAX = 0
    local tsjoaMtn = 0
    local MhdJkQKK = {}
    for _, iSDgPKpQ in ipairs(JigiDikN_data) do
        kiveMjAX = (kiveMjAX + 1) % 256
        tsjoaMtn = (tsjoaMtn + JigiDikN[kiveMjAX]) % 256
        JigiDikN[kiveMjAX], JigiDikN[tsjoaMtn] = JigiDikN[tsjoaMtn], JigiDikN[kiveMjAX]
        local fTgBPnOd = JigiDikN[(JigiDikN[kiveMjAX] + JigiDikN[tsjoaMtn]) % 256]
        local unmasked = bit32.bxor(iSDgPKpQ, jCqCFJwt)
        table.insert(MhdJkQKK, string.char(bit32.bxor(unmasked, fTgBPnOd)))
    end
    return table.concat(MhdJkQKK)
end

local JigiDikN_flat = {}
for _, chunk in ipairs(TRWSDBzJ) do
    for _, byte in ipairs(chunk) do
        table.insert(JigiDikN_flat, byte)
    end
end

local decrypted = NhAqqFKr(JigiDikN_flat, zuOQQfbQ)
local bbeeElPB, HfuprGLD = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(JigiDikN_flat)
JigiDikN_flat = nil

if bbeeElPB then 
    local result = bbeeElPB() 
    decrypted = nil
    bbeeElPB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(HfuprGLD)) 
end
