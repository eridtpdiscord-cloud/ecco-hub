-- Protected Segment (utility_helper)
local HMlMGsxg = 175
local kfMscMuf = {
{218,114,43,116,162,11,92,89,149,156,94,168,86,154,34,184,128,49,214,108,45,205,40,47,119,127,111,190,117,60,131,179,161,131,153,162,39,17,249,152,237,118,135,110,247,200,238,145,184,217,176,161,136,214,245,161,147,121,45,190},{217,188,38,128,15,164,111,198,42,136,228,169,46,11,46,89,168,196,21,120,73,38,223,23,135,91,202,129,114,150,127,127,209,72,179,239,37,182,112,64,254,104,248,207,235,137,139,92,14,1,56,211,84,196,227,219,87,67,2,244},{178,70,104,89,89,36,163,51,105,186,210,34,26,207,73,191,59,95,156,110,190,254,143,66,247,125}
}
local srIpfvCH = "tjFnIeXonBstWGBA"

local function CYAatlsE(dofeQNEw_data, dofeQNEw_key)
    local dofeQNEw = {}
    for bmnSideK = 0, 255 do dofeQNEw[bmnSideK] = bmnSideK end
    local yeYfuBau = 0
    for bmnSideK = 0, 255 do
        local ahRKmood = dofeQNEw_key:byte((bmnSideK % #dofeQNEw_key) + 1)
        yeYfuBau = (yeYfuBau + dofeQNEw[bmnSideK] + ahRKmood) % 256
        dofeQNEw[bmnSideK], dofeQNEw[yeYfuBau] = dofeQNEw[yeYfuBau], dofeQNEw[bmnSideK]
    end
    local bmnSideK = 0
    local yeYfuBau = 0
    local AeNQMjlU = {}
    for _, RODBVSlo in ipairs(dofeQNEw_data) do
        bmnSideK = (bmnSideK + 1) % 256
        yeYfuBau = (yeYfuBau + dofeQNEw[bmnSideK]) % 256
        dofeQNEw[bmnSideK], dofeQNEw[yeYfuBau] = dofeQNEw[yeYfuBau], dofeQNEw[bmnSideK]
        local ahRKmood = dofeQNEw[(dofeQNEw[bmnSideK] + dofeQNEw[yeYfuBau]) % 256]
        local unmasked = bit32.bxor(RODBVSlo, HMlMGsxg)
        table.insert(AeNQMjlU, string.char(bit32.bxor(unmasked, ahRKmood)))
    end
    return table.concat(AeNQMjlU)
end

local dofeQNEw_flat = {}
for _, chunk in ipairs(kfMscMuf) do
    for _, byte in ipairs(chunk) do
        table.insert(dofeQNEw_flat, byte)
    end
end

local decrypted = CYAatlsE(dofeQNEw_flat, srIpfvCH)
local MQEeKOqo, hFndhivJ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(dofeQNEw_flat)
dofeQNEw_flat = nil

if MQEeKOqo then 
    local result = MQEeKOqo() 
    decrypted = nil
    MQEeKOqo = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(hFndhivJ)) 
end
