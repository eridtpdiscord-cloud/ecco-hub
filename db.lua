-- Compiled secure segment
local nVJMKfGE = {
{167,49,124,233,222,156,213,33,160,45,114,166,154,4,236,219,35,119,167,9,64,121,172,58,38,115,6,49,112,205,104,1,31,213,135,219,0,74,215,140,0,32,91,255,95,74,15,188,213,111,9,232,120,147,222,94,123,80,255,143},{166,75,85,149,231,191,177,177,88,152,125,57,84,140,156,204,159,92,146,126,201,181,18,37,253,177,72,221,149,87,0,217,43,226,248,13,193,45,164,171,182,83,153,171,68,208,75,18,186,29,244,230,186,239,173,200,67,160,119,230},{86,123,243,192,80,53,243,109,89,75,156,59,175,139,87,62,135,140,254,39,78,217,87,186,74,192,130,105,146,145,78,194,158,205,124,160,209,46,142,135,111,249,67,205,235,128,50,7,70,125,95,183,12,93,28,9,29,20,124,113},{162,45,24,51,42,65,143,183,245,101,175,138,189,151,164,126,53,95,51,39,59,173,83,93,139,55,43,233,167,32,214,13,148,63,89,137,42,141,184,79,180,208,195,137,90,254,164,50,38,220,150,153,122,100,101,51,64,84,234,195},{11,5,184,164,178,210,56,13,78,64,171,237,199,49,205,135,24,113,37,251,78,119,187,230,32,162,72,7,91,200,244,132,19,242,19,10,164,57,89,83,163,120,115,214,78,35,99,71,160,178,222,54,79,92,190,212,225,71,64,197},{23,28,153,15,84,143,167,235,2,101,38,148,245,8,217,83,2,213,33,189,53,235,90,186,127,124,148,203,187,174,89,209,95,169,74,217,251,29,32,178,228,2,63,169,61,147,188,191,224,178,32,96,157,163,136,82,30,83,254,195},{58,174,70,7,233,204,117,134,43,75,102,1,254,69,34,58,47,208,42,221,233,82,114,62,49,110,27,99,188,39,229,0,225,61,6,210,54,136,48,243,146,170,128,37,16,249}
}
local drNyZGhY = "skCavCLEoMkcTMdJ"

local function cBrKlIYu(BJCuDguO_data, BJCuDguO_key)
    local BJCuDguO = {}
    for iWXswckB = 0, 255 do BJCuDguO[iWXswckB] = iWXswckB end
    local CbjrRUfg = 0
    for iWXswckB = 0, 255 do
        local jSmmOAPn = BJCuDguO_key:byte((iWXswckB % #BJCuDguO_key) + 1)
        CbjrRUfg = (CbjrRUfg + BJCuDguO[iWXswckB] + jSmmOAPn) % 256
        BJCuDguO[iWXswckB], BJCuDguO[CbjrRUfg] = BJCuDguO[CbjrRUfg], BJCuDguO[iWXswckB]
    end
    local iWXswckB = 0
    local CbjrRUfg = 0
    local igVSsEHq = {}
    for _, aGjosFtk in ipairs(BJCuDguO_data) do
        iWXswckB = (iWXswckB + 1) % 256
        CbjrRUfg = (CbjrRUfg + BJCuDguO[iWXswckB]) % 256
        BJCuDguO[iWXswckB], BJCuDguO[CbjrRUfg] = BJCuDguO[CbjrRUfg], BJCuDguO[iWXswckB]
        local jSmmOAPn = BJCuDguO[(BJCuDguO[iWXswckB] + BJCuDguO[CbjrRUfg]) % 256]
        table.insert(igVSsEHq, string.char(bit32.bxor(aGjosFtk, jSmmOAPn)))
    end
    return table.concat(igVSsEHq)
end

local BJCuDguO_flat = {}
for _, chunk in ipairs(nVJMKfGE) do
    for _, byte in ipairs(chunk) do
        table.insert(BJCuDguO_flat, byte)
    end
end

local decrypted = cBrKlIYu(BJCuDguO_flat, drNyZGhY)
local SQZIutHJ, pBulPaQY = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(BJCuDguO_flat)
BJCuDguO_flat = nil

if SQZIutHJ then 
    local result = SQZIutHJ() 
    decrypted = nil
    SQZIutHJ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(pBulPaQY)) 
end
