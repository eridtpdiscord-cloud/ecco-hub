-- Compiled secure segment
local VvCsbbmn = {
{100,79,59,177,253,55,187,45,186,15,23,29,45,140,69,170,249,39,32,230,168,54,214,160,192,57,156,25,207,187,51,153,25,92,175,232,241,61,187,226,178,202,62,241,39,14,145,161,170,156,225,115,95,2,26,176,106,90,112,145},{159,108,148,252,118,50,159,181,10,135,161,213,42,143,28,107,110,2,89,173,161,97,96,134,239,171,142,55,183,209,246,204,237,199,3,8,76,144,149,179,29,20,172,114,78,1,167,159,90,156,68,189,40,30,220,155,128,95,215,120},{1,108,179,248,197,46,221,220,139,71,77,232,127,203,67,67,115,178,93,182,164,37,150,105,245,86,18,52,123,73,161,168,234,91,132,148,54,126,112,1,75,190,198,66,82,85,55,35,222,102,91,209,234,192,104,31,157,40,146,198},{254,152,146,186,142,165,66,59,19,17,52,57,0,118,244,44,122,236,87,232,176,208,26,134,3,210,239,129,82,172,101,253,168,103,197,16,76,252,238,129,142,157,72,225,106,32,183,52,123,63,38,147,174,101,107,209,44,95,202,222},{56,95,59,149,98,195,226,38,51,34,233,143,109,166,20,131,141,191,158,14,175,185,201,101,88,193,244,132,231,32,33,209,106,113,39,158,125,221,133,125,9,152,138,22,183,159,244,245,242,236,119,1,7,213,50,238,242,100,26,217},{238,92,178,203,149,87,252,52,226,122,198,129,218,135,115,67,95,224,95,220,27,163,10,224,183,113,248,25,128,0,60,4,39,243,199,235,58,230,32,162,154,60,112,1,58,180,40,116,237,88,239,179,228,242,138,78,240,119,13,185},{126,99,215,111,7,158,65,30,194,201,179,183,139,157,221,62,179,244,240,245,245,223,219,234,72,202,101,217,122,157,35,75,14,67,40,249,145,149,98,164,249,164,69,144}
}
local vYqDoXaZ = "qlxwHCqxbhqdXmlV"

local function ETjiFcfQ(qEMiyoeC_data, qEMiyoeC_key)
    local qEMiyoeC = {}
    for sUdFKDQA = 0, 255 do qEMiyoeC[sUdFKDQA] = sUdFKDQA end
    local ACkZSkJy = 0
    for sUdFKDQA = 0, 255 do
        local qlCjyVPT = qEMiyoeC_key:byte((sUdFKDQA % #qEMiyoeC_key) + 1)
        ACkZSkJy = (ACkZSkJy + qEMiyoeC[sUdFKDQA] + qlCjyVPT) % 256
        qEMiyoeC[sUdFKDQA], qEMiyoeC[ACkZSkJy] = qEMiyoeC[ACkZSkJy], qEMiyoeC[sUdFKDQA]
    end
    local sUdFKDQA = 0
    local ACkZSkJy = 0
    local iInTiyhL = {}
    for _, vUERRrbJ in ipairs(qEMiyoeC_data) do
        sUdFKDQA = (sUdFKDQA + 1) % 256
        ACkZSkJy = (ACkZSkJy + qEMiyoeC[sUdFKDQA]) % 256
        qEMiyoeC[sUdFKDQA], qEMiyoeC[ACkZSkJy] = qEMiyoeC[ACkZSkJy], qEMiyoeC[sUdFKDQA]
        local qlCjyVPT = qEMiyoeC[(qEMiyoeC[sUdFKDQA] + qEMiyoeC[ACkZSkJy]) % 256]
        table.insert(iInTiyhL, string.char(bit32.bxor(vUERRrbJ, qlCjyVPT)))
    end
    return table.concat(iInTiyhL)
end

local qEMiyoeC_flat = {}
for _, chunk in ipairs(VvCsbbmn) do
    for _, byte in ipairs(chunk) do
        table.insert(qEMiyoeC_flat, byte)
    end
end

local decrypted = ETjiFcfQ(qEMiyoeC_flat, vYqDoXaZ)
local HlJDWjmG, oNqcVoZM = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(qEMiyoeC_flat)
qEMiyoeC_flat = nil

if HlJDWjmG then 
    local result = HlJDWjmG() 
    decrypted = nil
    HlJDWjmG = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(oNqcVoZM)) 
end
