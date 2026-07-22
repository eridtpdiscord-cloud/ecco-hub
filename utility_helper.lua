-- Protected Segment (utility_helper)
local Kouiagww = 54
local msbTxFEm = {
{81,67,70,59,95,154,111,136,4,26,99,98,133,214,230,12,222,11,248,48,132,214,120,202,165,8,210,163,30,162,97,49,3,185,234,254,162,168,163,62,127,121,86,189,152,138,209,238,146,9,94,69,232,127,198,39,33,193,187,79},{188,197,71,18,55,32,215,39,231,156,116,246,54,234,41,97,34,151,7,44,254,127,97,120,152,68,104,65,73,213,89,112,69,159,96,66,37,165,89,203,92,127,131,102,85,195,62,60,52,7,93,12,254,158,131,171,130,0,240,248},{168,248,30,0,232,101,80,22,126,231,19,46,186,99,158,90,4,144,16,159,117,236,133,136,158,10}
}
local FtJwWGvy = "NqVvNTXCPgIRarhP"

local function UmYELYLL(DsWdQCPj_data, DsWdQCPj_key)
    local DsWdQCPj = {}
    for ChcNiRTm = 0, 255 do DsWdQCPj[ChcNiRTm] = ChcNiRTm end
    local EpEYnNVc = 0
    for ChcNiRTm = 0, 255 do
        local iTNQKFUj = DsWdQCPj_key:byte((ChcNiRTm % #DsWdQCPj_key) + 1)
        EpEYnNVc = (EpEYnNVc + DsWdQCPj[ChcNiRTm] + iTNQKFUj) % 256
        DsWdQCPj[ChcNiRTm], DsWdQCPj[EpEYnNVc] = DsWdQCPj[EpEYnNVc], DsWdQCPj[ChcNiRTm]
    end
    local ChcNiRTm = 0
    local EpEYnNVc = 0
    local negejGzr = {}
    for _, eHzrwvLy in ipairs(DsWdQCPj_data) do
        ChcNiRTm = (ChcNiRTm + 1) % 256
        EpEYnNVc = (EpEYnNVc + DsWdQCPj[ChcNiRTm]) % 256
        DsWdQCPj[ChcNiRTm], DsWdQCPj[EpEYnNVc] = DsWdQCPj[EpEYnNVc], DsWdQCPj[ChcNiRTm]
        local iTNQKFUj = DsWdQCPj[(DsWdQCPj[ChcNiRTm] + DsWdQCPj[EpEYnNVc]) % 256]
        local unmasked = bit32.bxor(eHzrwvLy, Kouiagww)
        table.insert(negejGzr, string.char(bit32.bxor(unmasked, iTNQKFUj)))
    end
    return table.concat(negejGzr)
end

local DsWdQCPj_flat = {}
for _, chunk in ipairs(msbTxFEm) do
    for _, byte in ipairs(chunk) do
        table.insert(DsWdQCPj_flat, byte)
    end
end

local decrypted = UmYELYLL(DsWdQCPj_flat, FtJwWGvy)
local kZsenpsq, kTSjyDMx = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(DsWdQCPj_flat)
DsWdQCPj_flat = nil

if kZsenpsq then 
    local result = kZsenpsq() 
    decrypted = nil
    kZsenpsq = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(kTSjyDMx)) 
end
