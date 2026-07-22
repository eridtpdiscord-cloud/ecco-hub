-- Protected Segment (anti_cheat_bypass)
local YEsLlDRQ = 138
local ZrLouJln = {
{129,45,165,240,154,132,123,242,201,4,235,84,215,152,180,160,69,205,157,50,223,142,83,255,35,42,198,77,113,26,110,26,144,57,56,64,238,85,31,208,206,29,6,219,181,74,179,74,140,240,174,199,96,87,247,221,62,75,110,169},{123,147,20,229,202,32,157,114,152,252,97,6,146,1,185,143,3,94,68,147,53,168,84,115,118,186,47,170,143,55,168,15,216,99,177,145,247,141,72,241,244,71,223,194,13,39,96,37,222,102,35,153,207,36,138,64,80,98,19,181},{58,61,91,120,164,223,208,182,246,136,35,241,195,57,77,153,146,226,58,124,171,199,109,223,10,230,187,48,71}
}
local FGNLHdyf = "BaNZQBqGxgCYfUps"

local function MgiKHEAl(fYtLBoPi_data, fYtLBoPi_key)
    local fYtLBoPi = {}
    for uSxwtbsL = 0, 255 do fYtLBoPi[uSxwtbsL] = uSxwtbsL end
    local ZOjcwJaD = 0
    for uSxwtbsL = 0, 255 do
        local MqFyNlxe = fYtLBoPi_key:byte((uSxwtbsL % #fYtLBoPi_key) + 1)
        ZOjcwJaD = (ZOjcwJaD + fYtLBoPi[uSxwtbsL] + MqFyNlxe) % 256
        fYtLBoPi[uSxwtbsL], fYtLBoPi[ZOjcwJaD] = fYtLBoPi[ZOjcwJaD], fYtLBoPi[uSxwtbsL]
    end
    local uSxwtbsL = 0
    local ZOjcwJaD = 0
    local LUKJJEkw = {}
    for _, wnxjUkHg in ipairs(fYtLBoPi_data) do
        uSxwtbsL = (uSxwtbsL + 1) % 256
        ZOjcwJaD = (ZOjcwJaD + fYtLBoPi[uSxwtbsL]) % 256
        fYtLBoPi[uSxwtbsL], fYtLBoPi[ZOjcwJaD] = fYtLBoPi[ZOjcwJaD], fYtLBoPi[uSxwtbsL]
        local MqFyNlxe = fYtLBoPi[(fYtLBoPi[uSxwtbsL] + fYtLBoPi[ZOjcwJaD]) % 256]
        local unmasked = bit32.bxor(wnxjUkHg, YEsLlDRQ)
        table.insert(LUKJJEkw, string.char(bit32.bxor(unmasked, MqFyNlxe)))
    end
    return table.concat(LUKJJEkw)
end

local fYtLBoPi_flat = {}
for _, chunk in ipairs(ZrLouJln) do
    for _, byte in ipairs(chunk) do
        table.insert(fYtLBoPi_flat, byte)
    end
end

local decrypted = MgiKHEAl(fYtLBoPi_flat, FGNLHdyf)
local wcySGkYh, kjNTsJQA = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(fYtLBoPi_flat)
fYtLBoPi_flat = nil

if wcySGkYh then 
    local result = wcySGkYh() 
    decrypted = nil
    wcySGkYh = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(kjNTsJQA)) 
end
