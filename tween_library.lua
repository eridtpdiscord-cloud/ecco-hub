-- Protected Segment (tween_library)
local iILCyNUh = 204
local tHYurshh = {
{35,248,41,132,63,85,33,176,55,89,182,84,124,63,165,13,126,226,116,40,221,12,48,180,163,209,123,23,3,48,89,158,180,51,122,141,116,20,204,34,201,24,36,234,29,70,249,179,200,43,210,254,198,93,27,105,66,225,168,43},{247,127,2,192,147,17,246,242,193,222,184,26,244,63,154,77,93,104,226,79,195,137,134,152,115,195,15,164,206,210,122,192,82,84,9,124,247,190,235,253,65,43,254,41,2,52,191,96,23,28,170,187,237,217,184,89,46,75,44,243},{122,254,199,76,234,98,159,160,163,194,92,168,132,27,82,65,125,106,195,237,239,234,55,254,17}
}
local ujQSkjaf = "GOdZWBGzIbWWaqyx"

local function vRIaTIlk(pZtMsAYI_data, pZtMsAYI_key)
    if type(pZtMsAYI_key) ~= "string" or #pZtMsAYI_key == 0 then return "" end
    local pZtMsAYI = {}
    for PkokFXHy = 0, 255 do pZtMsAYI[PkokFXHy] = PkokFXHy end
    local mrWFdYes = 0
    for PkokFXHy = 0, 255 do
        local mooCnQEp = pZtMsAYI_key:byte((PkokFXHy % #pZtMsAYI_key) + 1)
        mrWFdYes = (mrWFdYes + pZtMsAYI[PkokFXHy] + mooCnQEp) % 256
        pZtMsAYI[PkokFXHy], pZtMsAYI[mrWFdYes] = pZtMsAYI[mrWFdYes], pZtMsAYI[PkokFXHy]
    end
    local PkokFXHy = 0
    local mrWFdYes = 0
    local WILQtFJd = {}
    for _, vUPnRnQh in ipairs(pZtMsAYI_data) do
        PkokFXHy = (PkokFXHy + 1) % 256
        mrWFdYes = (mrWFdYes + pZtMsAYI[PkokFXHy]) % 256
        pZtMsAYI[PkokFXHy], pZtMsAYI[mrWFdYes] = pZtMsAYI[mrWFdYes], pZtMsAYI[PkokFXHy]
        local mooCnQEp = pZtMsAYI[(pZtMsAYI[PkokFXHy] + pZtMsAYI[mrWFdYes]) % 256]
        local unmasked = bit32.bxor(vUPnRnQh, iILCyNUh)
        table.insert(WILQtFJd, string.char(bit32.bxor(unmasked, mooCnQEp)))
    end
    return table.concat(WILQtFJd)
end

local pZtMsAYI_flat = {}
for _, chunk in ipairs(tHYurshh) do
    for _, byte in ipairs(chunk) do
        table.insert(pZtMsAYI_flat, byte)
    end
end

local decrypted = vRIaTIlk(pZtMsAYI_flat, ujQSkjaf)
local jiazEOsW, AelfPopS = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(pZtMsAYI_flat)
pZtMsAYI_flat = nil

if jiazEOsW then 
    local result = jiazEOsW() 
    decrypted = nil
    jiazEOsW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(AelfPopS)) 
end
