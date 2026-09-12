--[[
    ================================================================================
    ECCO HUB V3 — OFFICIAL PRODUCT SUITE
    ================================================================================
    Discord  : https://discord.gg/hN9QpA3HA
    TikTok   : https://www.tiktok.com/@_ecc00_?is_from_webapp=1&sender_device=pc
    Website  : https://eccohub.xyz
    Branding : Ecco Symbol Emblem (ecco_symbol.png)
    ================================================================================
--]]
task.spawn(function()
    local gethui = gethui or function() return game:GetService("CoreGui") end
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
    local TweenService = game:GetService("TweenService")
    local cb = setclipboard or toclipboard or (Clipboard and Clipboard.set)

    -- 1. Ensure ecco_symbol.png is cached locally
    pcall(function()
        if isfile and not isfile("ecco_symbol.png") then
            pcall(function()
                local s = game:HttpGet("https://raw.githubusercontent.com/eridtpdiscord-cloud/ecco-loader/main/ecco_symbol.png")
                if s and #s > 1000 then writefile("ecco_symbol.png", s) end
            end)
            if not isfile("ecco_symbol.png") then
                pcall(function()
                    local s = game:HttpGet("http://127.0.0.1:8999/ecco_symbol.png")
                    if s and #s > 1000 then writefile("ecco_symbol.png", s) end
                end)
            end
            if not isfile("ecco_symbol.png") then
                pcall(function()
                    local s = game:HttpGet("https://eccohub.xyz/ecco_symbol.png")
                    if s and #s > 1000 then writefile("ecco_symbol.png", s) end
                end)
            end
        end
    end)

    local symbolAsset = getcustomasset and isfile and isfile("ecco_symbol.png") and getcustomasset("ecco_symbol.png")

    -- 2. Continuously brand any UI created by this script
    for loopIdx = 1, 150 do
        task.wait(0.25)
        local allGuis = {}
        for _, c in ipairs(gethui():GetChildren()) do
            if c:IsA("ScreenGui") and c.Name ~= "EccoLoaderModal" then
                table.insert(allGuis, c)
            end
        end
        if LocalPlayer:FindFirstChild("PlayerGui") then
            for _, c in ipairs(LocalPlayer.PlayerGui:GetChildren()) do
                if c:IsA("ScreenGui") and c.Name ~= "EccoLoaderModal" then
                    table.insert(allGuis, c)
                end
            end
        end

        for _, gui in ipairs(allGuis) do
            -- Enforce symbol emblem on window icons & toggle buttons
            if symbolAsset then
                for _, desc in ipairs(gui:GetDescendants()) do
                    if desc:IsA("ImageLabel") and (desc.Image:find("78539693571783") or desc.Image:find("91400086538074") or desc.Name:find("Icon") or desc.Name == "EccoSymbol") then
                        if desc.Image ~= symbolAsset and desc.Size.Y.Offset >= 18 and desc.Size.Y.Offset <= 48 then
                            desc.Image = symbolAsset
                            desc.ImageRectSize = Vector2.zero
                            desc.ImageRectOffset = Vector2.zero
                        end
                    elseif desc:IsA("ImageButton") and (gui.Name:find("Toggle") or desc.Name:find("Toggle")) then
                        if desc.Image ~= symbolAsset then
                            desc.Image = symbolAsset
                            desc.ImageRectSize = Vector2.zero
                            desc.ImageRectOffset = Vector2.zero
                        end
                    end
                end
            end

            -- Rebrand titles to Ecco Hub V3
            for _, desc in ipairs(gui:GetDescendants()) do
                if desc:IsA("TextLabel") then
                    if desc.Text:find("By Ouroboros Hub") or desc.Text:find("Ouroboros") then
                        desc.Text = "  •  Ecco Hub V3"
                        desc.TextColor3 = Color3.fromRGB(0, 200, 255)
                    end
                elseif desc:IsA("TextButton") then
                    if desc.Text:find("discord.gg/ecc00") or desc.Text:find("discord.gg/ouroboros") then
                        desc.Text = desc.Text:gsub("discord.gg/%w+", "discord.gg/hN9QpA3HA")
                    elseif desc.Text == "Website" or desc.Text == "Rscripts" then
                        desc.Text = "TikTok (@_ecc00_)"
                        desc.MouseButton1Click:Connect(function()
                            if cb then cb("https://www.tiktok.com/@_ecc00_?is_from_webapp=1&sender_device=pc") end
                        end)
                    elseif desc.Text == "Discord" then
                        desc.MouseButton1Click:Connect(function()
                            if cb then cb("https://discord.gg/hN9QpA3HA") end
                        end)
                    end
                end
            end
        end
    end
end)

--[[ ECCO HUB V3 | discord.gg/hN9QpA3HA | https://eccohub.xyz ]]
local message = "discontinued"
game:GetService("Players").LocalPlayer:Kick(message)
