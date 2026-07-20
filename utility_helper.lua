-- Compiled secure segment
local TkznkLKl = {
{201,222,145,180,150,152,65,218,0,173,169,249,76,40,123,177,225,56,231,242,201,125,8,71,24,124,65,111,143,210,136,2,117,180,126,132,4,203,130,200,108,190,221,143,86,129,140,79,9,76,232,36,180,101,29,8,141,97,1,206},{168,59,138,52,212,167,186,68,212,150,152,180,215,45,255,38,216,176,202,90,42,182,161,112,92,147,204,155,73,1,114,138,16,17,177,115,247,122,152,237,73,75,41,81,19,2,191,134,153,203,38,139,21,233,213,212,200,128,149,241},{33,196,26,108,129,52,157,115,77,107,147,255,45,126,238,121,175,210,46,109,30,246,229,206,66,138}
}
local tAcwUSTy = "jlMoYmKgbOvUTCPo"

local function wWbSkaeE(SDwccPzy_data, SDwccPzy_key)
    local SDwccPzy = {}
    for HQfkcUxf = 0, 255 do SDwccPzy[HQfkcUxf] = HQfkcUxf end
    local cIXBkKfe = 0
    for HQfkcUxf = 0, 255 do
        local grmPfLjX = SDwccPzy_key:byte((HQfkcUxf % #SDwccPzy_key) + 1)
        cIXBkKfe = (cIXBkKfe + SDwccPzy[HQfkcUxf] + grmPfLjX) % 256
        SDwccPzy[HQfkcUxf], SDwccPzy[cIXBkKfe] = SDwccPzy[cIXBkKfe], SDwccPzy[HQfkcUxf]
    end
    local HQfkcUxf = 0
    local cIXBkKfe = 0
    local QGcZunCj = {}
    for _, HqmbuRtr in ipairs(SDwccPzy_data) do
        HQfkcUxf = (HQfkcUxf + 1) % 256
        cIXBkKfe = (cIXBkKfe + SDwccPzy[HQfkcUxf]) % 256
        SDwccPzy[HQfkcUxf], SDwccPzy[cIXBkKfe] = SDwccPzy[cIXBkKfe], SDwccPzy[HQfkcUxf]
        local grmPfLjX = SDwccPzy[(SDwccPzy[HQfkcUxf] + SDwccPzy[cIXBkKfe]) % 256]
        table.insert(QGcZunCj, string.char(bit32.bxor(HqmbuRtr, grmPfLjX)))
    end
    return table.concat(QGcZunCj)
end

local SDwccPzy_flat = {}
for _, chunk in ipairs(TkznkLKl) do
    for _, byte in ipairs(chunk) do
        table.insert(SDwccPzy_flat, byte)
    end
end

local decrypted = wWbSkaeE(SDwccPzy_flat, tAcwUSTy)
local TAYgVRdI, creAIhqg = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(SDwccPzy_flat)
SDwccPzy_flat = nil

if TAYgVRdI then 
    local result = TAYgVRdI() 
    decrypted = nil
    TAYgVRdI = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(creAIhqg)) 
end
