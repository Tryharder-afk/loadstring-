local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local LoadingBar = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Gradient = Instance.new("UIGradient")
local TextLabel = Instance.new("TextLabel")
local Percentage = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Size = UDim2.new(1, 0, 1, 0)

TextLabel.Parent = Frame
TextLabel.Text = "🔎 Finding an old server, pls wait..."
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextSize = 40
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.Position = UDim2.new(0.5, 0, 0.45, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Size = UDim2.new(1, 0, 0, 50)

Percentage.Parent = Frame
Percentage.Text = "0%"
Percentage.Font = Enum.Font.Gotham
Percentage.TextSize = 30
Percentage.TextColor3 = Color3.fromRGB(200, 200, 200)
Percentage.AnchorPoint = Vector2.new(0.5, 0)
Percentage.Position = UDim2.new(0.5, 0, 0.6, 0)
Percentage.BackgroundTransparency = 1
Percentage.Size = UDim2.new(1, 0, 0, 30)

LoadingBar.Parent = Frame
LoadingBar.Position = UDim2.new(0.1, 0, 0.55, 0)
LoadingBar.Size = UDim2.new(0, 0, 0, 25)
LoadingBar.BackgroundColor3 = Color3.fromRGB(0, 150, 255)

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = LoadingBar

Gradient.Parent = LoadingBar
Gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(170, 0, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 170))
}

-- Animação da barra de carregamento
local duration = 240 -- 4 minutos
for i = 0, 100 do
	local percent = i
	LoadingBar:TweenSize(UDim2.new(0.8 * (percent / 100), 0, 0, 25), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.1, true)
	Percentage.Text = percent .. "%"
	wait(duration / 100)
end

-- Fica travado em 100%
while true do
	wait(1)
end
