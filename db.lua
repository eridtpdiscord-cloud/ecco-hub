-- Protected Segment (db)
local WUPzRZcK = 52
local glwAWLNb = {
{103,13,84,85,151,92,19,0,71,252,43,192,15,156,98,90,186,113,196,77,131,233,55,69,177,173,239,175,196,53,226,19,196,40,91,152,247,163,40,200,115,54,91,34,225,105,94,17,106,135,147,193,38,49,82,162,143,30,186,238},{247,186,122,24,115,37,146,244,241,96,89,129,115,17,92,237,245,81,113,158,28,204,131,241,76,39,221,29,42,234,214,195,66,104,123,19,254,219,142,60,235,246,146,52,114,90,253,59,15,0,3,111,83,42,77,150,170,190,109,65},{129,234,160,59,248,214,196,24,185,163,145,221,209,71,139,219,129,250,150,108,28,59,68,113,122,192,218,206,224,202,230,147,82,126,48,167,146,199,181,85,213,162,149,171,63,138,235,200,229,190,31,187,115,213,173,209,141,222,136,217},{168,66,193,112,249,247,29,77,148,168,97,9,113,100,123,203,141,220,134,85,33,215,201,15,124,220,19,242,245,202,117,14,254,251,151,127,49,135,196,148,193,155,17,112,3,6,86,38,66,235,191,27,202,180,182,119,130,177,207,192},{213,24,28,216,52,189,12,23,73,68,1,56,102,5,129,241,24,44,130,214,35,180,62,106,146,27,222,113,34,157,182,230,4,247,133,18,152,179,192,160,240,1,147,252,226,23,71,221,216,164,16,10,168,166,162,176,60,66,29,144},{114,58,201,60,72,78,114,93,215,233,222,195,11,61,168,202,92,20,248,101,92,224,189,210,67,60,20,146,81,38,127,63,188,61,176,66,226,87,154,196,63,97,15,171,164,43,99,17,182,164,204,142,52,140,9,176,26,90,154,82},{226,202,139,187,113,121,236,220,160,242,220,42,181,189,148,246,225,98,134,74,135,127,204,184,220,84,81,170,141,134,113,7,18,5,101,15,29,242,73,217,182,143,100,54,170}
}
local OGbIMQrj = "ZzRtblqHYIewXlxa"

local function mGtfwmSt(xyUQpxIT_data, xyUQpxIT_key)
    local xyUQpxIT = {}
    for HCWvoiJw = 0, 255 do xyUQpxIT[HCWvoiJw] = HCWvoiJw end
    local WjSdoJwt = 0
    for HCWvoiJw = 0, 255 do
        local JbPurcMj = xyUQpxIT_key:byte((HCWvoiJw % #xyUQpxIT_key) + 1)
        WjSdoJwt = (WjSdoJwt + xyUQpxIT[HCWvoiJw] + JbPurcMj) % 256
        xyUQpxIT[HCWvoiJw], xyUQpxIT[WjSdoJwt] = xyUQpxIT[WjSdoJwt], xyUQpxIT[HCWvoiJw]
    end
    local HCWvoiJw = 0
    local WjSdoJwt = 0
    local mkDLkDVM = {}
    for _, rTLTSFAK in ipairs(xyUQpxIT_data) do
        HCWvoiJw = (HCWvoiJw + 1) % 256
        WjSdoJwt = (WjSdoJwt + xyUQpxIT[HCWvoiJw]) % 256
        xyUQpxIT[HCWvoiJw], xyUQpxIT[WjSdoJwt] = xyUQpxIT[WjSdoJwt], xyUQpxIT[HCWvoiJw]
        local JbPurcMj = xyUQpxIT[(xyUQpxIT[HCWvoiJw] + xyUQpxIT[WjSdoJwt]) % 256]
        local unmasked = bit32.bxor(rTLTSFAK, WUPzRZcK)
        table.insert(mkDLkDVM, string.char(bit32.bxor(unmasked, JbPurcMj)))
    end
    return table.concat(mkDLkDVM)
end

local xyUQpxIT_flat = {}
for _, chunk in ipairs(glwAWLNb) do
    for _, byte in ipairs(chunk) do
        table.insert(xyUQpxIT_flat, byte)
    end
end

local decrypted = mGtfwmSt(xyUQpxIT_flat, OGbIMQrj)
local pihVbWmc, OpHlDcxS = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(xyUQpxIT_flat)
xyUQpxIT_flat = nil

if pihVbWmc then 
    local result = pihVbWmc() 
    decrypted = nil
    pihVbWmc = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(OpHlDcxS)) 
end
