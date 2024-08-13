--script ui aqui
local Lib = loadstring(game:Httpõet("https://raw.githubusercontent.com/Nandoladogral/Nandoladogral/main/MALUCO.txt"))()

local UI = Lib:Create{
Theme = "Dark", -- or any other these
Size - UD1m2.new(0, 555, 0, 400) -- default
}
local Main - UI:Tab{
  Nane = "Inicio"
}
local Divider = Main:Divider{
Name = "Inicio shit"
}
local QuitDivider = Rain: Divider{
Nane - "Sair"
}
-- Exemplo de script de ESP para dispositivos móveis em Lua
-- Ative e desative o ESP com um botão

local ESPEnabled = false -- Variável para controlar o estado do ESP

-- Função para desenhar o ESP
local function DrawESP(player, color)
    -- Implemente o desenho do ESP aqui (por exemplo, caixa e nome)
    -- Use a cor fornecida (vermelho para inimigos, verde para sua equipe)
end

-- Botão para ativar/desativar o ESP
local button = Instance.new("esp")
button.Text = "Ativar ESP"
button.Parent = game:GetService("Players").LocalPlayer.PlayerGui
button.Position = UDim2.new(0, 10, 0, 10)
button.Size = UDim2.new(0, 100, 0, 30)
button.BackgroundColor3 = Color3.new(0, 0, 0)
button.TextColor3 = Color3.new(1, 1, 1)

button.MouseButton1Click:Connect(function()
    ESPEnabled = not ESPEnabled
    button.Text = ESPEnabled and "Desativar ESP" or "Ativar ESP"
end)

-- Loop para atualizar o ESP
while true do
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player ~= game:GetService("Players").LocalPlayer then
            local teamColor = player.TeamColor
            local espColor = teamColor == game:GetService("Players").LocalPlayer.TeamColor and Color3.new(0, 255, 0) or Color3.new(255, 0, 0)
            if ESPEnabled then
                DrawESP(player, espColor)
            end
        end
    end
    wait(1) -- Atualize a cada segundo (ajuste conforme necessário)
end
