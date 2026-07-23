-- Protected Segment (teleport_handler)
local YKVPBCZg = 197
local GUVSANAt = {
{50,109,84,60,146,37,227,248,19,88,22,42,127,188,213,241,147,21,245,225,183,28,0,99,200,124,80,94,202,59,41,118,112,42,132,7,38,58,53,183,48,138,181,81,201,139,224,160,43,1,234,29,118,196,9,199,58,169,42,131},{99,193,234,115,40,176,102,215,81,252,183,74,15,119,132,184,2,220,246,206,99,181,233,233,213,1,121,198,209,159,244,39,44,60,129,119,83,7,46,178,39,167,20,227,245,3,83,103,255,71,11,11,24,176,131,135,157,127,107,3},{32,155,133,94,8,171,200,181,233,113,23,84,253,91,235,170,163,253,122,170,160,133,46,58,221,48,93,222}
}
local zrHOiXof = "pspSmNhTkZUuzjYG"

local function kPaAUIST(gzIHAdsd_data, gzIHAdsd_key)
    if type(gzIHAdsd_key) ~= "string" or #gzIHAdsd_key == 0 then return "" end
    local gzIHAdsd = {}
    for TZKaGtzv = 0, 255 do gzIHAdsd[TZKaGtzv] = TZKaGtzv end
    local NhGfnuyl = 0
    for TZKaGtzv = 0, 255 do
        local RRLigbsN = gzIHAdsd_key:byte((TZKaGtzv % #gzIHAdsd_key) + 1)
        NhGfnuyl = (NhGfnuyl + gzIHAdsd[TZKaGtzv] + RRLigbsN) % 256
        gzIHAdsd[TZKaGtzv], gzIHAdsd[NhGfnuyl] = gzIHAdsd[NhGfnuyl], gzIHAdsd[TZKaGtzv]
    end
    local TZKaGtzv = 0
    local NhGfnuyl = 0
    local VFcPFyNH = {}
    for _, WSUNGuyv in ipairs(gzIHAdsd_data) do
        TZKaGtzv = (TZKaGtzv + 1) % 256
        NhGfnuyl = (NhGfnuyl + gzIHAdsd[TZKaGtzv]) % 256
        gzIHAdsd[TZKaGtzv], gzIHAdsd[NhGfnuyl] = gzIHAdsd[NhGfnuyl], gzIHAdsd[TZKaGtzv]
        local RRLigbsN = gzIHAdsd[(gzIHAdsd[TZKaGtzv] + gzIHAdsd[NhGfnuyl]) % 256]
        local unmasked = bit32.bxor(WSUNGuyv, YKVPBCZg)
        table.insert(VFcPFyNH, string.char(bit32.bxor(unmasked, RRLigbsN)))
    end
    return table.concat(VFcPFyNH)
end

local gzIHAdsd_flat = {}
for _, chunk in ipairs(GUVSANAt) do
    for _, byte in ipairs(chunk) do
        table.insert(gzIHAdsd_flat, byte)
    end
end

local decrypted = kPaAUIST(gzIHAdsd_flat, zrHOiXof)
local OkzjhUHO, EbdfKPZL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(gzIHAdsd_flat)
gzIHAdsd_flat = nil

if OkzjhUHO then 
    local result = OkzjhUHO() 
    decrypted = nil
    OkzjhUHO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(EbdfKPZL)) 
end
