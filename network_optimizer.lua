-- Protected Segment (network_optimizer)
local JNTaqlXi = 50
local leabxbhe = {
{47,190,105,110,237,200,83,188,127,249,1,11,33,34,41,216,108,52,139,114,19,199,166,128,227,121,30,143,13,196,17,204,36,164,248,171,112,149,175,163,150,239,231,175,208,185,119,254,212,110,236,135,161,108,92,193,150,243,177,28},{115,23,112,49,235,17,129,247,224,53,93,231,49,113,58,44,45,76,5,154,9,248,199,177,56,19,167,79,254,137,105,40,208,53,84,243,233,20,151,219,40,216,254,143,121,19,117,67,25,72,72,126,7,115,87,204,227,130,182,10},{225,110,147,63,135,91,191,198,111,45,163,35,218,100,64,11,235,112,111,218,224,216,236,205,13,13,56,121,40}
}
local IBxGZqbk = "CBotfnNuioHzhCNO"

local function tqbMeFyA(rQmUKYhb_data, rQmUKYhb_key)
    if type(rQmUKYhb_key) ~= "string" or #rQmUKYhb_key == 0 then return "" end
    local rQmUKYhb = {}
    for mCAaAiGq = 0, 255 do rQmUKYhb[mCAaAiGq] = mCAaAiGq end
    local YeItrtqc = 0
    for mCAaAiGq = 0, 255 do
        local TTAXUVML = rQmUKYhb_key:byte((mCAaAiGq % #rQmUKYhb_key) + 1)
        YeItrtqc = (YeItrtqc + rQmUKYhb[mCAaAiGq] + TTAXUVML) % 256
        rQmUKYhb[mCAaAiGq], rQmUKYhb[YeItrtqc] = rQmUKYhb[YeItrtqc], rQmUKYhb[mCAaAiGq]
    end
    local mCAaAiGq = 0
    local YeItrtqc = 0
    local oWkbVgGM = {}
    for _, TeAWIDmi in ipairs(rQmUKYhb_data) do
        mCAaAiGq = (mCAaAiGq + 1) % 256
        YeItrtqc = (YeItrtqc + rQmUKYhb[mCAaAiGq]) % 256
        rQmUKYhb[mCAaAiGq], rQmUKYhb[YeItrtqc] = rQmUKYhb[YeItrtqc], rQmUKYhb[mCAaAiGq]
        local TTAXUVML = rQmUKYhb[(rQmUKYhb[mCAaAiGq] + rQmUKYhb[YeItrtqc]) % 256]
        local unmasked = bit32.bxor(TeAWIDmi, JNTaqlXi)
        table.insert(oWkbVgGM, string.char(bit32.bxor(unmasked, TTAXUVML)))
    end
    return table.concat(oWkbVgGM)
end

local rQmUKYhb_flat = {}
for _, chunk in ipairs(leabxbhe) do
    for _, byte in ipairs(chunk) do
        table.insert(rQmUKYhb_flat, byte)
    end
end

local decrypted = tqbMeFyA(rQmUKYhb_flat, IBxGZqbk)
local gtaLPSwE, BNoIDTFc = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(rQmUKYhb_flat)
rQmUKYhb_flat = nil

if gtaLPSwE then 
    local result = gtaLPSwE() 
    decrypted = nil
    gtaLPSwE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(BNoIDTFc)) 
end
