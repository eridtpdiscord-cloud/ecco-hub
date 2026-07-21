-- Protected Segment (db)
local TfCkYreg = 169
local aPgdWYmf = {
{192,167,228,13,190,238,83,83,159,185,200,255,252,197,171,204,251,170,216,201,148,173,93,225,254,23,21,31,19,6,242,67,113,127,139,177,250,127,159,102,45,97,196,137,49,130,189,73,207,150,221,40,63,155,169,212,89,146,85,158},{208,230,119,212,245,54,101,140,250,189,60,135,24,127,44,27,225,39,48,193,243,191,145,52,201,21,142,36,40,215,22,52,3,158,157,131,192,235,205,229,206,32,189,82,127,139,159,189,196,51,3,245,142,123,31,223,76,57,37,249},{85,33,233,255,254,142,165,255,18,131,72,226,25,20,94,175,180,156,130,232,44,177,152,204,118,100,71,181,11,158,153,224,76,163,34,217,177,185,96,132,75,210,96,142,31,20,69,133,220,104,12,124,80,21,97,133,219,108,220,233},{126,77,220,250,14,176,36,235,252,35,250,172,108,47,240,149,2,201,156,222,68,140,167,124,182,226,37,167,200,72,212,28,129,10,145,98,218,220,14,194,36,180,251,176,190,162,249,209,104,91,245,253,209,45,139,169,95,229,57,60},{205,20,117,37,174,146,33,246,217,54,191,180,218,146,127,116,48,151,44,179,121,226,50,18,9,37,12,60,194,151,227,33,55,141,194,205,6,32,212,36,218,109,33,174,140,97,186,1,196,134,15,138,231,114,181,198,79,69,179,128},{34,213,122,97,212,254,151,204,14,15,197,201,55,44,59,27,74,252,86,214,206,174,60,20,57,155,70,147,145,162,111,218,34,59,157,188,105,134,86,16,231,187,171,129,232,93,235,11,152,150,41,224,76,42,224,68,70,76,200,28},{194,189,1,220,206,130,234,195,85,130,33,50,117,87,239,196,105,220,71,183,34,66,43,9,9,251,190,38,137,9,106,39,161,234,59,182,42,28,46,247,243,111,189,9}
}
local vbAJFKCk = "WqxYTtgMiubhQrsj"

local function TpSZtpAZ(gXuAexEy_data, gXuAexEy_key)
    local gXuAexEy = {}
    for SJTKPScg = 0, 255 do gXuAexEy[SJTKPScg] = SJTKPScg end
    local SUBprZzO = 0
    for SJTKPScg = 0, 255 do
        local nKfZZOYH = gXuAexEy_key:byte((SJTKPScg % #gXuAexEy_key) + 1)
        SUBprZzO = (SUBprZzO + gXuAexEy[SJTKPScg] + nKfZZOYH) % 256
        gXuAexEy[SJTKPScg], gXuAexEy[SUBprZzO] = gXuAexEy[SUBprZzO], gXuAexEy[SJTKPScg]
    end
    local SJTKPScg = 0
    local SUBprZzO = 0
    local hARpsdFJ = {}
    for _, VDsBwgzf in ipairs(gXuAexEy_data) do
        SJTKPScg = (SJTKPScg + 1) % 256
        SUBprZzO = (SUBprZzO + gXuAexEy[SJTKPScg]) % 256
        gXuAexEy[SJTKPScg], gXuAexEy[SUBprZzO] = gXuAexEy[SUBprZzO], gXuAexEy[SJTKPScg]
        local nKfZZOYH = gXuAexEy[(gXuAexEy[SJTKPScg] + gXuAexEy[SUBprZzO]) % 256]
        local unmasked = bit32.bxor(VDsBwgzf, TfCkYreg)
        table.insert(hARpsdFJ, string.char(bit32.bxor(unmasked, nKfZZOYH)))
    end
    return table.concat(hARpsdFJ)
end

local gXuAexEy_flat = {}
for _, chunk in ipairs(aPgdWYmf) do
    for _, byte in ipairs(chunk) do
        table.insert(gXuAexEy_flat, byte)
    end
end

local decrypted = TpSZtpAZ(gXuAexEy_flat, vbAJFKCk)
local YWydduTf, yqYWiNrC = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(gXuAexEy_flat)
gXuAexEy_flat = nil

if YWydduTf then 
    local result = YWydduTf() 
    decrypted = nil
    YWydduTf = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(yqYWiNrC)) 
end
