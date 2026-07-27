-- Protected Segment (db)
local peScdTbw = 58
local mBdZjpGZ = {
{238,101,208,252,39,168,172,12,64,10,123,245,214,27,158,255,16,140,176,99,222,202,52,241,4,68,55,157,90,166,247,212,34,182,62,94,62,86,122,100,238,166,36,55,54,132,163,231,123,0,164,162,191,159,78,20,176,129,119,126},{235,139,68,135,49,39,30,182,183,184,185,219,3,238,50,47,74,76,128,113,24,133,29,246,153,83,111,241,143,8,130,71,97,214,88,42,139,148,159,208,27,167,204,131,118,144,33,15,194,168,51,75,27,250,107,58,246,145,230,194},{137,72,88,32,175,58,102,188,111,8,193,63,244,240,61,235,104,136,74,191,77,26,98,42,104,172,164,107,167,225,66,18,216,193,14,43,6,88,10,123,23,103,211,106,166,48,99,155,104,115,98,46,213,43,243,63,245,2,188,135},{79,220,239,98,107,50,195,246,143,38,215,6,79,150,182,166,179,88,182,56,22,52,66,28,253,217,7,91,245,160,72,218,84,108,122,216,180,159,0,84,1,21,249,154,203,87,108,128,104,111,177,139,112,38,57,194,1,88,247,199},{168,254,52,144,75,220,48,221,255,230,179,23,3,231,52,91,70,113,182,244,220,8,56,74,104,55,151,25,224,194,197,235,154,174,67,169,81,74,167,199,109,183,137,121,71,116,230,216,202,218,34,146,57,188,3,197,121,240,33,119},{166,10,207,90,193,172,91,191,94,172,173,50,101,172,224,190,249,89,199,72,109,42,99,176,135,59,159,107,161,116,243,50,101,134,215,166,61,77,12,16,122,122,240,57,220,197,245,169,187,250,75,29,18,250,191,122,99,94,152,25},{210,14,4,2,226,206,29,187,45,141,23,240,131,40,108,234,188,203,129,227,171,167,186,6,34,154,111,69,121,1,29,83,81,217,84,188,59,30,25,17,190,112,167,230,80,238,182,19,233,149,30,89,91,26,155,178,217,128,34,22},{165,126,99,140,252,4,23,112,186,158,157,194,40,85,190,132,167,115,192,169,43,219,123,198,245,207,61,53,206,90,146,188,169,25,147,150,252,224,216,160,45,175,167,136,253,104,212,223,188,95,240,238,136,202,193,117,36,80,8,145},{184,254,253,27,186}
}
local rDOVDSJY = "diGfwWumoxjvJERe"

local function AzkZCUQK(MTXqBIfx_data, MTXqBIfx_key)
    if type(MTXqBIfx_key) ~= "string" or #MTXqBIfx_key == 0 then return "" end
    local MTXqBIfx = {}
    for PuZlrNTg = 0, 255 do MTXqBIfx[PuZlrNTg] = PuZlrNTg end
    local iutGuemV = 0
    for PuZlrNTg = 0, 255 do
        local waIZbmXI = MTXqBIfx_key:byte((PuZlrNTg % #MTXqBIfx_key) + 1)
        iutGuemV = (iutGuemV + MTXqBIfx[PuZlrNTg] + waIZbmXI) % 256
        MTXqBIfx[PuZlrNTg], MTXqBIfx[iutGuemV] = MTXqBIfx[iutGuemV], MTXqBIfx[PuZlrNTg]
    end
    local PuZlrNTg = 0
    local iutGuemV = 0
    local lhZHIKfe = {}
    for _, pimamjVV in ipairs(MTXqBIfx_data) do
        PuZlrNTg = (PuZlrNTg + 1) % 256
        iutGuemV = (iutGuemV + MTXqBIfx[PuZlrNTg]) % 256
        MTXqBIfx[PuZlrNTg], MTXqBIfx[iutGuemV] = MTXqBIfx[iutGuemV], MTXqBIfx[PuZlrNTg]
        local waIZbmXI = MTXqBIfx[(MTXqBIfx[PuZlrNTg] + MTXqBIfx[iutGuemV]) % 256]
        local unmasked = bit32.bxor(pimamjVV, peScdTbw)
        table.insert(lhZHIKfe, string.char(bit32.bxor(unmasked, waIZbmXI)))
    end
    return table.concat(lhZHIKfe)
end

local MTXqBIfx_flat = {}
for _, chunk in ipairs(mBdZjpGZ) do
    for _, byte in ipairs(chunk) do
        table.insert(MTXqBIfx_flat, byte)
    end
end

local decrypted = AzkZCUQK(MTXqBIfx_flat, rDOVDSJY)
local mIaxIxhf, ozvFHTwy = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(MTXqBIfx_flat)
MTXqBIfx_flat = nil

if mIaxIxhf then 
    local result = mIaxIxhf() 
    decrypted = nil
    mIaxIxhf = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(ozvFHTwy)) 
end
