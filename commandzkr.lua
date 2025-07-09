--[[
    Roblox Command Script
    Command: ;cmds
    Features:
    - ;fly / ;unfly
    - ;serverhop
    - ;rejoin
    - ;tptool
    - ;speed [number]
    - ;jump [number]
    - ;noclip
    - ;alogger
]]--

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local SoundService = game:GetService("SoundService")

-- Variables
local flying = false
local noclip = false
local tpTool = nil
local originalWalkSpeed = 16
local originalJumpPower = 50

-- Fungsi untuk membuat GUI
local function createCommandGUI()
    -- Main Frame
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CommandGUI"
    ScreenGui.Parent = game.CoreGui
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 350, 0, 450)
    MainFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MainFrame.BackgroundTransparency = 0.3
    MainFrame.BorderSizePixel = 0
    
    -- Efek ungu kelap-kelip
    coroutine.wrap(function()
        while ScreenGui.Parent do
            for i = 0, 1, 0.05 do
                if not ScreenGui.Parent then break end
                local color = Color3.fromHSV(0.8, 0.7, i)
                MainFrame.BackgroundColor3 = color
                wait(0.05)
            end
            for i = 1, 0, -0.05 do
                if not ScreenGui.Parent then break end
                local color = Color3.fromHSV(0.8, 0.7, i)
                MainFrame.BackgroundColor3 = color
                wait(0.05)
            end
        end
    end)()
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Position = UDim2.new(0, 0, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Text = "COMMAND MENU"
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 24
    Title.Parent = MainFrame
    
    -- Close Button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 5)
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.new(1, 1, 1)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 18
    CloseButton.BackgroundTransparency = 1
    CloseButton.Parent = MainFrame
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Scrolling Frame for Commands
    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Name = "ScrollFrame"
    ScrollFrame.Size = UDim2.new(1, -20, 1, -80)
    ScrollFrame.Position = UDim2.new(0, 10, 0, 50)
    ScrollFrame.BackgroundTransparency = 1
    ScrollFrame.ScrollBarThickness = 5
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 650)
    ScrollFrame.Parent = MainFrame
    
    -- Command List
    local commands = {
        {name = ";fly", desc = "Terbang dengan menggerakan analog", color = Color3.fromRGB(200, 100, 255)},
        {name = ";unfly", desc = "Mematikan fly mode", color = Color3.fromRGB(200, 100, 255)},
        {name = ";serverhop", desc = "Mencari server yang banyak player", color = Color3.new(1, 1, 1)},
        {name = ";rejoin", desc = "Rejoin ke server yang sama", color = Color3.new(1, 1, 1)},
        {name = ";tptool", desc = "Tool gear teleport click", color = Color3.new(1, 1, 1)},
        {name = ";speed [number]", desc = "Kecepatan berlari melalui nomor", color = Color3.new(1, 1, 1)},
        {name = ";jump [number]", desc = "Lompatan tinggi melalui nomor", color = Color3.new(1, 1, 1)},
        {name = ";noclip", desc = "Tembus tembok dan lain lain", color = Color3.new(1, 1, 1)},
        {name = ";alogger", desc = "Mencari sekitar server id audio", color = Color3.new(1, 1, 1)}
    }
    
    local yOffset = 10
    for i, cmd in ipairs(commands) do
        local CmdFrame = Instance.new("Frame")
        CmdFrame.Name = "CmdFrame_"..i
        CmdFrame.Size = UDim2.new(1, -10, 0, 60)
        CmdFrame.Position = UDim2.new(0, 5, 0, yOffset)
        CmdFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        CmdFrame.BackgroundTransparency = 0.5
        CmdFrame.BorderSizePixel = 0
        CmdFrame.Parent = ScrollFrame
        
        local CmdName = Instance.new("TextLabel")
        CmdName.Name = "CmdName"
        CmdName.Size = UDim2.new(1, 0, 0, 30)
        CmdName.Position = UDim2.new(0, 10, 0, 5)
        CmdName.Text = cmd.name
        CmdName.TextColor3 = cmd.color
        CmdName.Font = Enum.Font.GothamBold
        CmdName.TextSize = 18
        CmdName.TextXAlignment = Enum.TextXAlignment.Left
        CmdName.BackgroundTransparency = 1
        CmdName.Parent = CmdFrame
        
        local CmdDesc = Instance.new("TextLabel")
        CmdDesc.Name = "CmdDesc"
        CmdDesc.Size = UDim2.new(1, -20, 0, 20)
        CmdDesc.Position = UDim2.new(0, 10, 0, 35)
        CmdDesc.Text = cmd.desc
        CmdDesc.TextColor3 = Color3.new(1, 1, 1)
        CmdDesc.Font = Enum.Font.Gotham
        CmdDesc.TextSize = 14
        CmdDesc.TextXAlignment = Enum.TextXAlignment.Left
        CmdDesc.BackgroundTransparency = 1
        CmdDesc.Parent = CmdFrame
        
        yOffset = yOffset + 65
    end
    
    MainFrame.Parent = ScreenGui
    return ScreenGui
end

-- Fly Function
local function toggleFly()
    if flying then
        flying = false
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlyVelocity"):Destroy()
        end
        return
    end
    
    flying = true
    local torso = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local bg = Instance.new("BodyVelocity")
    bg.Name = "FlyVelocity"
    bg.Parent = torso
    bg.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bg.Velocity = Vector3.new(0, 0, 0)
    
    local flySpeed = 1
    local forward = 0
    local backward = 0
    local left = 0
    local right = 0
    local up = 0
    local down = 0
    
    local flyConnection
    flyConnection = RunService.Heartbeat:Connect(function()
        if not flying or not torso or not torso.Parent then
            flyConnection:Disconnect()
            return
        end
        
        local cam = workspace.CurrentCamera
        local cf = cam.CFrame
        local direction = Vector3.new(
            (right - left) * flySpeed,
            (up - down) * flySpeed,
            (backward - forward) * flySpeed
        )
        
        bg.Velocity = cf:VectorToWorldSpace(direction)
        
        -- Control with keyboard
        forward = UserInputService:IsKeyDown(Enum.KeyCode.W) and 1 or 0
        backward = UserInputService:IsKeyDown(Enum.KeyCode.S) and 1 or 0
        left = UserInputService:IsKeyDown(Enum.KeyCode.A) and 1 or 0
        right = UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or 0
        up = UserInputService:IsKeyDown(Enum.KeyCode.Space) and 1 or 0
        down = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and 1 or 0
    end)
end

-- Server Hop Function
local function serverHop()
    local servers = {}
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
    end)
    
    if success and result and result.data then
        for _, server in ipairs(result.data) do
            if server.playing and server.playing > 10 and server.id ~= game.JobId then
                table.insert(servers, server.id)
            end
        end
    end
    
    if #servers > 0 then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)])
    else
        TeleportService:Teleport(game.PlaceId)
    end
end

-- Rejoin Function
local function rejoin()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
end

-- Teleport Tool Function
local function createTpTool()
    if tpTool then tpTool:Destroy() end
    
    local tool = Instance.new("Tool")
    tool.Name = "TeleportTool"
    tool.RequiresHandle = false
    tool.Parent = LocalPlayer.Backpack
    
    tool.Activated:Connect(function()
        if Mouse.Target then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local pos = Mouse.Hit.Position + Vector3.new(0, 3, 0)
                humanoid.RootPart.CFrame = CFrame.new(pos)
            end
        end
    end)
    
    tpTool = tool
end

-- Speed Function
local function setSpeed(value)
    local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = tonumber(value) or originalWalkSpeed
    end
end

-- Jump Function
local function setJump(value)
    local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = tonumber(value) or originalJumpPower
    end
end

-- Noclip Function
local function toggleNoclip()
    noclip = not noclip
    if LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = not noclip
            end
        end
    end
end

-- Audio Logger Function
local function audioLogger()
    local sounds = {}
    for _, sound in ipairs(SoundService:GetDescendants()) do
        if sound:IsA("Sound") and sound.SoundId ~= "" then
            local id = string.match(sound.SoundId, "%d+")
            if id then
                table.insert(sounds, "Sound ID: "..id.." | Playing: "..tostring(sound.IsPlaying).." | Volume: "..sound.Volume)
            end
        end
    end
    
    if #sounds > 0 then
        print("=== Audio Logger Results ===")
        for _, info in ipairs(sounds) do
            print(info)
        end
    else
        print("No sounds found in the server")
    end
end

-- Command Handler
local function handleCommand(input)
    local args = {}
    for word in input:gmatch("%S+") do
        table.insert(args, word:lower())
    end
    
    if #args == 0 then return end
    
    if args[1] == ";cmds" then
        createCommandGUI()
    elseif args[1] == ";fly" then
        toggleFly()
    elseif args[1] == ";unfly" then
        if flying then toggleFly() end
    elseif args[1] == ";serverhop" then
        serverHop()
    elseif args[1] == ";rejoin" then
        rejoin()
    elseif args[1] == ";tptool" then
        createTpTool()
    elseif args[1] == ";speed" and args[2] then
        setSpeed(args[2])
    elseif args[1] == ";jump" and args[2] then
        setJump(args[2])
    elseif args[1] == ";noclip" then
        toggleNoclip()
    elseif args[1] == ";alogger" then
        audioLogger()
    end
end

-- Chat Listener
LocalPlayer.Chatted:Connect(handleCommand)

-- Auto Noclip when enabled
RunService.Stepped:Connect(function()
    if noclip and LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

print("Command system loaded! Type ;cmds to see available commands")