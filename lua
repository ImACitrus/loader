local module = {}

local Plrs = game:GetService("Players")
local Plr = Plrs.LocalPlayer
local PlrGui = Plr:WaitForChild("PlayerGui")

local create = Instance.new
local Ts = game:GetService("TweenService")
function module:Initialize(t : string, d : string)
	
	local Gui = create("ScreenGui")

	local mainFrame = create("Frame")
	local UICorner1 = create("UICorner")

	local trigger = create("TextButton")
	local UIGradient1 = create("UIGradient")
	local UICorner2 = create("UICorner")

	local title, description = create("TextLabel"), create("TextLabel")
	
	mainFrame.Name = "main"
	trigger.Name = "trigger"
	title.Name = "title"
	description.Name = "description"
	
	mainFrame.Size = UDim2.new(0, 527, 0, 143)
	trigger.Size = UDim2.new(0, 514, 0, 42)
	
	title.Size = UDim2.new(0, 200, 0, 50)
	description.Size = UDim2.new(0, 200, 0, 50)
	
	mainFrame.Position = UDim2.new(0.294, 0, 0.339, 0)
	trigger.Position = UDim2.new(0.011, 0, 0.66, 0)

	title.Position = UDim2.new(0.309, 0, 0.084, 0)
	description.Position = UDim2.new(0.309, 0, 0.225, 0)	
	
	mainFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	trigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UIGradient1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(108, 118, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(58, 58, 58))}
	
	Gui.Enabled = true
	mainFrame.Visible = true
	mainFrame.Active = true
	mainFrame.Draggable = true
	trigger.Active = false
	trigger.AutoButtonColor = false

	title.Text = t
	description.Text = d

	trigger.Font = Enum.Font.GothamBlack
	title.Font = Enum.Font.RobotoMono
	description.Font = Enum.Font.RobotoMono
	
	trigger.TextSize = 14
	title.TextSize = 22
	description.TextSize = 18

	trigger.TextColor3 = Color3.fromRGB(141, 141, 141)
	title.TextColor3 = Color3.fromRGB(212, 212, 212)
	description.TextColor3 = Color3.fromRGB(140, 140, 140)
	
	UICorner1.CornerRadius = UDim.new(0, 9)
	UICorner2.CornerRadius = UDim.new(0, 4)
	
	trigger.TextTransparency = 1
	title.BackgroundTransparency = 1
	UIGradient1.Transparency = NumberSequence.new{
		NumberSequenceKeypoint.new(0,0,0),
		NumberSequenceKeypoint.new(0.497, 0, 0),
		NumberSequenceKeypoint.new(0.503, 1, 0),
		NumberSequenceKeypoint.new(1, 1, 0)
	}
	description.BackgroundTransparency = 1
	
	UIGradient1.Offset = Vector2.new(-1, 0)
	
	mainFrame.Parent = Gui
	UICorner1.Parent = mainFrame

	trigger.Parent = mainFrame
	UIGradient1.Parent = trigger
	UICorner2.Parent = trigger

	title.Parent = mainFrame
	description.Parent = mainFrame

	Gui.Parent = PlrGui

	local newData = {}

	local tween = Ts:Create(UIGradient1, TweenInfo.new(2), {Offset = Vector2.new(1, 0)})

	local visibalize = Ts:Create(trigger, TweenInfo.new(1), {TextTransparency = 0})
	local invisibalize = Ts:Create(trigger, TweenInfo.new(1), {TextTransparency = 1})

	function newData:Run(Callback: ()->())
		
		tween:Play()
		tween.Completed:Wait()
		
		trigger.Text = "(100%)"
		visibalize:Play()
		visibalize.Completed:Wait()
		invisibalize:Play()
		
		invisibalize.Completed:Wait()
		trigger.Text = "Continue"
		visibalize:Play()

		trigger.Active = true
		trigger.MouseButton1Click:Connect(function()
			Callback()
			Gui:Destroy()
		end)

	end

	return newData

end

return module
