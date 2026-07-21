-- Protected Segment (utility_helper)
local WeVSuaTI = 117
local GssrnvBq = {
{41,82,62,94,70,85,233,30,30,235,131,63,152,19,228,150,205,178,120,165,251,124,3,32,181,254,78,118,248,201,217,6,213,131,220,156,141,46,32,53,69,154,198,123,131,185,215,111,237,73,93,171,227,201,108,231,124,2,56,7},{117,34,151,212,147,10,142,163,186,140,17,107,209,164,5,70,245,72,17,66,223,115,46,93,135,16,73,190,41,14,226,105,97,230,188,118,93,14,95,17,30,218,75,203,253,201,211,201,26,180,58,46,101,157,168,30,179,224,45,72},{105,20,240,98,36,47,249,173,241,210,145,33,254,235,253,199,43,109,235,68,79,199,109,188,229,202}
}
local NQtMDCcH = "NXyQLaOMjWsxMFSd"

local function GUVyMnhR(prknyYGD_data, prknyYGD_key)
    local prknyYGD = {}
    for hllEebqg = 0, 255 do prknyYGD[hllEebqg] = hllEebqg end
    local elWQmUpq = 0
    for hllEebqg = 0, 255 do
        local pOVxgUiw = prknyYGD_key:byte((hllEebqg % #prknyYGD_key) + 1)
        elWQmUpq = (elWQmUpq + prknyYGD[hllEebqg] + pOVxgUiw) % 256
        prknyYGD[hllEebqg], prknyYGD[elWQmUpq] = prknyYGD[elWQmUpq], prknyYGD[hllEebqg]
    end
    local hllEebqg = 0
    local elWQmUpq = 0
    local pZKCaFTb = {}
    for _, XrRTnJpY in ipairs(prknyYGD_data) do
        hllEebqg = (hllEebqg + 1) % 256
        elWQmUpq = (elWQmUpq + prknyYGD[hllEebqg]) % 256
        prknyYGD[hllEebqg], prknyYGD[elWQmUpq] = prknyYGD[elWQmUpq], prknyYGD[hllEebqg]
        local pOVxgUiw = prknyYGD[(prknyYGD[hllEebqg] + prknyYGD[elWQmUpq]) % 256]
        local unmasked = bit32.bxor(XrRTnJpY, WeVSuaTI)
        table.insert(pZKCaFTb, string.char(bit32.bxor(unmasked, pOVxgUiw)))
    end
    return table.concat(pZKCaFTb)
end

local prknyYGD_flat = {}
for _, chunk in ipairs(GssrnvBq) do
    for _, byte in ipairs(chunk) do
        table.insert(prknyYGD_flat, byte)
    end
end

local decrypted = GUVyMnhR(prknyYGD_flat, NQtMDCcH)
local iTsqoHxN, LynIElUz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(prknyYGD_flat)
prknyYGD_flat = nil

if iTsqoHxN then 
    local result = iTsqoHxN() 
    decrypted = nil
    iTsqoHxN = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(LynIElUz)) 
end
