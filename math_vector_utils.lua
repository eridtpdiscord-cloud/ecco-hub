-- Compiled secure segment
local XsOQvjFx = {
{23,192,226,166,133,223,213,17,142,23,238,81,15,57,58,84,3,15,173,41,43,203,113,224,128,97,152,17,180,50,80,218,65,171,219,9,234,71,216,76,36,192,22,66,88,93,62,109,35,46,182,109,56,180,88,80,138,186,181,47},{16,112,89,197,107,75,231,200,213,125,105,7,112,51,108,105,69,95,191,139,173,159,56,86,220,132,76,184,154,118,5,249,157,111,162,234,50,145,121,237,212,59,131,19,130,133,194,14,153,192,2,139,219,158,212,168,5,168,85,198},{106,111,253,74,255,180,25,180,251,111,38,211,246,193,64,215,93,181,135,24,131,228,61,32,98,168,200,41,74}
}
local YHYqjpsI = "kZKQyJVKGYGLUpVI"

local function BzNJraRV(zlGDuwWE_data, zlGDuwWE_key)
    local zlGDuwWE = {}
    for GoHOfHnA = 0, 255 do zlGDuwWE[GoHOfHnA] = GoHOfHnA end
    local vghEmCvR = 0
    for GoHOfHnA = 0, 255 do
        local LPUOGJpP = zlGDuwWE_key:byte((GoHOfHnA % #zlGDuwWE_key) + 1)
        vghEmCvR = (vghEmCvR + zlGDuwWE[GoHOfHnA] + LPUOGJpP) % 256
        zlGDuwWE[GoHOfHnA], zlGDuwWE[vghEmCvR] = zlGDuwWE[vghEmCvR], zlGDuwWE[GoHOfHnA]
    end
    local GoHOfHnA = 0
    local vghEmCvR = 0
    local YVigbXjN = {}
    for _, YYlHnaZx in ipairs(zlGDuwWE_data) do
        GoHOfHnA = (GoHOfHnA + 1) % 256
        vghEmCvR = (vghEmCvR + zlGDuwWE[GoHOfHnA]) % 256
        zlGDuwWE[GoHOfHnA], zlGDuwWE[vghEmCvR] = zlGDuwWE[vghEmCvR], zlGDuwWE[GoHOfHnA]
        local LPUOGJpP = zlGDuwWE[(zlGDuwWE[GoHOfHnA] + zlGDuwWE[vghEmCvR]) % 256]
        table.insert(YVigbXjN, string.char(bit32.bxor(YYlHnaZx, LPUOGJpP)))
    end
    return table.concat(YVigbXjN)
end

local zlGDuwWE_flat = {}
for _, chunk in ipairs(XsOQvjFx) do
    for _, byte in ipairs(chunk) do
        table.insert(zlGDuwWE_flat, byte)
    end
end

local decrypted = BzNJraRV(zlGDuwWE_flat, YHYqjpsI)
local rKNmrdEW, CugwRfFk = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(zlGDuwWE_flat)
zlGDuwWE_flat = nil

if rKNmrdEW then 
    local result = rKNmrdEW() 
    decrypted = nil
    rKNmrdEW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(CugwRfFk)) 
end
