

local Players = game.Players
repeat
	Client = Players.LocalPlayer
	wait()
until Client

do
	Char = Client.Character
	vu = game:GetService("VirtualUser")

	Sea1 = game.PlaceId == 4520749081 
	Sea2 =  game.PlaceId == 6381829480
	Sea3 = game.PlaceId == 15759515082

	RespawnTime = 5
	RecentlySpawn = 0

	myWeapon = { ["Melee"] = "",  ["Sword"] = "",["Fruit"] = ""}
	addSkill = "?"
end

_G.Settings = {
	Select_Weapon = "all In One",
	Select_Stast = {"Melee", "Sword"},
	Select_Skill = {"Z","X","C","V"},
	Auto_Use_Skill = true,
	Auto_Third_World = false,
}

foldername = "Zee Hub";
filename = Client.Name.." Config.json"

function Current_Exploit()
	local decode = game:GetService('HttpService'):JSONDecode(request({Url = "https://httpbin.org/get",Method = "GET"}).Body)
	return decode.headers['User-Agent']
end

function SaveSettings()
	local HttpService = game:GetService("HttpService")
	local json = HttpService:JSONEncode(_G.Settings)
	if writefile then
		if isfolder(foldername) then
			if isfolder(foldername.."/King Legacy") then
				writefile(foldername.."/King Legacy/"..filename, json)
			else
				makefolder(foldername.."/King Legacy")
				writefile(foldername.."/King Legacy/"..filename, json)
			end
		else
			makefolder(foldername)
			makefolder(foldername.."/King Legacy")
			writefile(foldername.."/King Legacy/"..filename, json)
		end
	end
end

function LoadSettings()
	local HttpService = game:GetService("HttpService")
	if isfile(foldername.."/King Legacy/"..filename) then
		for _i, value in pairs(HttpService:JSONDecode(readfile(foldername.."/King Legacy/"..filename)) or _G.Settings ) do
			_G.Settings[_i] = value
		end
	end
end
if Current_Exploit() ~= "Roblox/WinInet" then LoadSettings() end

Client.Idled:connect(function()
	vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) task.wait(1)
	vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- main local

do
	GUI = Client.PlayerGui
	Repli = game:GetService("ReplicatedStorage")
	QuestManager = game:GetService("ReplicatedStorage").Chest.Modules.QuestManager
end

-- Function

EnableBuso = function()
	local char = Client and Client.Character
	repeat wait() until char or (not char and (tick() - RecentlySpawn) > RespawnTime)

	if char:WaitForChild("Services"):FindFirstChild("Haki") and char:WaitForChild("Services"):FindFirstChild("Haki").Value == 0 then
		Client.PlayerStats.BusoShopValue.Value = 'BusoHaki'
		game:GetService("ReplicatedStorage").Chest.Remotes.Events.Armament:FireServer()
		repeat wait(1) until char:WaitForChild("Services"):FindFirstChild("Haki").Value == 1
	end
	wait(.4)
end

do -- Parallel Executions
	task.spawn(function()
		while task.wait() do
			pcall(function()
				EnableBuso()
				if NeedNoClip then
					if Client and Client:FindFirstChild('Character') and Client.Character.Humanoid.Sit == true then Client.Character.Humanoid.Sit = false end
					for _, v in pairs(Char:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end
					if Char and not Char.UpperTorso:FindFirstChild("BodyClip") then 
						local Noclip = Instance.new("BodyVelocity") 
						Noclip.Name,Noclip.Parent = "BodyClip", Char.UpperTorso 
						Noclip.MaxForce,Noclip.Velocity = Vector3.new(math.huge,math.huge,math.huge), Vector3.new(0,1,0) 
					elseif Char and Char.UpperTorso:FindFirstChild("BodyClip") then
						if Char and Char.UpperTorso:FindFirstChild("BodyClip") then 
							Char.UpperTorso:FindFirstChild("BodyClip").MaxForce = Vector3.new(math.huge,math.huge,math.huge)
							Char.UpperTorso:FindFirstChild("BodyClip").Velocity = Vector3.new(0,0,0) 
						end
					end
				else
					if Char and Char.UpperTorso:FindFirstChild("BodyClip") then
						Char.UpperTorso:FindFirstChild("BodyClip"):Destroy()
					end
				end
			end)
		end
	end)
end

-- Item

local playerTool;
local playerToolTip;
getTool = function()
	for _i, _v in pairs(Client.Character:GetChildren()) do
		if _v:IsA("Tool") then
			if _v.ToolTip == "Fruit Power" then
				addSkill = "DF"
			end
			playerTool = tostring(_v.Name)
			playerToolTip = _v.ToolTip
		end
	end

	return playerTool
end

local Item = {}
Item.CheckOnCooldown = function(Skill)
	getTool()
	if playerToolTip == "Sword" then
		local SwordFrame = Client.PlayerGui.SkillCooldown.SWFrame
		if not SwordFrame:FindFirstChild(string.upper(Skill) or "Z") then return true end
		if SwordFrame:FindFirstChild(string.upper(Skill) or "Z")  and not SwordFrame[string.upper(Skill) or "Z"]:FindFirstChild("Locked").Visible then
			return SwordFrame[string.upper(Skill) or "Z"].Frame.Frame.AbsoluteSize.X > 0
		end
	elseif playerToolTip == "Combat" then
		local FSFrame = Client.PlayerGui.SkillCooldown.FSFrame
		if not FSFrame:FindFirstChild(string.upper(Skill) or "Z")  then return true end
		if FSFrame:FindFirstChild(string.upper(Skill) or "Z")  and not FSFrame[string.upper(Skill) or "Z"]:FindFirstChild("Locked").Visible then
			return FSFrame[string.upper(Skill) or "Z"].Frame.Frame.AbsoluteSize.X > 0
		end 
	elseif playerToolTip == 'Fruit Power' then
		local FruitFrame = Client.PlayerGui.SkillCooldown.DFFrame
		if not FruitFrame:FindFirstChild(string.upper(Skill) or "Z")  then return true end
		if FruitFrame:FindFirstChild(string.upper(Skill) or "Z")  and  not FruitFrame[string.upper(Skill) or "Z"]:FindFirstChild("Locked").Visible then
			return FruitFrame[string.upper(Skill) or "Z"].Frame.Frame.AbsoluteSize.X > 0
		end
	end
	return false
end

getPlayerMaterial = function(Value)
	local HttpService = game:GetService("HttpService")
	for gatMaterial, numMaterial in pairs(HttpService:JSONDecode(Client.PlayerStats.Material.Value)) do
		if gatMaterial == Value then
			return numMaterial
		end
	end
	return 0
end

-- Quest Data

QuestMaterial = {
	['3350'] = {
		['Material'] = 'Ice Crystal',
		['Kills'] = 'Azlan [Lv. 3300]',
		['QuestTitle'] = 'Kill 4 Azlan',
		['Level'] = 3300
	},
	['3375'] = {
		['Material'] = 'Magma Crystal',
		['Kills'] = 'The Volcano [Lv. 3325]',
		['QuestTitle'] = 'Kill 4 The Volcano',
		['Level'] = 3325
	},
	['3475'] = {
		['Material'] = "Dark Beard's Totem",
		['Kills'] = 'Sally [Lv. 3450]',
		['QuestTitle'] = 'Kill 1 Sally',
		['Level'] = 3450
	},
	['3575'] = {
		['Material'] = "Lucidus's Totem",
		['Kills'] = 'Vice Admiral [Lv. 3500]',
		['QuestTitle'] = 'Kill 5 Vice Admiral',
		['Level'] = 3500
	}
}

GetQuestData = function(Level)
	local Quests = {}
	local playerLevel = Client.PlayerStats.lvl.Value
	for QuestTitle, Quest in pairs(require(game.ReplicatedStorage.Chest.Modules.QuestManager)) do
		if not Quest['DailyQuest'] then
			local firstLv = Quest["Level"] == 0 and 1
			local MobLevel = tonumber(Quest['Mob']:match("Lv%. (%d+)"))
			if Quest['Mob']:match('Lv') and (Level or playerLevel >= Quest['Level']) then--and tostring(Quest['Mob']):find(tostring(firstLv or Quest.Level)) then
				table.insert(Quests, {
					LevelRequired = Quest['Level'] or 1,
					Mob = (function()
						if playerLevel >= 3300 and playerLevel < 3375 then
							return 'Azlan [Lv. 3300]'
						end
						return Quest['Mob']
					end)(),
					QuestTitle = (function()
						if playerLevel >= 3300 and playerLevel < 3375 then
							return 'Kill 4 Azlan'
						end
						return QuestTitle
					end)(),
					NPC = (function()
						local npclist = {}
						for _, npc in pairs(game:GetService("Workspace"):FindFirstChild("AllNPC"):GetChildren()) do
							if npc:GetAttribute("LevelMin") then
								if Quest['Level'] >= npc:GetAttribute("LevelMin") then
									npclist[#npclist+1] = {
										Level = npc:GetAttribute("LevelMin"),
										CFrame = npc.CFrame
									}
								end
							end
						end
						table.sort(npclist, function(a,b)
							return a.Level > b.Level
						end)
						return npclist[1]
					end)()
				})
			end
		end
	end
	table.sort(Quests, function(a, b) return a.LevelRequired > b.LevelRequired  end)
	if (playerLevel >= MaxLevelOfSea) and Sea2 then
		Quests[1]['Mob'] = "Ryu [Lv. 3975]"
		Quests[1]['LevelRequired'] = 3950
		Quests[1]['QuestTitle'] = 'Kill 1 Ryu'
	elseif playerLevel >= MaxLevelOfSea and Sea1 then
		Quests[1]['Mob'] = "Seasoned Fishman [Lv. 2200]"
		Quests[1]['LevelRequired'] = 2200
		Quests[1]['QuestTitle'] = 'Kill 1 Seasoned Fishman'
	end
	for qml, valuaqml in pairs(QuestMaterial) do
		if Quests[1]['LevelRequired'] == tonumber(qml) then
			local findMon;
			for __, checkmon in pairs(workspace.Monster.Mon:GetChildren()) do
				if checkmon.Name == Quests[1]['Mob']  and checkmon:FindFirstChild("Humanoid") and checkmon:FindFirstChild("HumanoidRootPart") and checkmon.Humanoid.Health > 0 then
					findMon = true
				end
			end
			for __, checkmon in pairs(workspace.Monster.Boss:GetChildren()) do
				if checkmon.Name == Quests[1]['Mob']  and checkmon:FindFirstChild("Humanoid") and checkmon:FindFirstChild("HumanoidRootPart") and checkmon.Humanoid.Health > 0 then
					findMon = true
				end
			end
			for __, checkmon in pairs(game:GetService("ReplicatedStorage").MOB:GetChildren()) do
				if checkmon.Name == Quests[1]['Mob']  and checkmon:FindFirstChild("Humanoid") and checkmon:FindFirstChild("HumanoidRootPart") and checkmon.Humanoid.Health > 0 then
					findMon = true
				end
			end

			if getPlayerMaterial(valuaqml['Material']) <= 0 and not findMon then
				Quests[1]['Mob'] = valuaqml['Kills']
				Quests[1]['LevelRequired'] = valuaqml['Level']
				Quests[1]['QuestTitle'] = valuaqml['QuestTitle']
			elseif getPlayerMaterial(valuaqml['Material']) > 0 and not findMon then
				local args = {
					[1] = "QuestSpawnBoss",
					[2] = {
						["SuccessQuest"] = "Quest Accepted.",
						["BossName"] = Quests[1]['Mob'],
						["LevelNeed"] =  Quests[1]['LevelRequired'],
						["QuestName"] = Quests[1]['QuestTitle'],
						["MaterialNeed"] = valuaqml['Material'],
					}
				}
				game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("EtcFunction"):InvokeServer(unpack(args))
			end
		end
	end
	return Quests[1]
end

for _, npc in pairs(game:GetService("Workspace"):FindFirstChild("AllNPC"):GetChildren()) do
	if npc:GetAttribute("LevelMax") then
		lvmax = npc:GetAttribute("LevelMax")
		if not MaxLevelOfSea or lvmax > MaxLevelOfSea then
			MaxLevelOfSea = lvmax
		end
	end
	if npc:GetAttribute("LevelMin") then
		lvmin = npc:GetAttribute("LevelMin")
		if not MinLevelOfSea or lvmin < MinLevelOfSea then
			MinLevelOfSea = lvmax
		end
	end
end

tp = function(options)
	pcall(function()
		local Character = Client and Client.Character
		if Character:FindFirstChild("Humanoid") and Character.Humanoid.Sit == true then Character.Humanoid.Sit = false end
		NeedNoClip = true
		local data = {
			Target = options.Target or print("mae mung tai."),
			Mod = options.Mod or CFrame.new(0,0,0)
		}
		Character:FindFirstChild("HumanoidRootPart").CFrame = data.Target * data.Mod
	end)
end

EquipTools = function(ToolSe)
	if Client.Backpack:FindFirstChild(ToolSe) then
		local Tool = Client.Backpack:FindFirstChild(ToolSe)
		Client.Character.Humanoid:EquipTool(Tool)
	end
end

UnEquipTools = function(Weapon)
	if Client.Character:FindFirstChild(Weapon) then
		wait(.5)
		Client.Character:FindFirstChild(Weapon).Parent = Client.LocalPlayer.Backpack
		wait(.1)
	end
end

Attack = function()
	if _G.Settings.Select_Weapon == "Melee" then
		addSkill = "FS"
		game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("FS_".._G.Weapon.."_M1")
	elseif _G.Settings.Select_Weapon == "Sword" then
		addSkill = "SW"
		game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("SW_".._G.Weapon.."_M1")
	elseif _G.Settings.Select_Weapon == "all In One" then
		addSkill = "SW"
		delay(.1, function()
			game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("SW_"..myWeapon["Sword"].."_M1")
		end)
		game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("FS_"..myWeapon["Melee"].."_M1")
		EquipTools(myWeapon["Sword"])
	else
		game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("FS_".._G.Weapon.."_M1")
	end;if _G.Settings.Select_Weapon ~= "all In One" then
		EquipTools(_G.Weapon)
	end
end

useSkill = function()
	if _G.Settings.Auto_Use_Skill then
		for _i, _v in next,_G.Settings.Select_Skill do
			if type(_v) == 'string' and not Item.CheckOnCooldown(_v) then
				game:service('VirtualInputManager'):SendKeyEvent(true, _v, false, game)
				game:service('VirtualInputManager'):SendKeyEvent(false, _v, false, game)
			end
		end
	end
end

click = function(t)
	for i = 1, t or 3 do
		game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))
		game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
	end
end

local LLAL = 0
getQuestOld = function(Position, UiName, doeswarp)
	doeswarp = doeswarp or true
	if Position == nil then if Sea1 then Position = "Elite Pirate" elseif Sea3 then Position = "The Squid" end end
	if UiName == 1 and Sea2 then Position = "Elite Pirate" end
	if UiName == 3 and Sea2 then Position = "The Squid" end
	if Position == "Elite Pirate" then
		Position = workspace.AllNPC:FindFirstChild("Elite Pirate").CFrame
	elseif Position == "The Squid" then
		Position = workspace.AllNPC:FindFirstChild("The Squid").CFrame
	end

	if doeswarp then
		Client.Character:FindFirstChild('HumanoidRootPart').CFrame = Position
	end

	click(7)
	if Client.PlayerGui:FindFirstChild('Elite Pirate') then
		if UiName == 1 or UiName == 2 then
			UiName = "Accept"
		elseif UiName == 3 then
			UiName = "ThirdSea"
		end
	elseif Client.PlayerGui:FindFirstChild("The Squid") then
		if UiName == 1 and Sea3 then
			UiName = "FirstSea"
		elseif UiName == 2 or (UiName == 1 and Sea2) or (Sea2 and UiName == 3) then
			UiName = "Accept"
		end
	end

	if not Position then warn("Position not found") return end

	for _, value in pairs(Client.PlayerGui:GetChildren()) do
		for _, value2 in pairs(value:GetChildren()) do
			if value2.Name == 'Dialogue' then
				if value2:FindFirstChild(UiName or 'Accept') then
					value2[UiName or 'Accept'].Size, value2[UiName or 'Accept'].Text.TextTransparency = UDim2.new(1001, 0, 1001, 0), 1
					value2[UiName or 'Accept'].Position, value2[UiName or 'Accept'].AnchorPoint = UDim2.new(.5, 0, .5, 0), Vector2.new(0.5, 0.5)
					click(5)
				elseif value2:FindFirstChild('QuestAccept') then
					value2['Quest 1'].Size, value2['Quest 1'].Text.TextTransparency = UDim2.new(1001, 0, 1001, 0), 1
					value2['Quest 1'].Position, value2['Quest 1'].AnchorPoint = UDim2.new(.5, 0, .5, 0), Vector2.new(0.5, 0.5)
					click(5)
					value2.QuestAccept.Size, value2.QuestAccept.Text.TextTransparency = UDim2.new(1001, 0, 1001, 0), 1
					value2.QuestAccept.Position, value2.QuestAccept.AnchorPoint = UDim2.new(.5, 0, .5, 0), Vector2.new(0.5, 0.5)
					click(5)
				end
			end
		end
	end
end

HopServer = function(FullServer) -- Hop Server (Low)
	local FullServer = FullServer or false

	local Http = game:GetService("HttpService")
	local Api = "https://games.roblox.com/v1/games/"

	local _place = game.PlaceId
	local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
	local ListServers = function (cursor)
		local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
		return Http:JSONDecode(Raw)
	end

	local Server, Next; repeat
		local Servers = ListServers(Next)
		Server = Servers.data[1]
		Next = Servers.nextPageCursor
	until Server

	repeat
		if not FullServer then
			game:GetService("TeleportService"):TeleportToPlaceInstance(_place,Server.id,Client)
		else
			if request then
				local servers = {}
				local req = request(
					{
						Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)
					}
				).Body;
				local body = game:GetService("HttpService"):JSONDecode(req)
				if body and body.data then
					for i, v in next, body.data do
						if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
							table.insert(servers, 1, v.id)
						end
					end
				end
				if #servers > 0 then
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], Client)
				else
					return "Couldn't find a server."
				end
			end
		end
		wait()
	until game.PlaceId ~= game.PlaceId
end

dist = function(a,b,noHeight)
	local Character = Client and Client.Character

	if not b then
		b = Character.HumanoidRootPart.Position
	end
	return (Vector3.new(a.X,not noHeight and a.Y,a.Z) - Vector3.new(b.X,not noHeight and b.Y,b.Z)).magnitude
end

local oldBeli = 0
seaChest = function()
	wait(3)
	local ChetLegacyIsland = function()
		local islands = {"Legacy Island1", "Legacy Island2", "Legacy Island3", "Legacy Island4"}
		for _, islandName in ipairs(islands) do
			local island = game:GetService("Workspace").Island:FindFirstChild(islandName)
			if island then
				return island
			end
		end
		return nil
	end

	local getHydaIsland = function()
		for _, v in pairs(workspace:FindFirstChild("Island"):GetChildren()) do
			if v.Name:match("Sea King") then
				return true
			end
		end
		return false
	end

	local Chetcheck = function()
		for _,cheats in pairs(game.Workspace:GetChildren())do 
			if cheats.Name:match("Chest") then 
				return true
			end
		end
		return false
	end
	local Hopp = function()
		if _G.Settings["Monter_Hop"] or _G.Settings["Auto_Third_World"] then task.wait(3.5) HopServer(false) end
	end
	if not workspace.SeaMonster:FindFirstChild("SeaKing") and not game:GetService("Workspace").SeaMonster:FindFirstChild("HydraSeaKing") and (ChetLegacyIsland() or getHydaIsland()) then
		local islands = {"Legacy Island1", "Legacy Island2", "Legacy Island3", "Legacy Island4"}
		for _, islandName in ipairs(islands) do
			local island = game:GetService("Workspace").Island:FindFirstChild(islandName)
			if island then
				tp({Target = island.ChestSpawner.CFrame})
				Client.PlayerStats.beli.Value = Client.PlayerStats.beli.Value + 50
				wait(3)
				if dist(island.ChestSpawner.Position, Client.Character.HumanoidRootPart.Position) < 10 and Client.PlayerStats.beli.Value > oldBeli + 1 then
					print(oldBeli, ' : ', Client.PlayerStats.beli.Value )
					Hopp()
				end
			end
		end
		for _, v in pairs(workspace:FindFirstChild("Island"):GetChildren()) do
			if v.Name:match("Sea King") then
				tp({Target = v.HydraStand.CFrame})
			end
		end
	end
end

local function GetIsland(...)
	local RealtargetPos = {...}
	local targetPos = RealtargetPos[1]
	local RealTarget

	if type(targetPos) == "vector" then
		RealTarget = targetPos
	elseif type(targetPos) == "userdata" then
		RealTarget = targetPos.Position
	elseif type(targetPos) == "number" then
		RealTarget = CFrame.new(unpack(RealtargetPos))
		RealTarget = RealTarget.p
	end

	local ReturnValue
	local CheckInOut = math.huge;

	for i,v in pairs(workspace.Island:GetChildren()) do
		if v:IsA("Model") then
			local ReMagnitude = (RealTarget - v:GetModelCFrame().p).Magnitude;
			if ReMagnitude < CheckInOut then
				CheckInOut = ReMagnitude;
				ReturnValue = v.Name
			end
		end
	end

	if ReturnValue then
		return ReturnValue
	end
end

local getIslandResults = {}
local function getNPCPos(Pos)
	for _, v in pairs(workspace.AllNPC:GetChildren()) do
		local islandName = GetIsland(v.CFrame)
		local playerIslandName = GetIsland(Pos)
		if islandName == playerIslandName then
			if not getIslandResults[islandName] then
				getIslandResults[islandName] = {}
			end
			table.insert(getIslandResults[islandName], v.CFrame)
		end
	end
end

-- Entity Fun

local Entity = {}
Entity.Bring = function(_v, cf)
	if not _G.Settings['Bring_Mon'] then
		return
	end
	for i,v in pairs(workspace.Monster.Mon:GetChildren()) do
		if v.Name == _v.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
			v.HumanoidRootPart.CFrame = cf
			v:FindFirstChild("Humanoid"):ChangeState(11)
			v:FindFirstChild("Humanoid"):ChangeState(14)
			setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
		end
	end
end

Entity.attack = function(inTable, Expression, PositionM)
	local PositionM = PositionM or 0
	local Data = GetQuestData()
	local SeaMonster, CheckGhost
	if Sea2 then
		SeaMonster, CheckGhost = game:GetService("Workspace").SeaMonster:GetChildren(),
		game.Workspace:FindFirstChild("GhostMonster"):GetChildren()
	else
		SeaMonster, CheckGhost = game:GetService("ReplicatedStorage").MOB:GetChildren(),
		game:GetService("ReplicatedStorage").MOB:GetChildren()
	end

	local attackTarget = function(target)
		if (Expression == "Auto_Farm_Level" and
			Client.CurrentQuest.Value ~= Data["QuestTitle"]) 
			or not _G.Settings[Expression] then return 
		end
		if target.Name == "Tentacle" then
			if not target:FindFirstChild("Next") then
				repeat
					task.wait()
					if target:FindFirstChild("Humanoid") and target:FindFirstChild("HumanoidRootPart") and 
						target.Humanoid.Health > 0 and 
						(target.HumanoidRootPart.Position.Y > -100 and target.HumanoidRootPart.Position.Y < 1500) 
					then
						tp({
							Target = target.HumanoidRootPart.CFrame * CFrame.new(0, 8.5, PositionM), 
							Mod = CFrame.Angles(math.rad(-90), 0, 0)
						})
						local run = function()
							Attack()
							getgenv().PosMonSkill = target.HumanoidRootPart
							useSkill()
						end
						task.spawn(pcall, run)
						delay(25, function()
							local Make = Instance.new("Folder", target)
							Make.Name = "Next"
							delay(10, function()
								Make:Destroy()
							end)
						end)
					end
				until target:FindFirstChild("Next")
					or not _G.Settings[Expression] 
					or not target.Parent 
					or target.Humanoid.Health <= 0
					or not target:FindFirstChild("HumanoidRootPart") 
					or target:FindFirstChild("HumanoidRootPart").Position.Y < -100 
					or target:FindFirstChild("HumanoidRootPart").Position.Y > 1500
			end
		else
			local bcframe = target.HumanoidRootPart.CFrame
			repeat
				task.wait()
				if target:FindFirstChild("Humanoid") and target:FindFirstChild("HumanoidRootPart") and 
					target.Humanoid.Health > 0 and 
					(target.HumanoidRootPart.Position.Y > -100 and target.HumanoidRootPart.Position.Y < 1500) 
				then
					tp({
						Target = target.HumanoidRootPart.CFrame * CFrame.new(0, 8.5, PositionM), 
						Mod = CFrame.Angles(math.rad(-90), 0, 0)
					})
					local run = function()
						Attack()
						getgenv().PosMonSkill = target.HumanoidRootPart
						useSkill()
					end
					local brig = function()
						Entity.Bring(target, bcframe)
						wait(1)
					end
					task.spawn(pcall, brig)
					task.spawn(pcall, run)
				end
			until (
				Expression == "Auto_Farm_Level" and
					Client.CurrentQuest.Value ~= Data["QuestTitle"]
			) 
				or not _G.Settings[Expression] 
				or not target.Parent 
				or target.Humanoid.Health <= 0
				or not target:FindFirstChild("HumanoidRootPart") 
				or target:FindFirstChild("HumanoidRootPart").Position.Y < -100 
				or target:FindFirstChild("HumanoidRootPart").Position.Y > 1500
		end
	end
	for _, category in ipairs({workspace.Monster.Boss:GetChildren(), 
		workspace.Monster.Mon:GetChildren(), 
		CheckGhost, 
		SeaMonster, 
		game:GetService("ReplicatedStorage").MOB:GetChildren()}) do
		for _, target in ipairs(category) do
			if table.find(inTable, target.Name) then
				if _G.Settings[Expression] then
					attackTarget(target)
				else
					repeat
						task.wait()
						if not target.Parent or 
							target.Humanoid.Health <= 0 or 
							not target:FindFirstChild("HumanoidRootPart")
							or target.HumanoidRootPart.Position.Y < -100 then
							break
						end
						attackTarget(target)
					until false
				end
			elseif category == game:GetService("ReplicatedStorage").MOB:GetChildren() then
				if table.find(inTable, target.Name) and 
					target:FindFirstChild("Humanoid") and 
					target:FindFirstChild("HumanoidRootPart") and 
					target.Humanoid.Health > 0 then
					tp({Target = target.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0)})
				end
			end
		end
	end
end

Entity.find = function(EnemiesName)
	local SeaMonster, CheckGhost
	if Sea2 then
		SeaMonster, CheckGhost = game:GetService("Workspace").SeaMonster:GetChildren(),
		game.Workspace:FindFirstChild("GhostMonster"):GetChildren()
	else
		SeaMonster, CheckGhost = game:GetService("ReplicatedStorage").MOB:GetChildren(),
		game:GetService("ReplicatedStorage").MOB:GetChildren()
	end
	local function isValidEnemy(enemy)
		return enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0
	end
	local function checkEnemies(enemies)
		for _, enemy in pairs(enemies) do
			if table.find(EnemiesName, enemy.Name) and isValidEnemy(enemy) then
				return true
			end
		end
		return false
	end
	return checkEnemies(workspace.Monster.Mon:GetChildren()) or checkEnemies(workspace.Monster.Boss:GetChildren()) or checkEnemies(CheckGhost) or checkEnemies(SeaMonster) or checkEnemies(game:GetService("ReplicatedStorage").MOB:GetChildren())
end

---------------

function loadIslandForAllNPCs(Pos, Mob)
	local islandData = getIslandResults[Pos]
	if not _G.Settings['Auto_Farm_Level'] or Entity.find({Mob}) then return "Entity Spawn" end
	if islandData and #islandData > 0 then
		for _, pos in pairs(islandData) do
			if not _G.Settings['Auto_Farm_Level'] or Entity.find({Mob}) then break end
			Client.Character.HumanoidRootPart.CFrame = pos * CFrame.new(0, 50, -math.random(5,10))
			wait(0.5)
		end
		return "Loaded all NPC positions on island: " .. Pos
	else
		return "No NPCs found on island: " .. Pos
	end
end

local tpToPos = function(Data, NpcPos)
	if Data['LevelRequired'] == 3750 then
		tp({Target = workspace.Island["H - Fiore"].Lab.Lab.Base.CFrame * CFrame.new(0, 20, 0)})
	elseif Data['LevelRequired'] == 3775 then
		tp({Target = workspace.Island["H - Fiore"].Italian.Base.Mountain.Model:GetChildren()[9].CFrame * CFrame.new(0, 20, 0)})
	elseif Data['LevelRequired'] == 4750 then
		tp({Target = workspace.Island["Forgotten Coliseum"].Vacuus.Base:GetChildren()[179].CFrame * CFrame.new(0, 20, 0)})
	else
		getNPCPos(NpcPos)
		loadIslandForAllNPCs(GetIsland(NpcPos), Data['Mob'])
	end
end

local loadfun = {}
local pos
local Data = GetQuestData()
loadfun['Auto_Farm_Level'] = function()
	local funcx = 'Auto_Farm_Level'
	while _G.Settings[funcx] and task.wait() do
		local s,e = pcall(function()
			local Data = GetQuestData()
			local NpcPos = Data['NPC'].CFrame
			if (Client.CurrentQuest.Value ~= Data["QuestTitle"]) or Client.CurrentQuest.Value == "" then
				tp({Target = NpcPos})
				Repli:WaitForChild("Chest").Remotes.Functions.Quest:InvokeServer("take", Data['QuestTitle'])
			elseif Client.CurrentQuest.Value == Data["QuestTitle"] then
				if Data['Mob'] == 'Dough Master [Lv. 3275]' and Data['LevelRequired'] == 3275 then
					tp({Target = CFrame.new(30279.0625, 69.36441802978516, 93166.2734375)})
				else
					local mobModel = Repli.MOB:FindFirstChild(Data['Mob'])
					if mobModel then
						tp({Target = mobModel:GetModelCFrame() * CFrame.new(0, 20, 0)})
					else 
						if Data['LevelRequired'] >= 3265 and pos == nil then
							tpToPos(Data, NpcPos)
						else
							tp({Target = pos or NpcPos})
						end
					end
				end
				if Entity.find({Data['Mob']}) then
					delay(.5, function() pos = nil end)
					Entity.attack({
						Data['Mob']
					}, funcx)
					delay(.5, function() pos = Client.Character.HumanoidRootPart.CFrame end)
				end
			end
		end)
		if not s then
			warn(e, ": ".. funcx)
		end
	end
end

local FF = {}
loadfun['Auto_Second_Sea'] = function()
	local funcx = 'Auto_Second_Sea'
	while _G.Settings[funcx] and task.wait() do
		local s,e = pcall(function()
			if Sea1 and Client.PlayerStats.lvl.Value >= 2250 and Client.PlayerStats.lvl.Value < 4000 then
				if _G.Settings['Auto_Farm_Level'] then
					_G.Settings['Auto_Farm_Level'] = false
				end
				if Client.PlayerStats.SecondSeaProgression.Value == "Yes" then
					getQuestOld(FF['Teleport To Sea 2'], 2)
				else
					if getPlayerMaterial('Map') > 0 then
						getQuestOld(workspace.AllNPC.Traveler.CFrame) wait(.5)
						tp({Target = workspace.AllNPC.Traveler.CFrame * CFrame.new( 0, 0, -10)})
					else
						if not GUI.MainGui.QuestFrame.QuestBoard.Visible then
							getQuestOld(workspace.AllNPC.Traveler.CFrame) wait(.5)
							tp({Target = workspace.AllNPC.Traveler.CFrame * CFrame.new( 0, 0, -10)})
						else
							if Repli.MOB:FindFirstChild("Seasoned Fishman [Lv. 2200]") then
								tp({Target = Repli.MOB:FindFirstChild("Seasoned Fishman [Lv. 2200]"):GetPivot()})
							else
								tp({Target = CFrame.new(-1865.43481, 45.2696266, 6722.8501, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)})
							end
							if Entity.find({"Seasoned Fishman [Lv. 2200]"}) then
								Entity.attack({
									"Seasoned Fishman [Lv. 2200]"
								}, funcx)
							end
						end
					end
				end
			end
		end)
		if not s then
			warn(e, ": "..funcx)
		end
	end
end

loadfun['Auto_Third_World'] = function()
	local funcx = 'Auto_Third_World'
	while _G.Settings[funcx] and task.wait() do
		local s,e = pcall(function()
			if Client.PlayerStats.lvl.Value >= 4000 and not Sea3 then
				if _G.Settings['Auto_Farm_Level'] then
					_G.Settings['Auto_Farm_Level'] = false
				end
				if getPlayerMaterial("Kraken's Cache") > 0 then
					getQuestOld(workspace.AllNPC:FindFirstChild("The Squid").CFrame) wait(.5)
					tp({Target = workspace.AllNPC:FindFirstChild("The Squid").CFrame * CFrame.new( 0, 10, -10)})
				else
					if Entity.find({"Tentacle"}) then
						Entity.attack({
							"Tentacle",
						}, funcx, "random")
					else
						if getPlayerMaterial("Heart of Sea") > 0 then
							if Client.PlayerGui:FindFirstChild("CraftingMaterialUI") then
								Client.PlayerGui:FindFirstChild("CraftingMaterialUI"):Destroy()
								Client.Character.Humanoid:ChangeState(15)
							else
								getQuestOld(workspace.AllNPC:FindFirstChild("Summon Tentacle").CFrame)
							end
						else
							if getPlayerMaterial("Kraken's Cache")  > 0 then
								return
							end
							if not Entity.find({"Tentacle"}) then
								local NeedMateria = {
									['Log'] = 50,
									['Pile of Bones'] = 10,
									["Fresh Fish"] = 50,
									["Angellic's Feather"] = 14,
									["Sea King's Blood"] = 1
								}
								local seax2 = {
									['Sea1'] = workspace.AllNPC:FindFirstChild("Elite Pirate").CFrame,
									['Sea2'] = workspace.AllNPC:FindFirstChild("Elite Pirate").CFrame
								}
								if getPlayerMaterial("Log") < NeedMateria['Log']  then
									if not Sea2 then
										getQuestOld(seax2['Sea2'])
										return
									end
									for _i, _v in pairs(game:GetService("Workspace"):GetDescendants()) do
										if string.find(_v.Name, "Tree") and _v:FindFirstChild("Part") and _v.Part.Transparency == 0 then task.wait(1.5)
											if _G.Settings[funcx] or getPlayerMaterial("Log") <= NeedMateria['Log'] or not Entity.find({"Tentacle"}) then
												repeat wait()
													local Tree = _v:GetModelCFrame()
													tp({Target = Tree})
													if not Client.Backpack:FindFirstChild('Bisento') and not Client.Character:FindFirstChild('Bisento') then
														local args = {
															[1] = "Bisento"
														}

														game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("InventoryEq"):InvokeServer(unpack(args))
													end
													EquipTools("Bisento")
													if not Item.CheckOnCooldown("Z") or not Item.CheckOnCooldown("X") then
														game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
														game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
														game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
														game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
													end
												until not _G.Settings[funcx] or Item.CheckOnCooldown("Z") or Item.CheckOnCooldown("X") or Entity.find({"Tentacle"}) or getPlayerMaterial("Kraken's Cache") > 0
											end
										end
										if not  _G.Settings[funcx]  or getPlayerMaterial("Log") >= NeedMateria['Log'] or Entity.find({"Tentacle"}) or getPlayerMaterial("Kraken's Cache") > 0 then
											break
										end
									end
								elseif getPlayerMaterial("Pile of Bones") < NeedMateria['Pile of Bones'] then
									if not Sea2 then
										getQuestOld(seax2['Sea2'])
									else
										if Entity.find({"Skull Pirate [Lv. 3050]"}) then
											Entity.attack({
												"Skull Pirate [Lv. 3050]",
											},  funcx)
										else
											tp({Target = CFrame.new(-5996.76953125, 462.4600524902344, 7296.43115234375) * CFrame.new(0, -50, 0)})
										end
									end
								elseif getPlayerMaterial("Fresh Fish") < NeedMateria['Fresh Fish'] then
									if not Sea1 then
										getQuestOld(seax2['Sea1'])
									else
										if  Entity.find({"Karate Fishman [Lv. 200]","Fighter Fishman [Lv. 180]","Shark Man [Lv. 230]"}) then
											Entity.attack({
												"Karate Fishman [Lv. 200]",
												"Fighter Fishman [Lv. 180]",
												"Shark Man [Lv. 230]",
											}, funcx)
										else
											tp({Target = workspace.Island["D - Shark Island"].D.Base:GetChildren()[57].CFrame})
										end
									end
								elseif getPlayerMaterial("Angellic's Feather") < NeedMateria["Angellic's Feather"] then
									if not Sea1 then
										getQuestOld(seax2['Sea1'])
									else
										if Entity.find({"Sky Soldier [Lv. 800]", "Ball Man [Lv. 850]"}) then
											Entity.attack({
												"Sky Soldier [Lv. 800]",
												"Ball Man [Lv. 850]"
											}, funcx)
										else
											tp({Target = workspace.Island["H - Skyland"].Sky.Base:GetChildren()[4].CFrame})
										end
									end

								elseif getPlayerMaterial("Sea King's Blood") < NeedMateria["Sea King's Blood"] then
									if not Sea2 then
										getQuestOld(seax2['Sea2'])
									else
										warn("Sea King's Blood Not Have")
										if Entity.find({"SeaKing", "HydraSeaKing"}) then
											Entity.attack({
												"SeaKing",
												"HydraSeaKing"
											}, funcx)
										else
											seaChest()
										end
									end
								else
									if not Sea2 then
										getQuestOld(seax2['Sea2'])
									else
										getQuestOld(workspace.AllNPC:FindFirstChild("Jack Stones").CFrame)
										for _i, _v in pairs(Client.PlayerGui:GetChildren()) do
											if _v.Name == "CraftingMaterialUI" then
												if _v:FindFirstChild("Frame") and _v.Frame.OrbName.Text ~= "Heart of Sea" then
													_v.Frame.Materials.AnchorPoint = Vector2.new(0, 0)
													_v.Frame.Materials.Position = UDim2.new(0, 0, 0, 0)
													_v.Frame.Materials.Visible = true
													if _v.Frame.Materials:FindFirstChild("ScrollingFrame") then
														_v.Frame.Materials:FindFirstChild("ScrollingFrame").ClipsDescendants = false
														if _v.Frame.Materials:FindFirstChild("ScrollingFrame"):FindFirstChild("UIGridLayout") then
															_v.Frame.Materials:FindFirstChild("ScrollingFrame"):FindFirstChild("UIGridLayout").CellSize = UDim2.new(1001, 0, 1001, 0)
														end
														if _v.Frame.Materials:FindFirstChild("ScrollingFrame"):FindFirstChild("Diamond Key") then
															_v.Frame.Materials:FindFirstChild("ScrollingFrame"):FindFirstChild("Diamond Key").Visible = false
														end
														game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))
														game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
													end
												elseif _v.Frame.OrbName.Text == "Heart of Sea" then
													_v.Frame.CraftButton.Size = UDim2.new(1001, 0, 1001, 0)
													game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))
													game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end)
		if not s then
			warn(e, ": "..funcx)
		end
	end

end

local CFrameBossM = {}
loadfun['Auto_Kill_Minion'] = function()
	local funcx = 'Auto_Kill_Minion'
	while _G.Settings[funcx] and task.wait() do
		local s,e = pcall(function()
			for i,v in pairs(workspace.EventSpawns:GetChildren()) do
				if v.Name == "Spawn" and v:FindFirstChild("Chest") and not CFrameBossM[v.Chest.RootPart.CFrame] then
					Check_Minion:Set("Check Minion Mon: Have Chest")
					if not CFrameBossM[v.Chest.RootPart.CFrame] then
						CFrameBossM[v.Chest.RootPart.CFrame] = true
						tp({Target = v.Chest.RootPart.CFrame})
					end
				else
					if Entity.find({"Minion","Boss"}) then
						Entity.attack({
							"Minion",
							"Boss"
						}, funcx)
					else
						Check_Minion:Set("Check Minion Mon: None")
					end
				end
			end
		end)
		if not s then
			warn(e, ": "..funcx)
		end
	end
end

loadfun['Auto_Kill_Sea_King'] = function()
	local funcx = 'Auto_Kill_Sea_King'
	while _G.Settings[funcx] and task.wait() do
		local s,e = pcall(function()
			if Entity.find({"SeaKing"}) then
				Entity.attack({
					"SeaKing",
				}, funcx)
			else
				seaChest()
			end
		end)
		if not s then
			warn(e, ": "..funcx)
		end
	end
end

loadfun['Auto_Kill_Hydar_Sea_King'] = function()
	local funcx = 'Auto_Kill_Hydar_Sea_King'
	while _G.Settings[funcx] and task.wait() do
		local s,e = pcall(function()
			if Entity.find({"HydraSeaKing"}) then
				Entity.attack({
					"HydraSeaKing",
				}, funcx)
			else
				seaChest()
			end
		end)
		if not s then
			warn(e, ": "..funcx)
		end
	end
end

loadfun['Auto_Kill_Kaido'] = function()
	local funcx = 'Auto_Kill_Kaido'
	while _G.Settings[funcx] and task.wait() do
		local s,e = pcall(function()
			if Entity.find({"Dragon [Lv. 5000]"}) then
				Entity.attack({
					"Dragon [Lv. 5000]",
				}, funcx)
			else
				if getPlayerMaterial("Dragon's Orb") > 0 and _G.Settings.Auto_Spawn_Kaido then
					getQuestOld(workspace.AllNPC:FindFirstChild("SummonDragon").CFrame, "SummonDragon")
				else
					if Entity.find({"Elite Skeleton [Lv. 3100]"}) then
						Entity.attack({
							"Elite Skeleton [Lv. 3100]",
						}, funcx)
					else
						tp({Target = CFrame.new(-5996.76953125, 462.4600524902344, 7296.43115234375) * CFrame.new(0, -50, 0)})
					end
				end
			end
		end)
		if not s then
			warn(e, ": "..funcx)
		end
	end
end

loadfun['Auto_Expert_Swordman'] = function()
	local funcx = 'Auto_Expert_Swordman'
	while _G.Settings[funcx] and task.wait() do
		local s,e = pcall(function()
			if Entity.find({"Expert Swordman [Lv. 3000]"}) then
				Entity.attack({
					"Expert Swordman [Lv. 3000]",
				}, funcx)
			end
		end)
		if not s then
			warn(e, ": "..funcx)
		end
	end
end


-- spawn all

task.spawn(function()
	while task.wait(1) do
		local success,error = pcall(function()
			local backpack = Client.Backpack
			local playerGui = Client.PlayerGui.MainGui.StarterFrame.StatsFrame.RemoteEvent

			if _G.Settings.Select_Weapon == "Melee" or _G.Settings.Select_Weapon == "Sword" then
				local toolType = (_G.Settings.Select_Weapon == "Melee") and "Combat" or "Sword"
				for _, tool in pairs(backpack:GetChildren()) do
					if tool.ClassName == "Tool" and tool.ToolTip == toolType then
						_G.Weapon = tostring(tool.Name)
					end
				end
			elseif _G.Settings.Select_Weapon == "all In One" then
				for _, tool in pairs(backpack:GetChildren()) do
					if tool.ClassName == "Tool" then
						if tool.ToolTip == "Sword" then
							myWeapon["Sword"] = tostring(tool.Name)
						elseif tool.ToolTip == "Combat" then
							myWeapon["Melee"] = tostring(tool.Name)
						end
					end
				end
			else
				_G.Settings.Select_Weapon = "Melee"
			end
			for _, tool in pairs(backpack:GetChildren()) do
				if tool.ToolTip == "Fruit Power" then
					if tool.ClassName == "Tool" then
						myWeapon["Fruit"] = tostring(tool.Name)
					end
				end
			end
			if _G.Settings.Select_Stast and _G.Settings.UpStast then
				for _, stat in ipairs(_G.Settings.Select_Stast) do
					local args = {
						[1] = stat,
						[2] = 1
					}

					Client.PlayerGui.MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer(unpack(args))
				end
			end
		end)
	end
end)

local function getTextoforLabel()
	task.spawn(function()
		while task.wait(1) do
			if Entity.find({"Minion","Boss"}) then
				Check_Minion:Set("Check Minion Mon: Have")
			else
				Check_Minion:Set("Check Minion Mon: None")
			end
			if Sea2 then
				if Entity.find({"Dragon [Lv. 5000]"}) then
					Check_Dragon:Set("Check Dragon Mon: Have")
				else
					Check_Dragon:Set("Check Dragon Mon: None")
				end
				if Entity.find({"HydraSeaKing"}) then
					Check_HydarSeaKing:Set("Check Hydar Sea King Mon: Have")
				else
					Check_HydarSeaKing:Set("Check Hydar Sea King Mon: None")
				end
				if Entity.find({"SeaKing"}) then
					Check_SeaKing:Set("Check SeaKing Mon: Have")
				else
					Check_SeaKing:Set("Check SeaKing Mon: None")
				end
				if Entity.find({"Ms. Mother [Lv.7500]"}) then
					Check_BigMom:Set("Check BigMom Mon: Have")
				else
					Check_BigMom:Set("Check BigMom Mon: None")
				end
				local islands = {"Legacy Island1", "Legacy Island2", "Legacy Island3", "Legacy Island4"}
				for _, islandName in ipairs(islands) do
					local island = game:GetService("Workspace").Island:FindFirstChild(islandName)
					if island then
						Check_LegacyIsland:Set("Check Legacy Island : Have")
						break
					else
						Check_LegacyIsland:Set("Check Legacy Island : None")
					end
				end
			elseif Sea1 then
				if Entity.find({"Expert Swordman [Lv. 3000]"}) then
					Check_Expert_Swordman:Set("Check Expert Swordman : Have")
				else
					Check_Expert_Swordman:Set("Check Expert Swordman : None")
				end
			end
		end
	end)
end

-- UI 
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tgoduiem/Test/refs/heads/main/LIB.txt"))()
local Win = library:XoxHi({
	Title = "Pear CAT Hub | King Legacy | By Tgodzskid", -- Your Name Hub
	Logo = "16330128588", -- Your Id Logo
	Dis = "TO Pear cat HUB | KING LEGACY",
	Color = {
		Color1 = Color3.fromRGB(255, 0, 4),
		Color2 = Color3.fromRGB(100, 0, 0),
	}
})
local MainTab = Win:CreateTab("General", 15169955786)

local theEnd
function Toggle(Text, section, ...)
	local SettingName, _function = ...
	if not _function and type(SettingName) == "function" then 
		_function = SettingName
		SettingName = nil 
	end
	if not SettingName then SettingName = ... end
	return section:AddToggle({
		Name = Text,
		Value = _G.Settings[SettingName],
		Callback = _function or function(v)
			_G.Settings[SettingName] = v
			SaveSettings()
			theEnd = task.spawn(loadfun[SettingName])
			if not v and theEnd then 
				task.cancel(theEnd)
				NeedNoClip = false
			end
		end,
	})
end;function Dropdown(Text, List, section, ...)
	local SettingName, _function = ...
	if not _function and type(SettingName) == "function" then _function = SettingName SettingName = nil end
	if not SettingName then SettingName = ... end
	return section:AddDropdown({
		Name = Text,
		Value = _G.Settings[SettingName],
		List = List,
		Callback = function(value)
			_G.Settings[SettingName] = value
			SaveSettings()
		end
	})
end;function MultiDropdown(Text, List, section, ...)
	local SettingName, _function = ...
	if not _function and type(SettingName) == "function" then _function = SettingName SettingName = nil end
	if not SettingName then SettingName = ... end
	return section:AddMultiDropdown({
		Name = Text,
		Value = _G.Settings[SettingName],
		List = List,
		Callback = function(value)
			_G.Settings[SettingName] = value
			SaveSettings()
		end
	})
end;function Label(Text, section, Mode)
	if Mode then
		return section:AddLabel({Name = Text,})
	else
		return section:AddLabel({Name = Text,})
	end
end

local MainSection = MainTab:CreateSection({
	Name = "🌍 General 🌍",
	Side = "Left"
})

Label("🌍 General 🌍", MainSection, true)
Toggle("Auto Farm Level \n ออโต้ฟาร์ม", MainSection, 'Auto_Farm_Level');
if Sea1 and Client.PlayerStats.SecondSeaProgression.Value ~= "Yes" then Toggle("Auto Second Sea \n ออโต้ไปโลก2 ['Fully']", MainSection, 'Auto_Second_Sea'); end
if not Sea3 then  Toggle("Auto Third World \n ออโต้ไปโลก3 ['Fully']", MainSection, 'Auto_Third_World'); end

Label("Auto Matic", MainSection, true);
Toggle("Auto Expert Swordman \n ออโต้ตีแชง", MainSection, 'Auto_Expert_Swordman');
Check_Minion = Label("Check Minion Mon: None", MainSection);

Toggle("Auto Kill Minion \n ออโต้ตีโจร", MainSection, 'Auto_Kill_Minion');
Toggle("Auto Kill Sea King \n ออโต้ตีเจ้าทะเล", MainSection, 'Auto_Kill_Sea_King');
Toggle("Auto Kill Hydar Sea King \n ออโต้ตีเจ้าทะเล3หัว", MainSection, 'Auto_Kill_Hydar_Sea_King');
Label("Kill Kaido or Find Dragon's Orb", MainSection, true);
Toggle("Auto Kill Kaido \n ออโต้ตีไคโด", MainSection, 'Auto_Kill_Kaido');
Toggle("Auto Spawn Kaido \n ออโต้ทำให้เกิดไคโด", MainSection, 'Auto_Spawn_Kaido');

Label("Kill BigMom", MainSection, true);
Toggle("Auto Kill BigMom \n ออโต้ตีแม่ใหญ่", MainSection, 'Auto_Kill_BigMom');
Label("Kill Ghost", MainSection, true);
Toggle("Auto Kill Ghost Monster \n ออโต้ตีเรีอผี", MainSection, 'Auto_Kill_GhostMonster');
Label("Monters Setting", MainSection, true);
Toggle("Hop \n ออโต้ตีย้ายเซิฟ", MainSection, 'Monter_Hop');


local settingssection = MainTab:CreateSection({
	Name = "🌍 Settings 🌍",
	Side = "Right"
})

Label("Stats Mon", settingssection, true)
if game.PlaceId == 6381829480 then
	Check_SeaKing = Label("Check Sea King Mon: None", settingssection);
	Check_Dragon = Label("Check Dragon Mon: None", settingssection);
	Check_HydarSeaKing = Label("Check Hydar Sea King Mon: None", settingssection);
	Check_LegacyIsland = Label("Check Legacy Island : None", settingssection);
	Check_BigMom = Label("Check BigMom : None", settingssection);
elseif game.PlaceId == 4520749081 then
	Check_Expert_Swordman = Label("Check Expert Swordman : None", settingssection);
end

Label("🌍 Settings 🌍", settingssection, true)
MultiDropdown("Select Skill \n เลือกทักษะ",{"Z","X","C","V"}, settingssection, 'Select_Skill');
Toggle("Auto Use Skill", settingssection, 'Auto_Use_Skill');
Toggle("Bring Mon \n test", settingssection, 'Bring_Mon');
Toggle("White screen \n จอขาว", settingssection, function(v)
	game:GetService("RunService"):Set3dRenderingEnabled(not v)
end)
Dropdown("Select Weapon \n เลือกอาวุต", { "Melee", "Sword", "all In One"}, settingssection, 'Select_Weapon');
MultiDropdown("Select Stast \n เลือกที่จะอัพ",{"Melee","Defense","Sword","Fruit"}, settingssection, 'Select_Stast');
Toggle("Auto Up Stast", settingssection, 'UpStast');

local Dev_Mode_Section = MainTab:CreateSection({
	Name = "🌍 Dev Mode 🌍",
	Side = "Right"
})

Label("🌍 Dev Mode 🌍", Dev_Mode_Section, true)
Dev_Mode_Section:AddButton({
	Name = "DEX Explorer",
	Callback = function()
		loadstring(game:HttpGet("https://github.com/Hosvile/DEX-Explorer/releases/latest/download/main.lua", true))()
	end
})

-- loadtext
getTextoforLabel()

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt,false)
mt.__namecall = function(...)
	local args = {...}
	local method = getnamecallmethod()
	if method == "InvokeServer" then
		if tostring(args[1]) == "SkillAction" then
			if getgenv().PosMonSkill then
				if not args[3] then
					return old(...)
				end
				if args[3].Type == "Up" or args[3].Type == "Down" then
					args[3].MouseHit = getgenv().PosMonSkill
					return old(unpack(args))
				end
			end
		end
	end
	return old(...)
end

--Ares_OI12
