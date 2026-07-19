-- Compiled secure segment
local mFRsOofp = {
{57,170,161,0,235,148,204,215,103,151,182,51,167,109,170,174,176,207,188,145,99,253,171,232,205,201,196,93,174,22,132,212,74,156,85,24,153,238,7,176,36,23,139,129,170,159,139,110,94,112,47,109,216,178,227,94,214,122,177,236},{253,212,170,248,177,60,247,58,23,193,172,146,38,209,221,138,97,160,101,98,35,161,246,54,113,76,83,112,148,49,109,187,69,90,108,216,28,119,25,113,50,16,162,75,120,197,95,34,90,12,108,238,17,132,181,7,167,197,215,182},{76,116,39,64,118,64,53,28,225,6,176,136,7,253,126,78,82,147,232,116,15,35,58,119,114,12,169,0,62,253,247,167,56,232,16,47,109,128,59,8,210,77,100,221,122,58,27,77,39,30,159,210,248,17,105,226,26,217,38,219},{213,191,103,10,87,129,64,52,113,186,240,254,111,172,215,251,33,22,87,109,11,9,175,192,35,119,230,18,30,219,73,124,111,162,48,137,121,101,173,45,163,122,244,40,225,4,238,215,50,74,246,45,67,207,31,102,10,18,171,162},{133,38,7,219,41,53,119,38,108,101,173,29,27,226,139,108,39,131,251,6,13,239,151,228,239,230,52,204,71,114,20,147,73,190,175,245,32,30,209,194,50,70,255,128,68,216,58,87,230,216,43,74,216,152,131,209,53,48,78,86},{18,126,224,146,18,179,104,255,41,76,230,250,128,244,23,227,245,147,238,211,188,157,2,8,8,47,102,242,81,161,127,118,169,84,187,111,234,193,92,247,81,124,32,108,236,194,249,222,72,64,211,44,17,76,21,86,33,212,99,224},{124,80,188,109,84,36,152,113,0,27,221,3,227,218,68,251,135,137,167,222,109,84,25,75,148,111,167,229,63,62,85,85,250,96,221,52,180,251,99,121,18,57,176,74,112,191,99,125}
}
local HhPfVwgf = "XPwsvEbkxmaqCYvs"

local function UjJKmRIs(rQrNOsrn_data, rQrNOsrn_key)
    local rQrNOsrn = {}
    for ZQuqjYZl = 0, 255 do rQrNOsrn[ZQuqjYZl] = ZQuqjYZl end
    local OzfKOxCH = 0
    for ZQuqjYZl = 0, 255 do
        local GviZesdz = rQrNOsrn_key:byte((ZQuqjYZl % #rQrNOsrn_key) + 1)
        OzfKOxCH = (OzfKOxCH + rQrNOsrn[ZQuqjYZl] + GviZesdz) % 256
        rQrNOsrn[ZQuqjYZl], rQrNOsrn[OzfKOxCH] = rQrNOsrn[OzfKOxCH], rQrNOsrn[ZQuqjYZl]
    end
    local ZQuqjYZl = 0
    local OzfKOxCH = 0
    local CzFJYfuR = {}
    for _, XCDkiUqS in ipairs(rQrNOsrn_data) do
        ZQuqjYZl = (ZQuqjYZl + 1) % 256
        OzfKOxCH = (OzfKOxCH + rQrNOsrn[ZQuqjYZl]) % 256
        rQrNOsrn[ZQuqjYZl], rQrNOsrn[OzfKOxCH] = rQrNOsrn[OzfKOxCH], rQrNOsrn[ZQuqjYZl]
        local GviZesdz = rQrNOsrn[(rQrNOsrn[ZQuqjYZl] + rQrNOsrn[OzfKOxCH]) % 256]
        table.insert(CzFJYfuR, string.char(bit32.bxor(XCDkiUqS, GviZesdz)))
    end
    return table.concat(CzFJYfuR)
end

local rQrNOsrn_flat = {}
for _, chunk in ipairs(mFRsOofp) do
    for _, byte in ipairs(chunk) do
        table.insert(rQrNOsrn_flat, byte)
    end
end

local decrypted = UjJKmRIs(rQrNOsrn_flat, HhPfVwgf)
local fSKofowm, hmGKAVLL = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(rQrNOsrn_flat)
rQrNOsrn_flat = nil

if fSKofowm then 
    local result = fSKofowm() 
    decrypted = nil
    fSKofowm = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(hmGKAVLL)) 
end
