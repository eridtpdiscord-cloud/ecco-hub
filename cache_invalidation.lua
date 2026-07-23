-- Protected Segment (cache_invalidation)
local luWRuUBn = 147
local nlbDsMdy = {
{235,223,214,83,21,121,146,45,9,46,145,50,225,65,28,50,241,134,151,71,177,178,196,35,224,203,87,88,226,144,118,82,164,136,132,209,45,236,78,189,232,92,74,234,169,214,11,103,249,144,175,90,84,81,148,41,164,158,28,222},{91,113,14,203,242,74,230,124,191,76,220,55,17,66,84,41,12,240,17,23,42,115,233,127,238,62,177,243,89,253,97,205,70,69,239,167,31,101,209,26,65,70,222,60,51,59,221,205,68,118,68,115,132,111,218,144,204,138,82,157},{72,130,22,69,3,250,0,18,239,113,87,79,34,22,144,70,117,189,144,209,249,37,11,26,177,71,205,224,142,63}
}
local swwUanjf = "EfFHsGRDCXyPUOUa"

local function stKandBf(XtLVEwCW_data, XtLVEwCW_key)
    if type(XtLVEwCW_key) ~= "string" or #XtLVEwCW_key == 0 then return "" end
    local XtLVEwCW = {}
    for nLoZCydr = 0, 255 do XtLVEwCW[nLoZCydr] = nLoZCydr end
    local wjZWGlst = 0
    for nLoZCydr = 0, 255 do
        local UoxuUeWK = XtLVEwCW_key:byte((nLoZCydr % #XtLVEwCW_key) + 1)
        wjZWGlst = (wjZWGlst + XtLVEwCW[nLoZCydr] + UoxuUeWK) % 256
        XtLVEwCW[nLoZCydr], XtLVEwCW[wjZWGlst] = XtLVEwCW[wjZWGlst], XtLVEwCW[nLoZCydr]
    end
    local nLoZCydr = 0
    local wjZWGlst = 0
    local AXMOZljw = {}
    for _, yffheMiR in ipairs(XtLVEwCW_data) do
        nLoZCydr = (nLoZCydr + 1) % 256
        wjZWGlst = (wjZWGlst + XtLVEwCW[nLoZCydr]) % 256
        XtLVEwCW[nLoZCydr], XtLVEwCW[wjZWGlst] = XtLVEwCW[wjZWGlst], XtLVEwCW[nLoZCydr]
        local UoxuUeWK = XtLVEwCW[(XtLVEwCW[nLoZCydr] + XtLVEwCW[wjZWGlst]) % 256]
        local unmasked = bit32.bxor(yffheMiR, luWRuUBn)
        table.insert(AXMOZljw, string.char(bit32.bxor(unmasked, UoxuUeWK)))
    end
    return table.concat(AXMOZljw)
end

local XtLVEwCW_flat = {}
for _, chunk in ipairs(nlbDsMdy) do
    for _, byte in ipairs(chunk) do
        table.insert(XtLVEwCW_flat, byte)
    end
end

local decrypted = stKandBf(XtLVEwCW_flat, swwUanjf)
local fsrHHBKP, awcPrOot = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(XtLVEwCW_flat)
XtLVEwCW_flat = nil

if fsrHHBKP then 
    local result = fsrHHBKP() 
    decrypted = nil
    fsrHHBKP = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(awcPrOot)) 
end
