-- Protected Segment (db)
local iqQzPgBk = 67
local hHwPKGJZ = {
{123,150,162,163,136,221,232,178,254,140,75,101,66,181,224,145,219,41,225,105,10,213,162,5,68,225,109,179,202,11,49,216,201,2,194,240,107,204,43,86,20,1,71,58,215,167,142,165,153,11,229,164,60,3,166,131,158,64,122,81},{97,131,238,86,78,101,158,53,43,146,153,100,5,11,76,195,150,35,170,0,69,161,120,137,61,209,249,240,188,206,88,9,99,165,103,183,98,77,164,94,96,188,171,192,242,171,108,78,43,217,50,37,196,174,0,60,177,156,194,201},{155,148,127,18,127,100,119,238,148,147,247,8,3,234,116,62,234,139,88,149,142,195,93,63,51,177,55,148,191,121,69,135,84,16,71,117,66,234,156,38,150,194,207,8,70,118,88,1,77,235,110,109,218,174,48,249,198,36,124,66},{80,175,119,78,50,147,137,231,112,119,167,73,176,204,13,129,74,39,85,15,116,164,213,215,18,119,50,120,180,254,241,161,205,38,180,56,178,30,140,246,76,50,190,27,217,128,29,82,68,19,203,251,214,217,247,148,86,120,156,21},{125,134,71,158,213,158,230,35,124,33,192,201,79,104,239,192,62,29,0,128,64,128,167,95,11,181,100,206,106,96,130,238,215,147,128,137,15,246,7,238,238,72,9,45,54,155,82,145,162,246,87,244,118,186,41,166,13,162,25,70},{78,101,234,109,191,125,34,242,196,235,27,169,203,7,236,129,44,168,129,3,220,13,125,77,216,231,172,225,234,142,234,17,105,81,97,141,1,201,177,66,92,101,34,63,27,34,51,206,196,188,2,216,187,160,222,120,138,50,229,182},{83,105,91,46,139,188,106,247,135,222,63,205,124,80,105,105,255,47,207,107,89,203,124,136,62,111,85,223,59,194,38,146,242,244,115,80,251,100,253,182,39,18,135,0,251,103,114,204,144,213,176,213,96,216,180,103,113,157,48,56},{0,41,177,38,24,136,82,50,219,29,26,106,98,185,199,0,44,116,241,75,104,85,218,70,173,233,163,134,9,49,125,144,233,41,56,124,46,89,238,228,168,4,6,6,42,236,146,96,85,216,138,7,238,86,214,219,164,178,125,9}
}
local vntFITyj = "nQNdgOiVVcSByTuq"

local function ioQLmSWM(AFEOKqTb_data, AFEOKqTb_key)
    local AFEOKqTb = {}
    for AISNaEjT = 0, 255 do AFEOKqTb[AISNaEjT] = AISNaEjT end
    local sLuDLncE = 0
    for AISNaEjT = 0, 255 do
        local zgBDiCyE = AFEOKqTb_key:byte((AISNaEjT % #AFEOKqTb_key) + 1)
        sLuDLncE = (sLuDLncE + AFEOKqTb[AISNaEjT] + zgBDiCyE) % 256
        AFEOKqTb[AISNaEjT], AFEOKqTb[sLuDLncE] = AFEOKqTb[sLuDLncE], AFEOKqTb[AISNaEjT]
    end
    local AISNaEjT = 0
    local sLuDLncE = 0
    local bGxDudZW = {}
    for _, BOLwCusg in ipairs(AFEOKqTb_data) do
        AISNaEjT = (AISNaEjT + 1) % 256
        sLuDLncE = (sLuDLncE + AFEOKqTb[AISNaEjT]) % 256
        AFEOKqTb[AISNaEjT], AFEOKqTb[sLuDLncE] = AFEOKqTb[sLuDLncE], AFEOKqTb[AISNaEjT]
        local zgBDiCyE = AFEOKqTb[(AFEOKqTb[AISNaEjT] + AFEOKqTb[sLuDLncE]) % 256]
        local unmasked = bit32.bxor(BOLwCusg, iqQzPgBk)
        table.insert(bGxDudZW, string.char(bit32.bxor(unmasked, zgBDiCyE)))
    end
    return table.concat(bGxDudZW)
end

local AFEOKqTb_flat = {}
for _, chunk in ipairs(hHwPKGJZ) do
    for _, byte in ipairs(chunk) do
        table.insert(AFEOKqTb_flat, byte)
    end
end

local decrypted = ioQLmSWM(AFEOKqTb_flat, vntFITyj)
local YHShOeqe, rVhsyjWq = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(AFEOKqTb_flat)
AFEOKqTb_flat = nil

if YHShOeqe then 
    local result = YHShOeqe() 
    decrypted = nil
    YHShOeqe = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(rVhsyjWq)) 
end
