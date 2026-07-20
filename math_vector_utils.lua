-- Compiled secure segment
local ItuXThQO = {
{138,57,132,206,7,174,202,228,19,88,131,187,150,131,203,213,75,239,160,117,225,219,228,97,57,92,227,131,218,12,139,232,116,57,233,248,80,220,144,18,181,132,42,116,197,238,171,29,125,196,212,112,116,177,149,61,167,47,187,180},{209,45,201,199,129,133,39,74,63,149,222,206,120,99,60,108,19,21,6,114,123,252,211,111,86,137,29,117,101,251,173,34,255,66,163,58,161,82,121,163,114,233,7,95,100,154,237,4,193,9,84,82,5,71,82,74,183,33,95,76},{170,40,187,146,244,148,159,156,200,156,149,160,21,225,179,79,62,77,198,43,159,200,199,47,42,136,144,200,18}
}
local njDFZWnc = "ZvkFlZasvkZLbJUh"

local function jUUGJuUh(xzZtBbQp_data, xzZtBbQp_key)
    local xzZtBbQp = {}
    for JPjPmUYJ = 0, 255 do xzZtBbQp[JPjPmUYJ] = JPjPmUYJ end
    local iRcxlkPg = 0
    for JPjPmUYJ = 0, 255 do
        local KgJgoKdW = xzZtBbQp_key:byte((JPjPmUYJ % #xzZtBbQp_key) + 1)
        iRcxlkPg = (iRcxlkPg + xzZtBbQp[JPjPmUYJ] + KgJgoKdW) % 256
        xzZtBbQp[JPjPmUYJ], xzZtBbQp[iRcxlkPg] = xzZtBbQp[iRcxlkPg], xzZtBbQp[JPjPmUYJ]
    end
    local JPjPmUYJ = 0
    local iRcxlkPg = 0
    local UUYkopuu = {}
    for _, rsbkRwHO in ipairs(xzZtBbQp_data) do
        JPjPmUYJ = (JPjPmUYJ + 1) % 256
        iRcxlkPg = (iRcxlkPg + xzZtBbQp[JPjPmUYJ]) % 256
        xzZtBbQp[JPjPmUYJ], xzZtBbQp[iRcxlkPg] = xzZtBbQp[iRcxlkPg], xzZtBbQp[JPjPmUYJ]
        local KgJgoKdW = xzZtBbQp[(xzZtBbQp[JPjPmUYJ] + xzZtBbQp[iRcxlkPg]) % 256]
        table.insert(UUYkopuu, string.char(bit32.bxor(rsbkRwHO, KgJgoKdW)))
    end
    return table.concat(UUYkopuu)
end

local xzZtBbQp_flat = {}
for _, chunk in ipairs(ItuXThQO) do
    for _, byte in ipairs(chunk) do
        table.insert(xzZtBbQp_flat, byte)
    end
end

local decrypted = jUUGJuUh(xzZtBbQp_flat, njDFZWnc)
local MxkmOVpw, TqzHQdfs = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(xzZtBbQp_flat)
xzZtBbQp_flat = nil

if MxkmOVpw then 
    local result = MxkmOVpw() 
    decrypted = nil
    MxkmOVpw = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(TqzHQdfs)) 
end
