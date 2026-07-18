-- Compiled secure segment
local YJxpFUDC = {
{135,73,42,69,228,200,156,62,224,45,215,45,143,105,186,190,14,196,233,145,99,49,139,198,251,227,66,211,62,57,1,99,12,5,191,26,183,53,229,41,68,255,85,234,31,138,210,54,117,177,154,129,218,5,248,39,189,137,207,168},{158,132,84,189,125,193,184,45,119,130,213,246,59,202,107,104,161,248,209,168,60,21,35,89,83,63,252,35,83,15,99,4,85,147,157,62,210,199,99,232,129,45,212,62,64,88,66,181,219,43,135,190,8,113,253,142,209,178,140,184},{76,125,189,95,196,139,206,164,169,101,40,58,46,170,119,53,159,215,212,217,14,18,251,207,241,66,14,60,125,255,23,54,0,18,68,30,166,73,20,37,25,18,164,27,53,15,151,28,27,214,247,179,208,72,64,160,14,31,208,102},{85,92,146,149,234,114,62,204,25,205,12,49,167,165,83,59,226,5,197,103,231,190,78,150,183,110,11,6,189,140,236,51,195,17,202,137,128,119,223,42,209,152,1,160,121,245,188,231,16,41,233,65,84,175,99,101,136,108,37,87},{181,45,7,34,27,146,117,226,232,173,164,80,4,4,253,229,168,127,34,187,143,140,99,104,174,188,219,101,30,215,56,165,122,149,167,98,80,114,168,164,190,24,102,93,32,77,209,73,155,150,189,197,26,110,42,236,215,117,235,16},{106,114,35,45,141,103,254,148,180,186,181,244,34,143,179,234,222,64,153,51,35,181,2,143,16,97,122,144,50,51,195,8,75,183,63,122,75,118,83,20,16,253,82,64,92,96,7,136,44,247,223,35,33,56,81,49,19,213,122,117},{216,211,141,222,115,243,104,202,133,202,69,30,41,168,44,204,195,148,177,61,112,135,214,226,93,216,230,154,215,69,36,207,217,71,254,12,201,5,114,148,46,31,74,152,56,76,163,227,100,250,12,158,61,105,213,31,155,20,78,240},{179,79,17,202,115,112,158,61,86,234,237,52,48,140,173,126,18,198,97,248,84,177}
}
local DcTxyYuX = "LWzlUURMfSMMJxwT"

local function VMdOZQrB(TvgNeEKT_data, TvgNeEKT_key)
    local TvgNeEKT = {}
    for MjYiBuQs = 0, 255 do TvgNeEKT[MjYiBuQs] = MjYiBuQs end
    local nbyXEuqE = 0
    for MjYiBuQs = 0, 255 do
        local GNghvbqv = TvgNeEKT_key:byte((MjYiBuQs % #TvgNeEKT_key) + 1)
        nbyXEuqE = (nbyXEuqE + TvgNeEKT[MjYiBuQs] + GNghvbqv) % 256
        TvgNeEKT[MjYiBuQs], TvgNeEKT[nbyXEuqE] = TvgNeEKT[nbyXEuqE], TvgNeEKT[MjYiBuQs]
    end
    local MjYiBuQs = 0
    local nbyXEuqE = 0
    local bYDmesUU = {}
    for _, mFsYjnYo in ipairs(TvgNeEKT_data) do
        MjYiBuQs = (MjYiBuQs + 1) % 256
        nbyXEuqE = (nbyXEuqE + TvgNeEKT[MjYiBuQs]) % 256
        TvgNeEKT[MjYiBuQs], TvgNeEKT[nbyXEuqE] = TvgNeEKT[nbyXEuqE], TvgNeEKT[MjYiBuQs]
        local GNghvbqv = TvgNeEKT[(TvgNeEKT[MjYiBuQs] + TvgNeEKT[nbyXEuqE]) % 256]
        table.insert(bYDmesUU, string.char(bit32.bxor(mFsYjnYo, GNghvbqv)))
    end
    return table.concat(bYDmesUU)
end

local TvgNeEKT_flat = {}
for _, chunk in ipairs(YJxpFUDC) do
    for _, byte in ipairs(chunk) do
        table.insert(TvgNeEKT_flat, byte)
    end
end

local decrypted = VMdOZQrB(TvgNeEKT_flat, DcTxyYuX)
local BejasPmb, vnHHBOtm = loadstring(decrypted)
if BejasPmb then 
    return BejasPmb() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(vnHHBOtm)) 
end
