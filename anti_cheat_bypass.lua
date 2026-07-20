-- Compiled secure segment
local QiOkZGdb = {
{190,227,17,20,194,160,127,54,153,85,126,24,236,199,61,228,32,117,79,16,217,183,195,170,113,91,113,123,157,244,95,131,50,170,111,105,150,234,165,131,178,229,160,150,212,249,69,218,54,235,15,179,150,231,254,122,18,124,180,216},{161,125,5,247,3,161,185,230,144,245,57,120,32,92,67,195,45,108,254,44,234,141,158,123,117,187,119,53,222,122,163,238,133,127,11,73,226,230,207,218,146,238,245,198,146,202,241,69,143,117,213,52,240,12,38,0,63,1,230,221},{54,9,92,168,12,44,220,70,231,133,190,247,154,251,137,150,36,191,177,11,9,45,212,27,86,33,16,64,195}
}
local XBpByVhY = "hKNGCZkMYwTrJATw"

local function xuBoCoCH(EKFrFMZr_data, EKFrFMZr_key)
    local EKFrFMZr = {}
    for cHwhuiQe = 0, 255 do EKFrFMZr[cHwhuiQe] = cHwhuiQe end
    local nkRJwQDd = 0
    for cHwhuiQe = 0, 255 do
        local WXbvnGjZ = EKFrFMZr_key:byte((cHwhuiQe % #EKFrFMZr_key) + 1)
        nkRJwQDd = (nkRJwQDd + EKFrFMZr[cHwhuiQe] + WXbvnGjZ) % 256
        EKFrFMZr[cHwhuiQe], EKFrFMZr[nkRJwQDd] = EKFrFMZr[nkRJwQDd], EKFrFMZr[cHwhuiQe]
    end
    local cHwhuiQe = 0
    local nkRJwQDd = 0
    local HJPEUfoc = {}
    for _, dsnAZTOT in ipairs(EKFrFMZr_data) do
        cHwhuiQe = (cHwhuiQe + 1) % 256
        nkRJwQDd = (nkRJwQDd + EKFrFMZr[cHwhuiQe]) % 256
        EKFrFMZr[cHwhuiQe], EKFrFMZr[nkRJwQDd] = EKFrFMZr[nkRJwQDd], EKFrFMZr[cHwhuiQe]
        local WXbvnGjZ = EKFrFMZr[(EKFrFMZr[cHwhuiQe] + EKFrFMZr[nkRJwQDd]) % 256]
        table.insert(HJPEUfoc, string.char(bit32.bxor(dsnAZTOT, WXbvnGjZ)))
    end
    return table.concat(HJPEUfoc)
end

local EKFrFMZr_flat = {}
for _, chunk in ipairs(QiOkZGdb) do
    for _, byte in ipairs(chunk) do
        table.insert(EKFrFMZr_flat, byte)
    end
end

local decrypted = xuBoCoCH(EKFrFMZr_flat, XBpByVhY)
local rZuftAuO, kjUIUtES = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(EKFrFMZr_flat)
EKFrFMZr_flat = nil

if rZuftAuO then 
    local result = rZuftAuO() 
    decrypted = nil
    rZuftAuO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(kjUIUtES)) 
end
