-- ✅ SERVIÇOS local Players = game:GetService("Players") local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Camera = workspace.CurrentCamera local LocalPlayer = Players.LocalPlayer

-- Aguarda o PlayerGui existir local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ✅ GUI SETUP local ScreenGui = Instance.new("ScreenGui") ScreenGui.Name = "AimbotUI" ScreenGui.IgnoreGuiInset = true ScreenGui.ResetOnSpawn = false ScreenGui.DisplayOrder = 1000 ScreenGui.Parent = PlayerGui

-- 🔴 Círculo FOV local FOVRadius = 100 local FOVCircle = Instance.new("ImageLabel") FOVCircle.Size = UDim2.new(0, FOVRadius * 2, 0, FOVRadius * 2) FOVCircle.Position = UDim2.new(0.5, -FOVRadius, 0.5, -FOVRadius) FOVCircle.BackgroundTransparency = 1 FOVCircle.Image = "rbxassetid://7072718368" FOVCircle.ImageColor3 = Color3.fromRGB(255, 0, 0) FOVCircle.ZIndex = 2 FOVCircle.Parent = ScreenGui

-- ESP Folder local ESPFolder = Instance.new("Folder") ESPFolder.Name = "ESPFolder" ESPFolder.Parent = ScreenGui

-- ✅ MENU UI local Menu = Instance.new("Frame") Menu.Size = UDim2.new(0, 200, 0, 240) Menu.Position = UDim2.new(0.3, 0, 0.2, 0) Menu.BackgroundColor3 = Color3.fromRGB(30, 30, 30) Menu.BackgroundTransparency = 0.2 Menu.Visible = true Menu.ZIndex = 10 Menu.Parent = ScreenGui

local UICorner = Instance.new("UICorner", Menu) UICorner.CornerRadius = UDim.new(0, 8)

local function criarBotao(texto, yPos) local btn = Instance.new("TextButton") btn.Size = UDim2.new(1, -20, 0, 30) btn.Position = UDim2.new(0, 10, 0, yPos) btn.Text = texto btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50) btn.ZIndex = 11 btn.Parent = Menu return btn end

local AimbotSuaveButton = criarBotao("Aimbot: SUAVE", 10) local AimbotCravadoButton = criarBotao("Aimbot: CRAVADO", 45) local AimbotDesativarButton = criarBotao("Desativar Aimbot", 80) local IncreaseFOV = criarBotao("+ FOV", 115) local DecreaseFOV = criarBotao("- FOV", 150)

local FOVLabel = Instance.new("TextLabel") FOVLabel.Size = UDim2.new(1, -20, 0, 20) FOVLabel.Position = UDim2.new(0, 10, 0, 185) FOVLabel.Text = "FOV: " .. tostring(FOVRadius) FOVLabel.TextColor3 = Color3.fromRGB(255, 255, 255) FOVLabel.BackgroundTransparency = 1 FOVLabel.ZIndex = 11 FOVLabel.Parent = Menu

local CloseButton = criarBotao("Fechar Menu", 210) CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

local OpenButton = Instance.new("TextButton") OpenButton.Size = UDim2.new(0, 120, 0, 30) OpenButton.Position = UDim2.new(0, 20, 0, 20) OpenButton.Text = "Abrir Menu" OpenButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) OpenButton.Visible = false OpenButton.ZIndex = 11 OpenButton.Parent = ScreenGui

local UICornerOpen = Instance.new("UICorner", OpenButton) UICornerOpen.CornerRadius = UDim.new(0, 8)

-- ✅ INTERAÇÕES local AimbotMode = 0

AimbotSuaveButton.MouseButton1Click:Connect(function() AimbotMode = 1 end) AimbotCravadoButton.MouseButton1Click:Connect(function() AimbotMode = 2 end) AimbotDesativarButton.MouseButton1Click:Connect(function() AimbotMode = 0 end)

IncreaseFOV.MouseButton1Click:Connect(function() FOVRadius = math.clamp(FOVRadius + 10, 30, 300) FOVCircle.Size = UDim2.new(0, FOVRadius * 2, 0, FOVRadius * 2) FOVCircle.Position = UDim2.new(0.5, -FOVRadius, 0.5, -FOVRadius) FOVLabel.Text = "FOV: " .. tostring(FOVRadius) end)

DecreaseFOV.MouseButton1Click:Connect(function() FOVRadius = math.clamp(FOVRadius - 10, 30, 300) FOVCircle.Size = UDim2.new(0, FOVRadius * 2, 0, FOVRadius * 2) FOVCircle.Position = UDim2.new(0.5, -FOVRadius, 0.5, -FOVRadius) FOVLabel.Text = "FOV: " .. tostring(FOVRadius) end)

CloseButton.MouseButton1Click:Connect(function() Menu.Visible = false OpenButton.Visible = true end) OpenButton.MouseButton1Click:Connect(function() Menu.Visible = true OpenButton.Visible = false end)

-- ✅ DRAG UI local function makeDraggable(frame) local dragging, dragInput, startPos, startFramePos frame.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true startPos = input.Position startFramePos = frame.Position input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end) end end) frame.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end end) UserInputService.InputChanged:Connect(function(input) if input == dragInput and dragging then local delta = input.Position - startPos frame.Position = UDim2.new( startFramePos.X.Scale, startFramePos.X.Offset + delta.X, startFramePos.Y.Scale, startFramePos.Y.Offset + delta.Y ) end end) end makeDraggable(Menu) makeDraggable(OpenButton)

-- ✅ FUNÇÃO ALVO local function getClosestEnemyInFOV() local closest, shortest = nil, math.huge for _, player in pairs(Players:GetPlayers()) do if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then local head = player.Character.Head local pos, onScreen = Camera:WorldToViewportPoint(head.Position) if onScreen then local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude if dist <= FOVRadius and dist < shortest then closest = head shortest = dist end end end end return closest end

-- ✅ LOOP RunService.RenderStepped:Connect(function() local target = getClosestEnemyInFOV() if AimbotMode == 1 and target then local camPos = Camera.CFrame.Position local camLook = Camera.CFrame.LookVector local dirToTarget = (target.Position - camPos).Unit local smooth = 0.1 local newLook = camLook:Lerp(dirToTarget, smooth) Camera.CFrame = CFrame.new(camPos, camPos + newLook) elseif AimbotMode == 2 and target then Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position) end end)

-- ✅ VISIBILIDADE GARANTIDA for _, gui in pairs(ScreenGui:GetDescendants()) do if gui:IsA("GuiObject") then gui.Visible = true end end

