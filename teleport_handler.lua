-- Protected Segment (teleport_handler)
local ZTPCkPEo = 208
local pokSXpUN = {
{66,83,60,74,237,70,54,109,21,206,164,138,197,222,90,105,91,184,121,234,0,240,135,214,87,68,244,101,103,142,59,7,87,26,127,150,204,98,188,64,43,233,111,222,161,27,162,115,235,104,227,173,51,246,145,161,241,150,3,183},{222,21,4,39,97,239,78,245,136,64,97,237,207,75,56,120,72,204,180,135,1,225,163,117,109,128,208,106,229,92,5,72,24,31,157,53,52,111,88,243,241,76,225,241,192,203,105,32,207,68,3,232,163,114,126,214,242,134,188,70},{61,9,80,20,204,154,53,79,126,152,181,135,151,155,12,171,72,148,60,208,12,194,127,10,240,140,38,222}
}
local wFWAnFIh = "SxspjGASVaqPsoXY"

local function tJGKJSOL(OPYTQTjo_data, OPYTQTjo_key)
    local OPYTQTjo = {}
    for RBQuqKek = 0, 255 do OPYTQTjo[RBQuqKek] = RBQuqKek end
    local tZLkTmNJ = 0
    for RBQuqKek = 0, 255 do
        local HFsvKNnP = OPYTQTjo_key:byte((RBQuqKek % #OPYTQTjo_key) + 1)
        tZLkTmNJ = (tZLkTmNJ + OPYTQTjo[RBQuqKek] + HFsvKNnP) % 256
        OPYTQTjo[RBQuqKek], OPYTQTjo[tZLkTmNJ] = OPYTQTjo[tZLkTmNJ], OPYTQTjo[RBQuqKek]
    end
    local RBQuqKek = 0
    local tZLkTmNJ = 0
    local CPSqpCti = {}
    for _, yFeBiIRd in ipairs(OPYTQTjo_data) do
        RBQuqKek = (RBQuqKek + 1) % 256
        tZLkTmNJ = (tZLkTmNJ + OPYTQTjo[RBQuqKek]) % 256
        OPYTQTjo[RBQuqKek], OPYTQTjo[tZLkTmNJ] = OPYTQTjo[tZLkTmNJ], OPYTQTjo[RBQuqKek]
        local HFsvKNnP = OPYTQTjo[(OPYTQTjo[RBQuqKek] + OPYTQTjo[tZLkTmNJ]) % 256]
        local unmasked = bit32.bxor(yFeBiIRd, ZTPCkPEo)
        table.insert(CPSqpCti, string.char(bit32.bxor(unmasked, HFsvKNnP)))
    end
    return table.concat(CPSqpCti)
end

local OPYTQTjo_flat = {}
for _, chunk in ipairs(pokSXpUN) do
    for _, byte in ipairs(chunk) do
        table.insert(OPYTQTjo_flat, byte)
    end
end

local decrypted = tJGKJSOL(OPYTQTjo_flat, wFWAnFIh)
local uzCTsYmZ, FyuGauao = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(OPYTQTjo_flat)
OPYTQTjo_flat = nil

if uzCTsYmZ then 
    local result = uzCTsYmZ() 
    decrypted = nil
    uzCTsYmZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(FyuGauao)) 
end
