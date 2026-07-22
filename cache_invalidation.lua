-- Protected Segment (cache_invalidation)
local YebNhuxq = 98
local oLvhMwmg = {
{46,79,71,247,193,162,62,60,254,189,163,95,62,8,176,158,111,3,212,147,19,68,240,178,80,212,235,141,223,61,54,28,70,102,81,204,118,248,139,5,252,222,111,95,17,112,167,96,72,109,114,78,98,10,13,153,45,226,217,158},{103,70,237,178,205,168,119,129,85,188,224,209,0,40,134,116,38,48,163,6,21,36,236,171,222,64,223,66,174,29,95,194,39,252,200,71,214,222,31,5,15,167,31,185,209,57,70,124,18,29,226,20,159,164,197,47,143,145,234,53},{119,96,72,137,191,99,6,220,206,96,74,181,81,141,151,95,239,30,185,11,181,84,26,116,149,118,31,158,174,164}
}
local CgHuNPkM = "RxpHtHuxsbpUOuoU"

local function BGlHBGQF(RpsTsZpA_data, RpsTsZpA_key)
    local RpsTsZpA = {}
    for HTOyiwJU = 0, 255 do RpsTsZpA[HTOyiwJU] = HTOyiwJU end
    local fhrognhZ = 0
    for HTOyiwJU = 0, 255 do
        local PJKhgTFf = RpsTsZpA_key:byte((HTOyiwJU % #RpsTsZpA_key) + 1)
        fhrognhZ = (fhrognhZ + RpsTsZpA[HTOyiwJU] + PJKhgTFf) % 256
        RpsTsZpA[HTOyiwJU], RpsTsZpA[fhrognhZ] = RpsTsZpA[fhrognhZ], RpsTsZpA[HTOyiwJU]
    end
    local HTOyiwJU = 0
    local fhrognhZ = 0
    local FKZHbrXS = {}
    for _, auKajXFJ in ipairs(RpsTsZpA_data) do
        HTOyiwJU = (HTOyiwJU + 1) % 256
        fhrognhZ = (fhrognhZ + RpsTsZpA[HTOyiwJU]) % 256
        RpsTsZpA[HTOyiwJU], RpsTsZpA[fhrognhZ] = RpsTsZpA[fhrognhZ], RpsTsZpA[HTOyiwJU]
        local PJKhgTFf = RpsTsZpA[(RpsTsZpA[HTOyiwJU] + RpsTsZpA[fhrognhZ]) % 256]
        local unmasked = bit32.bxor(auKajXFJ, YebNhuxq)
        table.insert(FKZHbrXS, string.char(bit32.bxor(unmasked, PJKhgTFf)))
    end
    return table.concat(FKZHbrXS)
end

local RpsTsZpA_flat = {}
for _, chunk in ipairs(oLvhMwmg) do
    for _, byte in ipairs(chunk) do
        table.insert(RpsTsZpA_flat, byte)
    end
end

local decrypted = BGlHBGQF(RpsTsZpA_flat, CgHuNPkM)
local kvyAkZig, GQicSRkc = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(RpsTsZpA_flat)
RpsTsZpA_flat = nil

if kvyAkZig then 
    local result = kvyAkZig() 
    decrypted = nil
    kvyAkZig = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(GQicSRkc)) 
end
