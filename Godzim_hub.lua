-- Serviços
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local Player = Players.LocalPlayer

-- Tabela de scripts
local Scripts = {
    {
        name = "Infinite Yield",
        Tipo = "all geme",
        url = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
    },
    {
        name = "Puxe Player",
        Tipo = "all geme - criado por mim",
        url = "https://pastebin.com/raw/7XSc7Vcm"
    },
    {
        name = "Void ware",
        Tipo = "99 noites na floresta",
        url = "https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/loader.lua"
    },
    {
        name = "interagir no Cooldown",
        Tipo = "all geme - criado por mim",
        url = "https://pastebin.com/raw/qHmcqrcs"
    },
    {
        name = "speed bypass",
        Tipo = "all geme - criado por mim",
        url = "https://pastebin.com/raw/ut3CUzRf"
    },
    {
        name = "puxe parts",
        Tipo = "so some geme",
        url = "https://pastebin.com/raw/ut3CUzRf"
    },
}

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
ScreenGui.Name = "GODZIM_MENU"
ScreenGui.ResetOnSpawn = false

-- Frame principal
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0.6, 0, 0.85, 0)
MainFrame.Position = UDim2.new(0.2, 0, 0.075, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0.08,0)

-- Título
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, -110, 0, 45)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.Text = "GODZIM MENU"
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", Title).CornerRadius = UDim.new(0.2,0)

-- Botão minimizar
local Min = Instance.new("TextButton", MainFrame)
Min.Size = UDim2.new(0,40,0,40)
Min.Position = UDim2.new(1,-50,0,12)
Min.Text = "-"
Min.TextScaled = true
Min.Font = Enum.Font.GothamBold
Min.BackgroundColor3 = Color3.fromRGB(200,50,50)
Min.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Min).CornerRadius = UDim.new(1,0)

-- Botão lupa
local SearchBtn = Instance.new("TextButton", MainFrame)
SearchBtn.Size = UDim2.new(0,40,0,40)
SearchBtn.Position = UDim2.new(1,-100,0,12)
SearchBtn.Text = "🔍"
SearchBtn.TextScaled = true
SearchBtn.Font = Enum.Font.Gotham
SearchBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
SearchBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", SearchBtn).CornerRadius = UDim.new(1,0)

-- Barra de pesquisa
local SearchBox = Instance.new("TextBox", MainFrame)
SearchBox.Size = UDim2.new(0.9,0,0,40)
SearchBox.Position = UDim2.new(0.05,0,0,65)
SearchBox.PlaceholderText = "Pesquisar por nome ou tipo..."
SearchBox.Text = ""
SearchBox.Visible = false
SearchBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
SearchBox.TextColor3 = Color3.new(1,1,1)
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextSize = 16
Instance.new("UICorner", SearchBox).CornerRadius = UDim.new(0.2,0)

-- ScrollFrame
local Scroll = Instance.new("ScrollingFrame", MainFrame)
Scroll.Position = UDim2.new(0,0,0,115)
Scroll.Size = UDim2.new(1,0,1,-125)
Scroll.CanvasSize = UDim2.new(0,0,0,0)
Scroll.ScrollBarImageTransparency = 0.3
Scroll.ScrollBarThickness = 8
Scroll.BackgroundTransparency = 1

local Layout = Instance.new("UIListLayout", Scroll)
Layout.Padding = UDim.new(0,15)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Scroll.CanvasSize = UDim2.new(0,0,0,Layout.AbsoluteContentSize.Y + 20)
end)

-- Criar botões
local Buttons = {}

local function CreateButtons(filter)
    for _,b in pairs(Buttons) do b:Destroy() end
    Buttons = {}

    for _,info in ipairs(Scripts) do
        if not filter
        or info.name:lower():find(filter)
        or info.Tipo:lower():find(filter) then

            local Button = Instance.new("TextButton", Scroll)
            Button.Size = UDim2.new(0.9,0,0,55)
            Button.BackgroundColor3 = Color3.fromRGB(55,55,55)
            Button.Text = info.name.."  ["..info.Tipo.."]"
            Button.TextScaled = true
            Button.Font = Enum.Font.Gotham
            Button.TextColor3 = Color3.new(1,1,1)
            Instance.new("UICorner", Button).CornerRadius = UDim.new(0.2,0)

            Button.MouseButton1Click:Connect(function()
                pcall(function()
                    loadstring(game:HttpGet(info.url, true))()
                end)
            end)

            table.insert(Buttons, Button)
        end
    end
end

CreateButtons()

-- Pesquisa
SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local text = SearchBox.Text:lower()
    if text == "" then
        CreateButtons()
    else
        CreateButtons(text)
    end
end)

SearchBtn.MouseButton1Click:Connect(function()
    SearchBox.Visible = not SearchBox.Visible
    SearchBox.Text = ""
    CreateButtons()
end)

-- Minimizar
local Max = Instance.new("TextButton", ScreenGui)
Max.Size = UDim2.new(0,55,0,55)
Max.Position = UDim2.new(0.05,0,0.2,0)
Max.Text = "⚜"
Max.TextScaled = true
Max.Font = Enum.Font.GothamBold
Max.BackgroundColor3 = Color3.fromRGB(50,200,50)
Max.TextColor3 = Color3.new(1,1,1)
Max.Visible = false
Instance.new("UICorner", Max).CornerRadius = UDim.new(1,0)

Min.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    Max.Visible = true
end)

Max.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    Max.Visible = false
end)
