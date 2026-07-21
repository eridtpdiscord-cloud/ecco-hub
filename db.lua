-- Protected Segment (db)
local zRxAMKdQ = 98
local oWXQAeNp = {
{244,71,212,134,116,70,131,135,15,38,11,92,17,99,5,138,249,7,222,67,83,241,141,10,77,254,182,91,124,29,190,1,247,37,146,37,22,143,76,224,163,46,39,174,27,205,151,198,87,6,87,246,147,9,139,4,175,143,30,47},{254,215,79,210,215,159,105,108,172,238,119,82,246,181,112,240,113,52,34,120,75,132,247,80,140,15,2,228,34,166,28,171,193,72,33,215,243,184,13,85,208,238,70,104,95,241,241,188,162,32,220,124,73,184,193,30,132,206,191,1},{87,226,192,140,200,108,36,200,244,248,89,120,150,81,78,114,17,121,224,178,207,100,210,21,32,129,45,150,210,1,243,154,0,51,41,52,122,190,28,178,67,238,53,164,195,40,119,203,111,74,181,61,206,54,252,188,50,17,130,146},{20,173,212,39,106,123,155,200,82,115,211,171,47,6,208,234,88,138,82,108,232,244,214,234,148,112,251,228,255,100,171,222,161,131,195,37,176,60,196,76,236,167,23,132,43,218,86,9,143,111,99,80,113,162,247,80,92,9,117,192},{103,148,87,119,28,199,90,198,253,234,122,206,142,193,132,74,247,48,34,135,188,103,253,63,114,198,4,77,117,216,191,120,49,113,81,191,253,133,105,163,21,123,245,255,101,66,39,26,126,86,251,148,132,7,215,7,3,241,255,93},{47,244,249,244,1,250,20,231,250,162,11,237,247,49,124,76,25,1,147,190,110,118,85,56,35,127,126,212,188,62,191,88,203,210,218,210,13,184,253,177,203,125,208,77,179,35,223,113,215,38,133,4,95,181,113,191,180,219,98,82},{213,194,26,91,210,120,193,62,15,248,146,229,43,210,11,29,47,246,140,92,56,174,237,160,73,192,144,215,238,154,138,52,234,47,223,205,196,144,253,116,8,33,152,104,141,17,87}
}
local ZtxpQsWU = "xXozJwDtRmeiWxvc"

local function PswxAawD(yIDBVTgY_data, yIDBVTgY_key)
    local yIDBVTgY = {}
    for rEOaOknI = 0, 255 do yIDBVTgY[rEOaOknI] = rEOaOknI end
    local TOIRtXKe = 0
    for rEOaOknI = 0, 255 do
        local WOQIjOLt = yIDBVTgY_key:byte((rEOaOknI % #yIDBVTgY_key) + 1)
        TOIRtXKe = (TOIRtXKe + yIDBVTgY[rEOaOknI] + WOQIjOLt) % 256
        yIDBVTgY[rEOaOknI], yIDBVTgY[TOIRtXKe] = yIDBVTgY[TOIRtXKe], yIDBVTgY[rEOaOknI]
    end
    local rEOaOknI = 0
    local TOIRtXKe = 0
    local sUxDVtfy = {}
    for _, AzVsGGqn in ipairs(yIDBVTgY_data) do
        rEOaOknI = (rEOaOknI + 1) % 256
        TOIRtXKe = (TOIRtXKe + yIDBVTgY[rEOaOknI]) % 256
        yIDBVTgY[rEOaOknI], yIDBVTgY[TOIRtXKe] = yIDBVTgY[TOIRtXKe], yIDBVTgY[rEOaOknI]
        local WOQIjOLt = yIDBVTgY[(yIDBVTgY[rEOaOknI] + yIDBVTgY[TOIRtXKe]) % 256]
        local unmasked = bit32.bxor(AzVsGGqn, zRxAMKdQ)
        table.insert(sUxDVtfy, string.char(bit32.bxor(unmasked, WOQIjOLt)))
    end
    return table.concat(sUxDVtfy)
end

local yIDBVTgY_flat = {}
for _, chunk in ipairs(oWXQAeNp) do
    for _, byte in ipairs(chunk) do
        table.insert(yIDBVTgY_flat, byte)
    end
end

local decrypted = PswxAawD(yIDBVTgY_flat, ZtxpQsWU)
local qCgjkWxg, KksOUUIb = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(yIDBVTgY_flat)
yIDBVTgY_flat = nil

if qCgjkWxg then 
    local result = qCgjkWxg() 
    decrypted = nil
    qCgjkWxg = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(KksOUUIb)) 
end
