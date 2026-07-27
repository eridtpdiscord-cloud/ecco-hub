-- Protected Segment (math_vector_utils)
local HvQUCKlM = 77
local NjbsTDVj = {
{126,96,21,15,252,225,54,169,72,67,155,90,54,131,211,4,57,93,59,140,34,30,159,216,84,222,212,72,170,138,249,216,164,157,44,93,51,228,247,212,228,4,246,48,0,29,95,231,239,67,188,26,69,132,27,22,203,16,133,228},{201,89,218,6,25,14,36,123,204,98,199,86,25,167,98,139,36,189,189,13,196,116,206,24,48,23,148,63,85,26,230,91,90,137,131,139,71,57,179,205,16,253,8,249,125,115,39,8,160,169,27,95,153,158,55,122,242,102,135,87},{9,224,130,44,139,199,63,110,110,97,12,239,2,72,57,76,89,219,196,117,114,20,130,35,2,184,173,8,121}
}
local zNRZGWlF = "uYQhogkhRAtofcJg"

local function aQylbVDJ(UkINHdko_data, UkINHdko_key)
    if type(UkINHdko_key) ~= "string" or #UkINHdko_key == 0 then return "" end
    local UkINHdko = {}
    for jgyWmMea = 0, 255 do UkINHdko[jgyWmMea] = jgyWmMea end
    local PDgzyATH = 0
    for jgyWmMea = 0, 255 do
        local wzYlGwVO = UkINHdko_key:byte((jgyWmMea % #UkINHdko_key) + 1)
        PDgzyATH = (PDgzyATH + UkINHdko[jgyWmMea] + wzYlGwVO) % 256
        UkINHdko[jgyWmMea], UkINHdko[PDgzyATH] = UkINHdko[PDgzyATH], UkINHdko[jgyWmMea]
    end
    local jgyWmMea = 0
    local PDgzyATH = 0
    local FgCnLQff = {}
    for _, WGyuwCWo in ipairs(UkINHdko_data) do
        jgyWmMea = (jgyWmMea + 1) % 256
        PDgzyATH = (PDgzyATH + UkINHdko[jgyWmMea]) % 256
        UkINHdko[jgyWmMea], UkINHdko[PDgzyATH] = UkINHdko[PDgzyATH], UkINHdko[jgyWmMea]
        local wzYlGwVO = UkINHdko[(UkINHdko[jgyWmMea] + UkINHdko[PDgzyATH]) % 256]
        local unmasked = bit32.bxor(WGyuwCWo, HvQUCKlM)
        table.insert(FgCnLQff, string.char(bit32.bxor(unmasked, wzYlGwVO)))
    end
    return table.concat(FgCnLQff)
end

local UkINHdko_flat = {}
for _, chunk in ipairs(NjbsTDVj) do
    for _, byte in ipairs(chunk) do
        table.insert(UkINHdko_flat, byte)
    end
end

local decrypted = aQylbVDJ(UkINHdko_flat, zNRZGWlF)
local DHDxKVqu, HrytbNHZ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(UkINHdko_flat)
UkINHdko_flat = nil

if DHDxKVqu then 
    local result = DHDxKVqu() 
    decrypted = nil
    DHDxKVqu = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(HrytbNHZ)) 
end
