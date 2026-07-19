-- Compiled secure segment
local KEmUaiPx = {
{117,6,113,39,133,19,168,231,163,148,67,96,115,204,16,84,6,160,185,129,116,96,132,15,82,94,255,70,148,126,106,163,140,135,30,63,52,113,98,73,127,194,135,125,126,3,51,204,30,126,81,12,66,193,73,104,16,118,207,93},{181,139,178,238,239,27,228,23,253,31,204,173,185,246,5,208,53,133,147,1,153,32,30,2,169,194,156,249,25,38,72,192,134,117,100,3,207,0,225,187,150,80,108,39,170,25,97,18,207,29,145,171,125,33,44,169,160,21,203,205},{221,37,244,188,228,21,139,149,29,223,203,196,114,175,67,6,2,61,97,134,66,246,211,40,142}
}
local jMwmtnVf = "AlKLjUVgOomISqCZ"

local function Izwtxkfb(oNUsCYjU_data, oNUsCYjU_key)
    local oNUsCYjU = {}
    for DDPTGKyn = 0, 255 do oNUsCYjU[DDPTGKyn] = DDPTGKyn end
    local ySsZBqom = 0
    for DDPTGKyn = 0, 255 do
        local vwBMYbjg = oNUsCYjU_key:byte((DDPTGKyn % #oNUsCYjU_key) + 1)
        ySsZBqom = (ySsZBqom + oNUsCYjU[DDPTGKyn] + vwBMYbjg) % 256
        oNUsCYjU[DDPTGKyn], oNUsCYjU[ySsZBqom] = oNUsCYjU[ySsZBqom], oNUsCYjU[DDPTGKyn]
    end
    local DDPTGKyn = 0
    local ySsZBqom = 0
    local qqjxhbhy = {}
    for _, IUkrpmof in ipairs(oNUsCYjU_data) do
        DDPTGKyn = (DDPTGKyn + 1) % 256
        ySsZBqom = (ySsZBqom + oNUsCYjU[DDPTGKyn]) % 256
        oNUsCYjU[DDPTGKyn], oNUsCYjU[ySsZBqom] = oNUsCYjU[ySsZBqom], oNUsCYjU[DDPTGKyn]
        local vwBMYbjg = oNUsCYjU[(oNUsCYjU[DDPTGKyn] + oNUsCYjU[ySsZBqom]) % 256]
        table.insert(qqjxhbhy, string.char(bit32.bxor(IUkrpmof, vwBMYbjg)))
    end
    return table.concat(qqjxhbhy)
end

local oNUsCYjU_flat = {}
for _, chunk in ipairs(KEmUaiPx) do
    for _, byte in ipairs(chunk) do
        table.insert(oNUsCYjU_flat, byte)
    end
end

local decrypted = Izwtxkfb(oNUsCYjU_flat, jMwmtnVf)
local tyAEpIwN, pMbXEeSC = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(oNUsCYjU_flat)
oNUsCYjU_flat = nil

if tyAEpIwN then 
    local result = tyAEpIwN() 
    decrypted = nil
    tyAEpIwN = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(pMbXEeSC)) 
end
