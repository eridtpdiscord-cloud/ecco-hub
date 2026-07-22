-- Protected Segment (teleport_handler)
local iLvWvbnK = 81
local bmijnUyT = {
{202,87,86,18,223,164,94,213,129,209,83,89,35,80,39,175,217,163,60,238,142,144,160,2,212,236,241,109,89,193,171,24,77,54,65,78,227,173,5,201,33,129,67,4,120,76,22,112,167,109,17,144,165,137,152,225,89,155,151,12},{212,196,230,164,128,245,49,18,85,85,163,9,240,99,139,10,35,93,108,220,153,129,43,120,191,69,137,231,102,233,253,235,10,134,125,127,111,253,90,24,65,1,50,72,159,113,166,225,251,9,254,82,126,110,208,169,201,89,35,81},{222,164,177,146,156,137,64,73,237,3,152,66,115,107,219,83,110,135,133,17,51,131,233,212,85,7,233,194}
}
local yMNGnSvp = "bOaLnBuyEAKZlruH"

local function UUgciqtb(idteBUwL_data, idteBUwL_key)
    local idteBUwL = {}
    for KMTrUFpj = 0, 255 do idteBUwL[KMTrUFpj] = KMTrUFpj end
    local YmtCrcSf = 0
    for KMTrUFpj = 0, 255 do
        local cWgJYYjH = idteBUwL_key:byte((KMTrUFpj % #idteBUwL_key) + 1)
        YmtCrcSf = (YmtCrcSf + idteBUwL[KMTrUFpj] + cWgJYYjH) % 256
        idteBUwL[KMTrUFpj], idteBUwL[YmtCrcSf] = idteBUwL[YmtCrcSf], idteBUwL[KMTrUFpj]
    end
    local KMTrUFpj = 0
    local YmtCrcSf = 0
    local HcVJzmpx = {}
    for _, VZcLdehp in ipairs(idteBUwL_data) do
        KMTrUFpj = (KMTrUFpj + 1) % 256
        YmtCrcSf = (YmtCrcSf + idteBUwL[KMTrUFpj]) % 256
        idteBUwL[KMTrUFpj], idteBUwL[YmtCrcSf] = idteBUwL[YmtCrcSf], idteBUwL[KMTrUFpj]
        local cWgJYYjH = idteBUwL[(idteBUwL[KMTrUFpj] + idteBUwL[YmtCrcSf]) % 256]
        local unmasked = bit32.bxor(VZcLdehp, iLvWvbnK)
        table.insert(HcVJzmpx, string.char(bit32.bxor(unmasked, cWgJYYjH)))
    end
    return table.concat(HcVJzmpx)
end

local idteBUwL_flat = {}
for _, chunk in ipairs(bmijnUyT) do
    for _, byte in ipairs(chunk) do
        table.insert(idteBUwL_flat, byte)
    end
end

local decrypted = UUgciqtb(idteBUwL_flat, yMNGnSvp)
local DxJksgpg, mMhjrpNq = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(idteBUwL_flat)
idteBUwL_flat = nil

if DxJksgpg then 
    local result = DxJksgpg() 
    decrypted = nil
    DxJksgpg = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(mMhjrpNq)) 
end
