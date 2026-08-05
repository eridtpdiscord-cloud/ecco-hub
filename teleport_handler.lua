-- Protected Segment (teleport_handler)
local cZbSHAgv = 237
local MDCImrPB = {
{49,86,129,79,94,1,127,172,201,166,98,114,66,43,88,39,52,141,58,56,94,66,124,118,100,75,148,80,125,97,221,130,216,55,173,207,88,153,250,239,24,220,36,169,157,158,97,212,190,230,87,88,248,161,172,231,122,153,173,64},{134,28,72,1,66,154,2,149,45,31,210,19,212,114,158,93,187,242,212,143,94,22,164,66,23,179,100,252,149,225,114,254,49,115,224,187,247,236,162,194,18,154,12,179,178,108,208,191,115,213,2,58,73,38,247,35,197,207,130,27},{80,171,152,250,29,94,223,180,65,94,151,26,115,171,121,193,39,204,174,210,53,230,87,129,122,103,240,120}
}
local TKFeAJJP = "EfoASVDJrTsviWIT"

local function NsQFtdIl(nexthbns_data, nexthbns_key)
    if type(nexthbns_key) ~= "string" or #nexthbns_key == 0 then return "" end
    local nexthbns = {}
    for MarpoFjh = 0, 255 do nexthbns[MarpoFjh] = MarpoFjh end
    local htXtUTtm = 0
    for MarpoFjh = 0, 255 do
        local AtZWTbTH = nexthbns_key:byte((MarpoFjh % #nexthbns_key) + 1)
        htXtUTtm = (htXtUTtm + nexthbns[MarpoFjh] + AtZWTbTH) % 256
        nexthbns[MarpoFjh], nexthbns[htXtUTtm] = nexthbns[htXtUTtm], nexthbns[MarpoFjh]
    end
    local MarpoFjh = 0
    local htXtUTtm = 0
    local tVUMBtyU = {}
    for _, vbugBQex in ipairs(nexthbns_data) do
        MarpoFjh = (MarpoFjh + 1) % 256
        htXtUTtm = (htXtUTtm + nexthbns[MarpoFjh]) % 256
        nexthbns[MarpoFjh], nexthbns[htXtUTtm] = nexthbns[htXtUTtm], nexthbns[MarpoFjh]
        local AtZWTbTH = nexthbns[(nexthbns[MarpoFjh] + nexthbns[htXtUTtm]) % 256]
        local unmasked = bit32.bxor(vbugBQex, cZbSHAgv)
        table.insert(tVUMBtyU, string.char(bit32.bxor(unmasked, AtZWTbTH)))
    end
    return table.concat(tVUMBtyU)
end

local nexthbns_flat = {}
for _, chunk in ipairs(MDCImrPB) do
    for _, byte in ipairs(chunk) do
        table.insert(nexthbns_flat, byte)
    end
end

local decrypted = NsQFtdIl(nexthbns_flat, TKFeAJJP)
local TclJMpII, sjogvTxY = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(nexthbns_flat)
nexthbns_flat = nil

if TclJMpII then 
    local result = TclJMpII() 
    decrypted = nil
    TclJMpII = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(sjogvTxY)) 
end
