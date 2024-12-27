-- Criando a ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GODZIM_MENU"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Criando o Frame Principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0.6, 0, 1, 0) -- Aumentado o tamanho para 100% da altura da tela
MainFrame.Position = UDim2.new(0.2, 0, 0.05, 0) -- Ajustado para que fique bem posicionado
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

-- Tornando o Frame arredondado
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.1, 0)
UICorner.Parent = MainFrame

-- Criando o Título
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -60, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Text = "GODZIM MENU"
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- Tornando o Título arredondado
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0.1, 0)
TitleCorner.Parent = Title

-- Criando o botão "Fling Player"
local FlingButton = Instance.new("TextButton")
FlingButton.Name = "FlingButton"
FlingButton.Size = UDim2.new(0.9, 0, 0, 50)
FlingButton.Position = UDim2.new(0.05, 0, 0.2, 0) -- Distância muito aumentada
FlingButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FlingButton.Text = "Fling Player"
FlingButton.TextScaled = true
FlingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingButton.Font = Enum.Font.Gotham
FlingButton.Parent = MainFrame

-- Tornando o botão "Fling Player" arredondado
local FlingButtonCorner = Instance.new("UICorner")
FlingButtonCorner.CornerRadius = UDim.new(0.1, 0)
FlingButtonCorner.Parent = FlingButton

-- Adicionando funcionalidade ao botão "Fling Player"
FlingButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Auto%20Fling%20Player'))()
end)

-- Criando o botão "Puxe Player"
local PuxeButton = Instance.new("TextButton")
PuxeButton.Name = "PuxeButton"
PuxeButton.Size = UDim2.new(0.9, 0, 0, 50)
PuxeButton.Position = UDim2.new(0.05, 0, 0.4, 0) -- Distância muito aumentada
PuxeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
PuxeButton.Text = "Puxe Player"
PuxeButton.TextScaled = true
PuxeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PuxeButton.Font = Enum.Font.Gotham
PuxeButton.Parent = MainFrame

-- Tornando o botão "Puxe Player" arredondado
local PuxeButtonCorner = Instance.new("UICorner")
PuxeButtonCorner.CornerRadius = UDim.new(0.1, 0)
PuxeButtonCorner.Parent = PuxeButton

-- Adicionando funcionalidade ao botão "Puxe Player"
PuxeButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/7XSc7Vcm'))()
end)

-- Criando o botão "Aimbot"
local AimbotButton = Instance.new("TextButton")
AimbotButton.Name = "AimbotButton"
AimbotButton.Size = UDim2.new(0.9, 0, 0, 50)
AimbotButton.Position = UDim2.new(0.05, 0, 0.6, 0) -- Distância muito aumentada
AimbotButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AimbotButton.Text = "Aimbot"
AimbotButton.TextScaled = true
AimbotButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotButton.Font = Enum.Font.Gotham
AimbotButton.Parent = MainFrame

-- Tornando o botão "Aimbot" arredondado
local AimbotButtonCorner = Instance.new("UICorner")
AimbotButtonCorner.CornerRadius = UDim.new(0.1, 0)
AimbotButtonCorner.Parent = AimbotButton

-- Adicionando funcionalidade ao botão "Aimbot"
AimbotButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/refs/heads/main/Arceus%20Aimbot.lua'))()
end)

-- Criando o botão de minimizar
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 40, 0, 40)
MinimizeButton.Position = UDim2.new(1, -50, 0, 10)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MinimizeButton.Text = "-"
MinimizeButton.TextScaled = true
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.Parent = MainFrame

-- Tornando o botão de minimizar arredondado
local MinimizeButtonCorner = Instance.new("UICorner")
MinimizeButtonCorner.CornerRadius = UDim.new(1, 0)
MinimizeButtonCorner.Parent = MinimizeButton

-- Criando o botão móvel para maximizar
local MaximizeButton = Instance.new("TextButton")
MaximizeButton.Name = "MaximizeButton"
MaximizeButton.Size = UDim2.new(0, 50, 0, 50)
MaximizeButton.Position = UDim2.new(0.1, 0, 0.1, 0)
MaximizeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
MaximizeButton.Text = "⚜"
MaximizeButton.TextScaled = true
MaximizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MaximizeButton.Font = Enum.Font.SourceSansBold
MaximizeButton.Visible = false
MaximizeButton.Parent = ScreenGui

-- Tornando o botão de maximizar arredondado
local MaximizeButtonCorner = Instance.new("UICorner")
MaximizeButtonCorner.CornerRadius = UDim.new(1, 0)
MaximizeButtonCorner.Parent = MaximizeButton

-- Adicionando funcionalidade de minimizar
MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MaximizeButton.Visible = true
end)

-- Adicionando funcionalidade de maximizar
MaximizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    MaximizeButton.Visible = false
end)

-- Tornando o Frame Principal Móvel
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
