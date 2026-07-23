-- Protected Segment (utility_helper)
local OpSglXWQ = 248
local CWLvQnbB = {
{177,56,17,215,251,3,21,64,52,85,88,225,110,224,136,228,155,46,143,225,110,28,205,43,75,144,219,71,143,75,209,69,86,36,125,123,83,100,86,45,108,211,116,207,15,79,133,86,213,162,133,76,237,64,41,84,178,112,57,155},{87,105,239,147,253,100,64,162,95,57,160,41,160,173,254,145,178,180,7,145,250,50,26,248,247,190,88,187,195,61,147,81,243,162,4,247,174,26,232,34,90,213,39,111,65,203,206,33,191,250,194,119,164,35,99,19,156,118,131,210},{192,208,170,42,45,37,19,146,5,102,52,18,67,6,167,216,69,247,238,26,102,180,111,96,6,57}
}
local KNomNvZQ = "OCzHJIuBjsREugwN"

local function DGJJqlMT(mcooQHia_data, mcooQHia_key)
    if type(mcooQHia_key) ~= "string" or #mcooQHia_key == 0 then return "" end
    local mcooQHia = {}
    for MSvmTqiY = 0, 255 do mcooQHia[MSvmTqiY] = MSvmTqiY end
    local YxWqavVx = 0
    for MSvmTqiY = 0, 255 do
        local HRLKxWZL = mcooQHia_key:byte((MSvmTqiY % #mcooQHia_key) + 1)
        YxWqavVx = (YxWqavVx + mcooQHia[MSvmTqiY] + HRLKxWZL) % 256
        mcooQHia[MSvmTqiY], mcooQHia[YxWqavVx] = mcooQHia[YxWqavVx], mcooQHia[MSvmTqiY]
    end
    local MSvmTqiY = 0
    local YxWqavVx = 0
    local YuZnJkcy = {}
    for _, HXaKHGZp in ipairs(mcooQHia_data) do
        MSvmTqiY = (MSvmTqiY + 1) % 256
        YxWqavVx = (YxWqavVx + mcooQHia[MSvmTqiY]) % 256
        mcooQHia[MSvmTqiY], mcooQHia[YxWqavVx] = mcooQHia[YxWqavVx], mcooQHia[MSvmTqiY]
        local HRLKxWZL = mcooQHia[(mcooQHia[MSvmTqiY] + mcooQHia[YxWqavVx]) % 256]
        local unmasked = bit32.bxor(HXaKHGZp, OpSglXWQ)
        table.insert(YuZnJkcy, string.char(bit32.bxor(unmasked, HRLKxWZL)))
    end
    return table.concat(YuZnJkcy)
end

local mcooQHia_flat = {}
for _, chunk in ipairs(CWLvQnbB) do
    for _, byte in ipairs(chunk) do
        table.insert(mcooQHia_flat, byte)
    end
end

local decrypted = DGJJqlMT(mcooQHia_flat, KNomNvZQ)
local GFREPSQZ, IFXNqzPw = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(mcooQHia_flat)
mcooQHia_flat = nil

if GFREPSQZ then 
    local result = GFREPSQZ() 
    decrypted = nil
    GFREPSQZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(IFXNqzPw)) 
end
