-- Protected Segment (db)
local BKQxJDQi = 128
local ZfmvsPSF = {
{86,245,244,110,36,163,231,186,254,172,116,29,156,252,176,95,138,221,188,162,65,30,79,208,248,245,233,13,210,77,143,10,143,92,235,225,252,174,37,190,230,22,58,18,159,207,209,142,125,60,82,132,228,109,107,145,170,130,230,190},{177,229,28,165,168,81,69,140,65,243,166,71,52,219,233,51,118,213,125,107,113,117,221,192,189,154,15,159,80,51,33,1,110,221,13,188,171,1,199,0,157,201,29,10,252,42,222,223,161,174,32,75,130,84,125,95,175,10,89,121},{207,5,145,178,195,237,61,194,67,101,95,207,80,200,9,43,161,110,80,57,1,225,241,97,52,64,19,155,126,54,232,77,56,246,254,193,15,166,124,31,123,68,189,56,54,129,135,52,218,182,229,122,150,247,48,249,117,109,108,34},{134,41,23,58,24,124,207,252,80,55,87,38,40,104,20,180,202,67,236,196,190,198,65,143,188,89,201,17,54,181,110,174,108,48,82,229,44,71,57,159,246,18,109,82,35,54,159,144,87,48,67,177,223,166,105,7,168,191,35,45},{56,14,230,29,130,81,183,144,201,112,114,12,227,207,233,217,152,130,150,225,97,98,167,186,66,136,125,125,105,184,141,17,216,186,51,235,137,207,250,138,29,91,150,46,132,239,16,36,3,0,90,228,242,138,40,169,97,219,31,173},{46,31,24,139,230,84,198,31,7,108,114,58,191,157,80,121,220,6,225,188,94,54,163,72,196,112,161,175,144,216,162,15,64,239,72,191,143,171,11,6,210,126,107,44,104,163,115,41,239,239,231,147,171,138,34,80,188,174,255,18},{26,190,251,70,59,222,39,7,10,240,99,251,62,69,217,79,10,95,180,37,69,224,45,49,50,203,122,33,178,253,228,216,81,230,139,255,79,7,203,122,69,70,16,32,182}
}
local CjckuQBv = "hAnGlzwvibKpKfIQ"

local function VVnVLVTn(JYRzOxBy_data, JYRzOxBy_key)
    local JYRzOxBy = {}
    for MdWKOPxm = 0, 255 do JYRzOxBy[MdWKOPxm] = MdWKOPxm end
    local yVEONBTX = 0
    for MdWKOPxm = 0, 255 do
        local HwamnMHv = JYRzOxBy_key:byte((MdWKOPxm % #JYRzOxBy_key) + 1)
        yVEONBTX = (yVEONBTX + JYRzOxBy[MdWKOPxm] + HwamnMHv) % 256
        JYRzOxBy[MdWKOPxm], JYRzOxBy[yVEONBTX] = JYRzOxBy[yVEONBTX], JYRzOxBy[MdWKOPxm]
    end
    local MdWKOPxm = 0
    local yVEONBTX = 0
    local rsoDUIMP = {}
    for _, whuIkTrQ in ipairs(JYRzOxBy_data) do
        MdWKOPxm = (MdWKOPxm + 1) % 256
        yVEONBTX = (yVEONBTX + JYRzOxBy[MdWKOPxm]) % 256
        JYRzOxBy[MdWKOPxm], JYRzOxBy[yVEONBTX] = JYRzOxBy[yVEONBTX], JYRzOxBy[MdWKOPxm]
        local HwamnMHv = JYRzOxBy[(JYRzOxBy[MdWKOPxm] + JYRzOxBy[yVEONBTX]) % 256]
        local unmasked = bit32.bxor(whuIkTrQ, BKQxJDQi)
        table.insert(rsoDUIMP, string.char(bit32.bxor(unmasked, HwamnMHv)))
    end
    return table.concat(rsoDUIMP)
end

local JYRzOxBy_flat = {}
for _, chunk in ipairs(ZfmvsPSF) do
    for _, byte in ipairs(chunk) do
        table.insert(JYRzOxBy_flat, byte)
    end
end

local decrypted = VVnVLVTn(JYRzOxBy_flat, CjckuQBv)
local uheINUvt, WVMLFWRC = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(JYRzOxBy_flat)
JYRzOxBy_flat = nil

if uheINUvt then 
    local result = uheINUvt() 
    decrypted = nil
    uheINUvt = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(WVMLFWRC)) 
end
