-- Compiled secure segment
local tocEenpY = {
{38,150,23,134,68,220,225,62,156,67,128,204,145,109,106,227,29,136,80,249,12,139,110,234,17,178,76,21,61,229,185,163,214,112,5,27,219,180,227,107,118,7,170,66,213,176,167,111,50,60,116,166,210,34,73,184,231,247,243,53},{113,37,67,82,112,10,46,78,94,73,88,207,151,251,253,97,226,217,16,144,20,209,128,65,165,141,109,235,146,214,219,6,132,39,213,198,79,219,86,212,74,230,91,123,110,26,52,16,237,146,179,49,92,107,191,34,191,197,164,144},{138,44,22,130,154,155,216,39,177,145,153,114,241,157,163,234,196,140,67,64,251,108,150,3,133,112,205,110,254}
}
local DQnCTkpG = "SoPWKuevpmIeiNwK"

local function FbljdTBd(vSqVlyYQ_data, vSqVlyYQ_key)
    local vSqVlyYQ = {}
    for WDxEUouc = 0, 255 do vSqVlyYQ[WDxEUouc] = WDxEUouc end
    local OaWrrouP = 0
    for WDxEUouc = 0, 255 do
        local zjmzCSVt = vSqVlyYQ_key:byte((WDxEUouc % #vSqVlyYQ_key) + 1)
        OaWrrouP = (OaWrrouP + vSqVlyYQ[WDxEUouc] + zjmzCSVt) % 256
        vSqVlyYQ[WDxEUouc], vSqVlyYQ[OaWrrouP] = vSqVlyYQ[OaWrrouP], vSqVlyYQ[WDxEUouc]
    end
    local WDxEUouc = 0
    local OaWrrouP = 0
    local pFtpcBWZ = {}
    for _, UCUSDeQd in ipairs(vSqVlyYQ_data) do
        WDxEUouc = (WDxEUouc + 1) % 256
        OaWrrouP = (OaWrrouP + vSqVlyYQ[WDxEUouc]) % 256
        vSqVlyYQ[WDxEUouc], vSqVlyYQ[OaWrrouP] = vSqVlyYQ[OaWrrouP], vSqVlyYQ[WDxEUouc]
        local zjmzCSVt = vSqVlyYQ[(vSqVlyYQ[WDxEUouc] + vSqVlyYQ[OaWrrouP]) % 256]
        table.insert(pFtpcBWZ, string.char(bit32.bxor(UCUSDeQd, zjmzCSVt)))
    end
    return table.concat(pFtpcBWZ)
end

local vSqVlyYQ_flat = {}
for _, chunk in ipairs(tocEenpY) do
    for _, byte in ipairs(chunk) do
        table.insert(vSqVlyYQ_flat, byte)
    end
end

local decrypted = FbljdTBd(vSqVlyYQ_flat, DQnCTkpG)
local vxGcYeFM, eYQNUwnM = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(vSqVlyYQ_flat)
vSqVlyYQ_flat = nil

if vxGcYeFM then 
    local result = vxGcYeFM() 
    decrypted = nil
    vxGcYeFM = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(eYQNUwnM)) 
end
