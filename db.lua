-- Compiled secure segment
local WAZpjRRY = {
{94,196,76,226,110,26,235,117,93,164,201,35,72,33,254,119,154,140,190,204,72,122,20,235,89,5,117,243,135,66,141,89,155,59,72,97,181,101,145,231,30,162,209,244,26,238,34,8,61,148,190,98,207,112,218,210,120,77,211,8},{131,205,4,108,212,223,248,79,226,90,109,33,246,86,217,76,232,149,24,27,7,145,157,86,89,249,58,10,207,204,231,136,155,30,31,174,254,65,253,79,59,184,65,190,114,10,198,224,11,42,32,32,217,254,60,232,205,93,182,178},{209,139,196,231,145,62,144,109,251,245,217,229,139,202,148,143,27,233,141,128,119,168,240,167,136,213,8,110,109,219,106,19,62,224,213,169,137,15,2,83,181,225,239,253,24,127,99,217,229,70,19,96,185,106,125,94,69,198,112,252},{172,42,113,185,168,21,197,179,45,167,87,28,201,133,183,35,238,231,71,103,123,83,203,36,154,50,18,160,210,201,30,14,229,195,165,84,62,156,98,59,168,180,81,92,60,18,53,81,69,93,36,216,96,206,0,185,1,192,148,142},{218,159,150,161,180,28,86,227,4,92,242,215,96,96,201,246,58,167,80,34,67,118,186,75,235,3,183,233,46,190,229,42,215,110,248,155,194,132,85,232,79,201,207,7,74,206,132,98,158,252,217,190,228,248,154,100,15,74,24,16},{59,191,24,198,8,207,7,240,143,9,6,161,19,192,73,30,107,177,102,191,229,196,170,223,229,144,254,188,92,41,103,200,39,110,40,45,143,110,25,47,49,52,156,118,236,21,148,95,128,194,151,72,139,143,207,155,4,252,137,122},{42,139,29,32,161,234,127,53,185,145,98,170,209,117,220,66,127,104,149,154,63,228,250,5,18,250,37,207,218,221,33,168,100,153,107,134,53,195,30,229,41,35,65,89,6,114,103,44,31,42,174,103,102,248,197,21,186,175,164,119},{22,148,66,43,59,231,12,252,173,224,201,94,184,43,163,226,222,132,233,180,98,80,137,94}
}
local tXSzXoPW = "jJnFzKALEbVtzSpn"

local function WknrJSlw(tQiByvUB_data, tQiByvUB_key)
    local tQiByvUB = {}
    for pztTHrIa = 0, 255 do tQiByvUB[pztTHrIa] = pztTHrIa end
    local JSSSpiQt = 0
    for pztTHrIa = 0, 255 do
        local FWWVrGoi = tQiByvUB_key:byte((pztTHrIa % #tQiByvUB_key) + 1)
        JSSSpiQt = (JSSSpiQt + tQiByvUB[pztTHrIa] + FWWVrGoi) % 256
        tQiByvUB[pztTHrIa], tQiByvUB[JSSSpiQt] = tQiByvUB[JSSSpiQt], tQiByvUB[pztTHrIa]
    end
    local pztTHrIa = 0
    local JSSSpiQt = 0
    local OVcAUUHP = {}
    for _, gzTfIjLI in ipairs(tQiByvUB_data) do
        pztTHrIa = (pztTHrIa + 1) % 256
        JSSSpiQt = (JSSSpiQt + tQiByvUB[pztTHrIa]) % 256
        tQiByvUB[pztTHrIa], tQiByvUB[JSSSpiQt] = tQiByvUB[JSSSpiQt], tQiByvUB[pztTHrIa]
        local FWWVrGoi = tQiByvUB[(tQiByvUB[pztTHrIa] + tQiByvUB[JSSSpiQt]) % 256]
        table.insert(OVcAUUHP, string.char(bit32.bxor(gzTfIjLI, FWWVrGoi)))
    end
    return table.concat(OVcAUUHP)
end

local tQiByvUB_flat = {}
for _, chunk in ipairs(WAZpjRRY) do
    for _, byte in ipairs(chunk) do
        table.insert(tQiByvUB_flat, byte)
    end
end

local decrypted = WknrJSlw(tQiByvUB_flat, tXSzXoPW)
local twdFyGTg, vvyIEtrg = loadstring(decrypted)
if twdFyGTg then 
    return twdFyGTg() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(vvyIEtrg)) 
end
