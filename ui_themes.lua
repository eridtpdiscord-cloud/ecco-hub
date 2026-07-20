-- Compiled secure segment
local nnSUJXRK = {
{92,90,179,249,253,183,225,199,241,68,59,165,130,132,224,12,53,215,30,113,14,43,90,201,17,59,91,183,213,193,167,225,215,207,82,209,75,45,123,209,175,28,29,233,169,197,68,213,189,131,121,131,87,231,69,87,98,59,236,170},{107,211,64,129,65,126,220,251,30,7,46,183,235,166,10,137,50,210,84,96,112,104,7,70,61,7,166,197,94,9,153,79,135,169,170,212,225,59,227,158,192,131,170,111,135,190,187,234,210,25,103,79,79,90,6,105,188,110,23,148},{131,217,196,0,135,4,59,113,169,198,175,228,190,81,164,90,135,86,249,223,178}
}
local eKqYHtvL = "aBTmAkwvtXwJbxpI"

local function EHSjiCWe(nbijBXMt_data, nbijBXMt_key)
    local nbijBXMt = {}
    for cvePDLTe = 0, 255 do nbijBXMt[cvePDLTe] = cvePDLTe end
    local FueBjBDX = 0
    for cvePDLTe = 0, 255 do
        local vCSCbDNk = nbijBXMt_key:byte((cvePDLTe % #nbijBXMt_key) + 1)
        FueBjBDX = (FueBjBDX + nbijBXMt[cvePDLTe] + vCSCbDNk) % 256
        nbijBXMt[cvePDLTe], nbijBXMt[FueBjBDX] = nbijBXMt[FueBjBDX], nbijBXMt[cvePDLTe]
    end
    local cvePDLTe = 0
    local FueBjBDX = 0
    local MSwQmyJw = {}
    for _, INeUpEgb in ipairs(nbijBXMt_data) do
        cvePDLTe = (cvePDLTe + 1) % 256
        FueBjBDX = (FueBjBDX + nbijBXMt[cvePDLTe]) % 256
        nbijBXMt[cvePDLTe], nbijBXMt[FueBjBDX] = nbijBXMt[FueBjBDX], nbijBXMt[cvePDLTe]
        local vCSCbDNk = nbijBXMt[(nbijBXMt[cvePDLTe] + nbijBXMt[FueBjBDX]) % 256]
        table.insert(MSwQmyJw, string.char(bit32.bxor(INeUpEgb, vCSCbDNk)))
    end
    return table.concat(MSwQmyJw)
end

local nbijBXMt_flat = {}
for _, chunk in ipairs(nnSUJXRK) do
    for _, byte in ipairs(chunk) do
        table.insert(nbijBXMt_flat, byte)
    end
end

local decrypted = EHSjiCWe(nbijBXMt_flat, eKqYHtvL)
local fssiXGQl, fNahOsxm = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(nbijBXMt_flat)
nbijBXMt_flat = nil

if fssiXGQl then 
    local result = fssiXGQl() 
    decrypted = nil
    fssiXGQl = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(fNahOsxm)) 
end
