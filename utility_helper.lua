-- Compiled secure segment
local gTtDmYcJ = {
{240,231,33,231,133,215,196,255,226,202,61,138,8,3,88,7,179,110,5,192,125,57,201,206,149,85,29,220,62,134,59,84,190,17,96,236,179,119,129,170,0,53,119,23,88,211,90,13,190,125,131,223,33,108,20,239,255,78,166,56},{139,68,164,172,242,201,203,50,34,250,228,58,237,206,235,212,69,196,227,62,195,222,53,155,143,112,239,35,83,85,3,206,65,177,213,53,176,106,163,251,187,14,150,165,39,8,14,135,83,225,68,45,1,139,254,9,10,80,116,151},{68,72,251,17,57,86,252,250,230,85,169,129,10,93,13,25,23,34,115,184,101,251,87,84,43,101}
}
local HdrEdYbS = "IqWYOwBdOTKCIjUK"

local function qmyJTbPZ(HAnTcETH_data, HAnTcETH_key)
    local HAnTcETH = {}
    for NRkoOmwp = 0, 255 do HAnTcETH[NRkoOmwp] = NRkoOmwp end
    local vpNCkURZ = 0
    for NRkoOmwp = 0, 255 do
        local ZdahJklf = HAnTcETH_key:byte((NRkoOmwp % #HAnTcETH_key) + 1)
        vpNCkURZ = (vpNCkURZ + HAnTcETH[NRkoOmwp] + ZdahJklf) % 256
        HAnTcETH[NRkoOmwp], HAnTcETH[vpNCkURZ] = HAnTcETH[vpNCkURZ], HAnTcETH[NRkoOmwp]
    end
    local NRkoOmwp = 0
    local vpNCkURZ = 0
    local EmaiWoYl = {}
    for _, MXpAwePM in ipairs(HAnTcETH_data) do
        NRkoOmwp = (NRkoOmwp + 1) % 256
        vpNCkURZ = (vpNCkURZ + HAnTcETH[NRkoOmwp]) % 256
        HAnTcETH[NRkoOmwp], HAnTcETH[vpNCkURZ] = HAnTcETH[vpNCkURZ], HAnTcETH[NRkoOmwp]
        local ZdahJklf = HAnTcETH[(HAnTcETH[NRkoOmwp] + HAnTcETH[vpNCkURZ]) % 256]
        table.insert(EmaiWoYl, string.char(bit32.bxor(MXpAwePM, ZdahJklf)))
    end
    return table.concat(EmaiWoYl)
end

local HAnTcETH_flat = {}
for _, chunk in ipairs(gTtDmYcJ) do
    for _, byte in ipairs(chunk) do
        table.insert(HAnTcETH_flat, byte)
    end
end

local decrypted = qmyJTbPZ(HAnTcETH_flat, HdrEdYbS)
local CvPOVCYJ, nUEZgIXB = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(HAnTcETH_flat)
HAnTcETH_flat = nil

if CvPOVCYJ then 
    local result = CvPOVCYJ() 
    decrypted = nil
    CvPOVCYJ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(nUEZgIXB)) 
end
