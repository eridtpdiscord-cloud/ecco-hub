-- Protected Segment (db)
local lFOwxGaF = 232
local BHLSXxMW = {
{147,65,175,123,214,215,199,232,57,212,231,84,40,115,42,137,34,98,185,67,72,40,165,58,221,78,162,170,50,160,248,109,100,183,88,248,8,56,197,93,151,99,69,21,100,174,192,32,210,97,170,205,102,186,199,80,128,142,124,74},{112,238,20,154,0,86,52,40,19,157,63,102,182,88,31,204,27,207,67,127,191,9,26,210,124,138,217,249,96,154,88,4,98,183,219,28,30,187,112,48,209,170,180,143,18,78,6,230,230,161,101,217,141,42,28,102,220,174,240,2},{237,10,99,57,128,159,220,198,235,166,212,3,171,78,35,0,230,128,84,251,86,17,181,117,133,173,87,33,168,76,14,24,200,182,63,107,219,192,126,147,216,22,198,155,215,185,62,85,27,214,212,3,241,81,34,46,4,141,61,97},{211,213,21,145,236,43,164,40,73,149,96,43,226,78,122,136,198,216,168,20,62,252,87,5,194,141,241,29,5,161,157,210,242,215,38,18,237,75,236,246,48,13,104,71,193,248,247,73,252,248,57,123,241,213,125,97,181,200,142,50},{129,152,63,143,16,205,221,81,97,210,45,98,228,253,144,226,122,194,120,188,122,168,31,74,47,144,219,201,20,230,53,175,161,62,127,114,1,158,215,45,247,117,122,76,10,30,56,167,168,70,232,192,19,80,7,142,82,14,198,73},{88,220,45,187,52,186,143,53,131,250,81,214,71,44,86,153,12,23,86,144,181,24,67,218,101,218,143,234,167,29,89,188,218,25,8,173,111,250,170,107,62,93,116,125,36,143,147,248,11,111,253,164,56,164,247,110,114,73,153,228},{135,89,202,31,18,219,48,157,70,216,109,151,208,211,39,228,252,226,71,30,242,98,78,229,82,107,108,63,212,56,238,88,99,45,45,41,26,72,251,88,236,167,41,157,104}
}
local khTGHOzj = "mtIIzyWZNjGJfcdu"

local function igmeRTHq(PCPegdOL_data, PCPegdOL_key)
    local PCPegdOL = {}
    for JCDnuaEr = 0, 255 do PCPegdOL[JCDnuaEr] = JCDnuaEr end
    local NMCQDxLD = 0
    for JCDnuaEr = 0, 255 do
        local AFisJNIy = PCPegdOL_key:byte((JCDnuaEr % #PCPegdOL_key) + 1)
        NMCQDxLD = (NMCQDxLD + PCPegdOL[JCDnuaEr] + AFisJNIy) % 256
        PCPegdOL[JCDnuaEr], PCPegdOL[NMCQDxLD] = PCPegdOL[NMCQDxLD], PCPegdOL[JCDnuaEr]
    end
    local JCDnuaEr = 0
    local NMCQDxLD = 0
    local tVuvkzmX = {}
    for _, KaOUjbrD in ipairs(PCPegdOL_data) do
        JCDnuaEr = (JCDnuaEr + 1) % 256
        NMCQDxLD = (NMCQDxLD + PCPegdOL[JCDnuaEr]) % 256
        PCPegdOL[JCDnuaEr], PCPegdOL[NMCQDxLD] = PCPegdOL[NMCQDxLD], PCPegdOL[JCDnuaEr]
        local AFisJNIy = PCPegdOL[(PCPegdOL[JCDnuaEr] + PCPegdOL[NMCQDxLD]) % 256]
        local unmasked = bit32.bxor(KaOUjbrD, lFOwxGaF)
        table.insert(tVuvkzmX, string.char(bit32.bxor(unmasked, AFisJNIy)))
    end
    return table.concat(tVuvkzmX)
end

local PCPegdOL_flat = {}
for _, chunk in ipairs(BHLSXxMW) do
    for _, byte in ipairs(chunk) do
        table.insert(PCPegdOL_flat, byte)
    end
end

local decrypted = igmeRTHq(PCPegdOL_flat, khTGHOzj)
local OQGhjSuL, zjNOVIZj = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(PCPegdOL_flat)
PCPegdOL_flat = nil

if OQGhjSuL then 
    local result = OQGhjSuL() 
    decrypted = nil
    OQGhjSuL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(zjNOVIZj)) 
end
