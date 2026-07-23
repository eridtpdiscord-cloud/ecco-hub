-- Protected Segment (network_optimizer)
local sfGrgtzh = 61
local dubVpMfm = {
{41,111,138,119,69,46,30,46,253,235,160,88,109,109,136,31,130,6,54,157,212,98,122,243,98,246,19,64,166,39,7,118,97,246,87,227,66,36,97,152,177,199,39,107,243,117,121,53,48,209,94,87,231,164,88,173,155,222,67,142},{234,131,91,215,95,209,49,92,147,98,4,204,42,98,62,101,163,255,162,33,83,234,191,9,3,210,216,6,92,173,20,211,173,28,31,28,24,94,192,215,74,145,58,195,60,201,48,85,163,193,16,78,117,84,203,84,163,95,189,198},{40,225,86,239,250,185,50,148,209,178,68,100,35,30,95,84,159,98,176,181,106,163,71,17,215,211,57,248,139}
}
local mUOLSWoC = "iVUaftNzoAiCxemd"

local function PgVsFzbh(mPyzvfSN_data, mPyzvfSN_key)
    if type(mPyzvfSN_key) ~= "string" or #mPyzvfSN_key == 0 then return "" end
    local mPyzvfSN = {}
    for jajmHTaC = 0, 255 do mPyzvfSN[jajmHTaC] = jajmHTaC end
    local dDgrrovN = 0
    for jajmHTaC = 0, 255 do
        local ozNplvod = mPyzvfSN_key:byte((jajmHTaC % #mPyzvfSN_key) + 1)
        dDgrrovN = (dDgrrovN + mPyzvfSN[jajmHTaC] + ozNplvod) % 256
        mPyzvfSN[jajmHTaC], mPyzvfSN[dDgrrovN] = mPyzvfSN[dDgrrovN], mPyzvfSN[jajmHTaC]
    end
    local jajmHTaC = 0
    local dDgrrovN = 0
    local EZUVnqRz = {}
    for _, niOLnFfs in ipairs(mPyzvfSN_data) do
        jajmHTaC = (jajmHTaC + 1) % 256
        dDgrrovN = (dDgrrovN + mPyzvfSN[jajmHTaC]) % 256
        mPyzvfSN[jajmHTaC], mPyzvfSN[dDgrrovN] = mPyzvfSN[dDgrrovN], mPyzvfSN[jajmHTaC]
        local ozNplvod = mPyzvfSN[(mPyzvfSN[jajmHTaC] + mPyzvfSN[dDgrrovN]) % 256]
        local unmasked = bit32.bxor(niOLnFfs, sfGrgtzh)
        table.insert(EZUVnqRz, string.char(bit32.bxor(unmasked, ozNplvod)))
    end
    return table.concat(EZUVnqRz)
end

local mPyzvfSN_flat = {}
for _, chunk in ipairs(dubVpMfm) do
    for _, byte in ipairs(chunk) do
        table.insert(mPyzvfSN_flat, byte)
    end
end

local decrypted = PgVsFzbh(mPyzvfSN_flat, mUOLSWoC)
local eucXLguk, SxzzHGFi = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(mPyzvfSN_flat)
mPyzvfSN_flat = nil

if eucXLguk then 
    local result = eucXLguk() 
    decrypted = nil
    eucXLguk = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(SxzzHGFi)) 
end
