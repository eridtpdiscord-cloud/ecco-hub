-- Protected Segment (teleport_handler)
local dejhONnr = 176
local XQRebbJC = {
{89,46,126,134,242,7,150,68,42,127,116,13,192,31,104,195,250,135,228,49,212,211,131,47,18,22,163,78,239,125,126,152,135,207,38,147,41,164,132,228,174,138,77,78,85,133,153,146,85,84,147,88,38,76,243,207,202,95,49,119},{40,82,46,77,195,181,178,74,149,158,247,68,14,69,106,137,101,79,228,205,224,60,231,210,92,224,179,131,7,133,211,244,182,57,155,68,186,72,153,24,188,149,54,36,237,19,241,24,85,55,30,92,28,156,203,223,108,233,11,162},{161,128,228,37,230,145,133,172,117,177,203,8,122,203,198,222,172,163,119,65,43,217,13,147,153,100,94,213}
}
local YQpqEPEk = "oepixvKtvMkxtmZv"

local function SzsOZmpv(ptfkRPha_data, ptfkRPha_key)
    local ptfkRPha = {}
    for GBGERLDc = 0, 255 do ptfkRPha[GBGERLDc] = GBGERLDc end
    local xhVslcBH = 0
    for GBGERLDc = 0, 255 do
        local ckYhRGbs = ptfkRPha_key:byte((GBGERLDc % #ptfkRPha_key) + 1)
        xhVslcBH = (xhVslcBH + ptfkRPha[GBGERLDc] + ckYhRGbs) % 256
        ptfkRPha[GBGERLDc], ptfkRPha[xhVslcBH] = ptfkRPha[xhVslcBH], ptfkRPha[GBGERLDc]
    end
    local GBGERLDc = 0
    local xhVslcBH = 0
    local OomSvZLi = {}
    for _, DvNGEfli in ipairs(ptfkRPha_data) do
        GBGERLDc = (GBGERLDc + 1) % 256
        xhVslcBH = (xhVslcBH + ptfkRPha[GBGERLDc]) % 256
        ptfkRPha[GBGERLDc], ptfkRPha[xhVslcBH] = ptfkRPha[xhVslcBH], ptfkRPha[GBGERLDc]
        local ckYhRGbs = ptfkRPha[(ptfkRPha[GBGERLDc] + ptfkRPha[xhVslcBH]) % 256]
        local unmasked = bit32.bxor(DvNGEfli, dejhONnr)
        table.insert(OomSvZLi, string.char(bit32.bxor(unmasked, ckYhRGbs)))
    end
    return table.concat(OomSvZLi)
end

local ptfkRPha_flat = {}
for _, chunk in ipairs(XQRebbJC) do
    for _, byte in ipairs(chunk) do
        table.insert(ptfkRPha_flat, byte)
    end
end

local decrypted = SzsOZmpv(ptfkRPha_flat, YQpqEPEk)
local RNIZhKHM, fSXFTDTf = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ptfkRPha_flat)
ptfkRPha_flat = nil

if RNIZhKHM then 
    local result = RNIZhKHM() 
    decrypted = nil
    RNIZhKHM = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(fSXFTDTf)) 
end
