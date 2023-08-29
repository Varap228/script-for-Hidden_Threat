game.StarterGui:SetCore("SendNotification", {
Title = "Varap Scripts"; 
Text = "Welcome ".. game.Players.LocalPlayer.Name; 
Icon = ""; 
Duration = 5; 
})
for i, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "NameGui" then
        v:Destroy()
    end
end
local players = game:GetService("Players")
for _, player in pairs(players:GetPlayers()) do
    local character = player.Character
    if character and character:FindFirstChild("Namehighlight") then
        character:FindFirstChild("Namehighlight"):Destroy()
    end
end

local Guii = Instance.new("ScreenGui")
Guii.Parent = game:GetService("CoreGui")
Guii.Name = "NameGui"

local Framaa = Instance.new("TextButton")
Framaa.Position = UDim2.new(0, 383, 0, 4)
Framaa.Size = UDim2.new(0, 100, 0, 100)
Framaa.Parent = Guii
Framaa.Text = "Left click=Check Murder \n Right click=remove highlight" 
Framaa.TextScaled = true
Framaa.TextColor3 = Color3.new(1, 1, 1)

local function OnButtonClick()
    Framaa.BackgroundColor3 = Color3.new(163/255, 162/255, 165/255) 
    Framaa.Text = "Who"
    if game:GetService("ReplicatedStorage").Settings.Impostor.Value ~= "" and game:GetService("ReplicatedStorage").Settings.Impostor.Value ~= game.Players.LocalPlayer.Name then
        if game.Players[game:GetService("ReplicatedStorage").Settings.Impostor.Value].Character:FindFirstChild("Namehighlight") then
            game.Players[game:GetService("ReplicatedStorage").Settings.Impostor.Value].Character.Namehighlight:Destroy()
        end
        local highlight = Instance.new("Highlight")
        highlight.FillColor = game.Players[game:GetService("ReplicatedStorage").Settings.Impostor.Value].PlayerColor.Value
        highlight.OutlineTransparency = 0.1
        highlight.Name = "Namehighlight"
        Framaa.Text = game:GetService("ReplicatedStorage").Settings.Impostor.Value
        highlight.Parent = game.Players[game:GetService("ReplicatedStorage").Settings.Impostor.Value].Character
        Framaa.BackgroundColor3 = game.Players[game:GetService("ReplicatedStorage").Settings.Impostor.Value].PlayerColor.Value
    end
end

local function OnButtonRightClick()
    Framaa.Text = "Who"
    Framaa.BackgroundColor3 = Color3.new(163/255, 162/255, 165/255) 
    local players = game:GetService("Players")
    for _, player in pairs(players:GetPlayers()) do
        local character = player.Character
        if character and character:FindFirstChild("Namehighlight") then
            character:FindFirstChild("Namehighlight"):Destroy()
        end
    end
end

Framaa.MouseButton1Click:Connect(OnButtonClick)
Framaa.MouseButton2Click:Connect(OnButtonRightClick)
