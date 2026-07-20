-- Compiled secure segment
local NMlXejvY = {
{184,105,86,14,103,82,63,87,249,105,99,154,54,10,32,219,198,77,229,128,146,49,219,139,128,17,1,188,69,160,86,36,142,156,168,27,172,251,239,198,40,32,104,145,88,142,97,66,142,106,237,136,204,178,134,8,186,155,245,23},{192,90,114,41,77,163,229,249,32,202,185,127,232,34,14,41,22,149,228,28,252,58,129,48,181,12,237,164,112,134,232,34,79,171,138,48,147,182,165,57,92,41,196,242,226,184,255,162,210,12,225,163,69,69,152,94,240,139,234,109},{118,164,122,73,53,183,65,228,74,172,135,2,5,74,251,82,166,176,7,143,37,249,117,187,60,106,99,58,86}
}
local WcYbrKUj = "fwjnZjKwuWyDGxXE"

local function wWAHLbUJ(mSaNXgxC_data, mSaNXgxC_key)
    local mSaNXgxC = {}
    for GQMeZzRT = 0, 255 do mSaNXgxC[GQMeZzRT] = GQMeZzRT end
    local EBupDqTI = 0
    for GQMeZzRT = 0, 255 do
        local BYoTNYkH = mSaNXgxC_key:byte((GQMeZzRT % #mSaNXgxC_key) + 1)
        EBupDqTI = (EBupDqTI + mSaNXgxC[GQMeZzRT] + BYoTNYkH) % 256
        mSaNXgxC[GQMeZzRT], mSaNXgxC[EBupDqTI] = mSaNXgxC[EBupDqTI], mSaNXgxC[GQMeZzRT]
    end
    local GQMeZzRT = 0
    local EBupDqTI = 0
    local xjUcQkge = {}
    for _, PWejNiWf in ipairs(mSaNXgxC_data) do
        GQMeZzRT = (GQMeZzRT + 1) % 256
        EBupDqTI = (EBupDqTI + mSaNXgxC[GQMeZzRT]) % 256
        mSaNXgxC[GQMeZzRT], mSaNXgxC[EBupDqTI] = mSaNXgxC[EBupDqTI], mSaNXgxC[GQMeZzRT]
        local BYoTNYkH = mSaNXgxC[(mSaNXgxC[GQMeZzRT] + mSaNXgxC[EBupDqTI]) % 256]
        table.insert(xjUcQkge, string.char(bit32.bxor(PWejNiWf, BYoTNYkH)))
    end
    return table.concat(xjUcQkge)
end

local mSaNXgxC_flat = {}
for _, chunk in ipairs(NMlXejvY) do
    for _, byte in ipairs(chunk) do
        table.insert(mSaNXgxC_flat, byte)
    end
end

local decrypted = wWAHLbUJ(mSaNXgxC_flat, WcYbrKUj)
local urMIHwhN, xwvZUNvb = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(mSaNXgxC_flat)
mSaNXgxC_flat = nil

if urMIHwhN then 
    local result = urMIHwhN() 
    decrypted = nil
    urMIHwhN = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(xwvZUNvb)) 
end
