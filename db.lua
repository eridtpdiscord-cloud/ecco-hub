-- Protected Segment (db)
local lbvJVCCy = 249
local wCxwWHQP = {
{255,45,147,41,207,23,31,174,17,184,197,159,85,118,231,104,124,60,6,139,245,109,72,97,221,233,119,243,44,119,189,177,210,164,31,143,60,25,144,186,33,125,102,220,91,20,229,22,225,213,175,12,139,144,28,123,145,1,228,6},{225,145,88,123,154,210,171,141,7,48,209,165,147,5,201,87,20,135,161,66,92,47,127,99,25,100,100,54,181,110,232,13,115,72,227,167,20,241,220,104,195,27,253,165,231,205,110,205,35,206,31,22,61,186,29,13,204,8,186,112},{119,34,53,144,75,250,255,192,94,18,28,234,49,154,200,140,5,217,5,159,142,145,68,115,145,239,165,184,128,63,221,72,36,229,199,141,132,193,176,62,48,73,52,182,185,44,144,183,170,147,172,208,71,25,101,206,210,51,105,156},{245,254,150,91,231,215,203,73,96,137,96,209,157,74,237,227,17,121,212,137,83,48,254,141,116,224,106,81,159,210,184,221,55,76,216,239,42,92,146,159,218,49,219,54,95,197,185,83,145,37,21,10,162,127,79,238,114,214,197,1},{255,21,32,75,62,238,210,217,77,218,48,217,67,120,94,255,207,187,7,3,32,172,43,143,2,53,121,226,45,86,13,129,147,117,0,203,98,180,5,60,35,201,21,212,151,186,206,247,57,8,86,157,27,16,218,113,26,4,241,19},{141,242,36,26,60,27,168,210,108,54,183,244,14,23,39,251,100,75,234,45,25,85,147,173,65,204,129,194,174,151,72,204,108,4,167,28,27,174,168,143,148,203,156,173,107,50,236,19,255,113,127,213,134,129,47,134,16,171,101,223},{67,143,3,142,21,51,66,185,168,166,41,97,59,25,123,107,97,24,218,168,46,63,203,68,136,21,167,100,150,134,57,103,23,8,74,220,242,66,6,79,27,91,11}
}
local EbPUlFKJ = "QJYmMHOJIebeGDEl"

local function sDdQuFpN(UQxNUAjg_data, UQxNUAjg_key)
    local UQxNUAjg = {}
    for WzxfRwvT = 0, 255 do UQxNUAjg[WzxfRwvT] = WzxfRwvT end
    local TToZscLD = 0
    for WzxfRwvT = 0, 255 do
        local NuqFtYch = UQxNUAjg_key:byte((WzxfRwvT % #UQxNUAjg_key) + 1)
        TToZscLD = (TToZscLD + UQxNUAjg[WzxfRwvT] + NuqFtYch) % 256
        UQxNUAjg[WzxfRwvT], UQxNUAjg[TToZscLD] = UQxNUAjg[TToZscLD], UQxNUAjg[WzxfRwvT]
    end
    local WzxfRwvT = 0
    local TToZscLD = 0
    local PnqLrNMi = {}
    for _, BTOzBCdd in ipairs(UQxNUAjg_data) do
        WzxfRwvT = (WzxfRwvT + 1) % 256
        TToZscLD = (TToZscLD + UQxNUAjg[WzxfRwvT]) % 256
        UQxNUAjg[WzxfRwvT], UQxNUAjg[TToZscLD] = UQxNUAjg[TToZscLD], UQxNUAjg[WzxfRwvT]
        local NuqFtYch = UQxNUAjg[(UQxNUAjg[WzxfRwvT] + UQxNUAjg[TToZscLD]) % 256]
        local unmasked = bit32.bxor(BTOzBCdd, lbvJVCCy)
        table.insert(PnqLrNMi, string.char(bit32.bxor(unmasked, NuqFtYch)))
    end
    return table.concat(PnqLrNMi)
end

local UQxNUAjg_flat = {}
for _, chunk in ipairs(wCxwWHQP) do
    for _, byte in ipairs(chunk) do
        table.insert(UQxNUAjg_flat, byte)
    end
end

local decrypted = sDdQuFpN(UQxNUAjg_flat, EbPUlFKJ)
local JAvvufkD, oFMNeCTp = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(UQxNUAjg_flat)
UQxNUAjg_flat = nil

if JAvvufkD then 
    local result = JAvvufkD() 
    decrypted = nil
    JAvvufkD = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(oFMNeCTp)) 
end
