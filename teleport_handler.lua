-- Protected Segment (teleport_handler)
local RSeVbKVq = 106
local mSaDQjZS = {
{187,70,107,240,215,164,22,161,135,176,211,205,238,159,182,101,214,158,95,188,47,154,241,199,59,230,174,77,164,92,116,132,135,100,85,127,236,249,47,171,112,120,179,111,85,191,2,82,160,81,92,54,155,231,11,39,169,107,46,95},{183,47,78,170,186,131,94,184,226,244,97,209,246,179,68,28,112,125,237,232,212,229,1,165,25,99,248,177,115,164,252,90,128,133,206,178,146,197,171,116,244,99,201,207,182,243,66,218,238,65,116,48,254,25,115,126,144,174,187,0},{101,137,142,133,123,105,103,191,235,54,246,81,77,238,90,190,98,163,188,59,133,29,184,82,208,109,152,208}
}
local mdPuveDI = "IBvMjSPqoOZvnBiI"

local function JmnvxHVx(WzqUuDbc_data, WzqUuDbc_key)
    if type(WzqUuDbc_key) ~= "string" or #WzqUuDbc_key == 0 then return "" end
    local WzqUuDbc = {}
    for RAVPafpN = 0, 255 do WzqUuDbc[RAVPafpN] = RAVPafpN end
    local EWsfCHJj = 0
    for RAVPafpN = 0, 255 do
        local oiSUAvol = WzqUuDbc_key:byte((RAVPafpN % #WzqUuDbc_key) + 1)
        EWsfCHJj = (EWsfCHJj + WzqUuDbc[RAVPafpN] + oiSUAvol) % 256
        WzqUuDbc[RAVPafpN], WzqUuDbc[EWsfCHJj] = WzqUuDbc[EWsfCHJj], WzqUuDbc[RAVPafpN]
    end
    local RAVPafpN = 0
    local EWsfCHJj = 0
    local MJmWpkWM = {}
    for _, aAaGQiJh in ipairs(WzqUuDbc_data) do
        RAVPafpN = (RAVPafpN + 1) % 256
        EWsfCHJj = (EWsfCHJj + WzqUuDbc[RAVPafpN]) % 256
        WzqUuDbc[RAVPafpN], WzqUuDbc[EWsfCHJj] = WzqUuDbc[EWsfCHJj], WzqUuDbc[RAVPafpN]
        local oiSUAvol = WzqUuDbc[(WzqUuDbc[RAVPafpN] + WzqUuDbc[EWsfCHJj]) % 256]
        local unmasked = bit32.bxor(aAaGQiJh, RSeVbKVq)
        table.insert(MJmWpkWM, string.char(bit32.bxor(unmasked, oiSUAvol)))
    end
    return table.concat(MJmWpkWM)
end

local WzqUuDbc_flat = {}
for _, chunk in ipairs(mSaDQjZS) do
    for _, byte in ipairs(chunk) do
        table.insert(WzqUuDbc_flat, byte)
    end
end

local decrypted = JmnvxHVx(WzqUuDbc_flat, mdPuveDI)
local uJQxBXUc, cESXBdNd = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(WzqUuDbc_flat)
WzqUuDbc_flat = nil

if uJQxBXUc then 
    local result = uJQxBXUc() 
    decrypted = nil
    uJQxBXUc = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(cESXBdNd)) 
end
