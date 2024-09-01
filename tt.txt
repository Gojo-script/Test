getgenv().Config = {
    ["Team"] = "Pirates",
    ["Safe Health"] = {40, 50},
    ["Skip"] = { 
        ["Fruit"] = {["Enabled"] = true,
            ["Avoid Fruit"] = {
                "Portal-Portal", 
                "Kitsune-Kitsune"
            }
        },
        ["Avoid V4"] = true
    },
    ["Hunt Method"] = {
        ["Use Move Predict"] = true,
        ["Hit and Run"] = true
    },
    ["Spam All Skill On V4"] = {
        ["Enabled"] = true,
        ["Weapons"] = {"Melee", "Gun", "Sword"}
    },
    ["Chat"] = {
        ["Enabled"] = false,
        ["Message"] = {"Tsuo is Playing Free Fire", ".gg/tsuoscripts"}
    },
    ["Custom Y Run"] = {
        ["Enabled"] = false,
        ["Y Run"] = 100
    },
    ["Misc"] = {
        ["Auto Store Fruit"] = true,
        ["Auto Random Fruit"] = true,
        ["White Screen"] = false,
        ["Click Delay"] = 0.1,
        ["Fps Boost"] = false
    },
    ["Items"] = {["Use"] = {"Melee", "Gun", "Sword"},
        ["Melee"] = {
            ["Enable"] = true,
            ["Delay"] = 1,
            ["Skills"] = {
                ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["X"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["C"] = {["Enable"] = true, ["HoldTime"] = 0.5},
                ["V"] = {["Enable"] = false, ["HoldTime"] = 0}
            }
        },
        ["Blox Fruit"] = {
            ["Enable"] = false,
            ["Delay"] = 6,
            ["Skills"] = {
                ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["X"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["C"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["V"] = {["Enable"] = false, ["HoldTime"] = 0.25},
                ["F"] = {["Enable"] = false, ["HoldTime"] = 0}
            }
        },
        ["Sword"] = {
            ["Enable"] = true,
            ["Delay"] = 0.5,
            ["Skills"] = {
                ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["X"] = {["Enable"] = true, ["HoldTime"] = 0.5}
            } 
        },
        ["Gun"] = {
            ["Enable"] = true,          
            ["Delay"] = 1,
            ["Skills"] = {
                ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["X"] = {["Enable"] = true, ["HoldTime"] = 0}
            } 
        }
    }
}

repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
--- Join Team
if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
    repeat task.wait()
        if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
            if getgenv().Config.Team == "Marines" then
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container["Marines"].Frame.TextButton.Activated)) do
                    for a, b in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
                       b:Fire() 
                    end
                    v.Function()
                end 
            else
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container["Pirates"].Frame.TextButton.Activated)) do
                    for a, b in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
                       b:Fire() 
                    end
                    v.Function()
                end 
            end
        end
    until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()
end
--//UI
local G2L = {};

G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- StarterGui.ScreenGui.Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(72, 15, 86);
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2"]["Size"] = UDim2.new(0.85, 0, 0.85, 0);
G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["BackgroundTransparency"] = 0.2;

-- StarterGui.ScreenGui.Frame.UICorner
G2L["3"] = Instance.new("UICorner", G2L["2"]);
G2L["3"]["CornerRadius"] = UDim.new(0, 9);

-- StarterGui.ScreenGui.Frame.ImageLabel
G2L["4"] = Instance.new("ImageLabel", G2L["2"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["Image"] = [[http://www.roblox.com/asset/?id=18748074579]];
G2L["4"]["Size"] = UDim2.new(0, 66, 0, 66);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["BackgroundTransparency"] = 1;

-- StarterGui.ScreenGui.Frame.ImageLabel.UICorner
G2L["5"] = Instance.new("UICorner", G2L["4"]);


-- StarterGui.ScreenGui.Frame.UIStroke
G2L["6"] = Instance.new("UIStroke", G2L["2"]);
G2L["6"]["Thickness"] = 3;
G2L["6"]["Color"] = Color3.fromRGB(255, 255, 255);

-- StarterGui.ScreenGui.Frame.UIStroke.UIGradient
G2L["7"] = Instance.new("UIGradient", G2L["6"]);
G2L["7"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(0.521, Color3.fromRGB(233, 45, 224)),ColorSequenceKeypoint.new(0.600, Color3.fromRGB(178, 35, 173)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};

-- StarterGui.ScreenGui.Frame.ImageLabel
G2L["8"] = Instance.new("ImageLabel", G2L["2"]);
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["8"]["Image"] = [[http://www.roblox.com/asset/?id=18747987014]];
G2L["8"]["Size"] = UDim2.new(0, 183, 0, 183);
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["BackgroundTransparency"] = 1;
G2L["8"]["Position"] = UDim2.new(0.86037, 0, 0.43562, 0);

-- StarterGui.ScreenGui.Frame.ImageLabel.UICorner
G2L["9"] = Instance.new("UICorner", G2L["8"]);


-- StarterGui.ScreenGui.Frame.TextLabel
G2L["a"] = Instance.new("TextLabel", G2L["2"]);
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["TextSize"] = 40;
G2L["a"]["FontFace"] = Font.new([[rbxassetid://12187375422]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["BackgroundTransparency"] = 0.99;
G2L["a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["a"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Text"] = [[TSUOHUB AUTOBOUNTY ]];
G2L["a"]["Position"] = UDim2.new(0.31096, 0, 0.10074, 0);

-- StarterGui.ScreenGui.Frame.TextLabel.UIGradient
G2L["b"] = Instance.new("UIGradient", G2L["a"]);
G2L["b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(171, 17, 168)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 39, 234))};

-- StarterGui.ScreenGui.Frame.TextLabel.UIStroke
G2L["c"] = Instance.new("UIStroke", G2L["a"]);
G2L["c"]["Thickness"] = 1.5;

-- StarterGui.ScreenGui.Frame.earn
G2L["d"] = Instance.new("TextLabel", G2L["2"]);
G2L["d"]["BorderSizePixel"] = 0;
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["TextSize"] = 22;
G2L["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["BackgroundTransparency"] = 0.99;
G2L["d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["d"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["Text"] = [[Bounty Earned:]];
G2L["d"]["Name"] = [[earn]];
G2L["d"]["Position"] = UDim2.new(0.19, 0, 0.30503, 0);

-- StarterGui.ScreenGui.Frame.earn.UIGradient
G2L["e"] = Instance.new("UIGradient", G2L["d"]);
G2L["e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(171, 17, 168)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 39, 234))};

-- StarterGui.ScreenGui.Frame.earn.UIStroke
G2L["f"] = Instance.new("UIStroke", G2L["d"]);
G2L["f"]["Thickness"] = 1.5;

-- StarterGui.ScreenGui.Frame.current
G2L["10"] = Instance.new("TextLabel", G2L["2"]);
G2L["10"]["BorderSizePixel"] = 0;
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["10"]["TextSize"] = 22;
G2L["10"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["10"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["10"]["BackgroundTransparency"] = 0.99;
G2L["10"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["10"]["Size"] = UDim2.new(0, 194, 0, 50);
G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["10"]["Text"] = [[Current Bounty:]];
G2L["10"]["Name"] = [[current]];
G2L["10"]["Position"] = UDim2.new(0.2, 0, 0.4, 0);

-- StarterGui.ScreenGui.Frame.current.UIGradient
G2L["11"] = Instance.new("UIGradient", G2L["10"]);
G2L["11"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(171, 17, 168)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 39, 234))};

-- StarterGui.ScreenGui.Frame.current.UIStroke
G2L["12"] = Instance.new("UIStroke", G2L["10"]);
G2L["12"]["Thickness"] = 1.5;

-- StarterGui.ScreenGui.Frame.time
G2L["13"] = Instance.new("TextLabel", G2L["2"]);
G2L["13"]["BorderSizePixel"] = 0;
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["13"]["TextSize"] = 22;
G2L["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["13"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["13"]["BackgroundTransparency"] = 0.99;
G2L["13"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["13"]["Size"] = UDim2.new(0, 194, 0, 50);
G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["Text"] = [[Time Elapsed:]];
G2L["13"]["Name"] = [[time]];
G2L["13"]["Position"] = UDim2.new(0.15299, 0, 0.5, 0);

-- StarterGui.ScreenGui.Frame.time.UIGradient
G2L["14"] = Instance.new("UIGradient", G2L["13"]);
G2L["14"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(171, 17, 168)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 39, 234))};

-- StarterGui.ScreenGui.Frame.time.UIStroke
G2L["15"] = Instance.new("UIStroke", G2L["13"]);
G2L["15"]["Thickness"] = 1.5;

-- StarterGui.ScreenGui.Frame.TextButton
G2L["16"] = Instance.new("TextButton", G2L["2"]);
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["TextSize"] = 22;
G2L["16"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["16"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["16"]["Size"] = UDim2.new(0, 140, 0, 38);
G2L["16"]["BackgroundTransparency"] = 1;
G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["Text"] = [[Skip Player]];
G2L["16"]["Position"] = UDim2.new(0.13799, 0, 0.87203, 0);

-- StarterGui.ScreenGui.Frame.TextButton.UIStroke
G2L["17"] = Instance.new("UIStroke", G2L["16"]);


-- StarterGui.ScreenGui.Frame.TextButton.UIGradient
G2L["18"] = Instance.new("UIGradient", G2L["16"]);
G2L["18"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(171, 17, 168)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 39, 234))};

-- StarterGui.ScreenGui.Frame.TextButton.UIStroke
G2L["19"] = Instance.new("UIStroke", G2L["16"]);
G2L["19"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["19"]["Thickness"] = 2;

-- StarterGui.ScreenGui.Frame.TextButton.UICorner
G2L["1a"] = Instance.new("UICorner", G2L["16"]);

G2L["1b"] = Instance.new("TextButton", G2L["2"]);
G2L["1b"]["BorderSizePixel"] = 0;
G2L["1b"]["TextSize"] = 22;
G2L["1b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1b"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["1b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1b"]["Size"] = UDim2.new(0, 140, 0, 38);
G2L["1b"]["BackgroundTransparency"] = 1;
G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1b"]["Text"] = [[Hop Server]];
G2L["1b"]["Position"] = UDim2.new(0.35859, 0, 0.87203, 0);

-- StarterGui.ScreenGui.Frame.TextButton.UIStroke
G2L["1c"] = Instance.new("UIStroke", G2L["1b"]);


-- StarterGui.ScreenGui.Frame.TextButton.UIGradient
G2L["1d"] = Instance.new("UIGradient", G2L["1b"]);
G2L["1d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(171, 17, 168)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 39, 234))};

-- StarterGui.ScreenGui.Frame.TextButton.UIStroke
G2L["1e"] = Instance.new("UIStroke", G2L["1b"]);
G2L["1e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["1e"]["Thickness"] = 2;

-- StarterGui.ScreenGui.Frame.TextButton.UICorner
G2L["1f"] = Instance.new("UICorner", G2L["1b"]);


-- StarterGui.ScreenGui.Frame.TextButton
G2L["20"] = Instance.new("TextButton", G2L["2"]);
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["TextSize"] = 22;
G2L["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["20"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["20"]["Size"] = UDim2.new(0, 140, 0, 38);
G2L["20"]["BackgroundTransparency"] = 1;
G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["Text"] = [[Stop Farming]];
G2L["20"]["Position"] = UDim2.new(0.5795, 0, 0.87203, 0);

-- StarterGui.ScreenGui.Frame.TextButton.UIStroke
G2L["21"] = Instance.new("UIStroke", G2L["20"]);


-- StarterGui.ScreenGui.Frame.TextButton.UIGradient
G2L["22"] = Instance.new("UIGradient", G2L["20"]);
G2L["22"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(171, 17, 168)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 39, 234))};

-- StarterGui.ScreenGui.Frame.TextButton.UIStroke
G2L["23"] = Instance.new("UIStroke", G2L["20"]);
G2L["23"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["23"]["Thickness"] = 2;

-- StarterGui.ScreenGui.Frame.TextButton.UICorner
G2L["24"] = Instance.new("UICorner", G2L["20"]);


-- StarterGui.ScreenGui.Frame.TextLabel
G2L["25"] = Instance.new("TextLabel", G2L["2"]);
G2L["25"]["BorderSizePixel"] = 0;
G2L["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["25"]["TextSize"] = 22;
G2L["25"]["FontFace"] = Font.new([[rbxassetid://12187375422]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["25"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["25"]["BackgroundTransparency"] = 0.99;
G2L["25"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["25"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["25"]["Text"] = [[discord.gg/tsuoscripts]];
G2L["25"]["Position"] = UDim2.new(0.75045, 0, 0.10228, 0);

-- StarterGui.ScreenGui.Frame.TextLabel.UIGradient
G2L["26"] = Instance.new("UIGradient", G2L["25"]);
G2L["26"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(171, 17, 168)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 39, 234))};

-- StarterGui.ScreenGui.Frame.TextLabel.UIStroke
G2L["27"] = Instance.new("UIStroke", G2L["25"]);
G2L["27"]["Thickness"] = 1.5;

-- StarterGui.ScreenGui.Frame.shadowHolder
G2L["28"] = Instance.new("Frame", G2L["2"]);
G2L["28"]["ZIndex"] = 0;
G2L["28"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["28"]["Name"] = [[shadowHolder]];
G2L["28"]["BackgroundTransparency"] = 1;

-- StarterGui.ScreenGui.Frame.shadowHolder.umbraShadow
G2L["29"] = Instance.new("ImageLabel", G2L["28"]);
G2L["29"]["ZIndex"] = 0;
G2L["29"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
G2L["29"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["29"]["ImageTransparency"] = 0.86;
G2L["29"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["29"]["Image"] = [[rbxassetid://1316045217]];
G2L["29"]["Size"] = UDim2.new(1, 4, 1, 4);
G2L["29"]["BackgroundTransparency"] = 1;
G2L["29"]["Name"] = [[umbraShadow]];
G2L["29"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

-- StarterGui.ScreenGui.Frame.shadowHolder.penumbraShadow
G2L["2a"] = Instance.new("ImageLabel", G2L["28"]);
G2L["2a"]["ZIndex"] = 0;
G2L["2a"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
G2L["2a"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["2a"]["ImageTransparency"] = 0.88;
G2L["2a"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2a"]["Image"] = [[rbxassetid://1316045217]];
G2L["2a"]["Size"] = UDim2.new(1, 4, 1, 4);
G2L["2a"]["BackgroundTransparency"] = 1;
G2L["2a"]["Name"] = [[penumbraShadow]];
G2L["2a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

-- StarterGui.ScreenGui.Frame.shadowHolder.ambientShadow
G2L["2b"] = Instance.new("ImageLabel", G2L["28"]);
G2L["2b"]["ZIndex"] = 0;
G2L["2b"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
G2L["2b"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["2b"]["ImageTransparency"] = 0.88;
G2L["2b"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2b"]["Image"] = [[rbxassetid://1316045217]];
G2L["2b"]["Size"] = UDim2.new(1, 4, 1, 4);
G2L["2b"]["BackgroundTransparency"] = 1;
G2L["2b"]["Name"] = [[ambientShadow]];
G2L["2b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

local foldername = "Tsuo Hub"
local filename = game.Players.LocalPlayer.Name.."_Main.json"

function saveSettings()
    local HttpService = game:GetService("HttpService")
    local json = HttpService:JSONEncode(_G.Settings)
    if (writefile) then
        if not isfolder(foldername) then
            makefolder(foldername)
        end
        writefile(foldername.."/"..filename, json)
    end
end

function loadSettings()
    local HttpService = game:GetService("HttpService")
    if isfile(foldername.."/"..filename) then
        _G.Settings = HttpService:JSONDecode(readfile(foldername.."/"..filename))
    else
        _G.Settings = {killCount = 0, timeElapsed = 0, bountyEarned = 0}
    end
end

loadSettings()

local foldername = "Tsuo Hub"
local filename = game.Players.LocalPlayer.Name.."_Main.json"

function saveSettings()
    local HttpService = game:GetService("HttpService")
    local json = HttpService:JSONEncode(_G.Settings)
    if (writefile) then
        if not isfolder(foldername) then
            makefolder(foldername)
        end
        writefile(foldername.."/"..filename, json)
    end
end

function loadSettings()
    local HttpService = game:GetService("HttpService")
    if isfile(foldername.."/"..filename) then
        _G.Settings = HttpService:JSONDecode(readfile(foldername.."/"..filename))
    else
        _G.Settings = {killCount = 0, timeElapsed = 0, bountyEarned = 0}
    end
end

loadSettings()

local oldBounty = game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value

game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Changed:Connect(function(newBounty)
    _G.Settings.bountyEarned = _G.Settings.bountyEarned + (newBounty - oldBounty)
    oldBounty = newBounty
    saveSettings()
end)

local startTime = os.time()

local function updateElapsedTime()
    local elapsedTime = os.time() - startTime
    local hours = math.floor(elapsedTime / 3600)
    local minutes = math.floor((elapsedTime % 3600) / 60)
    local seconds = elapsedTime % 60

    G2L["13"]["Text"] = string.format("Time: %dh %dm %d(s)", hours, minutes, seconds)
end

spawn(function()
    while true do
        updateElapsedTime()
        wait(1)
    end
end)

spawn(function ()
    while task.wait() do
        G2L["d"]["Text"] = "Bounty Earned: " .. _G.Settings.bountyEarned
        G2L["10"]["Text"] = "Current Bounty: " .. game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value
    end
end)


--//function now
local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer
local rs = game.ReplicatedStorage

function Hop()
    function bQ(v)
        if v.Name == "ErrorPrompt" then
            if v.Visible then
                if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                    v.Visible = false
                end
            end
            v:GetPropertyChangedSignal("Visible"):Connect(function()
                if v.Visible then
                    if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                        v.Visible = false
                    end
                end
            end)
        end
    end
    for i, v in game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren() do
        bQ(v) 
    end
    game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(bQ)
    while wt() do
        randomy = math.random(1000, 5000)
        if Config["Custom Y Run"].Enabled then
            randomy = Config["Custom Y Run"]["Y Run"]
        end
        to(CFrame.new(-12463.8740234375 , randomy, -7523.77392578125)) 
        if not checkcombat() then
            for r = 1, math.huge do
                to(CFrame.new(-12463.8740234375 , 1000, -7523.77392578125)) 
                game.Players.LocalPlayer.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text = "Singapore"
                for k, v in inv(rs.__ServerBrowser, {r}) do
                    if k ~= game.JobId and v["Count"] <= 10 then
                        inv(rs.__ServerBrowser, {"teleport", k})
                    end
                end
                wt()
            end
        end
    end
end

getgenv().Bounty = {
    Targ = nil,
    Checked = {},
    Hop = false,
    CanUseWeapon = false,
    CanUseSkill = false,
    UsingSkill = false,
    WeaponUsing = "",
    ToolTipUsing = "Melee",
    CFrameTarget = CFrame.new(Vector3.new(0,0,0)),
    Digit = CFrame.new(Vector3.new(0,0,0)),
}

--- Tween / Bypass
local w = game.PlaceId
if w == 2753915549 then
    distbyp = 1500
elseif w == 4442272183 then
    distbyp = 3500
elseif w == 7449423635 then
    distbyp = 6000
end
function getPortal(check2)
    local check3 = check2.Position
    local w = game.PlaceId
    if w == 2753915549 then
        gQ = {
            Vector3.new(-7894.6201171875, 5545.49169921875, -380.246346191406),
            Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
            Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
            Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
        }
    elseif w == 4442272183 then
        gQ = {
            Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
            Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        }
    elseif w == 7449423635 then
        gQ = {
            Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
            Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
            Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
            Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
            Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
            Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
        }
    end
    local aM, aN = Vector3.new(0,0,0), math.huge

    for _, aL in pairs(gQ) do
        if (aL-check3).Magnitude < aN and aM ~= aL then
            aM, aN = aL,  (aL-check3).Magnitude
        end 
    end
    return aM
end 
function bypass(is)
    if tween then
        tween:Cancel()
    end
    repeat task.wait()
        lp.Character.HumanoidRootPart.CFrame = is  
    until lp.Character.PrimaryPart.CFrame == is  
    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
    lp.Character:SetPrimaryPartCFrame(is)
    task.wait(0.1)
    lp.Character.HumanoidRootPart.CFrame = is  
    lp.Character:SetPrimaryPartCFrame(is)
    lp.Character.Head:Destroy()
    task.wait(0.5)
    repeat task.wait()
        lp.Character.HumanoidRootPart.CFrame = is 
        lp.Character.PrimaryPart.CFrame = is  
    until lp.Character:FindFirstChild("Head")
    task.wait(0.5)
end 
function getSpawn(wtf)
    local a, b = nil, math.huge
    for i,v in pairs(game.Workspace._WorldOrigin.PlayerSpawns:FindFirstChild(tostring(lp.Team)):GetChildren()) do
        if tostring(v) ~= "Leviathan" and (v:GetModelCFrame().Position-wtf.Position).Magnitude < b then
            a = v:GetModelCFrame()
            b = (v:GetModelCFrame().Position-wtf.Position).Magnitude
        end
    end
    return a
end
function request(check1)
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack({"requestEntrance", check1}))
end
function calcpos(I, II) 
    if not II then 
        II = game.Players.LocalPlayer.Character.PrimaryPart.CFrame 
    end 
    return (Vector3.new(I.X, 0, I.Z)-Vector3.new(II.X, 0, II.Z)).Magnitude 
end 
function checkcombat()
    return game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible and game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Text and (string.find(string.lower(game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Text),"risk"))
end 
function to(Pos)
    if not Pos then return end 
    for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false    
        end
    end
    if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Tsuo") then
        local ngu = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
        ngu.Name = "Tsuo"
        ngu.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
        ngu.Velocity = Vector3.new(0,0,0)
    end 
    Portal = getPortal(Pos) 
    Spawn = getSpawn(Pos) 
    for mm = 0,3,1 do 
        if getSpawn(Pos) ~= Spawn then 
            return 
        end 
    end 
    MyCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    Distance = calcpos(MyCFrame, Pos)
    if Distance > distbyp and Distance > calcpos(Portal, Pos) and Distance > calcpos(Portal, Pos) then
        return request(Portal) 
    end
    if Spawn then 
        Pos0 = calcpos(Spawn, Pos)
        if Distance > distbyp and not checkcombat() and Pos0 < Distance and calcpos(MyCFrame, Spawn) > Pos0 then
            return bypass(Spawn)
        end
    end
    if Distance < 500 then
        Speed = 350
    elseif Distance < 1000 then
        Speed = 325
    elseif Distance >= 1000 then
        Speed = 300
    end
    if Speed ~= nil then
        tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),{CFrame = Pos})
        tween:Play() 
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, Pos.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
end
--// Equip
function equip(tool)
    for _, v in lp.Backpack:GetChildren() do 
        if v:IsA("Tool") and v.ToolTip == tool then
            wfh(lp):EquipTool(v)
            return v.Name
        end 
    end 
    return false
end
--// Use Skill
function down(key, hold)
    pcall(function()
        if not ffc(lp.Character, Bounty.WeaponUsing) then
            equip(Bounty.ToolTipUsing)
        end
        game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, game)
        local spam = tick()
        repeat wt()
            if not ffc(lp.Character, Bounty.WeaponUsing) then
                equip(Bounty.ToolTipUsing)
            end
            game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, game)
        until (tick() - spam) >= hold or not (Bounty.CanUseWeapon and Bounty.CanUseSkill) or not (ffc(lp.Character, "Busy") and lp.Character.Busy.Value)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, key, false, game)
    end) 
end
--// Skill
function cd(I, II) 
    if not II then II = lp.Character.PrimaryPart.CFrame end
    return (Vector3.new(I.X, 0, I.Z) - Vector3.new(II.X, 0, II.Z)).Magnitude 
end 
function int(num)
    if not num then return end
    return tonumber(num)
end
function str(string)
    if not string then return end
    return tostring(string)
end
function wt(num)
    if not num then return task.wait() end
    return task.wait(int(num))
end
function ffc(obj, child)
    if not obj or not child then return end
    return obj:FindFirstChild(str(child))
end
function wfc(obj, child)
    if not obj or not child then return end
    return obj:WaitForChild(str(child), 9)
end
function wfh(mob)
    if not mob then return end
    return wfc(mob.Character, "Humanoid")
end
function wfhrp(mob)
    if not mob then return end
    return wfc(mob.Character, "HumanoidRootPart")
end
function checkmon(mob)
    if not mob then return end
    if mob and ffc(mob.Character, "Humanoid") and mob.Character.Humanoid.Health > 0 and ffc(mob.Character, "HumanoidRootPart") then
        return true
    end
    return
end
function inv(obj, child)
    if not obj or not child then return end
    return obj:InvokeServer(unpack(child))
end

function checkfruit(targcheck)
    local pdf = targcheck and ffc(targcheck, "Data") and ffc(targcheck.Data, 'DevilFruit') and targcheck.Data.DevilFruit.Value
    for _, v in Config["Skip"]["Fruit"]["Avoid Fruit"] do 
        if str(v) == str(pdf) then 
            return true
        end
    end
    return false
end

function findtarget()
    table.insert(Bounty.Checked, Bounty.Targ)
    Bounty.CanUseWeapon = false
    Bounty.CanUseSkill = false
    if Config["Chat"]["Enabled"] then
        ffc(wfc(rs, "DefaultChatSystemChatEvents"), "SayMessageRequest"):FireServer(Config["Chat"]["Message"][math.random(1, #Config["Chat"]["Message"])], "All")
    end
    if not Bounty.Hop then
        a, b = nil, math.huge
        for i, v in plrs:GetChildren() do
            if v ~= lp and v ~= a and v.Team and string.find(str(v.Team.Name), "es") and not table.find(Bounty.Checked, v)
            and (str(lp.Team.Name) == "Pirates" or str(v.Team.Name) == "Pirates") and math.abs(lp.Data.Level.Value - v.Data.Level.Value) < 600
            and (not Config["Skip"]["Fruit"]["Enabled"] or not checkfruit(v)) 
            and (not Config["Skip"]["Avoid V4"] or not (ffc(v.Backpack, "Awakening") or ffc(v.Character, "Awakening")))
            and cd(getSpawn(wfhrp(v).CFrame), wfhrp(v).CFrame) <= 3000 and not ffc(v.Character, "TempSafeZone") and checkmon(v) then
                a = v
                b = cd(wfhrp(v).CFrame, wfhrp(lp).CFrame)
            end
        end
        if a ~= nil then
            Bounty.Targ = a
            return false
        end
    end
    Bounty.Hop = true
    Hop()
    return false
end

function checknotify(msg, msg1)
    msg1 = msg1 or ""
    for i, v in pairs(lp.PlayerGui.Notifications:GetChildren()) do
        if v and v.Text and string.find(string.lower(v.Text), string.lower(msg)) and string.find(string.lower(v.Text), string.lower(msg1)) then
            v:Destroy()
            return true
        end
    end
    return false
end

function checkraid(target)
    if ffc(workspace["_WorldOrigin"].Locations, "Island 1") then
        if cd(wfhrp(target).CFrame, workspace["_WorldOrigin"].Locations["Island 1"].CFrame) < 3000 then 
            return true 
        end 
    end 
    return false
end

function checksafezone(pos)
    for _, v in workspace._WorldOrigin.SafeZones:GetChildren() do
        if cd(v.CFrame, pos) < (v.Mesh.Scale.Magnitude / 2) then
            return true
        end
    end
    return false
end  

local oldtarg = Bounty.Targ
local oldtime = tick()
local oldspamskill = tick()
local startuse = false

function checktarg()
    if not checkmon(Bounty.Targ) then
        return findtarget()
    end
    if checksafezone(wfhrp(Bounty.Targ).CFrame) then
        return findtarget()
    end
    if checkraid(Bounty.Targ) then
        return findtarget()
    end
    if Bounty.Targ == oldtarg then
        if Bounty.UsingSkill and not startuse then
            oldspamskill = tick()
            startuse = true
        end
        if startuse and (tick() - oldspamskill) >= 3 and not (Bounty.Targ.Character:GetAttribute("InCombat") == 0 or Bounty.Targ.Character:GetAttribute("InCombat") == 1) then
            return findtarget()
        end
    else
        startuse = false
        oldtarg = Bounty.Targ
    end
    return true
end

local Mouse = game.Players.LocalPlayer:GetMouse()
Cac = hookmetamethod(game, "__index", newcclosure(function(self, Index)
    if self == Mouse then
        if Index == "Hit" or Index == "hit" then
            return Bounty.CFrameTarget
        end
    end
    return Cac(self, Index)
end))

spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg, false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    args[2] = Bounty.Digit.Position
                    return old(unpack(args))
                end
            end
        end
        return old(...)
    end)
end)

local oldtw = tick()
spawn(function()
    while wt() do
        if checktarg() then
            if (not (game.Players.LocalPlayer.Character:FindFirstChild("HasBuso"))) then
                local rel = game.ReplicatedStorage
                rel.Remotes.CommF_:InvokeServer("Buso")
            end
            if ffc(lp, "PlayerGui") and ffc(lp.PlayerGui, "ScreenGui") and ffc(lp.PlayerGui.ScreenGui, "ImageLabel") then
            else
                game:service("VirtualUser"):CaptureController()
                game:service("VirtualUser"):SetKeyDown("0x65")
                game:service("VirtualUser"):SetKeyUp("0x65")
            end
            if ffc(workspace._WorldOrigin.Locations, "Dimensional Rift") and (workspace._WorldOrigin.Locations["Dimensional Rift"].Position - wfhrp(lp).Position).Magnitude <= 1000 and (wfhrp(Bounty.Targ).Position - workspace._WorldOrigin.Locations["Dimensional Rift"].Position).Magnitude <= 1000 then
                Bounty.CanUseWeapon = false
                Bounty.CanUseSkill = false
                to(CFrame.new(workspace._WorldOrigin.Locations["Dimensional Rift"].Position + Vector3.new(0, 190, 0)))
            else
                if tonumber(wfh(lp).Health) > 0 and (tonumber(wfh(lp).Health) < (Config["Safe Health"][1] / 100 * tonumber(wfh(lp).MaxHealth)))
                or (hide and tonumber(wfh(lp).Health) < (Config["Safe Health"][2] / 100 * tonumber(wfh(lp).MaxHealth))) then
                    Bounty.CanUseWeapon = false
                    Bounty.CanUseSkill = false
                    hide = true
                    randomy = math.random(1000, 5000)
                    if Config["Custom Y Run"].Enabled then
                        randomy = Config["Custom Y Run"]["Y Run"]
                    end
                    to(CFrame.new(wfhrp(Bounty.Targ).Position + Vector3.new(0, randomy, 0)))
                else
                    hide = false
                    Bounty.CFrameTarget = wfhrp(Bounty.Targ).CFrame
                    if tick() - oldtw >= 0.05 then
                        Bounty.Digit = Bounty.CFrameTarget + wfhrp(Bounty.Targ).Velocity / 2
                    end
                    if Bounty.Digit.Y < 5 then 
                        Bounty.Digit = CFrame.new(Bounty.Digit.X, 5, Bounty.Digit.Z) 
                    end 
                    if (wfhrp(lp).Position - Bounty.CFrameTarget.Position).Magnitude <= 80 then
                        if not ffc(Bounty.Targ.Character, "Busy") or not Bounty.Targ.Character.Busy.Value then
                            Bounty.CanUseWeapon = true
                            Bounty.CanUseSkill = true
                        else
                            Bounty.CanUseWeapon = true
                            Bounty.CanUseSkill = false
                        end
                        if Config["Hunt Method"]["Use Move Predict"] then
                            if Config["Hunt Method"]["Hit and Run"] then
                                if Bounty.UsingSkill then
                                    to(Bounty.Digit + Vector3.new(0, 4, 4))
                                else
                                    to(Bounty.Digit + Vector3.new(0, 30, 0))
                                end
                            else
                                to(Bounty.Digit + Vector3.new(0, 4, 4))
                            end
                        else
                            if Config["Hunt Method"]["Hit and Run"] then
                                if Bounty.UsingSkill then
                                    to(Bounty.CFrameTarget + Vector3.new(0, 4, 4))
                                else
                                    to(Bounty.CFrameTarget + Vector3.new(0, 30, 0))
                                end
                            else
                                to(Bounty.CFrameTarget + Vector3.new(0, 4, 4))
                            end
                        end
                    else
                        to(Bounty.CFrameTarget + Vector3.new(0, 4, 4))
                        Bounty.CanUseSkill = false
                    end
                end
            end
        end
    end
end)

local races = { 
    ["Human"] = "Last Resort", 
    ["Mink"] = "Agility", 
    ["Fishman"] = "Water Body", 
    ["Skypea"] = "Heavenly Blood", 
    ["Ghoul"] = "Heightened Senses",
    ["Cyborg"] = "Energy Core"
} 
local killcount = 0
local attackbool = false
spawn(function()
    while wt() do
        if ffc(lp.Character, "RaceTransformed") and ffc(lp.Character, "RaceEnergy") and lp.Character.RaceEnergy.Value >= 1 and not lp.Character.RaceTransformed.Value then
            down("Y", 0)
        end
        if lp.PlayerGui.Main.PvpDisabled.Visible == true then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
        end
        if Bounty.CanUseWeapon then
            if not ffc(lp.Character, races[lp.Data.Race.Value]) and inv(game.ReplicatedStorage.Remotes.CommF_, {"Wenlocktoad", "1"}) == -2 then
                down("T", 0)
            end
            if Config["Spam All Skill On V4"].Enabled and ffc(lp.Character, "RaceTransformed") and ffc(lp.Character, "RaceTransformed").Value then
                for _, v in Config["Spam All Skill On V4"]["Weapons"] do 
                    if Bounty.CanUseSkill then
                        EqWeapon = equip(v)
                        Bounty.WeaponUsing = EqWeapon
                        Bounty.ToolTipUsing = v
                        
                        Bounty.UsingSkill = true
                        if EqWeapon and Config.Items[v].Enable then
                            wt(Config.Items[v].Delay)
                            for k, skill in pairs(Config.Items[v].Skills) do
                                if Bounty.CanUseSkill and skill.Enable and ffc(lp.PlayerGui.Main.Skills[EqWeapon], k) 
                                and ((lp.Data.Race.Value == "Ghoul" and ffc(lp.Character, "Heightened Senses") and lp.PlayerGui.Main.Skills[EqWeapon][k].Cooldown.Size.X.Scale <= 0.4) 
                                or lp.PlayerGui.Main.Skills[EqWeapon][k].Cooldown.Size.X.Scale <= 0) then
                                    down(k, skill.HoldTime)
                                    repeat wt()
                                    until ffc(lp.Character, "Busy") and not lp.Character.Busy.Value
                                    killcount = killcount + 1
                                end
                            end
                        end
                        attackbool = true
                        wt(0.25)
                        Bounty.UsingSkill = false
                        attackbool = false
                    end
                end
            else
                for _, v in Config.Items.Use do
                    if Bounty.CanUseSkill then
                        EqWeapon = equip(v)
                        Bounty.WeaponUsing = EqWeapon
                        Bounty.ToolTipUsing = v

                        Bounty.UsingSkill = true
                        if EqWeapon and Config.Items[v].Enable then
                            wt(Config.Items[v].Delay)
                            for k, skill in pairs(Config.Items[v].Skills) do
                                if Bounty.CanUseSkill and skill.Enable and ffc(lp.PlayerGui.Main.Skills[EqWeapon], k) 
                                and ((lp.Data.Race.Value == "Ghoul" and ffc(lp.Character, "Heightened Senses") and lp.PlayerGui.Main.Skills[EqWeapon][k].Cooldown.Size.X.Scale <= 0.4) 
                                or lp.PlayerGui.Main.Skills[EqWeapon][k].Cooldown.Size.X.Scale <= 0) then
                                    down(k, skill.HoldTime)
                                    repeat wt()
                                    until ffc(lp.Character, "Busy") and not lp.Character.Busy.Value
                                    killcount = killcount + 1
                                end
                            end
                        end
                        attackbool = true
                        wt(0.25)
                        Bounty.UsingSkill = false
                        attackbool = false
                    end
                end
            end
        end
    end
end)

local u5 = require(game.ReplicatedStorage:WaitForChild("Notification"))
spawn(function()
    while wt() do
        u5.new("<Color=Yellow>Server: discord.gg/tsuoscripts<Color=/>"):Display()
        u5.new("<Color=Yellow>Dms: tsuo9<Color=/>"):Display() 
        u5.new("<Color=Yellow>ID: 879370807778902057<Color=/>"):Display() 
        wt(20)
    end
end)

    local v1 = game:GetService("UserInputService")
    local v2 = game.Players.LocalPlayer:GetMouse()
    local v3 = (v1.TouchEnabled and v1.TouchTapInWorld) or v2.Button1Down 
    local gundelay = tick()
    local attackdelay = tick()
    function Attack()
        if ffc(lp.Character, "Stun") and lp.Character.Stun.Value ~= 0 then
            return
        end
        if Bounty.ToolTipUsing ~= "Blox Fruit" then
            if Bounty.ToolTipUsing == "Gun" then
                if ffc(lp.Character, Bounty.WeaponUsing) and tick() - gundelay >= lp.Character[Bounty.WeaponUsing].Cooldown.Value then
                    for _, v4 in getconnections(v3) do
                        if type(v4.Function) == "function" and debug.getinfo(v4.Function).name == "inputAndReload" then
                            v4.Function()
                        end
                    end
                    gundelay = tick()
                end
            else
                if tick() - attackdelay >= Config["Misc"]["Click Delay"] then
                    pcall(function()
                        local ac = CombatFrameworkR.activeController
                        ac.hitboxMagnitude = 55
                        if ac and ac.equipped then
                            for indexincrement = 1, 1 do
                                local bladehit =require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(game.Players.LocalPlayer.Character,{game.Players.LocalPlayer.Character.HumanoidRootPart},60)
                                if #bladehit > 0 then
                                    local AcAttack8 = debug.getupvalue(ac.attack, 5)
                                    local AcAttack9 = debug.getupvalue(ac.attack, 6)
                                    local AcAttack7 = debug.getupvalue(ac.attack, 4)
                                    local AcAttack10 = debug.getupvalue(ac.attack, 7)
                                    local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
                                    local NumberAc13 = AcAttack7 * 798405
                                    (function()
                                        NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
                                        AcAttack8 = math.floor(NumberAc12 / AcAttack9)
                                        AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
                                    end)()
                                    AcAttack10 = AcAttack10 + 1
                                    debug.setupvalue(ac.attack, 5, AcAttack8)
                                    debug.setupvalue(ac.attack, 6, AcAttack9)
                                    debug.setupvalue(ac.attack, 4, AcAttack7)
                                    debug.setupvalue(ac.attack, 7, AcAttack10)
                                    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then
                                        Animation.AnimationId = ac.anims.basic[2]
                                        ac.humanoid:LoadAnimation(Animation):Play(1, 1)
                                        game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
                                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", str(CurrentWeapon()))
                                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
                                    end
                                end
                            end
                        end
                        attackdelay = tick()
                    end)
                end
            end
        else
            return
        end
    end

spawn(function()
    while wt() do
        if attackbool then
            Attack()
        end
    end
end)
lp.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wt(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
