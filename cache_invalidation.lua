-- Protected Segment (cache_invalidation)
local TLxSSQsW = 7
local aZxTkSsY = {
{32,74,253,206,94,180,155,94,15,229,5,13,156,80,244,235,216,157,105,113,187,172,183,208,171,208,251,167,186,20,202,170,147,95,109,204,47,92,120,180,196,70,145,229,222,50,227,80,162,212,131,240,18,112,141,65,180,118,147,206},{168,28,237,101,147,8,206,80,225,123,186,100,2,25,98,201,152,41,144,94,140,128,248,37,5,196,27,202,56,125,86,114,236,196,209,8,211,173,244,141,125,15,188,235,143,170,52,102,171,221,152,102,155,70,103,10,75,84,167,187},{99,194,150,109,253,102,71,53,2,220,183,56,112,145,247,184,133,109,8,58,57,170,71,133,84,82,50,199,12,173}
}
local HaUcMPmZ = "mKKEilczVWHxAKfK"

local function BejePxmH(DufQVpkd_data, DufQVpkd_key)
    local DufQVpkd = {}
    for HNlMmYET = 0, 255 do DufQVpkd[HNlMmYET] = HNlMmYET end
    local DCJwqwTC = 0
    for HNlMmYET = 0, 255 do
        local WZObVYpL = DufQVpkd_key:byte((HNlMmYET % #DufQVpkd_key) + 1)
        DCJwqwTC = (DCJwqwTC + DufQVpkd[HNlMmYET] + WZObVYpL) % 256
        DufQVpkd[HNlMmYET], DufQVpkd[DCJwqwTC] = DufQVpkd[DCJwqwTC], DufQVpkd[HNlMmYET]
    end
    local HNlMmYET = 0
    local DCJwqwTC = 0
    local bOCynyEB = {}
    for _, mILaBfHD in ipairs(DufQVpkd_data) do
        HNlMmYET = (HNlMmYET + 1) % 256
        DCJwqwTC = (DCJwqwTC + DufQVpkd[HNlMmYET]) % 256
        DufQVpkd[HNlMmYET], DufQVpkd[DCJwqwTC] = DufQVpkd[DCJwqwTC], DufQVpkd[HNlMmYET]
        local WZObVYpL = DufQVpkd[(DufQVpkd[HNlMmYET] + DufQVpkd[DCJwqwTC]) % 256]
        local unmasked = bit32.bxor(mILaBfHD, TLxSSQsW)
        table.insert(bOCynyEB, string.char(bit32.bxor(unmasked, WZObVYpL)))
    end
    return table.concat(bOCynyEB)
end

local DufQVpkd_flat = {}
for _, chunk in ipairs(aZxTkSsY) do
    for _, byte in ipairs(chunk) do
        table.insert(DufQVpkd_flat, byte)
    end
end

local decrypted = BejePxmH(DufQVpkd_flat, HaUcMPmZ)
local pGpxTzzA, FbsDgKJW = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(DufQVpkd_flat)
DufQVpkd_flat = nil

if pGpxTzzA then 
    local result = pGpxTzzA() 
    decrypted = nil
    pGpxTzzA = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(FbsDgKJW)) 
end
