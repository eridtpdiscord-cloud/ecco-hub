-- Protected Segment (anti_cheat_bypass)
local cmVaVsBA = 253
local SzeeUQNn = {
{100,145,218,171,108,17,161,160,187,31,79,228,49,152,118,84,213,44,43,43,16,46,117,255,45,148,25,90,224,62,127,39,216,238,117,68,101,33,137,40,171,26,223,77,197,234,156,23,194,136,8,80,120,43,168,203,221,105,155,21},{204,198,97,166,15,223,230,20,68,182,78,138,83,153,88,200,255,102,152,121,93,20,207,229,80,56,202,111,224,10,17,65,224,193,163,128,182,182,56,104,3,139,96,153,240,36,239,202,52,113,70,193,127,14,192,86,67,7,31,103},{81,253,89,140,254,14,157,127,243,94,247,175,71,246,92,162,239,192,185,132,173,90,105,212,172,221,225,155,33}
}
local QUzaOQKk = "YXcdvgdyDXbCqiOY"

local function BrMkoHox(prRrkgCx_data, prRrkgCx_key)
    if type(prRrkgCx_key) ~= "string" or #prRrkgCx_key == 0 then return "" end
    local prRrkgCx = {}
    for cqUJefpE = 0, 255 do prRrkgCx[cqUJefpE] = cqUJefpE end
    local ufIvLoBF = 0
    for cqUJefpE = 0, 255 do
        local UaUNbuJF = prRrkgCx_key:byte((cqUJefpE % #prRrkgCx_key) + 1)
        ufIvLoBF = (ufIvLoBF + prRrkgCx[cqUJefpE] + UaUNbuJF) % 256
        prRrkgCx[cqUJefpE], prRrkgCx[ufIvLoBF] = prRrkgCx[ufIvLoBF], prRrkgCx[cqUJefpE]
    end
    local cqUJefpE = 0
    local ufIvLoBF = 0
    local syFKZmaZ = {}
    for _, nixemcgu in ipairs(prRrkgCx_data) do
        cqUJefpE = (cqUJefpE + 1) % 256
        ufIvLoBF = (ufIvLoBF + prRrkgCx[cqUJefpE]) % 256
        prRrkgCx[cqUJefpE], prRrkgCx[ufIvLoBF] = prRrkgCx[ufIvLoBF], prRrkgCx[cqUJefpE]
        local UaUNbuJF = prRrkgCx[(prRrkgCx[cqUJefpE] + prRrkgCx[ufIvLoBF]) % 256]
        local unmasked = bit32.bxor(nixemcgu, cmVaVsBA)
        table.insert(syFKZmaZ, string.char(bit32.bxor(unmasked, UaUNbuJF)))
    end
    return table.concat(syFKZmaZ)
end

local prRrkgCx_flat = {}
for _, chunk in ipairs(SzeeUQNn) do
    for _, byte in ipairs(chunk) do
        table.insert(prRrkgCx_flat, byte)
    end
end

local decrypted = BrMkoHox(prRrkgCx_flat, QUzaOQKk)
local wmvVSFAr, yjxEbpJx = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(prRrkgCx_flat)
prRrkgCx_flat = nil

if wmvVSFAr then 
    local result = wmvVSFAr() 
    decrypted = nil
    wmvVSFAr = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(yjxEbpJx)) 
end
