-- Protected Segment (network_optimizer)
local yuRlCWXx = 56
local BeNQzvYi = {
{117,236,153,255,176,127,207,94,119,219,190,213,122,205,61,185,226,255,105,18,112,139,159,67,67,113,64,63,8,175,154,26,96,215,8,0,132,219,91,152,100,56,77,119,219,222,126,44,24,124,73,248,156,253,7,127,40,109,240,68},{251,216,138,239,206,253,178,21,101,9,68,82,65,139,197,143,56,92,159,97,117,19,19,126,254,176,113,3,225,126,75,116,221,208,118,211,249,144,41,203,213,179,133,234,1,72,120,104,167,180,246,26,45,246,133,71,11,147,224,51},{197,208,184,51,254,110,67,87,178,239,203,1,252,9,80,73,145,148,86,97,116,199,98,69,1,241,169,240,144}
}
local tbjQslZU = "XzsMdpeRtKTlMTjc"

local function xuDXNbtW(paTpkeHB_data, paTpkeHB_key)
    local paTpkeHB = {}
    for yOjhRGuh = 0, 255 do paTpkeHB[yOjhRGuh] = yOjhRGuh end
    local ZsHvUagz = 0
    for yOjhRGuh = 0, 255 do
        local vEKDLKIK = paTpkeHB_key:byte((yOjhRGuh % #paTpkeHB_key) + 1)
        ZsHvUagz = (ZsHvUagz + paTpkeHB[yOjhRGuh] + vEKDLKIK) % 256
        paTpkeHB[yOjhRGuh], paTpkeHB[ZsHvUagz] = paTpkeHB[ZsHvUagz], paTpkeHB[yOjhRGuh]
    end
    local yOjhRGuh = 0
    local ZsHvUagz = 0
    local RzIVkEaS = {}
    for _, UXohrQQT in ipairs(paTpkeHB_data) do
        yOjhRGuh = (yOjhRGuh + 1) % 256
        ZsHvUagz = (ZsHvUagz + paTpkeHB[yOjhRGuh]) % 256
        paTpkeHB[yOjhRGuh], paTpkeHB[ZsHvUagz] = paTpkeHB[ZsHvUagz], paTpkeHB[yOjhRGuh]
        local vEKDLKIK = paTpkeHB[(paTpkeHB[yOjhRGuh] + paTpkeHB[ZsHvUagz]) % 256]
        local unmasked = bit32.bxor(UXohrQQT, yuRlCWXx)
        table.insert(RzIVkEaS, string.char(bit32.bxor(unmasked, vEKDLKIK)))
    end
    return table.concat(RzIVkEaS)
end

local paTpkeHB_flat = {}
for _, chunk in ipairs(BeNQzvYi) do
    for _, byte in ipairs(chunk) do
        table.insert(paTpkeHB_flat, byte)
    end
end

local decrypted = xuDXNbtW(paTpkeHB_flat, tbjQslZU)
local JnusBfGZ, klxbMjkw = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(paTpkeHB_flat)
paTpkeHB_flat = nil

if JnusBfGZ then 
    local result = JnusBfGZ() 
    decrypted = nil
    JnusBfGZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(klxbMjkw)) 
end
