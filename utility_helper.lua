-- Protected Segment (utility_helper)
local rchMPPeM = 32
local iiZfAuBC = {
{187,43,142,228,106,116,224,77,166,246,143,127,145,170,247,110,33,103,13,86,214,157,25,173,91,82,244,212,112,171,36,242,44,106,67,65,146,30,36,253,6,76,91,145,24,101,248,20,229,170,179,242,26,107,40,192,187,72,80,183},{77,179,183,49,167,78,187,3,213,79,24,217,79,116,239,50,109,120,99,141,68,20,13,68,247,167,107,146,241,203,113,51,168,151,200,244,16,58,233,74,103,160,163,11,124,172,181,166,241,24,28,245,23,212,229,255,120,184,145,177},{236,32,243,233,85,189,32,143,10,239,218,135,240,239,175,60,211,202,171,142,31,18,26,143,241,84}
}
local mKOFRTXd = "kSpaOyQhadJfDvAh"

local function yXaNYKSK(JwnKoHTI_data, JwnKoHTI_key)
    if type(JwnKoHTI_key) ~= "string" or #JwnKoHTI_key == 0 then return "" end
    local JwnKoHTI = {}
    for QphlBphB = 0, 255 do JwnKoHTI[QphlBphB] = QphlBphB end
    local RgvVxuHp = 0
    for QphlBphB = 0, 255 do
        local YOmXQPqc = JwnKoHTI_key:byte((QphlBphB % #JwnKoHTI_key) + 1)
        RgvVxuHp = (RgvVxuHp + JwnKoHTI[QphlBphB] + YOmXQPqc) % 256
        JwnKoHTI[QphlBphB], JwnKoHTI[RgvVxuHp] = JwnKoHTI[RgvVxuHp], JwnKoHTI[QphlBphB]
    end
    local QphlBphB = 0
    local RgvVxuHp = 0
    local piphIKuJ = {}
    for _, WafvdTsT in ipairs(JwnKoHTI_data) do
        QphlBphB = (QphlBphB + 1) % 256
        RgvVxuHp = (RgvVxuHp + JwnKoHTI[QphlBphB]) % 256
        JwnKoHTI[QphlBphB], JwnKoHTI[RgvVxuHp] = JwnKoHTI[RgvVxuHp], JwnKoHTI[QphlBphB]
        local YOmXQPqc = JwnKoHTI[(JwnKoHTI[QphlBphB] + JwnKoHTI[RgvVxuHp]) % 256]
        local unmasked = bit32.bxor(WafvdTsT, rchMPPeM)
        table.insert(piphIKuJ, string.char(bit32.bxor(unmasked, YOmXQPqc)))
    end
    return table.concat(piphIKuJ)
end

local JwnKoHTI_flat = {}
for _, chunk in ipairs(iiZfAuBC) do
    for _, byte in ipairs(chunk) do
        table.insert(JwnKoHTI_flat, byte)
    end
end

local decrypted = yXaNYKSK(JwnKoHTI_flat, mKOFRTXd)
local oWAaEsSA, ezlbimRY = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(JwnKoHTI_flat)
JwnKoHTI_flat = nil

if oWAaEsSA then 
    local result = oWAaEsSA() 
    decrypted = nil
    oWAaEsSA = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(ezlbimRY)) 
end
