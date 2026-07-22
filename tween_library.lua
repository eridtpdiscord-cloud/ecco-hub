-- Protected Segment (tween_library)
local IESZUyYT = 127
local VAKbYnJl = {
{197,177,59,161,179,21,82,228,83,221,212,69,133,122,87,241,61,184,225,81,93,182,154,90,50,33,194,30,157,87,253,63,70,197,110,119,252,19,43,162,89,164,202,104,27,131,203,109,31,137,49,63,20,102,68,222,214,135,96,99},{224,230,189,71,206,126,119,44,60,119,13,78,9,81,81,87,208,32,21,99,59,61,46,50,61,225,148,251,184,205,0,213,2,91,63,8,44,154,200,145,93,127,108,132,176,204,51,192,182,104,233,200,75,215,156,1,74,22,228,250},{111,47,137,232,140,255,219,34,211,49,210,220,244,32,181,97,35,223,7,108,206,9,50,194,104}
}
local vdxKSToC = "nAWUUQSodOAZMQCm"

local function myrJlEyM(XCCtyoFz_data, XCCtyoFz_key)
    local XCCtyoFz = {}
    for gtRttSPe = 0, 255 do XCCtyoFz[gtRttSPe] = gtRttSPe end
    local aOJYiQHg = 0
    for gtRttSPe = 0, 255 do
        local LmLPPWhs = XCCtyoFz_key:byte((gtRttSPe % #XCCtyoFz_key) + 1)
        aOJYiQHg = (aOJYiQHg + XCCtyoFz[gtRttSPe] + LmLPPWhs) % 256
        XCCtyoFz[gtRttSPe], XCCtyoFz[aOJYiQHg] = XCCtyoFz[aOJYiQHg], XCCtyoFz[gtRttSPe]
    end
    local gtRttSPe = 0
    local aOJYiQHg = 0
    local xXGgfQws = {}
    for _, qpmyNTOm in ipairs(XCCtyoFz_data) do
        gtRttSPe = (gtRttSPe + 1) % 256
        aOJYiQHg = (aOJYiQHg + XCCtyoFz[gtRttSPe]) % 256
        XCCtyoFz[gtRttSPe], XCCtyoFz[aOJYiQHg] = XCCtyoFz[aOJYiQHg], XCCtyoFz[gtRttSPe]
        local LmLPPWhs = XCCtyoFz[(XCCtyoFz[gtRttSPe] + XCCtyoFz[aOJYiQHg]) % 256]
        local unmasked = bit32.bxor(qpmyNTOm, IESZUyYT)
        table.insert(xXGgfQws, string.char(bit32.bxor(unmasked, LmLPPWhs)))
    end
    return table.concat(xXGgfQws)
end

local XCCtyoFz_flat = {}
for _, chunk in ipairs(VAKbYnJl) do
    for _, byte in ipairs(chunk) do
        table.insert(XCCtyoFz_flat, byte)
    end
end

local decrypted = myrJlEyM(XCCtyoFz_flat, vdxKSToC)
local ehtPdgec, ZmVcpcrd = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(XCCtyoFz_flat)
XCCtyoFz_flat = nil

if ehtPdgec then 
    local result = ehtPdgec() 
    decrypted = nil
    ehtPdgec = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(ZmVcpcrd)) 
end
