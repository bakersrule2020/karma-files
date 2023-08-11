--KARMA rewrite V1
local engine = loadstring(game:HttpGet("https://raw.githubusercontent.com/Singularity5490/rbimgui-2/main/rbimgui-2.lua"))()
local selectedtarget = "None"
local player = game.Players
local LocalPlayer = player.LocalPlayer
local karmapath = "KARMA"
function downloadfile(filename, url)
	local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
	local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
	
	Notification:Notify(
	    {Title = "Downloading File...", Description = "Downloading " .. filename .. " From " .. url},
	    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
		 {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end}
	)
writefile(filename, game:HttpGet(url))
end
downloadfile("KARMA/Dependencies/squid.lua", "https://raw.githubusercontent.com/bakersrule2020/karma-files/main/squidhaxongod.lua")
downloadfile("KARMA/Dependencies/flymodule.lua", "https://raw.githubusercontent.com/bakersrule2020/karma-files/main/flymodule.lua")
dofile("KARMA/Dependencies/flymodule.lua")
local window1 = engine.new({
    text = "Karma Client",
    size = UDim2.new(800, 800),
})
window1.open()
local exectab = window1.new({
	text = "General Hacks"
})
local fly = exectab.new("switch", {
	text = "Flyhack",
})
fly.event:Connect(function(bool)
	if bool then
		_G.FlyOn()
	else
		_G.FlyOff()
	end
end)
local tab1 = window1.new({
    text = "Target",
})
local fold1 = tab1.new("folder", {
	text = "Players"
})
local fold2 = tab1.new("folder", {
	text = "Functions"
})
for i,v in ipairs(game.Players:GetChildren()) do
	dock = fold1.new("dock")
	dock.new("label", {
		text = v.DisplayName
	})
	sel = dock.new("button", {text = "Select"})
	sel.event:Connect(function()
		selectedtarget = v.Name
	end)
	player.PlayerRemoving:Connect(function(plr)
		dock.Destroy()
		if selectedtarget == plr.Name then
			selectedtarget = "None"
		end
	end)
end
player.PlayerConnecting:Connect(function(plr)
		dock = fold1.new("dock")
	dock.new("label", {
		text = v.DisplayName
	})
	sel = dock.new("button", {text = "Select"})
	sel.event:Connect(function()
		selectedtarget = v.Name
	end)
	player.PlayerRemoving:Connect(function(plr)
		dock.Destroy()
		if selectedtarget == plr.Name then
			selectedtarget = "None"
		end
	end)
	end)
local tpbtn = fold2.new("button", {text = "Teleport To Target"})
tpbtn.event:Connect(function()
	if selectedtarget == "None" then
		warnlabel = fold2.new("label", {text = "Select someone first!"})
		wait(3)
		warnlabel.Destroy()
	else
		for i,v in ipairs(player:GetPlayers()) do
		if v.Name == selectedtarget then
			local targetplayer = v
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetplayer.Character.HumanoidRootPart.Position.X, targetplayer.Character.HumanoidRootPart.Position.Y, targetplayer.Character.HumanoidRootPart.Position.Z)
		end
	end end
end)
local specbtn = fold2.new("switch", {text = "Spectate Target"})
specbtn.event:Connect(function(bool)
	if bool then
			if selectedtarget == "None" then
				warnlabel = fold2.new("label", {text = "Select someone first!"})
				wait(3)
				warnlabel.Destroy()
			else
				for i,v in ipairs(player:GetPlayers()) do
					if v.Name == selectedtarget then
						targetplayer = v
					end
				end
				game.Workspace.Camera.CameraSubject = targetplayer.Character
			end
		else
			game.Workspace.Camera.CameraSubject = LocalPlayer.Character
	end
end)
