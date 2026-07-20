-- Compiled secure segment
local JXydVGZF = {
{78,144,90,87,80,37,171,50,197,65,134,71,37,243,229,203,107,39,169,190,92,191,232,216,231,80,196,159,103,62,158,200,185,167,172,188,216,78,35,169,18,70,24,200,188,91,157,188,201,5,109,61,161,141,46,174,159,124,190,202},{56,39,193,2,36,123,101,40,60,49,50,87,179,72,252,57,37,223,118,71,20,149,41,140,105,11,241,3,88,186,16,194,114,182,76,188,197,76,209,95,150,200,224,252,7,23,38,24,201,3,120,88,87,126,130,38,170,86,130,31},{208,102,22,199,72,2,224,90,233,104,100,0,25,107,141,154,87,150,240,196,246,179,246,46,37,91,148,145}
}
local nTUNhAjo = "EDHNRfDcJKOmBlkw"

local function PDaTgOZd(ZaDphHmc_data, ZaDphHmc_key)
    local ZaDphHmc = {}
    for fHVXoPBC = 0, 255 do ZaDphHmc[fHVXoPBC] = fHVXoPBC end
    local hZGBUOwd = 0
    for fHVXoPBC = 0, 255 do
        local uPrieqaL = ZaDphHmc_key:byte((fHVXoPBC % #ZaDphHmc_key) + 1)
        hZGBUOwd = (hZGBUOwd + ZaDphHmc[fHVXoPBC] + uPrieqaL) % 256
        ZaDphHmc[fHVXoPBC], ZaDphHmc[hZGBUOwd] = ZaDphHmc[hZGBUOwd], ZaDphHmc[fHVXoPBC]
    end
    local fHVXoPBC = 0
    local hZGBUOwd = 0
    local ZaojobWL = {}
    for _, kWivKjWS in ipairs(ZaDphHmc_data) do
        fHVXoPBC = (fHVXoPBC + 1) % 256
        hZGBUOwd = (hZGBUOwd + ZaDphHmc[fHVXoPBC]) % 256
        ZaDphHmc[fHVXoPBC], ZaDphHmc[hZGBUOwd] = ZaDphHmc[hZGBUOwd], ZaDphHmc[fHVXoPBC]
        local uPrieqaL = ZaDphHmc[(ZaDphHmc[fHVXoPBC] + ZaDphHmc[hZGBUOwd]) % 256]
        table.insert(ZaojobWL, string.char(bit32.bxor(kWivKjWS, uPrieqaL)))
    end
    return table.concat(ZaojobWL)
end

local ZaDphHmc_flat = {}
for _, chunk in ipairs(JXydVGZF) do
    for _, byte in ipairs(chunk) do
        table.insert(ZaDphHmc_flat, byte)
    end
end

local decrypted = PDaTgOZd(ZaDphHmc_flat, nTUNhAjo)
local gQVRjfeO, ZWvVAsgw = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(ZaDphHmc_flat)
ZaDphHmc_flat = nil

if gQVRjfeO then 
    local result = gQVRjfeO() 
    decrypted = nil
    gQVRjfeO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(ZWvVAsgw)) 
end
