-- Compiled secure segment
local zncWbVlQ = {
{28,190,82,44,82,96,120,194,119,118,114,230,76,234,241,213,214,230,231,39,147,43,213,205,202,167,32,230,15,168,47,49,60,227,59,31,235,187,73,25,1,231,175,137,94,45,167,89,178,187,240,161,51,185,237,213,186,30,100,56},{49,226,144,158,102,226,173,10,7,17,251,8,64,139,28,12,159,252,244,176,188,227,15,39,252,220,76,147,106,136,65,20,107,59,64,82,184,40,87,161,4,182,168,80,226,179,114,95,142,14,66,40,170,106,70,51,81,23,84,77},{241,197,90,210,97,35,15,103,157,5,97,79,27,12,37,204,170,65,188,235,201,137,82,121,76,97,231,162,64,161,101,71,32,73,13,177,78,34,134,239,72,160,7,124,122,120,194,76,13,60,3,194,19,73,201,37,98,169,138,179},{163,117,78,141,31,163,167,176,220,42,234,172,193,222,237,249,81,221,83,70,98,50,75,211,69,53,63,195,158,242,119,162,227,143,56,180,164,72,185,219,134,17,213,43,225,197,156,154,126,228,226,81,176,5,238,41,7,177,12,101},{185,93,109,187,208,12,75,125,212,5,76,122,255,128,27,147,40,195,30,202,112,127,64,50,238,28,184,85,19,239,134,27,22,94,198,237,247,26,96,78,138,82,104,56,232,217,168,79,245,226,133,150,160,106,122,172,173,179,239,18},{174,30,67,217,155,49,253,31,253,82,88,215,213,145,114,5,245,157,174,133,164,186,170,169,102,20,166,228,129,20,219,176,75,93,254,64,117,179,171,188,202,54,195,243,20,45,242,174,42,234,54,115,163,89,214,195,42,177,86,222},{34,179,248,22,96,162,143,132,241,99,242,198,20,164,58,85,134,91,150,156,32,249,158,236,244,81,209,153,23,219,9,2,212,149,146,15,22,250,107,251,178,163,125,161,251,178,107,158,239,20,171,104,190,67,66,54,245,75,93,52},{8,231,23,45,92,124,203,168,10,114,230,49,171,122,51,37,107,50,46,186,102,93,53,23}
}
local wFqrKgUW = "wPoEgieEthfgTBWk"

local function UKfRYBmP(CgPHRdtY_data, CgPHRdtY_key)
    local CgPHRdtY = {}
    for xhAhbqXd = 0, 255 do CgPHRdtY[xhAhbqXd] = xhAhbqXd end
    local hvePmFrP = 0
    for xhAhbqXd = 0, 255 do
        local mvsfQQOj = CgPHRdtY_key:byte((xhAhbqXd % #CgPHRdtY_key) + 1)
        hvePmFrP = (hvePmFrP + CgPHRdtY[xhAhbqXd] + mvsfQQOj) % 256
        CgPHRdtY[xhAhbqXd], CgPHRdtY[hvePmFrP] = CgPHRdtY[hvePmFrP], CgPHRdtY[xhAhbqXd]
    end
    local xhAhbqXd = 0
    local hvePmFrP = 0
    local slEzoaLs = {}
    for _, BwnBihCl in ipairs(CgPHRdtY_data) do
        xhAhbqXd = (xhAhbqXd + 1) % 256
        hvePmFrP = (hvePmFrP + CgPHRdtY[xhAhbqXd]) % 256
        CgPHRdtY[xhAhbqXd], CgPHRdtY[hvePmFrP] = CgPHRdtY[hvePmFrP], CgPHRdtY[xhAhbqXd]
        local mvsfQQOj = CgPHRdtY[(CgPHRdtY[xhAhbqXd] + CgPHRdtY[hvePmFrP]) % 256]
        table.insert(slEzoaLs, string.char(bit32.bxor(BwnBihCl, mvsfQQOj)))
    end
    return table.concat(slEzoaLs)
end

local CgPHRdtY_flat = {}
for _, chunk in ipairs(zncWbVlQ) do
    for _, byte in ipairs(chunk) do
        table.insert(CgPHRdtY_flat, byte)
    end
end

local decrypted = UKfRYBmP(CgPHRdtY_flat, wFqrKgUW)
local snSaqQHl, fqCgXZFb = loadstring(decrypted)
if snSaqQHl then 
    return snSaqQHl() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(fqCgXZFb)) 
end
