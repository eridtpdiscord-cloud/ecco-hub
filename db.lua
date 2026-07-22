-- Protected Segment (db)
local fLGTAWdX = 193
local hJYFDaUp = {
{189,26,50,76,17,33,232,116,186,30,121,188,112,228,163,51,196,40,239,155,230,25,223,158,184,203,150,61,175,124,19,148,210,137,55,4,57,126,58,84,36,231,1,235,155,127,43,25,143,160,130,247,54,120,212,185,207,208,243,247},{128,134,253,210,212,47,137,85,100,102,137,176,214,152,174,61,98,233,115,206,206,19,116,106,36,63,183,207,219,35,193,120,134,181,186,40,151,3,156,253,158,210,143,89,9,121,96,167,159,146,134,209,62,93,122,43,46,16,90,210},{216,3,113,96,198,146,162,96,9,184,146,149,194,62,193,36,36,104,209,153,226,245,76,127,36,234,31,13,58,129,5,242,68,70,96,179,232,246,49,117,251,229,212,82,69,193,160,106,3,99,135,250,120,46,11,142,121,108,246,202},{89,34,81,153,81,252,224,45,28,203,180,206,250,110,19,203,215,66,166,1,191,201,123,218,6,133,209,145,141,22,55,127,174,67,171,117,95,12,148,137,241,138,123,128,46,147,53,108,22,194,46,85,200,79,8,70,229,39,222,154},{195,79,189,146,97,186,183,113,105,59,244,137,48,201,96,117,156,245,43,44,208,187,202,81,70,108,59,237,169,13,9,84,100,47,254,186,24,187,25,184,76,176,160,224,254,98,212,92,80,84,125,16,178,86,67,62,61,25,97,234},{143,75,174,105,237,224,95,253,157,166,100,94,2,8,72,168,112,131,51,246,168,130,232,20,13,101,20,173,91,110,116,168,114,90,111,217,26,84,226,250,36,213,238,232,6,241,254,28,74,107,21,110,229,153,83,159,175,122,253,251},{25,72,14,84,124,232,27,26,254,136,163,190,115,154,129,121,37,237,136,163,82,221,183,124,248,226,156,233,170,12,45,11,108,43,91,139,227,191,50,14,134,153,4,183,147,24}
}
local vAxevrrl = "ONADoVVaeKurUHIW"

local function JIyYyaVv(boMInIpB_data, boMInIpB_key)
    local boMInIpB = {}
    for aOhIxcqa = 0, 255 do boMInIpB[aOhIxcqa] = aOhIxcqa end
    local bkZhKiul = 0
    for aOhIxcqa = 0, 255 do
        local rVysGstl = boMInIpB_key:byte((aOhIxcqa % #boMInIpB_key) + 1)
        bkZhKiul = (bkZhKiul + boMInIpB[aOhIxcqa] + rVysGstl) % 256
        boMInIpB[aOhIxcqa], boMInIpB[bkZhKiul] = boMInIpB[bkZhKiul], boMInIpB[aOhIxcqa]
    end
    local aOhIxcqa = 0
    local bkZhKiul = 0
    local QRUTrdMc = {}
    for _, hevtwJBU in ipairs(boMInIpB_data) do
        aOhIxcqa = (aOhIxcqa + 1) % 256
        bkZhKiul = (bkZhKiul + boMInIpB[aOhIxcqa]) % 256
        boMInIpB[aOhIxcqa], boMInIpB[bkZhKiul] = boMInIpB[bkZhKiul], boMInIpB[aOhIxcqa]
        local rVysGstl = boMInIpB[(boMInIpB[aOhIxcqa] + boMInIpB[bkZhKiul]) % 256]
        local unmasked = bit32.bxor(hevtwJBU, fLGTAWdX)
        table.insert(QRUTrdMc, string.char(bit32.bxor(unmasked, rVysGstl)))
    end
    return table.concat(QRUTrdMc)
end

local boMInIpB_flat = {}
for _, chunk in ipairs(hJYFDaUp) do
    for _, byte in ipairs(chunk) do
        table.insert(boMInIpB_flat, byte)
    end
end

local decrypted = JIyYyaVv(boMInIpB_flat, vAxevrrl)
local WoPvxXKQ, ZcRaRYLV = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(boMInIpB_flat)
boMInIpB_flat = nil

if WoPvxXKQ then 
    local result = WoPvxXKQ() 
    decrypted = nil
    WoPvxXKQ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(ZcRaRYLV)) 
end
