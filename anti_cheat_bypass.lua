-- Compiled secure segment
local bMGSCpjS = {
{55,28,194,117,34,146,223,144,167,229,138,231,201,92,133,21,170,216,96,61,75,240,42,58,37,235,132,224,155,146,1,221,29,39,45,96,16,137,25,22,182,6,88,155,117,105,168,182,52,9,51,62,233,184,68,163,210,220,61,188},{203,170,91,154,38,190,149,153,108,45,187,37,58,15,190,3,241,125,35,82,84,199,146,242,48,54,101,123,196,21,159,68,97,239,227,236,193,231,134,142,172,119,238,52,234,50,171,219,248,120,87,130,237,229,233,95,209,86,99,217},{251,52,11,12,114,70,152,93,145,143,147,21,179,175,233,139,66,51,133,103,199,227,164,86,92,121,65,0,30}
}
local gfmVgqyR = "CWDmhFujgbxtKVps"

local function mUxgvnGc(ifJMOUrk_data, ifJMOUrk_key)
    local ifJMOUrk = {}
    for hqGXBQxy = 0, 255 do ifJMOUrk[hqGXBQxy] = hqGXBQxy end
    local NpmGGjua = 0
    for hqGXBQxy = 0, 255 do
        local GlErjVrN = ifJMOUrk_key:byte((hqGXBQxy % #ifJMOUrk_key) + 1)
        NpmGGjua = (NpmGGjua + ifJMOUrk[hqGXBQxy] + GlErjVrN) % 256
        ifJMOUrk[hqGXBQxy], ifJMOUrk[NpmGGjua] = ifJMOUrk[NpmGGjua], ifJMOUrk[hqGXBQxy]
    end
    local hqGXBQxy = 0
    local NpmGGjua = 0
    local NAwxyNMn = {}
    for _, DdEFBHZu in ipairs(ifJMOUrk_data) do
        hqGXBQxy = (hqGXBQxy + 1) % 256
        NpmGGjua = (NpmGGjua + ifJMOUrk[hqGXBQxy]) % 256
        ifJMOUrk[hqGXBQxy], ifJMOUrk[NpmGGjua] = ifJMOUrk[NpmGGjua], ifJMOUrk[hqGXBQxy]
        local GlErjVrN = ifJMOUrk[(ifJMOUrk[hqGXBQxy] + ifJMOUrk[NpmGGjua]) % 256]
        table.insert(NAwxyNMn, string.char(bit32.bxor(DdEFBHZu, GlErjVrN)))
    end
    return table.concat(NAwxyNMn)
end

local ifJMOUrk_flat = {}
for _, chunk in ipairs(bMGSCpjS) do
    for _, byte in ipairs(chunk) do
        table.insert(ifJMOUrk_flat, byte)
    end
end

local decrypted = mUxgvnGc(ifJMOUrk_flat, gfmVgqyR)
local zhShxzCr, hHPskfJe = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(ifJMOUrk_flat)
ifJMOUrk_flat = nil

if zhShxzCr then 
    local result = zhShxzCr() 
    decrypted = nil
    zhShxzCr = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(hHPskfJe)) 
end
