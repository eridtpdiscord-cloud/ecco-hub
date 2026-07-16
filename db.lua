-- Compiled secure segment
local JAdkyBal = {
{240,59,88,137,76,70,1,21,49,43,170,219,208,0,41,156,96,112,3,1,125,214,126,223,80,140,108,187,133,165,8,203,101,7,137,64,72,201,46,56,183,185,185,159,243,216,22,120,201,168,98,254,35,198,21,28,64,138,108,178},{0,192,83,121,6,57,69,212,173,138,252,141,103,231,213,109,113,191,134,165,65,26,99,212,25,127,62,136,158,184,222,172,37,231,41,10,81,171,226,207,179,233,10,168,55,190,124,141,208,117,76,255,101,92,226,48,130,12,183,51},{93,93,77,228,32,129,28,199,114,94,243,96,236,235,198,69,236,181,140,63,5,13,225,98,163,92,118,224,69,87,41,161,39,252,149,11,244,82,98,30,121,118,156,196,8,161,12,82,82,112,143,173,169,81,106,181,206,103,13,65},{162,202,134,198,142,73,221,235,187,77,72,72,210,180,3,185,227,194,127,215,135,4,19,225,71,33,42,132,236,43,97,221,117,76,195,60,41,80,3,252,3,12,139,195,10,100,236,112,77,147,199,186,221,78,214,143,37,209,49,91},{213,33,187,154,35,238,113,243,69,88,216,144,113,128,9,229,212,208,191,193,11,128,48,183,82,0,28,4,102,116,19,124,30,109,248,10,28,191,110,177,112,141,107,12,93,222,92,110,196,249,107,138,53,18,54,83,29,112,29,148},{215,45,122,44,134,105,109,75,87,17,185,122,193,112,88,125,51,203,119,63,183,214,130,55,62,32,121,178,97,165,245,250,113,7,29,67,2,136,141,216,16,34,75,169,140,112,140,208,104,133,159,28,23,211,63,66,234,141,22,222},{98,224,145,31,214,82,189,111,11,243,226,9,181,209,137,115,58,156,174,46,61,41,252,141,147,172,10,39,179,135,179,54,66,64,213,135,26,181,230,236,10,213,2,183,225,66,212,3,104,174,135,110,174,149,68,187,110,0,198,122},{251,84,105,187,209,176,41,240,61,149,18,115,192,43,24,43,228,223,142,149,207,203}
}
local tvGMdnrP = "rIDAkrnQGEznCXcj"

local function vOCCmuyK(jDNplhaw_data, jDNplhaw_key)
    local jDNplhaw = {}
    for mKfiwmNg = 0, 255 do jDNplhaw[mKfiwmNg] = mKfiwmNg end
    local omUUuAHW = 0
    for mKfiwmNg = 0, 255 do
        local ZrFEhkgs = jDNplhaw_key:byte((mKfiwmNg % #jDNplhaw_key) + 1)
        omUUuAHW = (omUUuAHW + jDNplhaw[mKfiwmNg] + ZrFEhkgs) % 256
        jDNplhaw[mKfiwmNg], jDNplhaw[omUUuAHW] = jDNplhaw[omUUuAHW], jDNplhaw[mKfiwmNg]
    end
    local mKfiwmNg = 0
    local omUUuAHW = 0
    local jTFJADzR = {}
    for _, rzTAjnVx in ipairs(jDNplhaw_data) do
        mKfiwmNg = (mKfiwmNg + 1) % 256
        omUUuAHW = (omUUuAHW + jDNplhaw[mKfiwmNg]) % 256
        jDNplhaw[mKfiwmNg], jDNplhaw[omUUuAHW] = jDNplhaw[omUUuAHW], jDNplhaw[mKfiwmNg]
        local ZrFEhkgs = jDNplhaw[(jDNplhaw[mKfiwmNg] + jDNplhaw[omUUuAHW]) % 256]
        table.insert(jTFJADzR, string.char(bit32.bxor(rzTAjnVx, ZrFEhkgs)))
    end
    return table.concat(jTFJADzR)
end

local jDNplhaw_flat = {}
for _, chunk in ipairs(JAdkyBal) do
    for _, byte in ipairs(chunk) do
        table.insert(jDNplhaw_flat, byte)
    end
end

local decrypted = vOCCmuyK(jDNplhaw_flat, tvGMdnrP)
local YrZUeWVJ, ZZlDZRXM = loadstring(decrypted)
if YrZUeWVJ then 
    return YrZUeWVJ() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(ZZlDZRXM)) 
end
