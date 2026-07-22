-- Protected Segment (teleport_handler)
local tZHsXHHl = 168
local kqzRXiRv = {
{39,174,169,114,43,147,176,199,194,97,6,133,138,203,172,206,3,99,98,149,178,80,134,54,222,14,135,165,124,149,16,49,166,78,48,84,1,15,227,160,144,121,227,181,147,52,132,170,119,14,68,127,204,127,159,56,4,189,210,5},{146,45,121,230,96,150,149,247,197,35,101,110,40,249,145,55,59,93,230,89,200,58,101,111,15,234,28,224,191,164,164,8,244,173,181,198,148,193,245,55,241,226,12,107,75,45,74,18,115,242,155,201,215,137,52,120,220,19,238,123},{89,112,50,210,164,146,212,135,102,161,176,226,241,98,184,219,189,131,25,141,202,95,91,173,65,74,118,110}
}
local GmEDTUIS = "KFCnlbXFvkLgYzyv"

local function omRFnpnL(mHVNlkzg_data, mHVNlkzg_key)
    local mHVNlkzg = {}
    for kLvgOhKy = 0, 255 do mHVNlkzg[kLvgOhKy] = kLvgOhKy end
    local qKkHDzJD = 0
    for kLvgOhKy = 0, 255 do
        local IWAUBPwm = mHVNlkzg_key:byte((kLvgOhKy % #mHVNlkzg_key) + 1)
        qKkHDzJD = (qKkHDzJD + mHVNlkzg[kLvgOhKy] + IWAUBPwm) % 256
        mHVNlkzg[kLvgOhKy], mHVNlkzg[qKkHDzJD] = mHVNlkzg[qKkHDzJD], mHVNlkzg[kLvgOhKy]
    end
    local kLvgOhKy = 0
    local qKkHDzJD = 0
    local pXbgTClC = {}
    for _, MLKlgbZi in ipairs(mHVNlkzg_data) do
        kLvgOhKy = (kLvgOhKy + 1) % 256
        qKkHDzJD = (qKkHDzJD + mHVNlkzg[kLvgOhKy]) % 256
        mHVNlkzg[kLvgOhKy], mHVNlkzg[qKkHDzJD] = mHVNlkzg[qKkHDzJD], mHVNlkzg[kLvgOhKy]
        local IWAUBPwm = mHVNlkzg[(mHVNlkzg[kLvgOhKy] + mHVNlkzg[qKkHDzJD]) % 256]
        local unmasked = bit32.bxor(MLKlgbZi, tZHsXHHl)
        table.insert(pXbgTClC, string.char(bit32.bxor(unmasked, IWAUBPwm)))
    end
    return table.concat(pXbgTClC)
end

local mHVNlkzg_flat = {}
for _, chunk in ipairs(kqzRXiRv) do
    for _, byte in ipairs(chunk) do
        table.insert(mHVNlkzg_flat, byte)
    end
end

local decrypted = omRFnpnL(mHVNlkzg_flat, GmEDTUIS)
local pJsXcFMZ, BmaSOZxB = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(mHVNlkzg_flat)
mHVNlkzg_flat = nil

if pJsXcFMZ then 
    local result = pJsXcFMZ() 
    decrypted = nil
    pJsXcFMZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(BmaSOZxB)) 
end
