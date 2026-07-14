-- Compiled secure segment
local rcHpFlCQ = {
{122,187,120,167,33,82,22,230,194,189,47,43,93,214,160,170,66,38,33,175,30,19,118,203,130,219,99,107,86,61,191,210,118,34,122,229,144,141,124,74,17,232,31,127,139,18,219,103,181,3,71,143,187,127,95,75,188,115,156,186},{197,151,140,189,106,194,134,151,181,81,88,90,157,83,89,152,216,147,199,66,55,127,221,13,62,13,131,35,247,180,13,64,183,5,186,208,207,143,38,180,227,247,229,188,79,114,158,233,35,248,132,15,0,245,106,143,148,134,33,40},{10,47,112,246,0,110,139,63,37,179,162,75,121,70,12,161,211,85,105,226,68,35,3,240,205,215,192,185,64,95,48,193,75,93,10,146,128,213,170,253,154,84,0,205,158,74,226,178,6,158,68,236,32,98,160,138,3,240,105,216},{121,143,6,64,33,34,226,99,99,180,208,29,224,57,63,112,149,20,247,79,171,228,189,153,99,180,146,154,65,34,186,55,62,250,180,167,37,98,29,102,212,140,219,208,203,108,216,118,149,84,231,201,22,254,115,102}
}
local aSIQxicQ = "aTbshbgavyDjMfdJ"

local function iJPnQEwV(bWvxWVMZ_data, bWvxWVMZ_key)
    local bWvxWVMZ = {}
    for FigaycSl = 0, 255 do bWvxWVMZ[FigaycSl] = FigaycSl end
    local mzuJADKQ = 0
    for FigaycSl = 0, 255 do
        local jSmHxNhe = bWvxWVMZ_key:byte((FigaycSl % #bWvxWVMZ_key) + 1)
        mzuJADKQ = (mzuJADKQ + bWvxWVMZ[FigaycSl] + jSmHxNhe) % 256
        bWvxWVMZ[FigaycSl], bWvxWVMZ[mzuJADKQ] = bWvxWVMZ[mzuJADKQ], bWvxWVMZ[FigaycSl]
    end
    local FigaycSl = 0
    local mzuJADKQ = 0
    local jBYZLShN = {}
    for _, APVZfOEK in ipairs(bWvxWVMZ_data) do
        FigaycSl = (FigaycSl + 1) % 256
        mzuJADKQ = (mzuJADKQ + bWvxWVMZ[FigaycSl]) % 256
        bWvxWVMZ[FigaycSl], bWvxWVMZ[mzuJADKQ] = bWvxWVMZ[mzuJADKQ], bWvxWVMZ[FigaycSl]
        local jSmHxNhe = bWvxWVMZ[(bWvxWVMZ[FigaycSl] + bWvxWVMZ[mzuJADKQ]) % 256]
        table.insert(jBYZLShN, string.char(bit32.bxor(APVZfOEK, jSmHxNhe)))
    end
    return table.concat(jBYZLShN)
end

local bWvxWVMZ_flat = {}
for _, chunk in ipairs(rcHpFlCQ) do
    for _, byte in ipairs(chunk) do
        table.insert(bWvxWVMZ_flat, byte)
    end
end

local decrypted = iJPnQEwV(bWvxWVMZ_flat, aSIQxicQ)
local APkCOBrw, ACAmHlps = loadstring(decrypted)
if APkCOBrw then 
    return APkCOBrw() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(ACAmHlps)) 
end
