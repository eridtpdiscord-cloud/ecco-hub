-- Protected Segment (network_optimizer)
local LxbbNYlS = 158
local seqiXLKA = {
{231,248,117,46,250,212,139,192,148,224,201,67,92,172,44,252,78,61,142,242,180,82,15,49,128,21,114,173,178,97,161,163,76,43,143,130,43,97,217,233,152,252,181,252,236,253,25,42,135,68,65,204,225,194,41,163,175,60,91,22},{254,12,84,238,254,8,24,166,102,180,97,139,70,164,191,163,146,143,26,104,41,161,139,192,171,224,80,175,171,155,233,207,91,158,24,171,245,140,33,48,241,152,96,102,185,189,223,166,209,179,16,89,171,248,220,188,38,108,236,226},{111,235,128,154,19,18,220,192,152,75,242,137,203,20,91,65,145,249,2,210,167,138,19,62,154,87,115,244,160}
}
local OcrzpxwQ = "huDUVfMzVElBaItE"

local function VOvQJdGA(JuCDqKpK_data, JuCDqKpK_key)
    if type(JuCDqKpK_key) ~= "string" or #JuCDqKpK_key == 0 then return "" end
    local JuCDqKpK = {}
    for IagDnaUo = 0, 255 do JuCDqKpK[IagDnaUo] = IagDnaUo end
    local KKTBWEZh = 0
    for IagDnaUo = 0, 255 do
        local MAzCPSHo = JuCDqKpK_key:byte((IagDnaUo % #JuCDqKpK_key) + 1)
        KKTBWEZh = (KKTBWEZh + JuCDqKpK[IagDnaUo] + MAzCPSHo) % 256
        JuCDqKpK[IagDnaUo], JuCDqKpK[KKTBWEZh] = JuCDqKpK[KKTBWEZh], JuCDqKpK[IagDnaUo]
    end
    local IagDnaUo = 0
    local KKTBWEZh = 0
    local akgGBCNV = {}
    for _, lbwyIsYZ in ipairs(JuCDqKpK_data) do
        IagDnaUo = (IagDnaUo + 1) % 256
        KKTBWEZh = (KKTBWEZh + JuCDqKpK[IagDnaUo]) % 256
        JuCDqKpK[IagDnaUo], JuCDqKpK[KKTBWEZh] = JuCDqKpK[KKTBWEZh], JuCDqKpK[IagDnaUo]
        local MAzCPSHo = JuCDqKpK[(JuCDqKpK[IagDnaUo] + JuCDqKpK[KKTBWEZh]) % 256]
        local unmasked = bit32.bxor(lbwyIsYZ, LxbbNYlS)
        table.insert(akgGBCNV, string.char(bit32.bxor(unmasked, MAzCPSHo)))
    end
    return table.concat(akgGBCNV)
end

local JuCDqKpK_flat = {}
for _, chunk in ipairs(seqiXLKA) do
    for _, byte in ipairs(chunk) do
        table.insert(JuCDqKpK_flat, byte)
    end
end

local decrypted = VOvQJdGA(JuCDqKpK_flat, OcrzpxwQ)
local VetzSLPC, mgYRzPNh = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(JuCDqKpK_flat)
JuCDqKpK_flat = nil

if VetzSLPC then 
    local result = VetzSLPC() 
    decrypted = nil
    VetzSLPC = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(mgYRzPNh)) 
end
