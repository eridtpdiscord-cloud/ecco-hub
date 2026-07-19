-- Compiled secure segment
local yDzuSfuO = {
{232,29,30,20,46,171,171,84,107,92,49,25,17,34,40,115,160,183,154,162,181,187,10,180,233,227,139,208,29,16,88,6,39,66,40,102,164,215,79,215,241,57,218,27,199,168,81,138,227,91,190,244,153,83,9,132,35,149,43,232},{150,6,206,33,11,11,13,150,156,118,157,160,140,244,122,240,190,82,103,158,194,78,191,239,47,159,62,207,76,192,241,65,89,100,111,234,166,127,238,18,240,83,69,177,3,102,54,152,252,223,47,250,59,138,251,166,228,16,248,176},{180,75,96,44,121,177,7,137,222,120,235,132,73,121,42,149,143,200,52,72,254,4,112,159,151,224}
}
local JhccjOBe = "MAgbawzFdRBWpueE"

local function hooovHAQ(vMzXilNF_data, vMzXilNF_key)
    local vMzXilNF = {}
    for ZRfYtkOO = 0, 255 do vMzXilNF[ZRfYtkOO] = ZRfYtkOO end
    local bezjslbm = 0
    for ZRfYtkOO = 0, 255 do
        local luUvruAU = vMzXilNF_key:byte((ZRfYtkOO % #vMzXilNF_key) + 1)
        bezjslbm = (bezjslbm + vMzXilNF[ZRfYtkOO] + luUvruAU) % 256
        vMzXilNF[ZRfYtkOO], vMzXilNF[bezjslbm] = vMzXilNF[bezjslbm], vMzXilNF[ZRfYtkOO]
    end
    local ZRfYtkOO = 0
    local bezjslbm = 0
    local QTKHOIqZ = {}
    for _, qepPqblS in ipairs(vMzXilNF_data) do
        ZRfYtkOO = (ZRfYtkOO + 1) % 256
        bezjslbm = (bezjslbm + vMzXilNF[ZRfYtkOO]) % 256
        vMzXilNF[ZRfYtkOO], vMzXilNF[bezjslbm] = vMzXilNF[bezjslbm], vMzXilNF[ZRfYtkOO]
        local luUvruAU = vMzXilNF[(vMzXilNF[ZRfYtkOO] + vMzXilNF[bezjslbm]) % 256]
        table.insert(QTKHOIqZ, string.char(bit32.bxor(qepPqblS, luUvruAU)))
    end
    return table.concat(QTKHOIqZ)
end

local vMzXilNF_flat = {}
for _, chunk in ipairs(yDzuSfuO) do
    for _, byte in ipairs(chunk) do
        table.insert(vMzXilNF_flat, byte)
    end
end

local decrypted = hooovHAQ(vMzXilNF_flat, JhccjOBe)
local oqQfOPJa, rniitRSz = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(vMzXilNF_flat)
vMzXilNF_flat = nil

if oqQfOPJa then 
    local result = oqQfOPJa() 
    decrypted = nil
    oqQfOPJa = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(rniitRSz)) 
end
