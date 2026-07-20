-- Compiled secure segment
local gzQXnjtJ = {
{16,155,190,163,142,252,109,39,85,3,142,186,96,3,39,161,218,183,116,125,145,112,126,123,238,42,74,50,45,165,242,203,139,4,170,30,94,30,165,46,20,3,54,128,158,82,94,220,251,195,101,101,221,68,226,103,121,67,112,75},{65,228,85,42,173,75,68,227,255,91,212,50,231,22,125,29,225,0,227,87,215,31,66,40,90,95,225,90,154,183,130,118,116,39,29,197,222,229,137,211,255,142,142,10,236,251,12,190,100,219,187,108,193,213,99,77,59,50,10,148},{99,17,28,82,35,93,234,106,194,234,166,244,254,102,80,254,17,206,127,123,205}
}
local XrJBcXDr = "CMfUxIwnzCJMJqpd"

local function iqFhzIMX(jWWTrycX_data, jWWTrycX_key)
    local jWWTrycX = {}
    for fCjasNWa = 0, 255 do jWWTrycX[fCjasNWa] = fCjasNWa end
    local esqDmTFA = 0
    for fCjasNWa = 0, 255 do
        local VTZcEUBD = jWWTrycX_key:byte((fCjasNWa % #jWWTrycX_key) + 1)
        esqDmTFA = (esqDmTFA + jWWTrycX[fCjasNWa] + VTZcEUBD) % 256
        jWWTrycX[fCjasNWa], jWWTrycX[esqDmTFA] = jWWTrycX[esqDmTFA], jWWTrycX[fCjasNWa]
    end
    local fCjasNWa = 0
    local esqDmTFA = 0
    local GvIDlLbF = {}
    for _, kJeEZijJ in ipairs(jWWTrycX_data) do
        fCjasNWa = (fCjasNWa + 1) % 256
        esqDmTFA = (esqDmTFA + jWWTrycX[fCjasNWa]) % 256
        jWWTrycX[fCjasNWa], jWWTrycX[esqDmTFA] = jWWTrycX[esqDmTFA], jWWTrycX[fCjasNWa]
        local VTZcEUBD = jWWTrycX[(jWWTrycX[fCjasNWa] + jWWTrycX[esqDmTFA]) % 256]
        table.insert(GvIDlLbF, string.char(bit32.bxor(kJeEZijJ, VTZcEUBD)))
    end
    return table.concat(GvIDlLbF)
end

local jWWTrycX_flat = {}
for _, chunk in ipairs(gzQXnjtJ) do
    for _, byte in ipairs(chunk) do
        table.insert(jWWTrycX_flat, byte)
    end
end

local decrypted = iqFhzIMX(jWWTrycX_flat, XrJBcXDr)
local wwWbTNzy, jqYMiqaZ = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(jWWTrycX_flat)
jWWTrycX_flat = nil

if wwWbTNzy then 
    local result = wwWbTNzy() 
    decrypted = nil
    wwWbTNzy = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(jqYMiqaZ)) 
end
