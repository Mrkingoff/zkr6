local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

-- Create UI
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AdvancedMenu"
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Menu Frame (Purple)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(85, 0, 127)
MainFrame.BackgroundTransparency = 0.2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Add corner radius
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.1, 0)
UICorner.Parent = MainFrame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(65, 0, 97)
TitleBar.Parent = MainFrame

local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Size = UDim2.new(1, -40, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "Advanced Tools"
TitleText.TextColor3 = Color3.new(1, 1, 1)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 14
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TitleBar

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 1, 0)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 14
CloseButton.Parent = TitleBar

-- Minimize Button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 30, 1, 0)
MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 14
MinimizeButton.Parent = TitleBar

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -20, 1, -50)
ContentFrame.Position = UDim2.new(0, 10, 0, 40)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- Head Tool Button
local HeadToolButton = Instance.new("TextButton")
HeadToolButton.Name = "HeadToolButton"
HeadToolButton.Size = UDim2.new(1, 0, 0, 40)
HeadToolButton.Position = UDim2.new(0, 0, 0, 0)
HeadToolButton.BackgroundColor3 = Color3.fromRGB(105, 0, 157)
HeadToolButton.Text = "Head Tool"
HeadToolButton.TextColor3 = Color3.new(1, 1, 1)
HeadToolButton.Font = Enum.Font.GothamBold
HeadToolButton.TextSize = 14
HeadToolButton.Parent = ContentFrame

-- Music Section
local MusicLabel = Instance.new("TextLabel")
MusicLabel.Name = "MusicLabel"
MusicLabel.Size = UDim2.new(1, 0, 0, 20)
MusicLabel.Position = UDim2.new(0, 0, 0, 50)
MusicLabel.BackgroundTransparency = 1
MusicLabel.Text = "Music Settings:"
MusicLabel.TextColor3 = Color3.new(1, 1, 1)
MusicLabel.Font = Enum.Font.GothamMedium
MusicLabel.TextSize = 12
MusicLabel.TextXAlignment = Enum.TextXAlignment.Left
MusicLabel.Parent = ContentFrame

local AudioIdBox = Instance.new("TextBox")
AudioIdBox.Name = "AudioIdBox"
AudioIdBox.Size = UDim2.new(1, 0, 0, 30)
AudioIdBox.Position = UDim2.new(0, 0, 0, 75)
AudioIdBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AudioIdBox.PlaceholderText = "Enter Audio ID (rbxassetid://...)"
AudioIdBox.Text = ""
AudioIdBox.TextColor3 = Color3.new(1, 1, 1)
AudioIdBox.Font = Enum.Font.GothamMedium
AudioIdBox.TextSize = 12
AudioIdBox.Parent = ContentFrame

local PlayMusicButton = Instance.new("TextButton")
PlayMusicButton.Name = "PlayMusicButton"
PlayMusicButton.Size = UDim2.new(0.48, 0, 0, 30)
PlayMusicButton.Position = UDim2.new(0, 0, 0, 110)
PlayMusicButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
PlayMusicButton.Text = "Play Music"
PlayMusicButton.TextColor3 = Color3.new(1, 1, 1)
PlayMusicButton.Font = Enum.Font.GothamMedium
PlayMusicButton.TextSize = 14
PlayMusicButton.Parent = ContentFrame

local StopMusicButton = Instance.new("TextButton")
StopMusicButton.Name = "StopMusicButton"
StopMusicButton.Size = UDim2.new(0.48, 0, 0, 30)
StopMusicButton.Position = UDim2.new(0.52, 0, 0, 110)
StopMusicButton.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
StopMusicButton.Text = "Stop Music"
StopMusicButton.TextColor3 = Color3.new(1, 1, 1)
StopMusicButton.Font = Enum.Font.GothamMedium
StopMusicButton.TextSize = 14
StopMusicButton.Parent = ContentFrame

-- Volume Settings
local VolumeLabel = Instance.new("TextLabel")
VolumeLabel.Name = "VolumeLabel"
VolumeLabel.Size = UDim2.new(1, 0, 0, 20)
VolumeLabel.Position = UDim2.new(0, 0, 0, 150)
VolumeLabel.BackgroundTransparency = 1
VolumeLabel.Text = "Volume (0-10):"
VolumeLabel.TextColor3 = Color3.new(1, 1, 1)
VolumeLabel.Font = Enum.Font.GothamMedium
VolumeLabel.TextSize = 12
VolumeLabel.TextXAlignment = Enum.TextXAlignment.Left
VolumeLabel.Parent = ContentFrame

local VolumeBox = Instance.new("TextBox")
VolumeBox.Name = "VolumeBox"
VolumeBox.Size = UDim2.new(1, 0, 0, 30)
VolumeBox.Position = UDim2.new(0, 0, 0, 175)
VolumeBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
VolumeBox.Text = "5"
VolumeBox.TextColor3 = Color3.new(1, 1, 1)
VolumeBox.Font = Enum.Font.GothamMedium
VolumeBox.TextSize = 12
VolumeBox.Parent = ContentFrame

-- Pitch Settings
local PitchLabel = Instance.new("TextLabel")
PitchLabel.Name = "PitchLabel"
PitchLabel.Size = UDim2.new(1, 0, 0, 20)
PitchLabel.Position = UDim2.new(0, 0, 0, 210)
PitchLabel.BackgroundTransparency = 1
PitchLabel.Text = "Pitch (0.5-2):"
PitchLabel.TextColor3 = Color3.new(1, 1, 1)
PitchLabel.Font = Enum.Font.GothamMedium
PitchLabel.TextSize = 12
PitchLabel.TextXAlignment = Enum.TextXAlignment.Left
PitchLabel.Parent = ContentFrame

local PitchBox = Instance.new("TextBox")
PitchBox.Name = "PitchBox"
PitchBox.Size = UDim2.new(1, 0, 0, 30)
PitchBox.Position = UDim2.new(0, 0, 0, 235)
PitchBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
PitchBox.Text = "1"
PitchBox.TextColor3 = Color3.new(1, 1, 1)
PitchBox.Font = Enum.Font.GothamMedium
PitchBox.TextSize = 12
PitchBox.Parent = ContentFrame

-- Submit Button
local SubmitButton = Instance.new("TextButton")
SubmitButton.Name = "SubmitButton"
SubmitButton.Size = UDim2.new(1, 0, 0, 40)
SubmitButton.Position = UDim2.new(0, 0, 0, 280)
SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
SubmitButton.Text = "Apply Settings"
SubmitButton.TextColor3 = Color3.new(1, 1, 1)
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.TextSize = 14
SubmitButton.Parent = ContentFrame

-- Toggle Menu Visibility
local isMinimized = false
local originalSize = MainFrame.Size

MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        MainFrame.Size = UDim2.new(0, 300, 0, 30)
        ContentFrame.Visible = false
    else
        MainFrame.Size = originalSize
        ContentFrame.Visible = true
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Head Tool Function
HeadToolButton.MouseButton1Click:Connect(function()
    if character:FindFirstChild("Head") then
        local head = character.Head
        local headTool = Instance.new("Tool")
        headTool.Name = "HeadTool"
        headTool.Parent = player.Backpack
        
        -- Create handle that looks like the head
        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = head.Size
        handle.Mesh = head:FindFirstChildOfClass("SpecialMesh") and head:FindFirstChildOfClass("SpecialMesh"):Clone() or nil
        handle.BrickColor = head.BrickColor
        handle.Parent = headTool
        
        -- Remove original head
        head:Destroy()
        
        -- Equip tool
        headTool.Parent = character
    end
end)

-- Music Player Variables
local currentSound = nil
local boombox = nil

-- Music Functions
PlayMusicButton.MouseButton1Click:Connect(function()
    local audioId = AudioIdBox.Text
    if audioId == "" then return end
    
    -- Clean up previous sound
    if currentSound then
        currentSound:Destroy()
    end
    
    -- Create boombox tool if it doesn't exist
    if not boombox or not boombox.Parent then
        boombox = Instance.new("Tool")
        boombox.Name = "Boombox"
        boombox.Parent = player.Backpack
        
        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = Vector3.new(1, 1, 1)
        handle.Parent = boombox
        
        -- Create sound in the boombox
        currentSound = Instance.new("Sound")
        currentSound.SoundId = audioId
        currentSound.Looped = true
        currentSound.Parent = handle
        
        -- Equip boombox
        boombox.Parent = character
    else
        -- Update existing sound
        currentSound.SoundId = audioId
    end
    
    -- Apply volume and pitch settings
    local volume = tonumber(VolumeBox.Text) or 5
    local pitch = tonumber(PitchBox.Text) or 1
    currentSound.Volume = volume
    currentSound.PlaybackSpeed = pitch
    
    currentSound:Play()
end)

StopMusicButton.MouseButton1Click:Connect(function()
    if currentSound then
        currentSound:Stop()
    end
end)

-- Apply Settings
SubmitButton.MouseButton1Click:Connect(function()
    if currentSound then
        local volume = tonumber(VolumeBox.Text) or 5
        local pitch = tonumber(PitchBox.Text) or 1
        
        -- Validate inputs
        volume = math.clamp(volume, 0, 10)
        pitch = math.clamp(pitch, 0.5, 2)
        
        currentSound.Volume = volume
        currentSound.PlaybackSpeed = pitch
        
        VolumeBox.Text = tostring(volume)
        PitchBox.Text = tostring(pitch)
    end
end)

-- Update when character changes
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
end)