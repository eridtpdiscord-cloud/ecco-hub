-- Protected Segment (anti_cheat_bypass)
local vwdctxLL = 100
local zMBhmexY = {
{251,104,130,152,198,102,130,121,1,49,172,108,31,66,195,0,93,109,63,100,244,15,239,106,28,247,48,247,226,29,81,37,250,170,80,71,15,255,198,79,132,134,126,131,224,167,81,81,124,245,242,198,131,80,201,200,197,160,14,37},{16,15,247,87,211,192,91,92,49,134,114,49,94,188,35,4,227,235,46,98,230,239,84,126,180,251,165,250,100,229,121,254,83,46,52,199,6,146,142,189,54,83,51,82,137,59,2,200,142,119,71,69,32,81,86,163,57,170,112,223},{204,161,26,18,25,38,36,40,92,8,56,255,102,189,65,105,210,252,183,27,169,89,230,240,135,211,49,182,103}
}
local UFstfqfu = "sJCJyqqtrYcDuCrv"

local function wAkMWihf(EAigRIxP_data, EAigRIxP_key)
    if type(EAigRIxP_key) ~= "string" or #EAigRIxP_key == 0 then return "" end
    local EAigRIxP = {}
    for kXztyLyO = 0, 255 do EAigRIxP[kXztyLyO] = kXztyLyO end
    local daFHgzGc = 0
    for kXztyLyO = 0, 255 do
        local SrwuCfgk = EAigRIxP_key:byte((kXztyLyO % #EAigRIxP_key) + 1)
        daFHgzGc = (daFHgzGc + EAigRIxP[kXztyLyO] + SrwuCfgk) % 256
        EAigRIxP[kXztyLyO], EAigRIxP[daFHgzGc] = EAigRIxP[daFHgzGc], EAigRIxP[kXztyLyO]
    end
    local kXztyLyO = 0
    local daFHgzGc = 0
    local NdOLvplG = {}
    for _, sTDqGAkh in ipairs(EAigRIxP_data) do
        kXztyLyO = (kXztyLyO + 1) % 256
        daFHgzGc = (daFHgzGc + EAigRIxP[kXztyLyO]) % 256
        EAigRIxP[kXztyLyO], EAigRIxP[daFHgzGc] = EAigRIxP[daFHgzGc], EAigRIxP[kXztyLyO]
        local SrwuCfgk = EAigRIxP[(EAigRIxP[kXztyLyO] + EAigRIxP[daFHgzGc]) % 256]
        local unmasked = bit32.bxor(sTDqGAkh, vwdctxLL)
        table.insert(NdOLvplG, string.char(bit32.bxor(unmasked, SrwuCfgk)))
    end
    return table.concat(NdOLvplG)
end

local EAigRIxP_flat = {}
for _, chunk in ipairs(zMBhmexY) do
    for _, byte in ipairs(chunk) do
        table.insert(EAigRIxP_flat, byte)
    end
end

local decrypted = wAkMWihf(EAigRIxP_flat, UFstfqfu)
local fDcoKoyl, FpbAdkah = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(EAigRIxP_flat)
EAigRIxP_flat = nil

if fDcoKoyl then 
    local result = fDcoKoyl() 
    decrypted = nil
    fDcoKoyl = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(FpbAdkah)) 
end
