-- Protected Segment (cache_invalidation)
local IMSkNGWW = 216
local zJvRvHPO = {
{181,20,149,59,199,239,210,154,142,3,215,203,224,74,24,107,137,195,209,77,91,122,218,245,121,138,66,55,201,34,56,252,44,180,13,171,175,203,84,171,163,204,85,13,254,82,184,167,255,108,218,243,210,90,68,247,43,211,1,102},{116,170,222,142,98,65,215,201,130,147,174,198,33,33,215,55,166,69,246,63,113,168,132,189,32,111,110,153,31,15,79,156,30,176,242,196,77,163,77,114,146,97,186,114,147,176,0,144,91,179,163,203,204,221,37,181,20,81,7,138},{140,28,90,212,234,136,231,56,63,179,28,63,175,62,35,27,134,139,254,97,10,122,36,223,94,20,36,255,60,170}
}
local DtBHotzh = "KtOTqvwCOnFGjCqa"

local function QpvwnHKX(MpyPFrEh_data, MpyPFrEh_key)
    if type(MpyPFrEh_key) ~= "string" or #MpyPFrEh_key == 0 then return "" end
    local MpyPFrEh = {}
    for NpeIuIpt = 0, 255 do MpyPFrEh[NpeIuIpt] = NpeIuIpt end
    local dMUexSDb = 0
    for NpeIuIpt = 0, 255 do
        local rlHLFlMH = MpyPFrEh_key:byte((NpeIuIpt % #MpyPFrEh_key) + 1)
        dMUexSDb = (dMUexSDb + MpyPFrEh[NpeIuIpt] + rlHLFlMH) % 256
        MpyPFrEh[NpeIuIpt], MpyPFrEh[dMUexSDb] = MpyPFrEh[dMUexSDb], MpyPFrEh[NpeIuIpt]
    end
    local NpeIuIpt = 0
    local dMUexSDb = 0
    local PPGxoPIT = {}
    for _, hdqtIPGk in ipairs(MpyPFrEh_data) do
        NpeIuIpt = (NpeIuIpt + 1) % 256
        dMUexSDb = (dMUexSDb + MpyPFrEh[NpeIuIpt]) % 256
        MpyPFrEh[NpeIuIpt], MpyPFrEh[dMUexSDb] = MpyPFrEh[dMUexSDb], MpyPFrEh[NpeIuIpt]
        local rlHLFlMH = MpyPFrEh[(MpyPFrEh[NpeIuIpt] + MpyPFrEh[dMUexSDb]) % 256]
        local unmasked = bit32.bxor(hdqtIPGk, IMSkNGWW)
        table.insert(PPGxoPIT, string.char(bit32.bxor(unmasked, rlHLFlMH)))
    end
    return table.concat(PPGxoPIT)
end

local MpyPFrEh_flat = {}
for _, chunk in ipairs(zJvRvHPO) do
    for _, byte in ipairs(chunk) do
        table.insert(MpyPFrEh_flat, byte)
    end
end

local decrypted = QpvwnHKX(MpyPFrEh_flat, DtBHotzh)
local wbMQXwcT, ykhVeqfc = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(MpyPFrEh_flat)
MpyPFrEh_flat = nil

if wbMQXwcT then 
    local result = wbMQXwcT() 
    decrypted = nil
    wbMQXwcT = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(ykhVeqfc)) 
end
