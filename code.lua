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

local main = Instance.new("Frame")
main.Name = "main"
main.Parent = Guii
main.BackgroundColor3 = Color3.fromRGB(126, 0, 200)
main.Size = UDim2.new(0, 220, 0, 120)
main.Position = UDim2.new(0, 500, 0, 4)
main.Active = true
main.Draggable = true

local textB = Instance.new("TextButton")
textB.Position = UDim2.new(0, 9, 0, 9)
textB.Size = UDim2.new(0, 200, 0, 100)
textB.Parent = main
textB.Text = "Left click=Check Murder \n Right click=remove highlight" 
textB.TextScaled = true
textB.TextColor3 = Color3.new(1, 1, 1)
textB.BorderSizePixel = 2

local function OnButtonClick()
    textB.BackgroundColor3 = Color3.new(163/255, 162/255, 165/255) 
    textB.Text = "Who impostor ?"
    if game:GetService("ReplicatedStorage").Settings.Impostor.Value ~= "" and game:GetService("ReplicatedStorage").Settings.Impostor.Value ~= game.Players.LocalPlayer.Name then
        if game.Players[game:GetService("ReplicatedStorage").Settings.Impostor.Value].Character:FindFirstChild("Namehighlight") then
            game.Players[game:GetService("ReplicatedStorage").Settings.Impostor.Value].Character.Namehighlight:Destroy()
        end
        local highlight = Instance.new("Highlight")
        highlight.FillColor = game.Players[game:GetService("ReplicatedStorage").Settings.Impostor.Value].PlayerColor.Value
        highlight.OutlineTransparency = 0.1
        highlight.Name = "Namehighlight"
        textB.Text = game:GetService("ReplicatedStorage").Settings.Impostor.Value .. "\ntarget: " .. game:GetService("ReplicatedStorage").Settings.Target.Value
        highlight.Parent = game.Players[game:GetService("ReplicatedStorage").Settings.Impostor.Value].Character
        textB.BackgroundColor3 = game.Players[game:GetService("ReplicatedStorage").Settings.Impostor.Value].PlayerColor.Value
    end
end

local function OnButtonRightClick()
    textB.Text = "Who impostor ?"
    textB.BackgroundColor3 = Color3.new(163/255, 162/255, 165/255) 
    local players = game:GetService("Players")
    for _, player in pairs(players:GetPlayers()) do
        local character = player.Character
        if character and character:FindFirstChild("Namehighlight") then
            character:FindFirstChild("Namehighlight"):Destroy()
        end
    end
end

textB.MouseButton1Click:Connect(OnButtonClick)
textB.MouseButton2Click:Connect(OnButtonRightClick)
