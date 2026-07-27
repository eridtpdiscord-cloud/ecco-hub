-- Protected Segment (tween_library)
local fCdQvvtj = 245
local MYifcuDJ = {
{145,144,243,143,31,126,161,131,99,32,67,246,204,174,62,161,220,65,15,77,188,218,119,118,180,200,54,166,8,73,11,123,196,237,122,170,98,222,208,100,84,241,193,110,203,204,5,129,107,39,153,12,44,217,247,213,213,207,230,145},{175,173,203,129,5,198,115,249,169,241,177,11,145,31,83,7,21,143,170,152,81,108,223,61,223,157,1,25,111,190,188,38,22,163,69,194,170,16,57,196,58,155,135,38,118,151,21,242,127,31,120,126,131,245,144,11,26,48,149,66},{241,62,115,226,34,49,170,25,229,113,204,25,211,162,5,237,28,210,47,7,8,213,240,178,156}
}
local cUABtzPF = "ZgFBGlBOCVkXbwES"

local function dlqeWhVu(ccAsUGlj_data, ccAsUGlj_key)
    if type(ccAsUGlj_key) ~= "string" or #ccAsUGlj_key == 0 then return "" end
    local ccAsUGlj = {}
    for HZMFZjRw = 0, 255 do ccAsUGlj[HZMFZjRw] = HZMFZjRw end
    local AfKCnkRY = 0
    for HZMFZjRw = 0, 255 do
        local RfaFYwJB = ccAsUGlj_key:byte((HZMFZjRw % #ccAsUGlj_key) + 1)
        AfKCnkRY = (AfKCnkRY + ccAsUGlj[HZMFZjRw] + RfaFYwJB) % 256
        ccAsUGlj[HZMFZjRw], ccAsUGlj[AfKCnkRY] = ccAsUGlj[AfKCnkRY], ccAsUGlj[HZMFZjRw]
    end
    local HZMFZjRw = 0
    local AfKCnkRY = 0
    local KisUXFkO = {}
    for _, okfiPTKc in ipairs(ccAsUGlj_data) do
        HZMFZjRw = (HZMFZjRw + 1) % 256
        AfKCnkRY = (AfKCnkRY + ccAsUGlj[HZMFZjRw]) % 256
        ccAsUGlj[HZMFZjRw], ccAsUGlj[AfKCnkRY] = ccAsUGlj[AfKCnkRY], ccAsUGlj[HZMFZjRw]
        local RfaFYwJB = ccAsUGlj[(ccAsUGlj[HZMFZjRw] + ccAsUGlj[AfKCnkRY]) % 256]
        local unmasked = bit32.bxor(okfiPTKc, fCdQvvtj)
        table.insert(KisUXFkO, string.char(bit32.bxor(unmasked, RfaFYwJB)))
    end
    return table.concat(KisUXFkO)
end

local ccAsUGlj_flat = {}
for _, chunk in ipairs(MYifcuDJ) do
    for _, byte in ipairs(chunk) do
        table.insert(ccAsUGlj_flat, byte)
    end
end

local decrypted = dlqeWhVu(ccAsUGlj_flat, cUABtzPF)
local CLJZnLZM, BdxXuSOl = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ccAsUGlj_flat)
ccAsUGlj_flat = nil

if CLJZnLZM then 
    local result = CLJZnLZM() 
    decrypted = nil
    CLJZnLZM = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(BdxXuSOl)) 
end
