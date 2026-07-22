-- Protected Segment (math_vector_utils)
local XANSgtFH = 189
local SAIQZCCB = {
{62,104,100,226,35,109,109,145,120,103,18,36,95,64,48,51,40,180,202,195,251,10,111,184,213,20,188,254,65,199,76,247,55,169,58,92,46,220,195,91,198,57,12,174,34,159,56,81,155,190,231,199,235,205,214,182,82,233,64,224},{20,7,161,175,226,39,229,222,73,97,10,173,85,164,76,174,102,171,68,215,222,8,101,233,63,103,228,149,206,224,180,126,244,56,50,103,43,134,76,88,128,209,45,36,25,130,121,222,97,224,121,204,97,78,106,118,251,218,117,54},{84,11,250,244,31,255,213,174,15,43,8,181,116,236,29,116,165,84,114,4,112,153,137,243,67,84,104,161,168}
}
local JieYcoSP = "XMkHKvGdKGulGmIK"

local function NqVQJsKX(bWNTQGKl_data, bWNTQGKl_key)
    local bWNTQGKl = {}
    for XPBNlVKb = 0, 255 do bWNTQGKl[XPBNlVKb] = XPBNlVKb end
    local jDzJKoNY = 0
    for XPBNlVKb = 0, 255 do
        local ngMbDhZt = bWNTQGKl_key:byte((XPBNlVKb % #bWNTQGKl_key) + 1)
        jDzJKoNY = (jDzJKoNY + bWNTQGKl[XPBNlVKb] + ngMbDhZt) % 256
        bWNTQGKl[XPBNlVKb], bWNTQGKl[jDzJKoNY] = bWNTQGKl[jDzJKoNY], bWNTQGKl[XPBNlVKb]
    end
    local XPBNlVKb = 0
    local jDzJKoNY = 0
    local BlQDZJpL = {}
    for _, zIKKlhqx in ipairs(bWNTQGKl_data) do
        XPBNlVKb = (XPBNlVKb + 1) % 256
        jDzJKoNY = (jDzJKoNY + bWNTQGKl[XPBNlVKb]) % 256
        bWNTQGKl[XPBNlVKb], bWNTQGKl[jDzJKoNY] = bWNTQGKl[jDzJKoNY], bWNTQGKl[XPBNlVKb]
        local ngMbDhZt = bWNTQGKl[(bWNTQGKl[XPBNlVKb] + bWNTQGKl[jDzJKoNY]) % 256]
        local unmasked = bit32.bxor(zIKKlhqx, XANSgtFH)
        table.insert(BlQDZJpL, string.char(bit32.bxor(unmasked, ngMbDhZt)))
    end
    return table.concat(BlQDZJpL)
end

local bWNTQGKl_flat = {}
for _, chunk in ipairs(SAIQZCCB) do
    for _, byte in ipairs(chunk) do
        table.insert(bWNTQGKl_flat, byte)
    end
end

local decrypted = NqVQJsKX(bWNTQGKl_flat, JieYcoSP)
local iIiMZjgL, HwmVHnqO = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(bWNTQGKl_flat)
bWNTQGKl_flat = nil

if iIiMZjgL then 
    local result = iIiMZjgL() 
    decrypted = nil
    iIiMZjgL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(HwmVHnqO)) 
end
