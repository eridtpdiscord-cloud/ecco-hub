-- Protected Segment (cache_invalidation)
local XxtJxljP = 204
local sDOktxNK = {
{55,108,84,206,23,173,137,218,65,4,44,94,219,228,239,220,73,102,51,45,140,237,179,245,231,225,22,10,40,31,6,87,231,249,127,224,154,67,6,149,76,58,33,188,254,59,156,217,158,26,245,156,224,107,61,125,209,245,227,68},{139,158,188,66,172,167,35,143,227,48,177,18,99,168,204,52,80,240,100,148,36,51,35,138,209,230,107,142,28,141,64,70,240,188,140,244,115,189,240,1,245,67,99,75,224,72,228,76,18,233,61,96,151,8,71,132,214,103,245,118},{118,208,199,223,121,204,70,60,138,250,228,252,218,248,64,120,24,146,219,96,252,73,98,189,41,150,166,116,87,78}
}
local aRtbdmrf = "sfzINOMpkTHtNlly"

local function wzbNCRAH(DdobnhdD_data, DdobnhdD_key)
    if type(DdobnhdD_key) ~= "string" or #DdobnhdD_key == 0 then return "" end
    local DdobnhdD = {}
    for RSdHKygc = 0, 255 do DdobnhdD[RSdHKygc] = RSdHKygc end
    local GItPJjtI = 0
    for RSdHKygc = 0, 255 do
        local PwrwKNUD = DdobnhdD_key:byte((RSdHKygc % #DdobnhdD_key) + 1)
        GItPJjtI = (GItPJjtI + DdobnhdD[RSdHKygc] + PwrwKNUD) % 256
        DdobnhdD[RSdHKygc], DdobnhdD[GItPJjtI] = DdobnhdD[GItPJjtI], DdobnhdD[RSdHKygc]
    end
    local RSdHKygc = 0
    local GItPJjtI = 0
    local XKDsTBqr = {}
    for _, bNZSBJMU in ipairs(DdobnhdD_data) do
        RSdHKygc = (RSdHKygc + 1) % 256
        GItPJjtI = (GItPJjtI + DdobnhdD[RSdHKygc]) % 256
        DdobnhdD[RSdHKygc], DdobnhdD[GItPJjtI] = DdobnhdD[GItPJjtI], DdobnhdD[RSdHKygc]
        local PwrwKNUD = DdobnhdD[(DdobnhdD[RSdHKygc] + DdobnhdD[GItPJjtI]) % 256]
        local unmasked = bit32.bxor(bNZSBJMU, XxtJxljP)
        table.insert(XKDsTBqr, string.char(bit32.bxor(unmasked, PwrwKNUD)))
    end
    return table.concat(XKDsTBqr)
end

local DdobnhdD_flat = {}
for _, chunk in ipairs(sDOktxNK) do
    for _, byte in ipairs(chunk) do
        table.insert(DdobnhdD_flat, byte)
    end
end

local decrypted = wzbNCRAH(DdobnhdD_flat, aRtbdmrf)
local rzPYvhDb, aGRHErDA = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(DdobnhdD_flat)
DdobnhdD_flat = nil

if rzPYvhDb then 
    local result = rzPYvhDb() 
    decrypted = nil
    rzPYvhDb = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(aGRHErDA)) 
end
