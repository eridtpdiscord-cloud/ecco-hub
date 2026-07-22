-- Protected Segment (db)
local eoTwmZfL = 71
local mfhdZsxB = {
{32,135,67,145,53,153,160,67,68,93,148,67,1,162,196,244,101,42,202,88,227,226,117,11,19,42,113,18,180,146,12,94,85,151,45,34,173,228,195,147,219,85,176,86,146,61,168,197,242,83,214,3,193,28,31,61,196,113,144,251},{253,180,48,135,18,180,138,186,243,89,103,245,64,130,15,68,255,240,228,23,25,103,41,35,156,73,204,187,209,179,156,173,63,197,193,98,59,115,198,101,189,249,234,207,217,211,2,142,63,227,205,63,26,80,106,168,132,182,126,197},{58,23,253,220,115,41,196,129,75,17,229,158,86,225,45,109,82,35,102,194,173,89,243,20,203,246,37,77,187,166,245,235,152,39,96,38,16,217,156,182,68,134,120,113,37,64,54,150,2,209,243,136,158,118,131,40,148,64,115,35},{83,242,105,160,74,238,202,39,93,11,54,194,93,88,238,18,242,131,103,55,43,173,9,9,171,130,84,202,146,167,113,215,192,192,120,93,53,66,105,94,49,41,2,74,188,136,180,87,66,197,195,85,194,55,229,160,39,55,168,162},{220,144,228,221,216,74,229,236,90,98,80,199,209,98,140,187,243,9,184,142,132,22,89,52,31,48,112,158,23,222,96,212,193,89,106,193,233,211,137,161,139,12,169,188,244,227,44,24,168,183,180,116,52,230,40,84,23,57,195,66},{28,8,217,175,146,113,65,190,200,248,83,178,170,115,250,10,248,55,127,136,87,38,158,31,156,8,113,56,232,1,219,19,147,160,104,110,158,161,79,87,231,81,190,177,207,84,137,134,211,252,236,207,30,211,238,201,182,241,30,101},{24,113,212,172,203,205,86,142,75,102,185,231,60,195,150,202,140,85,31,163,36,84,3,30,177,47,164,83,250,58,0,65,81,255,114,36,213,210,147,46,177,239,231,26,85,143}
}
local XEgkXWUS = "gRxBmYnZlyPpQMlD"

local function uZEGMgbn(jUuIsdxb_data, jUuIsdxb_key)
    local jUuIsdxb = {}
    for KTFjfHub = 0, 255 do jUuIsdxb[KTFjfHub] = KTFjfHub end
    local eQmJmNJu = 0
    for KTFjfHub = 0, 255 do
        local WEhictWp = jUuIsdxb_key:byte((KTFjfHub % #jUuIsdxb_key) + 1)
        eQmJmNJu = (eQmJmNJu + jUuIsdxb[KTFjfHub] + WEhictWp) % 256
        jUuIsdxb[KTFjfHub], jUuIsdxb[eQmJmNJu] = jUuIsdxb[eQmJmNJu], jUuIsdxb[KTFjfHub]
    end
    local KTFjfHub = 0
    local eQmJmNJu = 0
    local DrSFOhdb = {}
    for _, tfQZEPWy in ipairs(jUuIsdxb_data) do
        KTFjfHub = (KTFjfHub + 1) % 256
        eQmJmNJu = (eQmJmNJu + jUuIsdxb[KTFjfHub]) % 256
        jUuIsdxb[KTFjfHub], jUuIsdxb[eQmJmNJu] = jUuIsdxb[eQmJmNJu], jUuIsdxb[KTFjfHub]
        local WEhictWp = jUuIsdxb[(jUuIsdxb[KTFjfHub] + jUuIsdxb[eQmJmNJu]) % 256]
        local unmasked = bit32.bxor(tfQZEPWy, eoTwmZfL)
        table.insert(DrSFOhdb, string.char(bit32.bxor(unmasked, WEhictWp)))
    end
    return table.concat(DrSFOhdb)
end

local jUuIsdxb_flat = {}
for _, chunk in ipairs(mfhdZsxB) do
    for _, byte in ipairs(chunk) do
        table.insert(jUuIsdxb_flat, byte)
    end
end

local decrypted = uZEGMgbn(jUuIsdxb_flat, XEgkXWUS)
local RHnemadw, JdqGOiUt = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(jUuIsdxb_flat)
jUuIsdxb_flat = nil

if RHnemadw then 
    local result = RHnemadw() 
    decrypted = nil
    RHnemadw = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(JdqGOiUt)) 
end
