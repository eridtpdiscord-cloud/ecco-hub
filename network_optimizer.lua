-- Protected Segment (network_optimizer)
local HlkminRJ = 253
local cqhszrZt = {
{235,202,150,40,53,32,53,66,71,170,246,179,87,246,195,54,234,152,175,108,201,79,67,44,15,152,134,97,85,197,110,15,88,210,176,149,71,145,15,183,66,31,29,87,230,101,10,79,216,115,139,251,118,120,247,85,220,166,194,102},{169,187,147,192,28,114,134,31,9,193,30,83,65,25,217,116,126,97,172,67,43,203,166,228,233,79,19,43,135,164,28,223,235,251,176,142,207,140,183,73,45,232,48,136,82,113,28,18,234,137,29,25,62,89,79,91,168,216,196,129},{45,250,109,242,20,181,1,1,19,209,255,201,33,161,41,247,198,246,166,192,186,83,78,228,132,83,152,104,104}
}
local jEMBfZsC = "GIFErpbGWFtugiHm"

local function QIEHetsu(jxuyfSFP_data, jxuyfSFP_key)
    if type(jxuyfSFP_key) ~= "string" or #jxuyfSFP_key == 0 then return "" end
    local jxuyfSFP = {}
    for CWKyzCfV = 0, 255 do jxuyfSFP[CWKyzCfV] = CWKyzCfV end
    local MsIeQSOH = 0
    for CWKyzCfV = 0, 255 do
        local kYqkVMEc = jxuyfSFP_key:byte((CWKyzCfV % #jxuyfSFP_key) + 1)
        MsIeQSOH = (MsIeQSOH + jxuyfSFP[CWKyzCfV] + kYqkVMEc) % 256
        jxuyfSFP[CWKyzCfV], jxuyfSFP[MsIeQSOH] = jxuyfSFP[MsIeQSOH], jxuyfSFP[CWKyzCfV]
    end
    local CWKyzCfV = 0
    local MsIeQSOH = 0
    local vbQhMMRK = {}
    for _, ByqgBHik in ipairs(jxuyfSFP_data) do
        CWKyzCfV = (CWKyzCfV + 1) % 256
        MsIeQSOH = (MsIeQSOH + jxuyfSFP[CWKyzCfV]) % 256
        jxuyfSFP[CWKyzCfV], jxuyfSFP[MsIeQSOH] = jxuyfSFP[MsIeQSOH], jxuyfSFP[CWKyzCfV]
        local kYqkVMEc = jxuyfSFP[(jxuyfSFP[CWKyzCfV] + jxuyfSFP[MsIeQSOH]) % 256]
        local unmasked = bit32.bxor(ByqgBHik, HlkminRJ)
        table.insert(vbQhMMRK, string.char(bit32.bxor(unmasked, kYqkVMEc)))
    end
    return table.concat(vbQhMMRK)
end

local jxuyfSFP_flat = {}
for _, chunk in ipairs(cqhszrZt) do
    for _, byte in ipairs(chunk) do
        table.insert(jxuyfSFP_flat, byte)
    end
end

local decrypted = QIEHetsu(jxuyfSFP_flat, jEMBfZsC)
local uRNFuolG, XnCGlHZl = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(jxuyfSFP_flat)
jxuyfSFP_flat = nil

if uRNFuolG then 
    local result = uRNFuolG() 
    decrypted = nil
    uRNFuolG = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(XnCGlHZl)) 
end
