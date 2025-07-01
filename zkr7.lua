local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Get local player
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Create UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AdvancedPlayerMenu"
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Menu button
local MenuButton = Instance.new("TextButton")
MenuButton.Name = "MenuButton"
MenuButton.Size = UDim2.new(0, 50, 0, 50)
MenuButton.Position = UDim2.new(0, 20, 0.5, -25)
MenuButton.AnchorPoint = Vector2.new(0, 0.5)
MenuButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
MenuButton.Text = "⚙️"
MenuButton.TextSize = 24
MenuButton.Parent = ScreenGui

-- Main menu frame
local MenuFrame = Instance.new("Frame")
MenuFrame.Name = "MenuFrame"
MenuFrame.Size = UDim2.new(0, 300, 0, 350)
MenuFrame.Position = UDim2.new(0, 80, 0.5, -175)
MenuFrame.AnchorPoint = Vector2.new(0, 0.5)
MenuFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MenuFrame.Visible = false
MenuFrame.Parent = ScreenGui

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(0, 90, 180)
Title.Text = "Player Controls"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = MenuFrame

-- Close button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -40, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.Parent = Title

-- Speed Section
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Name = "SpeedLabel"
SpeedLabel.Size = UDim2.new(1, -20, 0, 20)
SpeedLabel.Position = UDim2.new(0, 10, 0, 50)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Running Speed:"
SpeedLabel.TextColor3 = Color3.new(1, 1, 1)
SpeedLabel.Font = Enum.Font.GothamMedium
SpeedLabel.TextSize = 14
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.Parent = MenuFrame

local SpeedBox = Instance.new("TextBox")
SpeedBox.Name = "SpeedBox"
SpeedBox.Size = UDim2.new(1, -20, 0, 30)
SpeedBox.Position = UDim2.new(0, 10, 0, 75)
SpeedBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SpeedBox.Text = tostring(humanoid.WalkSpeed)
SpeedBox.TextColor3 = Color3.new(1, 1, 1)
SpeedBox.Font = Enum.Font.GothamMedium
SpeedBox.TextSize = 14
SpeedBox.Parent = MenuFrame

local SpeedButton = Instance.new("TextButton")
SpeedButton.Name = "SpeedButton"
SpeedButton.Size = UDim2.new(1, -20, 0, 30)
SpeedButton.Position = UDim2.new(0, 10, 0, 110)
SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
SpeedButton.Text = "Apply Speed"
SpeedButton.TextColor3 = Color3.new(1, 1, 1)
SpeedButton.Font = Enum.Font.GothamMedium
SpeedButton.TextSize = 14
SpeedButton.Parent = MenuFrame

-- Jump Section
local JumpLabel = Instance.new("TextLabel")
JumpLabel.Name = "JumpLabel"
JumpLabel.Size = UDim2.new(1, -20, 0, 20)
JumpLabel.Position = UDim2.new(0, 10, 0, 150)
JumpLabel.BackgroundTransparency = 1
JumpLabel.Text = "Jump Power:"
JumpLabel.TextColor3 = Color3.new(1, 1, 1)
JumpLabel.Font = Enum.Font.GothamMedium
JumpLabel.TextSize = 14
JumpLabel.TextXAlignment = Enum.TextXAlignment.Left
JumpLabel.Parent = MenuFrame

local JumpBox = Instance.new("TextBox")
JumpBox.Name = "JumpBox"
JumpBox.Size = UDim2.new(1, -20, 0, 30)
JumpBox.Position = UDim2.new(0, 10, 0, 175)
JumpBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
JumpBox.Text = tostring(humanoid.JumpPower)
JumpBox.TextColor3 = Color3.new(1, 1, 1)
JumpBox.Font = Enum.Font.GothamMedium
JumpBox.TextSize = 14
JumpBox.Parent = MenuFrame

local JumpButton = Instance.new("TextButton")
JumpButton.Name = "JumpButton"
JumpButton.Size = UDim2.new(1, -20, 0, 30)
JumpButton.Position = UDim2.new(0, 10, 0, 210)
JumpButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
JumpButton.Text = "Apply Jump"
JumpButton.TextColor3 = Color3.new(1, 1, 1)
JumpButton.Font = Enum.Font.GothamMedium
JumpButton.TextSize = 14
JumpButton.Parent = MenuFrame

-- Fly Section
local FlyLabel = Instance.new("TextLabel")
FlyLabel.Name = "FlyLabel"
FlyLabel.Size = UDim2.new(1, -20, 0, 20)
FlyLabel.Position = UDim2.new(0, 10, 0, 250)
FlyLabel.BackgroundTransparency = 1
FlyLabel.Text = "Fly Speed:"
FlyLabel.TextColor3 = Color3.new(1, 1, 1)
FlyLabel.Font = Enum.Font.GothamMedium
FlyLabel.TextSize = 14
FlyLabel.TextXAlignment = Enum.TextXAlignment.Left
FlyLabel.Parent = MenuFrame

local FlyBox = Instance.new("TextBox")
FlyBox.Name = "FlyBox"
FlyBox.Size = UDim2.new(1, -20, 0, 30)
FlyBox.Position = UDim2.new(0, 10, 0, 275)
FlyBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
FlyBox.Text = "50"
FlyBox.TextColor3 = Color3.new(1, 1, 1)
FlyBox.Font = Enum.Font.GothamMedium
FlyBox.TextSize = 14
FlyBox.Parent = MenuFrame

local FlyButton = Instance.new("TextButton")
FlyButton.Name = "FlyButton"
FlyButton.Size = UDim2.new(1, -20, 0, 30)
FlyButton.Position = UDim2.new(0, 10, 0, 310)
FlyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
FlyButton.Text = "Toggle Fly"
FlyButton.TextColor3 = Color3.new(1, 1, 1)
FlyButton.Font = Enum.Font.GothamMedium
FlyButton.TextSize = 14
FlyButton.Parent = MenuFrame

-- Player Teleport Section
local PlayerLabel = Instance.new("TextLabel")
PlayerLabel.Name = "PlayerLabel"
PlayerLabel.Size = UDim2.new(1, -20, 0, 20)
PlayerLabel.Position = UDim2.new(0, 10, 0, 350)
PlayerLabel.BackgroundTransparency = 1
PlayerLabel.Text = "Teleport to Player:"
PlayerLabel.TextColor3 = Color3.new(1, 1, 1)
PlayerLabel.Font = Enum.Font.GothamMedium
PlayerLabel.TextSize = 14
PlayerLabel.TextXAlignment = Enum.TextXAlignment.Left
PlayerLabel.Parent = MenuFrame

local PlayerBox = Instance.new("TextBox")
PlayerBox.Name = "PlayerBox"
PlayerBox.Size = UDim2.new(1, -20, 0, 30)
PlayerBox.Position = UDim2.new(0, 10, 0, 375)
PlayerBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
PlayerBox.PlaceholderText = "Enter player name"
PlayerBox.Text = ""
PlayerBox.TextColor3 = Color3.new(1, 1, 1)
PlayerBox.Font = Enum.Font.GothamMedium
PlayerBox.TextSize = 14
PlayerBox.Parent = MenuFrame

local PlayerButton = Instance.new("TextButton")
PlayerButton.Name = "PlayerButton"
PlayerButton.Size = UDim2.new(1, -20, 0, 30)
PlayerButton.Position = UDim2.new(0, 10, 0, 410)
PlayerButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
PlayerButton.Text = "Teleport"
PlayerButton.TextColor3 = Color3.new(1, 1, 1)
PlayerButton.Font = Enum.Font.GothamMedium
PlayerButton.TextSize = 14
PlayerButton.Parent = MenuFrame

-- Reset Button
local ResetButton = Instance.new("TextButton")
ResetButton.Name = "ResetButton"
ResetButton.Size = UDim2.new(1, -20, 0, 30)
ResetButton.Position = UDim2.new(0, 10, 0, 450)
ResetButton.BackgroundColor3 = Color3.fromRGB(215, 60, 0)
ResetButton.Text = "Reset Character"
ResetButton.TextColor3 = Color3.new(1, 1, 1)
ResetButton.Font = Enum.Font.GothamMedium
ResetButton.TextSize = 14
ResetButton.Parent = MenuFrame

-- Toggle menu visibility
local function ToggleMenu()
    MenuFrame.Visible = not MenuFrame.Visible
end

MenuButton.MouseButton1Click:Connect(ToggleMenu)
CloseButton.MouseButton1Click:Connect(ToggleMenu)

-- Apply speed changes
SpeedButton.MouseButton1Click:Connect(function()
    local newSpeed = tonumber(SpeedBox.Text)
    if newSpeed and newSpeed > 0 and newSpeed <= 100 then
        humanoid.WalkSpeed = newSpeed
    else
        SpeedBox.Text = tostring(humanoid.WalkSpeed)
    end
end)

-- Apply jump changes
JumpButton.MouseButton1Click:Connect(function()
    local newJump = tonumber(JumpBox.Text)
    if newJump and newJump > 0 and newJump <= 100 then
        humanoid.JumpPower = newJump
    else
        JumpBox.Text = tostring(humanoid.JumpPower)
    end
end)

-- Fly functionality
local flying = false
local bodyVelocity
local bodyGyro

FlyButton.MouseButton1Click:Connect(function()
    if not flying then
        -- Enable fly
        local flySpeed = tonumber(FlyBox.Text) or 50
        
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(0, 0, 0)
        bodyVelocity.Parent = character.HumanoidRootPart
        
        bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bodyGyro.P = 1e6
        bodyGyro.D = 1e3
        bodyGyro.CFrame = character.HumanoidRootPart.CFrame
        bodyGyro.Parent = character.HumanoidRootPart
        
        flying = true
        FlyButton.Text = "Flying: ON"
        FlyButton.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        
        local hum = character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.PlatformStand = true
        end
        
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Enum.KeyCode.Space then
                bodyVelocity.Velocity = Vector3.new(0, flySpeed, 0)
            elseif input.KeyCode == Enum.KeyCode.LeftShift then
                bodyVelocity.Velocity = Vector3.new(0, -flySpeed, 0)
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input, gameProcessed)
            if input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.LeftShift then
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            end
        end)
    else
        -- Disable fly
        if bodyVelocity then bodyVelocity:Destroy() end
        if bodyGyro then bodyGyro:Destroy() end
        
        local hum = character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.PlatformStand = false
        end
        
        flying = false
        FlyButton.Text = "Toggle Fly"
        FlyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    end
end)

-- Teleport to player
PlayerButton.MouseButton1Click:Connect(function()
    local targetName = PlayerBox.Text
    if targetName == "" then return end
    
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Name:lower():find(targetName:lower()) == 1 then
            if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame
                break
            end
        end
    end
end)

-- Reset character
ResetButton.MouseButton1Click:Connect(function()
    character:BreakJoints()
end)

-- Update when character changes
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    
    -- Update values
    SpeedBox.Text = tostring(humanoid.WalkSpeed)
    JumpBox.Text = tostring(humanoid.JumpPower)
    
    -- Reset fly if active
    if flying then
        if bodyVelocity then bodyVelocity:Destroy() end
        if bodyGyro then bodyGyro:Destroy() end
        flying = false
        FlyButton.Text = "Toggle Fly"
        FlyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    end
end)