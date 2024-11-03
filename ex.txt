-- Create Functions
local Func_Farms = {
    ["Auto Level"] = false,
    ["Auto Bone"] = false,
    ["Auto Katakuri"] = false,
    ["Auto Mastery"] = false,
    ["Skills Press"] = {}
}
local Func_Settings = {
    ["Fast Attack"] = {
        ["Value"] = true,
        ["Speed"] = "Normal"
    },
    ["Hop Delay"] = 4,
    ["Auto Ken"] = false,
    ["Double Quest"] = false,
    ["Triple Quest Cake Or Bone"] = false,
    ["Tween Speed"] = 300,
    ["Claim Quest Cake And Haunted"] = false,
    ["Open Dimension"] = false,
    ["Stop Health"] = 25
}
local Func_Other = {
    ["Random Suprise"] = false,
    ["Awakening V4"] = false
}
local Func_Sub = {
    ["Auto Full Mastery All Sword"] = false,
    ["Auto Saber"] = false, 
    ["Auto Cursed Dual Katana"] = false,
    ["Auto Yama"] = false,
    ["Auto Tushita Fully"] = false,
    ["Auto Melee"] = {
        ["Superhuman"] = false,
        ["Death Step"] = false,
        ["Sharkman Karate"] = false,
        ["Dragon Talon"] = false,
        ["God Human"] = false
    },
    ["Auto Shark Anchor"] = false,
    ["Auto Soul Reaper"] = false
}
local Func_UpgradeRace = {
    ["Auto Fully V2"] = false,
    ["Auto Fully V3"] = false,
    ["Find Mirage Island"] = false,
    ["Cam To Moon"] = false,
    ["Auto Fully Trial"] = false, 
    ["Auto Kill Players Trial Completed"] = false,
    ["Skill Press [Trial]"] = false,
    ["Multiple Trial"] = false
}
local Func_SeaEvent = {
    ["Tween Boat To Zone 6"] = false,
    ["Auto Kill Shark Mon"] = false,
    ["Auto Kill Terror Shark"] = {
        ["Normal Kill"] = false,
        ["Dogde Skill"] = false
    },
    ["Auto Kill Ghost/Fish Ship"] = false,
    ["Auto Dogde Rough Sea"] = false,
    ["Auto Sea Beast"] = false,
    ["Auto Tween To Frozen Dimension"] = false,
    ["Auto Find Frozen Dimension"] = false,
    ["Auto Kill Leviathan"] = false
}
local Func_Neccessary = {
    ["Auto Fully Raid"] = false
}
local StatusLabel = ""
-- Loader Library
local LibLoader = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
-- Load Hub
local function UIOpen()
    -- Functions Unnecessary
    function noti(name, content, subc, time)
        if name == nil or name == "" then
            name = "Not Titled"
        end
        if content == nil or content == "" then
            content = "No Any Descriptions"
        end
        if subc == nil or subc == "" then
            subc = "No Any Sub Descriptions"
        end
        if type(I) ~= "number" then
            time = 10
        end
        LibLoader:Notify({Title = name,Content = content, SubContent = subc,Duration = time})
    end
    -- Functions Necessary
    local Q = require(game.ReplicatedStorage.Quests)
    local R = {"BartiloQuest", "Trainees", "MarineQuest", "CitizenQuest"}
    local function S()
        local T = game.Players.LocalPlayer.Data.Level.Value
        local min = 0
        if T >= 1450 and game.PlaceId == 4442272183 then
            Mob1 = "Water Fighter"
            Mob2 = "ForgottenQuest"
            Mob3 = 2
        elseif T >= 700 and game.PlaceId == 2753915549 then
            Mob1 = "Galley Captain"
            Mob2 = "FountainQuest"
            Mob3 = 2
        else
            for r, v in pairs(Q) do
                for M, N in pairs(v) do
                    local U = N.LevelReq
                    for O, P in pairs(N.Task) do
                        if T >= U and U >= min and N.Task[O] > 1 and not table.find(R, tostring(r)) then
                            min = U
                            Mob1 = tostring(O)
                            Mob2 = r
                            Mob3 = M
                        end
                    end
                end
            end
        end
    end
    function CFrameQuest()
        local GuideModule = require(game.ReplicatedStorage.GuideModule)
        for list,NPCListC in pairs(GuideModule["Data"]["NPCList"]) do
            if NPCListC["NPCName"] == GuideModule["Data"]["LastClosestNPC"] then
                return list["CFrame"]
            end
        end
    end
    local Q = require(game.ReplicatedStorage.Quests)
    local a3 = require(game.ReplicatedStorage:WaitForChild("GuideModule"))
    function CheckDataQuest()
        for r, v in next, a3.Data do
            if r == "QuestData" then
                return true
            end
        end
        return false
    end
    function CheckNameMobDoubleQuest()
        local a
        if CheckDataQuest() then
            for r, v in next, a3.Data.QuestData.Task do
                a = r
            end
        end
        return a
    end
    function CheckDoubleQuestSkidcuaYMF()
        S()
        local a5 = {}
        if game.Players.LocalPlayer.Data.Level.Value >= 10 and Func_Settings["Double Quest"] and CheckDataQuest() and CheckNameMobDoubleQuest() == Mob1 and #CheckNameMobDoubleQuest() > 2 then
            for r, v in pairs(Q) do
                for M, N in pairs(v) do
                    for O, P in pairs(N.Task) do
                        if tostring(O) == Mob1 then
                            for a6, a7 in next, v do
                                for a8, a9 in next, a7.Task do
                                    if a8 ~= Mob1 and a9 > 1 then
                                        if a7.LevelReq <= game.Players.LocalPlayer.Data.Level.Value then
                                            a5["Name"] = tostring(a8)
                                            a5["Mob2"] = r
                                            a5["ID"] = a6
                                        else
                                            a5["Name"] = Mob1
                                            a5["Mob2"] = Mob2
                                            a5["ID"] = Mob3
                                        end
                                        return a5
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else
            a5["Name"] = Mob1
            a5["Mob2"] = Mob2
            a5["ID"] = Mob3
            return a5
        end
        a5["Name"] = Mob1
        a5["Mob2"] = Mob2
        a5["ID"] = Mob3
        return a5
    end
    function MobLevel1OrMobLevel2()
        local aa = {}
        for r, v in pairs(game.Workspace.Enemies:GetChildren()) do
            if not table.find(aa, v.Name) and v:IsA("Model") and v.Name ~= "PirateBasic" and not string.find(v.Name, "Brigade") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
                table.insert(aa, v.Name)
            end
        end
        for r, v in pairs(aa) do
            local ab = v
            v = tostring(v:gsub(" %pLv. %d+%p", ""))
            if tostring(v) == CheckNameMobDoubleQuest() then
                return tostring(ab)
            end
        end
        return false
    end
    function ClickRaid()
        if game.PlaceId == 4442272183 then
            fireclickdetector(game.Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
        elseif game.PlaceId == 7449423635 then
            fireclickdetector(game.Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
        end
    end
    function GetQuest()
        local Distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest().Position).Magnitude
        if Distance <= 20 then
            game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("StartQuest", tostring(CheckDoubleQuestSkidcuaYMF().Mob2), CheckDoubleQuestSkidcuaYMF().ID)
        else
            ToTween(CFrameQuest())
        end
    end
    function GetMob()
        local tablegetmob = {}
        for i,v in pairs(game.Workspace.MobSpawns:GetChildren()) do
            if not table.find(tablegetmob, v.Name) then
                table.insert(tablegetmob, v.Name)
            end
        end
        if string.find(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()[1].Name, "Lv.") then
            for i, v in pairs(tablegetmob) do
                local b = v
                v = RemoveLevelTitle(v)
                if v == CheckNameMobDoubleQuest() then
                    return b
                end
            end
        else
            return CheckNameMobDoubleQuest()
        end
    end
    -- Function Attack
    function Clicking()
        local VirtualUser = game:GetService("VirtualUser")
        VirtualUser:CaptureController()
        VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
    end
    function KillAura()
        for _,v in pairs(game.Workspace.Enemies:GetDescendants()) do
            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                repeat wait(.1)
                    v.Humanoid.Health = 0
                    v.HumanoidRootPart.CanCollide = false
                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                until not v or not v:FindFirstChild("Humanoid") or v.Humanoid.Health == 0
            end
        end
    end
    function HopServer(bO)
        if not bO then
            bO = 10
        end
        ticklon = tick()
        repeat
            task.wait()
        until tick() - ticklon >= 1
        local function Hop()
            for r = 1, math.huge do
                if ChooseRegion == nil or ChooseRegion == "" then
                    ChooseRegion = "Singapore"
                else
                    game.Players.LocalPlayer.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text =
                        ChooseRegion
                end
                local bP = game.ReplicatedStorage.__ServerBrowser:InvokeServer(r)
                for k, v in pairs(bP) do
                    if k ~= game.JobId and v["Count"] < bO then
                        game.ReplicatedStorage.__ServerBrowser:InvokeServer("teleport", k)
                    end
                end
            end
            return false
        end 
        if not getgenv().Loaded then
            local function bQ(v)
                if v.Name == "ErrorPrompt" then
                    if v.Visible then
                        if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                            HopServer()
                            v.Visible = false
                        end
                    end
                    v:GetPropertyChangedSignal("Visible"):Connect(
                        function()
                            if v.Visible then
                                if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                                    HopServer()
                                    v.Visible = false
                                end
                            end
                        end
                    )
                end
            end
            for k, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
                bQ(v)
            end
            game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(bQ)
            getgenv().Loaded = true
        end
        while not Hop() do
            wait()
        end
    end
    function CheckItem(item)
        for i, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
            if v.Name == item then
                return v
            end
        end
    end
    function TorchDimension(nameDimension) 
        Dimension = nameDimension == "Tushita" and "HeavenlyDimension" or "HellDimension"
        DimensionInMap = game.Workspace.Map:FindFirstChild(Dimension) 
        if not DimensionInMap then 
            return 
        end
        if game.Workspace.Map:FindFirstChild(Dimension) then 
            for _,DimensionPath in pairs(DimensionInMap) do
                if string.find(DimensionPath.Name, "Torch") then
                    if DimensionPath.ProximityPrompt.Enabled == true then
                        return DimensionPath
                    end
                end
            end
        end
    end  
    function HopUI(timec, reason)
        if not reason then
            reason = "Laggy"
        end
        local ScreenGui = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        local shadowHolder = Instance.new("Frame")
        local umbraShadow = Instance.new("ImageLabel")
        local penumbraShadow = Instance.new("ImageLabel")
        local ambientShadow = Instance.new("ImageLabel")
        local Hubname = Instance.new("TextLabel")
        local HopSecond = Instance.new("TextLabel")
        local Reason = Instance.new("TextLabel")
        local InstanceFrame = Instance.new("LocalScript", Frame)
        
        ScreenGui.Parent = game:GetService("CoreGui")
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
        Frame.Parent = ScreenGui
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame.BackgroundTransparency = 1.000
        Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame.BorderSizePixel = 0
        Frame.Position = UDim2.new(0.5, 0, -1, 0)
        Frame.Size = UDim2.new(0, 1424, 0, 776)
        
        InstanceFrame.Parent:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 1, false)
        
        shadowHolder.Name = "shadowHolder"
        shadowHolder.Parent = Frame
        shadowHolder.BackgroundTransparency = 1.000
        shadowHolder.Size = UDim2.new(1, 0, 1, 0)
        shadowHolder.ZIndex = 0
        
        umbraShadow.Name = "umbraShadow"
        umbraShadow.Parent = shadowHolder
        umbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
        umbraShadow.BackgroundTransparency = 1.000
        umbraShadow.Position = UDim2.new(0.5, 0, 0.5, 6)
        umbraShadow.Size = UDim2.new(1, 100, 1, 300)
        umbraShadow.ZIndex = 0
        umbraShadow.Image = "rbxassetid://1316045217"
        umbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
        umbraShadow.ImageTransparency = 0.860
        umbraShadow.ScaleType = Enum.ScaleType.Slice
        umbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)
        
        penumbraShadow.Name = "penumbraShadow"
        penumbraShadow.Parent = shadowHolder
        penumbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
        penumbraShadow.BackgroundTransparency = 1.000
        penumbraShadow.Position = UDim2.new(0.5, 0, 0.5, 6)
        penumbraShadow.Size = UDim2.new(1, 100, 1, 300)
        penumbraShadow.ZIndex = 0
        penumbraShadow.Image = "rbxassetid://1316045217"
        penumbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
        penumbraShadow.ImageTransparency = 0.880
        penumbraShadow.ScaleType = Enum.ScaleType.Slice
        penumbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)
        
        ambientShadow.Name = "ambientShadow"
        ambientShadow.Parent = shadowHolder
        ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
        ambientShadow.BackgroundTransparency = 1.000
        ambientShadow.Position = UDim2.new(0.499297738, 0, 0.392268056, 6)
        ambientShadow.Size = UDim2.new(1, 100, 1, 300)
        ambientShadow.ZIndex = 0
        ambientShadow.Image = "rbxassetid://1316045217"
        ambientShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
        ambientShadow.ImageTransparency = 0.880
        ambientShadow.ScaleType = Enum.ScaleType.Slice
        ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)
        
        Hubname.Name = "Hubname"
        Hubname.Parent = Frame
        Hubname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Hubname.BackgroundTransparency = 1.000
        Hubname.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Hubname.BorderSizePixel = 0
        Hubname.Position = UDim2.new(0.287219107, 0, 0.390463918, 0)
        Hubname.Size = UDim2.new(0, 605, 0, 85)
        Hubname.Font = Enum.Font.Michroma
        Hubname.Text = "Experience Script"
        Hubname.TextColor3 = Color3.fromRGB(170, 255, 255)
        Hubname.TextSize = 100.000
        
        HopSecond.Name = "HopSecond"
        HopSecond.Parent = Frame
        HopSecond.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        HopSecond.BackgroundTransparency = 1.000
        HopSecond.BorderColor3 = Color3.fromRGB(0, 0, 0)
        HopSecond.BorderSizePixel = 0
        HopSecond.Position = UDim2.new(0.287219107, 0, 0.461340219, 0)
        HopSecond.Size = UDim2.new(0, 605, 0, 85)
        HopSecond.Font = Enum.Font.Gotham
        HopSecond.Text = "Hopping Server in: ?s"
        HopSecond.TextColor3 = Color3.fromRGB(255, 255, 255)
        HopSecond.TextSize = 40.000
        timed = timec
        spawn(function()
            while wait(1) do
                local a = math.random(1,255)
                local b = math.random(1,255)
                local c = math.random(1,255)
                timed -= 1
                HopSecond.Text = "Hopping Server in: "..timed
                if timed <= 0 then
                    HopSecond.Text = "HOP!"
                    HopSecond.TextColor3 = Color3.fromRGB(a, b, c)
                end
                if timed <= 0 then
                    wait(2)
                    InstanceFrame.Parent:TweenPosition(UDim2.new(0.5, 0, -1, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, false)
                    wait(1)
                    ScreenGui:Destroy()
                    print("Hop")
                    HopServer()
                end
            end
        end)
        Reason.Name = "Reason"
        Reason.Parent = Frame
        Reason.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Reason.BackgroundTransparency = 1.000
        Reason.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Reason.BorderSizePixel = 0
        Reason.Position = UDim2.new(1, 0, 0.512886584, 0)
        Reason.Size = UDim2.new(0, 605, 0, 85)
        Reason.Font = Enum.Font.Gotham
        Reason.Text = "Reason: "..reason
        Reason.TextColor3 = Color3.fromRGB(255, 255, 127)
        Reason.TextSize = 50.000
        local script3 = Instance.new("LocalScript", Reason)
        local script1 = Instance.new("LocalScript", Hubname)
        local script2 = Instance.new("LocalScript", HopSecond)
        for i = 1,0,-0.02 do
            script1.Parent.TextTransparency = i
            script2.Parent.TextTransparency = i
            script3.Parent.TextTransparency = i
            task.wait(0.02)
        end
        script3.Parent:TweenPosition(UDim2.new(0.286516845, 0, 0.512886584, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, false)
    end
    function Buso()
        NoClip()
        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
        end
    end
    function CheckEnemySpawns(b)
        for i,v in game.Workspace._WorldOrigin.EnemySpawns:GetChildren() do
            if type(b) == "table" then
                if table.find(b, v.Name) then
                    return v
                end
            else
                if v.Name == b then
                    return v
                end
            end
        end
    end
    function RequestEntraceTemple()
        local CFRAMETEMPLE = CFrame.new(28734.3945,14888.2324,-109.071777,-0.650207579,4.1780531e-08,-0.759756625,1.97876595e-08,1,3.80575109e-08,0.759756625,9.71147784e-09,-0.650207579)
        for i = 1,3 do
            if GetDistance(CFRAMETEMPLE) > 1200 then
                Temple()
            end
        end
    end
    function PullLever()
        local bn = CFrame.new(28576.4688, 14939.2832, 76.5164413, -1, 0, 0, 0, 0.707134247, -0.707079291, -0, -0.707079291, -0.707134247)
        local bo = CFrame.new(28576.4688, 14935.9512, 75.469101, -1, -4.22219593e-08, 1.13133396e-08, 0, -0.258819044, -0.965925813, 4.37113883e-08, -0.965925813, 0.258819044)
        local bp = 0.2
        if game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z > bo.Z + bp or game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z < bo.Z - bp then
            RequestEntraceTemple()
            ToTween(game:GetService("Workspace").Map["Temple of Time"].Lever.Part.CFrame)
            for r, v in pairs(game:GetService("Workspace").Map["Temple of Time"].Lever:GetDescendants()) do
                if v.Name == "ProximityPrompt" then
                    fireproximityprompt(v)
                end
            end
        end
    end
    function GetNameRaid()
        local table_GetNameRaid = {}
        local Rc = require(game:GetService("ReplicatedStorage").Raids).raids
        local Rb = require(game:GetService("ReplicatedStorage").Raids).advancedRaids
        for _,RaidName in pairs({Rc, Rb}) do
            for _,RaidName2 in pairs(RaidName) do
                if RaidName2 ~= " " and RaidName2 ~= "" then
                    table.insert(table_GetNameRaid, RaidName2)
                end
            end
        end
        return table_GetNameRaid
    end
    function GetNextIs(islandNumber)
        local min = 4500
        local ClosetIs = nil
        local worldOrigin = game:GetService("Workspace")["_WorldOrigin"]
        for _,IslandM in pairs(worldOrigin.Locations:GetChildren()) do
            if IslandM.Name == "Island "..islandNumber then
                local distance = (IslandM.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance < min then
                    min = distance
                    ClosetIs = IslandM
                end
            end
        end
        return ClosetIs
    end
    function NextIS()
        for i,v in pairs({5,4,3,2,1}) do
            if GetNextIs(v) and (GetNextIs(v).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
                return GetNextIs(v)
            end
        end
    end
    function Temple()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
    end
    function SendKeyEvents(vb ,cc)
        if not cc then
            cc = 0
        end
        game.VirtualInputManager:SendKeyEvent(true, vb, false, game)
        task.wait(cc)
        game.VirtualInputManager:SendKeyEvent(false, vb, false, game)
    end
    function GetRandomTween(ck)
        local RandomL,R2 = math.random(30,100), math.random(10,40)
        return ck * CFrame.new(RandomL, 30, R2)
    end
    function EquipTool(ToolSe)
        if va then
            return
        end
        if getgenv()["SelectTool"] == "" or getgenv()["SelectTool"] == nil then
            getgenv()["SelectTool"] = "Melee"
        end
        ToolSe = GetWeapon(getgenv()["SelectTool"])
        NoClip()
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait(.4)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
        end
    end
    function NoClip(Cc)
        if not Cc then
            Cc = true
        end
        if Cc then
            if not game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
                local bv = Instance.new("BodyVelocity")
                bv.Velocity = Vector3.new(0, 0, 0)
                bv.MaxForce = Vector3.new(9999999, 9999999, 9999999)
                bv.P = 15000
                bv.Parent = game.Players.LocalPlayer.Character.Head
            end
            for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        else
            if game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
                game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
            end
        end
    end
    function GetWeapon(cc)
        stringcurrent = ""
        for i, v in game.Players.LocalPlayer.Backpack:GetChildren() do
            if v:IsA("Tool") and v.ToolTip == cc then
                stringcurrent = v.Name
            end
        end
        for i, v in game.Players.LocalPlayer.Character:GetChildren() do
            if v:IsA("Tool") and v.ToolTip == cc then
                stringcurrent = v.Name
            end
        end
        return stringcurrent
    end
    function ResetTP(Pos)
        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            if (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
                for i = 1,4 do
                    InstantTeleport(Pos)
                end
                task.wait()
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
            end
        else
            ToTween(Pos)
        end
    end
    function TpEntrance(P)
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", P)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
        wait(0.5)
    end
    function Func1()
        Mobs = game.workspace.Enemies:GetChildren()
        if #Mobs <= 0 then 
            return 
        else
            for _,MobsFolder in pairs(Mobs) do 
                if MobsFolder:FindFirstChild("Humanoid") and MobsFolder.Humanoid.Health > 0 and MobsFolder:FindFirstChild("HumanoidRootPart") then 
                    return MobsFolder 
                end
            end
        end
    end    
    function GetNameQuestHaze()
        for _,QuestHazeF in pairs(game.Players.LocalPlayer.QuestHaze:GetChildren()) do
            if QuestHazeF.Value > 0 then
                return QuestHazeF.Name
            end
        end
    end
    function CheckHazeESP()
        for _,v in pairs(game.Workspace.Enemies:GetChildren()) do
            if v:IsA("Model") and DetectingPart(v) and v:FindFirstChild("HazeESP") and v.Humanoid.Health > 0 then
                v.HazeESP.Size = Vector3.new(30, 30, 30)
                return v
            end
        end
        for _,v in pairs(game.Workspace.Enemies:GetChildren()) do
            if v.Name == GetNameQuestHaze() then
                if v:IsA("Model") and DetectingPart(v) and v.Humanoid.Health > 0 then
                    return v
                end 
            end
        end
    end
    function GetQuestCDK(nameQ)
        if NameQ == "Good" then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
        elseif NameQ == "Evil" then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
        end  
    end
    CursedDualKatana = function()
        QuestGood = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good").Good
        QuestEvil = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good").Evil
        if not CheckItem("Yama") or not CheckItem("Tushita") then
            return
        end
        if CheckItem("Yama") and CheckItem("Tushita") then
            if CheckItem("Yama").Mastery < 350 and CheckItem("Tushita").Mastery < 350 then
                noti("Experience Script", "Auto Cursed Dual Katana", "Not Enough Mastery Requirements", 5)
                return
            else
                local CurrentPedestal
                if not CheckItemBPCR("Tushita") and not CheckItemBPCR("Yama") then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("LoadItem","Tushita")
                elseif QuestGood == 4 then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("LoadItem","Yama")
                end
                if QuestGood == 4 and QuestEvil == 3 then
                    CurrentPedestal = "Pedestal2"
                elseif QuestGood == 3 and QuestEvil == 4 then
                    CurrentPedestal = "Pedestal1"
                end
                if CurrentPedestal then
                    if (game.Workspace.Map.Turtle.Cursed[CurrentPedestal].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                        fireproximityprompt(game.Workspace.Map.Turtle.Cursed[CurrentPedestal].ProximityPrompt)
                    else
                        ToTween(game.Workspace.Map.Turtle.Cursed[CurrentPedestal].CFrame)
                    end
                end
                if game.Players.LocalPlayer.PlayerGui.Main.Dialogue.Visible then
                    game.VirtualUser:Button1Down(Vector2.new(0, 0))
                    game.VirtualUser:Button1Down(Vector2.new(0, 0))
                end
                if QuestGood then
                    if QuestGood == -3 then
                        StatusLabel = "Doing Auto Cursed Dual Katana, Quest 1 [Tushita]"
                        GetQuestCDK("Good")
                        for _,nilinstance in pairs(getnilinstances()) do
                            if nilinstance.Name:match("Luxury Boat Dealer") then
                                TpInstant(nilinstance.HumanoidRootPart.CFrame)
                                local args = {[1] = "CDKQuest", [2] = "BoatQuest", [3] = game.Workspace.NPCs:FindFirstChild("Luxury Boat Dealer")}
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                        end
                    elseif QuestGood == -4 then
                        GetQuestCDK("Good")
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219)).magnitude > 1000 then
                            TpEntrance(Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125))
                        else
                            if CheckMonCastle() then
                                local v = CheckMonCastle()
                                repeat task.wait()
                                    KillMonster(v.Name, true, CheckStatusFeature(Func_Sub["Auto Cursed Dual Katana"]) == "FALSE")
                                    StatusLabel = "Doing Auto Cursed Dual Katana, Quest 2 [Tushita], Auto Raid Castle"
                                until not v or v.Humanoid.Health <= 0 
                            else
                                StatusLabel = "Doing Auto Cursed Dual Katana, Quest 2 [Tushita], Wait Mob Raid Castle"
                                local tick1 = tick()
                                repeat task.wait() until tick1-tick() >= 20
                                HopUI(Func_Settings["Hop Delay"], "Not Found Raid Castle On The Sea")
                            end
                        end
                    elseif QuestGood == -5 then
                        GetQuestCDK("Good")
                        local CreamPos = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
                        if GetDistance(game.Workspace["_WorldOrigin"].Locations["Heavenly Dimension"].Position) < 2000 then
                            StatusLabel = "Doing Auto Cursed Dual Katana, Quest 3 [Tushita], Successing Dimension"
                            if game.Workspace.Map.HeavenlyDimension.Exit.BrickColor == BrickColor.new("Cloudy grey") then 
                                InstantTeleport(game.Workspace.Map.HeavenlyDimension.Exit.CFrame)
                                ToTween(game.Workspace.Map.HeavenlyDimension.Exit.CFrame)
                            else
                                if Func1() then			
                                    repeat wait()
                                        KillAura()
                                    until not Func1() or CheckStatusFeature(Func_Sub["Auto Cursed Dual Katana"]) == "FALSE"
                                else
                                    if TorchDimension("Tushita") then 
                                        ToTween(TorchDimension("Tushita").CFrame)  
                                        wait(.5)
                                        fireproximityprompt(TorchDimension("Tushita").ProximityPrompt)
                                    end
                                end
                            end
                        else
                            if CheckEnemies("Cake Queen") then
                                local v = CheckEnemies("Cake Queen")
                                repeat wait()
                                    KillMonster(v.Name, true, CheckStatusFeature(Func_Sub["Auto Cursed Dual Katana"]) == "FALSE")
                                    StatusLabel = "Doing Auto Cursed Dual Katana, Quest 3 [Tushita], Kill Cake Queen"
                                until CheckStatusFeature(Func_Sub["Auto Cursed Dual Katana"]) == "FALSE" or game.Workspace.Map:FindFirstChild("HeavenlyDimension") 
                            else
                                StatusLabel = "Doing Auto Cursed Dual Katana, Quest 3 [Tushita], Wait Spawn Cake Queen"
                                if GetDistance(CreamPos) > 2000 then
                                    ToTween(CreamPos)
                                else
                                    local tick1 = tick()
                                    repeat task.wait() until tick1-tick() >= 5
                                    HopUI(Func_Settings["Hop Delay"], "Not Found Cake Queen")
                                end
                            end
                        end
                    end
                else
                    if QuestEvil == -3 then 
                        StatusLabel = "Doing Auto Cursed Dual Katana, Quest 1 [Yama]"
                        GetQuestCDK("Evil")
                        local Mons
                        for _,EnemiesFolder in pairs(game.Workspace.Enemies:GetChildren()) do
                            if EnemiesFolder:IsA("Model") and EnemiesFolder.Name == "Marine Commodore" and DetectingPart(EnemiesFolder) then
                                Mons = EnemiesFolder
                            end
                        end
                        if not Mons then
                            for _,EnemySpawnsFolder in pairs(game.Workspace["_WorldOrigin"].EnemySpawns:GetChildren()) do
                                if v.Name == "Marine Commodore" then
                                    ToTween(v.CFrame * CFrame.new(0,20,0))
                                end
                            end
                        else
                            repeat task.wait()
                                ToTween(Mons.HumanoidRootPart.CFrame)
                            until game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                        end
                    elseif QuestEvil == -4 then
                        GetQuestCDK("Evil")
                        StatusLabel = "Doing Auto Cursed Dual Katana, Quest 2 [Yama]"
                        CurrentHaze = CheckHazeESP()
                        if CurrentHaze then
                            repeat wait()
                                KillMonster(CurrentHaze.Name, true, CheckStatusFeature(Func_Sub["Auto Cursed Dual Katana"]) == "FALSE")
                            until CheckItem("Cursed Dual Katana") or CheckStatusFeature(Func_Sub["Auto Cursed Dual Katana"]) == "FALSE"
                        else
                            NameQHaze = GetNameQuestHaze()
                            for _,MobSpawnsFolder in pairs(game.Workspace.MobSpawns:GetChildren()) do
                                if (typeof(NameQHaze) == "string" and string.find(MobSpawnsFolder.Name, NameQHaze) or (typeof(NameQHaze) == "table" and table.find(NameQHaze, MobSpawnsFolder.Name))) then
                                    repeat wait()
                                        ToTween(MobSpawnsFolder.CFrame * CFrame.new(0,20,0))
                                    until not GetNameQuestHaze() or CheckStatusFeature(Func_Sub["Auto Cursed Dual Katana"]) == "FALSE"
                                    
                                end
                            end
                        end
                        if GetNameQuestHaze() <= 0 then
                            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
                        end
                    elseif QuestEvil == -5 then
                        GetQuestCDK("Evil")
                        if GetDistance(game.Workspace["_WorldOrigin"].Locations["Hell Dimension"].Position) < 2000 then
                            if game.Workspace.Map.HellDimension.Exit.BrickColor == BrickColor.new("Olivine") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.HellDimension.Exit.CFrame
                                ToTween(game.Workspace.Map.HellDimension.Exit.CFrame)
                            else
                                StatusLabel = "Doing Auto Cursed Dual Katana, Quest 3 [Yama], Successing Dimension"
                                local v = Func1()
                                if v then			
                                    repeat wait()
                                        KillAura()
                                    until not Func1() or CheckStatusFeature(Func_Sub["Auto Cursed Dual Katana"]) == "FALSE"
                                else
                                    if TorchDimension("Yama") then 
                                        ToTween(TorchDimension("Yama").CFrame)  
                                        wait(.5)
                                        fireproximityprompt(TorchDimension("Yama").ProximityPrompt)
                                    end
                                end
                            end
                        else
                            if not CheckEnemies("Soul Reaper") then
                                if not CheckItemBPCR("Hallow Essence") then
                                    for i = 1,11 do
                                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                                    end
                                elseif CheckItemBPCR("Hallow Essence") then
                                    StatusLabel = "Doing Auto Cursed Dual Katana, Quest 3 [Yama], Auto Soul Reaper"
                                    if GetDistance(CFrame.new(-8930.6083984375, 144.92068481445312, 6066.2236328125)) > 30 then
                                        ToTween(CFrame.new(-8930.6083984375, 144.92068481445312, 6066.2236328125))
                                        if GetDistance(CFrame.new(-8930.6083984375, 144.92068481445312, 6066.2236328125)) <= 20 then
                                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game.Workspace.Map["Haunted Castle"].Detection.TouchInterest, 0)
                                        end
                                    else
                                        EquipName("Hallow Essence")
                                    end
                                end
                            else
                                ToTween(CheckEnemies("Soul Reaper", true).HumanoidRootPart.CFrame)
                            end
                        end
                    end
                end
            end
        elseif CheckItem("Cursed Dual Katana") then
            CDK:SetValue(false)
            noti("Experience Script", "Auto Cursed Dual Katana", "You Already Have Cursed Dual Katana", 5)
        end
    end
    function CheckMonCastle()
        for _,v in pairs(game.workspace.Enemies:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219)).magnitude <= 1000 and v.Humanoid.Health > 0 then
                return v 
            end
        end
    end
    function ResetTPNearest(Pos)
        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            if (Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2800 then
                TpEntrance(Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125))
            else
                ResetTP(Pos)
            end
        end
    end
    function InstantTeleport(P)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
    end
    local statusTween = ""
    function ToTween(Pos)
        local tween
        Distance = GetDistance(Pos)
        if Distance <= 350 then
            InstantTeleport(Pos)
        end
        tween = game:GetService("TweenService"):Create(
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Func_Settings["Tween Speed"], Enum.EasingStyle.Linear),
            {CFrame = Pos}
        )
        tween:Play()
        statusTween = tween.PlaybackState
        tween.Completed:Wait()
        statusTween = tween.PlaybackState
        if not tween then
            return
        end
    end
    spawn(function()
        while task.wait() do
            if tween then
                local conmemay = tostring(string.gsub(tostring(statusTween), "Enum.PlaybackState.", ""))
                if conmemay == "Playing"  then
                    NoClip()
                else
                    wait(2)
                    if game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
                        game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
                    end
                end
            end
         end
    end)
    function DisableAll()
        if game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
            game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
        end
    end
    function GetMasteryTool(tooltip)
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == tooltip then
                return v.Level.Value
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == tooltip then
                return v.Level.Value
            end
        end
    end
    function CheckStatusFeature(feature)
        InputedFeature = feature
        if InputedFeature == true then
            return "TRUE"
        else
            return "FALSE"
        end
        return "FALSE"
    end
    function DetectingPart(v1)
        return v1 and v1:FindFirstChild("HumanoidRootPart") and v1:FindFirstChild("Humanoid")
    end
    function StopTween(value)
        if value == false then
            pcall(function()
                if tween then
                    tween:Cancel()
                end
                if game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
                    game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
                end
            end)
        end
    end
    function CheckEnemies(k, replicated)
        if not replicated then
            replicated = false
        end
        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
            if type(k) == "table" then
                if table.find(k, v.Name) and DetectingPart(v) and v.Humanoid.Health > 0 then
                    return v
                end
            else
                if v.Name == k and DetectingPart(v) and v.Humanoid.Health > 0 then
                    return v
                end
            end
        end
        if replicated then
            for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                if type(k) == "table" then
                    if table.find(k, v.Name) then
                        return v
                    end
                else
                    if v.Name == k then
                        return v
                    end
                end
            end
        end
    end
    function TweenObject(TweenCFrame,obj,ts)
        if not ts then ts = 350 end
        local tween_s = game:service "TweenService"
        local info = TweenInfo.new((TweenCFrame.Position - obj.Position).Magnitude / ts, Enum.EasingStyle.Linear)
        tween = tween_s:Create(obj, info, {CFrame = TweenCFrame})
        tween:Play() 
    end	
    local StatusQuest = "Claim Quest 1"
    function CheckI()
        if Func_Settings["Triple Quest Cake Or Bone"] or Func_Settings["Claim Quest Cake And Haunted"] then
	        if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                return "CAN'T CHECKED"
	        else
	            return "CHECKED"
    	    end
    	end
    end
    local CheckTripleQuestAndGetQuest = function()
        local plrHuman = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        local LevelData = game.Players.LocalPlayer.Data.Level.Value
        if Func_Farms["Auto Bone"] then
            targetquest1,targetquest2 = "HauntedQuest1", "HauntedQuest2"
            QuestPOS1, QuestPOS2 = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0), CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            lvlreq = {["R1"] = 2000, ["R2"] = 2025, ["R3"] = 2050}
        elseif Func_Farms["Auto Katakuri"] then
            targetquest1,targetquest2 = "CakeQuest1", "CakeQuest2"
            QuestPOS1, QuestPOS2 = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931), CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            lvlreq = {["R1"] = 2225, ["R2"] = 2250, ["R3"] = 2275}
        end
        local table_triple = {
        	["Quest 1"] = {
                ["Name Quest"] = targetquest1,
                ["Level Quest"] = 2
            },
            ["Quest 2"] = {
                ["Name Quest"] = targetquest2,
                ["Level Quest"] = 1
            },
            ["Quest 3"] = {
                ["Name Quest"] = targetquest2,
                ["Level Quest"] = 2
            }
        }
        if CheckI() == "CAN'T CHECKED" then 
            if Func_Settings["Triple Quest Cake Or Bone"] and Func_Settings["Claim Quest Cake And Haunted"]  then
                if StatusQuest == "Claim Quest 1" then
                    if LevelData >= lvlreq["R1"] then
                        if (QuestPOS1.Position - plrHuman).Magnitude <= 10 then
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest",table_triple["Quest 1"]["Name Quest"],table_triple["Quest 1"]["Level Quest"])
                            StatusQuest = "Claim Quest 2"
                        else
                            ToTween(QuestPOS1)
                        end
                    else
                        noti("Experience Script", "Not Enough Level Requirements", "zzz", 5)
                        TripleQuest:SetValue(false)
                        ClaimQuest:SetValue(false)
                    end
                elseif StatusQuest == "Claim Quest 2" then
                    if LevelData >= lvlreq["R2"] then
                        if (QuestPOS2.Position - plrHuman).Magnitude <= 10 then
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest",table_triple["Quest 2"]["Name Quest"],table_triple["Quest 2"]["Level Quest"])
                            StatusQuest = "Claim Quest 3"
                        else
                            ToTween(QuestPOS2)
                        end
                    else
                        noti("Experience Script", "Not Enough Level Requirements ", "To Claim Quest 2", 5)
                        StatusQuest = "Claim Quest 1"
                    end
                elseif StatusQuest == "Claim Quest 3" then
                    if LevelData >= lvlreq["R3"] then
                        if (QuestPOS2.Position - plrHuman).Magnitude <= 10 then
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest",table_triple["Quest 3"]["Name Quest"],table_triple["Quest 3"]["Level Quest"])
                            StatusQuest = "Claim Quest 1"
                        else
                            ToTween(QuestPOS2)
                        end
                    else
                        noti("Experience Script", "Not Enough Level Requirements", "To Claim Quest 3", 5)
                        StatusQuest = "Claim Quest 1"
                    end
                end
            elseif Func_Settings["Claim Quest Cake And Haunted"] then
                if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    if LevelData >= lvlreq["R3"] then
                        if (QuestPOS2.Position - plrHuman).Magnitude <= 10 then
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest",table_triple["Quest 3"]["Name Quest"],table_triple["Quest 3"]["Level Quest"])
                        else
                            ToTween(QuestPOS2)
                        end
                    else
                        noti("Experience Script", "Not Enough Level Requirements", "zzz", 5)
                        ClaimQuest:SetValue(false)
                    end
                end
            end
        elseif CheckI() == "CHECKED" then
            return
        end
    end
    loadstring(
        [[
        local gg = getrawmetatable(game)
        local old = gg.__namecall
        setreadonly(gg, false)
        gg.__namecall =
            newcclosure(
            function(...)
                local method = getnamecallmethod()
                local args = {...}
                if tostring(method) == "FireServer" then
                    if tostring(args[1]) == "RemoteEvent" then
                        if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                            if getgenv().Aim and getgenv().AimPos then
                                if getgenv().AimPos then 
                                    args[2] = getgenv().AimPos 
                                end
                            end
                            return old(unpack(args))
                        end
                    end
                end
                return old(...)
            end
        )
    ]]
    )()
    function CheckBossCake()
        for _,Boss in pairs(game.Workspace.Enemies:GetChildren()) do
            if Boss.Name == "Cake Prince" or Boss.Name == "Dough King" and DetectingPart(Boss) and Boss.Humanoid.Health > 0 then
                return Boss
            end
        end
        for _,Boss in pairs(game.ReplicatedStorage:GetChildren()) do
            if Boss.Name == "Cake Prince" or Boss.Name == "Dough King" then
                return Boss
            end
        end
    end
    function Bring(nameMob,BringC,DistanceF,radius)
        inputed = nameMob
        inputed2 = DistanceF
        inputed3 = radius
        inputed4 = BringC
        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
            if v.Name == inputed and DetectingPart(v) and v.Humanoid.Health > 0 and inputed2.Magnitude <= inputed3 then
                TweenObject(inputed4, v.HumanoidRootPart, 1400)
                v.HumanoidRootPart.Size = Vector3.new(4,4,4)
                v.Humanoid.JumpPower = 0
                v.Humanoid.WalkSpeed = 0
                if v.Humanoid:FindFirstChild("Animator") then
                    v.Humanoid.Animator:Destroy()
                end
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            end
        end
    end
    -- MobSpawns (Tsuo Hub)
    plr = game.Players.LocalPlayer
    if game.Workspace:FindFirstChild("MobSpawns") then
        for i, v in pairs(game.Workspace:GetChildren()) do
            if v.Name == "MobSpawns" then
                v:Destroy()
            end
        end
    end
    local CreateFoldermmb = Instance.new("Folder")
    CreateFoldermmb.Parent = game.Workspace
    CreateFoldermmb.Name = "MobSpawns"
    function RemoveLevelTitle(v)
        return tostring(tostring(v):gsub(" %pLv. %d+%p", ""):gsub(" %pRaid Boss%p", ""):gsub(" %pBoss%p", ""))
    end 
    task.spawn(
        function()
            while task.wait() do 
                pcall(function()
                    for i,v in pairs(game.workspace.MobSpawns:GetChildren()) do  
                        v.Name = RemoveLevelTitle(v.Name)
                    end
                end)
                task.wait(50)
            end
        end
    )
    function MobDepTrai()
        MobDepTraiTable = {}
        for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
            table.insert(MobDepTraiTable, v)
        end
        local tablefoldermmb = {}
        for i, v in next, require(game:GetService("ReplicatedStorage").Quests) do
            for i1, v1 in next, v do
                for i2, v2 in next, v1.Task do
                    if v2 > 1 then
                        table.insert(tablefoldermmb, i2)
                    end
                end
            end
        end
        for i, v in pairs(getnilinstances()) do
            if table.find(tablefoldermmb, RemoveLevelTitle(v.Name)) then
                table.insert(MobDepTraiTable, v)
            end
        end
        return MobDepTraiTable
    end
    local MobSpawnList = MobDepTrai()
    function ReloadFolderMob()
        for i, v in next, game.Workspace.MobSpawns:GetChildren() do
            v:Destroy()
        end
        for i, v in pairs(MobSpawnList) do
            if v then
                if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                    MobNew = Instance.new("Part")
                    MobNew.CFrame = v.HumanoidRootPart.CFrame
                    MobNew.Name = v.Name
                    MobNew.Parent = game.Workspace.MobSpawns
                elseif v:IsA("Part") then
                    MobNew = v:Clone()
                    MobNew.Parent = game.Workspace.MobSpawns
                end
            end
        end
    end
    ReloadFolderMob()
    function CheckMobSpawns(ic)
        for _,MobSpawnsFolder in pairs(game.Workspace.MobSpawns:GetChildren()) do
            if MobSpawnsFolder.Name == ic then
                return MobSpawnsFolder
            end
        end
    end
    -- Other2 
    function AddHitbox(numberRadius)
        local CRV = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework")))[2]
        CRV.activeController.hitboxMagnitude = numberRadius
    end
    -- Kill Mob Functions
    local KillMonster = function(mob,bringmobvalue,value)
        if CheckEnemies(mob) then
            local v = CheckEnemies(mob)
            task.spawn(function()
                if CheckStatusFeature(bringmobvalue) == "TRUE" then
                    Bring(v.Name,v.HumanoidRootPart.CFrame,(v.HumanoidRootPart.Position - v.HumanoidRootPart.Position), 350)
                end
            end)
            if DetectingPart(v) and v.Humanoid.Health > 0 then
                repeat task.wait()
                    Buso()
                    ToTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                    if CheckStatusFeature(Func_Farms["Auto Mastery"]) == "TRUE" and v.Humanoid.MaxHealth < 200000 then
                        if v.Humanoid.Health <= v.Humanoid.MaxHealth * Func_Settings["Stop Health"] / 100 then
                            local EFruit,PressSkill = IsSkillFruit()
                            EquipName(EFruit)
                            SendKeyEvents(PressSkill)
                            NoClip()
                            getgenv().AimPos = v.HumanoidRootPart.Position
                            getgenv().Aim = true
                        else
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 20 then
                                AddHitbox(60)
                                Clicking()
                                EquipTool()
                            end
                        end
                    else
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 20 then
                            Clicking()
                            EquipTool()
                        end
                    end
                until value or v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
                getgenv().AimPos = nil
                getgenv().Aim = false
            end
        end
    end
    -- Other Function
    function GetMobSpawnList(a)
        a = RemoveLevelTitle(a)
        k = {}
        for i, v in pairs(game.Workspace.MobSpawns:GetChildren()) do
            if v.Name == a then
                table.insert(k, v)
            end
        end
        return k
    end
    CakeA = "ngu"
    function RemainingCake()
        local remainingCake = tonumber(string.match(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true), "%d+"))
        if remainingCake then
            return "KILL REMAINING: " .. remainingCake
        elseif CheckBossCake() then
            return "BOSS HAS SPAWNED"
        else
            return "KILL REMAINING: N/A"
        end 
    end
    function SoulReaperS()
        if CheckEnemies(RemoveLevelTitle("Soul Reaper [Lv. 2100] [Raid Boss]")) then
            return "Spawned"
        else
            return "Not Spawned"
        end
    end
    spawn(function()
        while wait() do
            CakeStatus:SetDesc(tostring(RemainingCake()))
            BoneStatus:SetDesc("Your Bone: "..tostring(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Check")).."\nSoul Reaper: "..SoulReaperS())
            FunctionStatus:SetDesc(StatusLabel)
        end
    end)
    function sortSwordsByRarity(swords)
        table.sort(swords, function(a, b)
            return a.Rarity > b.Rarity
        end) 
        return swords[1]
    end
    function getNextSword()
        local Swords = {}
        for _, itemData in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do 
            if itemData.Type == 'Sword' and itemData.Mastery < 600 then 
                table.insert(Swords, itemData)
            end 
        end
        if #Swords > 0 then 
            local NNN = sortSwordsByRarity(Swords) 
            return NNN,NNN.MasteryRequirements.X
        end
        return nil,0
    end  
    function GetDistance(Pos1, Pos2)
        if not Pos2 then
            Pos2 = game.Players.LocalPlayer.Character.HumanoidRootPart
        end
        if not Pos1 then return end
        return (Pos1.Position - Pos2.Position).Magnitude
    end
    function ChangeSword()
        local args = {[1] = "LoadItem",[2] = getNextSword()["Name"]}
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))     
    end
    function CheckItemBPCR(name)
        chbp = {game.Players.LocalPlayer.Character,game.Players.LocalPlayer.Backpack}
        for i, v in pairs(chbp) do
            if v:FindFirstChild(name) then
                return v:FindFirstChild(name)
            end
        end
    end
    -- Trial Function
    function GetPlayersTrial()
        local MidPos = CFrame.new(28718.068359375, 14887.5625, -60.5482177734375)
        for _,CharactersFolder in pairs(game.Workspace.Characters:GetChildren()) do
            if DetectingPart(CharactersFolder) and CharactersFolder.Name ~= game.Players.LocalPlayer.Name and GetDistance(v.HumanoidRootPart, CFrame.new(28718.068359375, 14887.5625, -60.5482177734375)) <= 250 then
                return CharactersFolder
            end
        end
    end
    -- Mastery Function
    function EquipName(nameTarget)
        if not nameTarget then return end
        ToolSelector = nameTarget
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSelector) then
            wait(.4)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSelector))
        end
    end
    function IsSkillFruit()
        local FruitData = game.Players.LocalPlayer.Data.DevilFruit.Value
        if CheckItemBPCR(FruitData) then
            if game.Players.LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(FruitData) then
                for _,v in pairs(game.Players.LocalPlayer.PlayerGui.Main.Skills[FruitData]:GetChildren()) do
                    if v:IsA("Frame") and table.find(Func_Farms["Skills Press"], v.Name) then
                        if v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                            return FruitData, v.Name
                        end
                    end
                end
            else
                EquipName(FruitData)
            end
        end
    end
    -- Create Window
    local Window = LibLoader:CreateWindow({Title = "Experience Script", SubTitle = "by Memories and Flontium", TabWidth = 160, Size = UDim2.fromOffset(500,330), Acrylic = false, Theme = "Darker", MinimizeKey = Enum.KeyCode.LeftShift})
    -- Create Tabs
    local A = Window:AddTab({ Title = "Farm Tab", Icon = "rbxassetid://4483345998"})
    local B = Window:AddTab({ Title = "Setting Tab", Icon = "settings"})
    local C = Window:AddTab({ Title = "Status Tab", Icon = "bar-chart-horizontal"})
    local D = Window:AddTab({ Title = "Other", Icon = "bookmark-plus"})
    local E = Window:AddTab({ Title = "Sub Tab", Icon = "layout-panel-top"})
    local F = Window:AddTab({ Title = "Necessary Tab", Icon = "app-window"})
    local G = Window:AddTab({ Title = "Race Tab", Icon = "power"})
    -- Create Features
    -- Farm Tab
    local LevelFarming = A:AddToggle("Auto Level", {Title = "Auto Level", Default = false})
    if game.PlaceId == 7449423635 then
        local BoneFarming = A:AddToggle("Auto Bone", {Title = "Auto Bone", Default = false})
        local KatakuriFarming = A:AddToggle("Auto Katakuri", {Title = "Auto Katakuri", Default = false})
        BoneFarming:OnChanged(function(v)
            Func_Farms["Auto Bone"] = v
            StopTween(v)
            StatusLabel = "Doing Auto Katakuri"
        end)
        KatakuriFarming:OnChanged(function(v)
            Func_Farms["Auto Katakuri"] = v
            StopTween(v)
            StatusLabel = "Doing Auto Bone"
        end)
    end
    local MasteryAuto = A:AddToggle("Auto Mastery (Fruit)", {Title = "Auto Mastery (Fruit)", Default = false})
    local MasterySkills = A:AddDropdown("Select Skills Press", {Title = "Select Skills Press", Values = {"Z", "X", "C", "V"}, Multi = true, Default = {},})
    LevelFarming:OnChanged(function(v)
        Func_Farms["Auto Level"] = v
        StopTween(v)
        StatusLabel = "Doing Auto Level"
    end)
    MasteryAuto:OnChanged(function(v)
        Func_Farms["Auto Mastery"] = v
    end)
    getgenv().TableInput1 = {}
    MasterySkills:OnChanged(function(vPress)
        for Skill,Notfv in pairs(vPress) do
            getgenv().TableInput1[Skill] = not getgenv().TableInput1[Skill]
        end
        for FormS,kv in pairs(getgenv().TableInput1) do
            if kv then
                table.insert(Func_Farms["Skills Press"], FormS)
            end
        end
    end)
    task.spawn(function()
        while task.wait() do
            if CheckStatusFeature(Func_Farms["Auto Level"]) == "TRUE" then
                if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then
                    if not MobLevel1OrMobLevel2() then
                        for i, v in pairs(GetMobSpawnList(GetMob())) do
                            pcall(function()
                                if not MobLevel1OrMobLevel2() and Func_Farms["Auto Level"] then
                                    ToTween(GetRandomTween(v.CFrame))
                                end
                            end)
                        end
                    else
                        pcall(function()
                            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if v.Name == MobLevel1OrMobLevel2() and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible then
                                    repeat task.wait()
                                        KillMonster(v.Name, true, CheckStatusFeature(Func_Farms["Auto Level"]) == "FALSE")
                                    until not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or CheckStatusFeature(Func_Farms["Auto Level"]) == "FALSE"
                                end
                            end
                        end)
                    end
                else
                    GetQuest()
                end
            end
        end
    end)
    task.spawn(function()
        while task.wait() do
            if CheckStatusFeature(Func_Farms["Auto Bone"]) == "TRUE" then
                local table_BoneMobs = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}
                if CheckEnemies(table_BoneMobs) then
                    local v = CheckEnemies(table_BoneMobs)
                    if v and DetectingPart(v) and v.Humanoid.Health > 0 then
                        pcall(function()
                            if Func_Settings["Triple Quest Cake Or Bone"] or Func_Settings["Claim Quest Cake And Haunted"] then
                                if CheckI() == "CAN'T CHECKED" then
                                    CheckTripleQuestAndGetQuest()
                                elseif CheckI() == "CHECKED" then
                                    repeat task.wait()
                                        KillMonster(v.Name, true, CheckStatusFeature(Func_Farms["Auto Bone"]) == "FALSE")
                                    until not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or CheckStatusFeature(Func_Farms["Auto Bone"]) == "FALSE"
                                end
                            else
                                repeat task.wait()
                                    KillMonster(v.Name, true, CheckStatusFeature(Func_Farms["Auto Bone"]) == "FALSE")
                                until not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or CheckStatusFeature(Func_Farms["Auto Bone"]) == "FALSE"
                            end
                        end)
                    end
                else
                    if (CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
                        ResetTPNearest(CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375))
                    else
                        ToTween(CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375))
                    end
                end
            end
        end
    end)
    task.spawn(function()
        while task.wait() do
            if CheckStatusFeature(Func_Farms["Auto Katakuri"]) == "TRUE" then
                local table_CakeMobs = {"Cookie Crafter","Cake Guard","Baking Staff","Head Baker"}
                local table_CakePrinceBosses = {"Dough King","Cake Prince"}
                if CheckBossCake() then
                    if (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1700 then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Map.CakeLoaf.BigMirror.Main.TouchInterest, 0)
                    else
                        local v = CheckBossCake()
                        pcall(function()
                            repeat task.wait()
                                KillMonster(v.Name, false, CheckStatusFeature(Func_Farms["Auto Katakuri"]) == "FALSE")
                            until not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or CheckStatusFeature(Func_Farms["Auto Katakuri"]) == "FALSE"
                        end)
                    end
                elseif CheckEnemies(table_CakeMobs) then
                    local v = CheckEnemies(table_CakeMobs)
                    pcall(function()
                        if Func_Settings["Triple Quest Cake Or Bone"] or Func_Settings["Claim Quest Cake And Haunted"] then
                            if CheckI() == "CAN'T CHECKED" then
                                CheckTripleQuestAndGetQuest()
                            elseif CheckI() == "CHECKED" then
                                repeat task.wait()
                                    KillMonster(v.Name, true, CheckStatusFeature(Func_Farms["Auto Katakuri"]) == "FALSE")
                                until not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or CheckStatusFeature(Func_Farms["Auto Katakuri"]) == "FALSE"
                            end
                        else
                            repeat task.wait()
                                KillMonster(v.Name, true, CheckStatusFeature(Func_Farms["Auto Katakuri"]) == "FALSE")
                            until not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or CheckStatusFeature(Func_Farms["Auto Katakuri"]) == "FALSE"
                        end
                    end)
                else
                    if (CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
                        ResetTPNearest(CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375))
                    else
                        ToTween(CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375))
                    end
                end
            end
        end
    end)
    -- Settings Tab
    -- local BringRadius = B:AddSlider("Bring Radius", {Title = "Bring Radius", Description = "", Default = 250, Min = 1, Max = 500, Rounding = 1,
    --     Callback = function(v)
    --         VBringRadius = v
    --     end
    -- })
    B:AddButton({Title = "Hop Server", Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Hop Server",
                Content = "Are You Sure?",
                Buttons = {
                    {Title = "Yes",Callback = function()
                        SendKeyEvents("LeftShift")
                        HopUI(Func_Settings["Hop Delay"])
                    end},
                    {Title = "No", Callback = function()
                    end}
                }
            })
        end
    })
    B:AddButton({Title = "Disable All BodyVelo", Description = "",
        Callback = function()
            DisableAll()
        end
    })
    local StopHeath = B:AddSlider("Stop Health", {Title = "Stop Health", Description = "", Default = 25, Min = 10, Max = 80, Rounding = 1,
         Callback = function(v)
             Func_Settings["Stop Health"] = v
         end
     })
    local OpenDoor = B:AddToggle("Open Cake Dimension", {Title = "Open Cake Dimension", Description = "Apply Auto Katakuri", Default = false})
    OpenDoor:OnChanged(function(v)
        Func_Settings["Open Dimension"] = v
    end)
    task.spawn(function()
        while wait() do
            if CheckStatusFeature(Func_Settings["Open Dimension"]) == "TRUE" then
                if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true):find("open the portal now") then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                end
            end
        end
    end)     
    local FastAttackSpeed = B:AddDropdown("Fast Attack Speed", {Title = "Fast Attack Speed", Values = {"Slow", "Normal", "No Countdown"}, Multi = false, Default = "Normal",})
    FastAttackSpeed:OnChanged(function(v)
        Func_Settings["Fast Attack"]["Speed"] = v
    end)
    local DoubleQuest = B:AddToggle("Double Quest", {Title = "Double Quest", Default = false})
    DoubleQuest:OnChanged(function(v)
        Func_Settings["Double Quest"] = v
    end)
    local ClaimQuest = B:AddToggle("Claim Quest", {Title = "Option: Claim Quest", Description = "Apply to Auto Bone And Auto Katakuri", Default = false})
    ClaimQuest:OnChanged(function(v)
        Func_Settings["Claim Quest Cake And Haunted"] = v
    end)
    local TripleQuest = B:AddToggle("Triple Quest", {Title = "Option: Triple Quest", Description = "Apply to Auto Bone And Auto Katakuri\nRequirement: Turn On Claim Quest", Default = false})
    TripleQuest:OnChanged(function(v)
        Func_Settings["Triple Quest Cake Or Bone"] = v
    end)
    local TweenSpeed = B:AddSlider("Tween Speed", {Title = "Tween Speed", Description = "", Default = 300, Min = 1, Max = 400, Rounding = 1,
        Callback = function(v)
            Func_Settings["Tween Speed"] = v
        end
    })
    local HopDelay = B:AddSlider("Hop Delay", {Title = "Hop Delay", Description = "", Default = 4, Min = 1, Max = 20, Rounding = 1,
        Callback = function(v)
            Func_Settings["Hop Delay"] = v
        end
    })
    local Usesword = B:AddToggle("Select Sword", {Title = "Select Sword", Description = "Switching Use Sword", Default = false})
    Usesword:OnChanged(function(v)
            if v == true then
                getgenv()["SelectTool"] = "Sword"
            else
                getgenv()["SelectTool"] = "Melee"
            end
        end
    )
    -- Status Tab
    CakeStatus = C:AddParagraph({Title = "Cake Island", Content = "nil"})
    BoneStatus = C:AddParagraph({Title = "Haunted Castle", Content = "nil"})
    FunctionStatus = C:AddParagraph({Title = "Function Status", Content = "nil"})
    -- Other Tab
    local RandomSup = D:AddToggle("Random Suprise", {Title = "Random Suprise", Description = "", Default = false})
    RandomSup:OnChanged(function(v)
        Func_Other["Random Suprise"] = v
    end)
    local AwkV4 = D:AddToggle("Awakening V4", {Title = "Awakening V4", Description = "", Default = false})
    AwkV4:OnChanged(function(v)
        Func_Other["Awakening V4"] = v
    end)
    task.spawn(function()
        while task.wait() do
            if CheckStatusFeature(Func_Other["Random Suprise"]) == "TRUE" then
               if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Check") > 0 then
                    for i = 1,11 do
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                    end
                end
            end
            if CheckStatusFeature(Func_Other["Awakening V4"]) == "TRUE" then
                if game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 and not game.Players.LocalPlayer.Character.RaceTransformed.Value then
                    SendKeyEvents("Y")
                end
            end
        end
    end)
    -- Sub Tab
    local FullMas = E:AddToggle("Auto Max Mastery", {Title = "Auto Max Mastery", Description = "Apply To Sword", Default = false})
    FullMas:OnChanged(function(v)
        Func_Sub["Auto Full Mastery All Sword"] = v
        if not v then
            Usesword:SetValue(false)
        end
    end)
    local SoulReaper = E:AddToggle("Auto Soul Reaper", {Title = "Auto Soul Reaper", Description = "Haunted Castle (Sea 3)", Default = false})
    SoulReaper:OnChanged(function(v)
        Func_Sub["Auto Soul Reaper"] = v
        StatusLabel = "Doing Auto Soul Reaper"
    end)
    local CDK = E:AddToggle("Auto Cursed Dual Katana", {Title = "Auto Cursed Dual Katana", Description = "Mythical Sword Fully (Sea 3)", Default = false})
    CDK:OnChanged(function(v)
        Func_Sub["Auto Cursed Dual Katana"] = v
    end)
    task.spawn(function()
        while task.wait() do
            if CheckStatusFeature(Func_Sub["Auto Cursed Dual Katana"]) == "TRUE" then
                CursedDualKatana()
            end
        end
    end)
    task.spawn(function()
        while task.wait() do
            if CheckStatusFeature(Func_Sub["Auto Full Mastery All Sword"]) == "TRUE" then
                if GetMasteryTool("Sword") >= 600 then
                    ChangeSword()
                else
                    Usesword:SetValue(true)
                end
            end
        end
    end)
    task.spawn(function()
        while task.wait() do
            if CheckStatusFeature(Func_Sub["Auto Soul Reaper"]) == "TRUE" then
                if CheckEnemies("Soul Reaper") then
                    local v = CheckEnemies("Soul Reaper")
                    repeat task.wait()
                        KillMonster(v.Name, false, CheckStatusFeature(Func_Sub["Auto Soul Reaper"]) == "FALSE")
                    until not v or v.Humanoid.Health <= 0 or CheckStatusFeature(Func_Sub["Auto Soul Reaper"]) == "FALSE"
                else
                    if CheckItemBPCR("Hallow Essence") then
                        ToTween(CFrame.new(-8930.6083984375, 144.92068481445312, 6066.2236328125))
                        if GetDistance(CFrame.new(-8930.6083984375, 144.92068481445312, 6066.2236328125)) <= 20 then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game.Workspace.Map["Haunted Castle"].Detection.TouchInterest, 0)
                        end
                    end
                end
            end
        end
    end) 
    -- Necessary Tab
    local RaidSelect = F:AddDropdown("Select Raid", {Title = "Select Raid", Values = GetNameRaid(), Multi = false, Default = "Flame",})
    RaidSelect:OnChanged(function(v)
        getgenv().RaidSelect = v
    end)
    local RaidFully = F:AddToggle("Auto Fully Raid", {Title = "Auto Fully Raid", Description = "", Default = false})
    RaidFully:OnChanged(function(v)
        Func_Neccessary["Auto Fully Raid"] = v
        StatusLabel = "Doing Raid"
    end)
    task.spawn(function()
        while task.wait() do
            if CheckStatusFeature(Func_Neccessary["Auto Fully Raid"]) == "TRUE" then
                if CheckItemBPCR("Special Microchip") then
                    ClickRaid()
                elseif NextIS() and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                    ToTween(NextIS().CFrame * CFrame.new(0,60,0))
                    KillAura()
                else
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", getgenv().RaidSelect)
                end
            end
        end
    end)
    -- Race Tab
    G:AddButton({Title = "Pull Lever [Temple Of Time]", Description = "",
        Callback = function()
            PullLever()
        end
    })
    G:AddButton({Title = "Tween To Current Race Door", Description = "",
        Callback = function()
            local CurrentDoor = game.Workspace.Map["Temple of Time"][game.Players.LocalPlayer.Data.Race.Value.."Corridor"].Door.Door.RightDoor.Union
            if GetDistance(CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586)) < 2000 then 
                RequestEntraceTemple()
                wait(1)
                repeat task.wait()
                    ToTween(CurrentDoor.CFrame)
                until (CurrentDoor.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 8
            else
                repeat task.wait()
                    ToTween(CurrentDoor.CFrame)
                until (CurrentDoor.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 8
            end
        end
    })
    -- Hide FX
    local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)
    CamShake:Stop()
    workspace._WorldOrigin.ChildAdded:Connect(function(v)
        if v.Name =='DamageCounter' then 
            v.Enabled  = false 
        end
    end)
    -- Fast AttacK Function
    local fastattack = 0
    task.spawn(function()
        while wait() do
            if CheckStatusFeature(Func_Settings["Fast Attack"]["Value"]) == "TRUE" then
                local table_listcountdown = {["Slow"] = 0.3,["Normal"] = 0.175,["No Countdown"] = 0.05}
                fastattack = table_listcountdown[Func_Settings["Fast Attack"]["Speed"]] or 0.175
            end
        end
    end)
    local RunService = game:GetService("RunService")
    local CombatFramework = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
    local CombatFrameworkR = debug.getupvalues(CombatFramework)[2]
    BladeHits = function(Value)
        local Hits = {}
        for _, Hit in ipairs(game.Workspace.Enemies:GetChildren()) do
            local Humanoid = Hit and Hit:FindFirstChildOfClass("Humanoid")
            if Humanoid and Humanoid.Health > 0 then
                local RootPart = Humanoid.RootPart
                if RootPart and game.Players.LocalPlayer:DistanceFromCharacter(RootPart.Position) < Value then
                    table.insert(Hits, RootPart)
                end
            end
        end
        return Hits
    end
    PlayerHits = function(Value)
        local Hits = {}
        for _, Char in ipairs(game.Workspace.Characters:GetChildren()) do
            if Char.Name ~= game.Players.LocalPlayer.Name then
                local Humanoid = Char and Char:FindFirstChildOfClass("Humanoid")
                if Humanoid and Humanoid.RootPart and Humanoid.Health > 0 then
                    if game.Players.LocalPlayer:DistanceFromCharacter(Humanoid.RootPart.Position) < Value then
                        table.insert(Hits, Humanoid.RootPart)
                    end
                end
            end
        end
        return Hits
    end
    AddAttack = function(Hit)
        local ac = CombatFrameworkR.activeController
        if ac and ac.equipped then
            if #Hit > 0 then
                local agrs1 = getupvalue(ac.attack, 5)
                local agrs2 = getupvalue(ac.attack, 6)
                local agrs3 = getupvalue(ac.attack, 4)
                local agrs4 = getupvalue(ac.attack, 7)
                local agrs5 = (agrs1 * 798405 + agrs3 * 727595) % agrs2
                local agrs6 = agrs3 * 798405
                agrs5 = (agrs5 * agrs2 + agrs6) % 1099511627776
                agrs1 = math.floor(agrs5 / agrs2)
                agrs3 = agrs5 - agrs1 * agrs2
                agrs4 = agrs4 + 1
                setupvalue(ac.attack, 5, agrs1)
                setupvalue(ac.attack, 6, agrs2)
                setupvalue(ac.attack, 4, agrs3)
                setupvalue(ac.attack, 7, agrs4)
                local Blade = ac.currentWeaponModel
                if Blade then
                    game.ReplicatedStorage.RigControllerEvent:FireServer("weaponChange", Blade.Name)
                    ac.animator.anims.basic[1]:Play(0.01, 0.01, 0.01)
                    game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(agrs5 / 1099511627776 * 16777215), agrs4)
                    game.ReplicatedStorage.RigControllerEvent:FireServer("hit", Hit, 1, "")
                end
            end
        end
    end
    AttackFunc = function()
        AddAttack(BladeHits(65))
        AddAttack(PlayerHits(65))
    end
    task.spawn(function()
        while task.wait() do
            if getgenv().CurrentlyFast then
                pcall(function()
                    local controller = CurveFrame.activeController
                    controller.timeToNextAttack = -1
                    controller.focusStart = 0
                    controller.hitboxMagnitude = 40
                    controller.humanoid.AutoRotate = true
                    controller.increment = 2          
                    game:GetService("VirtualUser"):Button1Down(Vector2.new())
                    game:GetService("VirtualUser"):Button1Up(Vector2.new())      
                end)
            end
        end
    end)
    local Tick = tick()
    local Delay = fastattack
    DetectFastAttack = function()
        task.spawn(function()
            while task.wait() do 
                if not Func_Farms["Auto Mastery"] then
                    if (tick() - Tick) >= math.clamp(Delay, 0.100, 1) then
                        task.spawn(AttackFunc)
                        getgenv().CurrentlyFast = true
                        Tick = tick()
                    end
                end
            end 
        end)
    end
    DetectFastAttack()
    -- Other
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Memories0912/UI/main/UI.lua"))()
    noti("Experience Script", "Status", "Script Has Been Loaded!", 5)
end
UIOpen()
