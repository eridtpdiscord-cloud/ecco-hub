-- Protected Segment (anti_cheat_bypass)
local QJrkwFGL = 130
local oeHxtkiP = {
{248,196,180,175,32,127,117,25,229,235,60,171,90,231,2,15,107,36,192,137,131,115,136,228,236,75,109,65,58,225,248,248,184,66,196,125,111,72,191,147,91,165,132,138,114,30,52,239,87,176,152,107,201,172,233,118,0,244,60,127},{11,226,183,239,184,145,53,10,197,64,237,136,98,16,151,26,52,143,176,221,237,249,136,122,3,245,125,175,175,161,21,45,197,40,255,115,179,211,143,6,114,101,27,39,248,132,44,244,57,117,226,85,232,97,187,123,106,41,15,198},{235,46,201,93,117,97,34,200,197,164,243,175,250,106,110,33,71,88,255,186,179,192,55,242,106,17,250,88,216}
}
local qLgVNYVR = "yQTPkSnYCFsxbAoH"

local function voUfaqGU(mzuwChTm_data, mzuwChTm_key)
    if type(mzuwChTm_key) ~= "string" or #mzuwChTm_key == 0 then return "" end
    local mzuwChTm = {}
    for zxZyfefX = 0, 255 do mzuwChTm[zxZyfefX] = zxZyfefX end
    local MqbAXxyq = 0
    for zxZyfefX = 0, 255 do
        local TpJTKyge = mzuwChTm_key:byte((zxZyfefX % #mzuwChTm_key) + 1)
        MqbAXxyq = (MqbAXxyq + mzuwChTm[zxZyfefX] + TpJTKyge) % 256
        mzuwChTm[zxZyfefX], mzuwChTm[MqbAXxyq] = mzuwChTm[MqbAXxyq], mzuwChTm[zxZyfefX]
    end
    local zxZyfefX = 0
    local MqbAXxyq = 0
    local wZSyTWGY = {}
    for _, QDgWPiil in ipairs(mzuwChTm_data) do
        zxZyfefX = (zxZyfefX + 1) % 256
        MqbAXxyq = (MqbAXxyq + mzuwChTm[zxZyfefX]) % 256
        mzuwChTm[zxZyfefX], mzuwChTm[MqbAXxyq] = mzuwChTm[MqbAXxyq], mzuwChTm[zxZyfefX]
        local TpJTKyge = mzuwChTm[(mzuwChTm[zxZyfefX] + mzuwChTm[MqbAXxyq]) % 256]
        local unmasked = bit32.bxor(QDgWPiil, QJrkwFGL)
        table.insert(wZSyTWGY, string.char(bit32.bxor(unmasked, TpJTKyge)))
    end
    return table.concat(wZSyTWGY)
end

local mzuwChTm_flat = {}
for _, chunk in ipairs(oeHxtkiP) do
    for _, byte in ipairs(chunk) do
        table.insert(mzuwChTm_flat, byte)
    end
end

local decrypted = voUfaqGU(mzuwChTm_flat, qLgVNYVR)
local pDfsIFaS, MkdxVexQ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(mzuwChTm_flat)
mzuwChTm_flat = nil

if pDfsIFaS then 
    local result = pDfsIFaS() 
    decrypted = nil
    pDfsIFaS = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(MkdxVexQ)) 
end
