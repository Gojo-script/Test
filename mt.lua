local mt = getrawmetatable(game)
setreadonly(mt,false)
local old = mt.__namecall
mt.__namecall = newcclosure(function(...)
    local method = getnamecallmethod()
    local args = {...}
    if tostring(method) == "FireServer" then
        if tostring(args[1]) == "RemoteEvent" then
            if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                if _G.SkillAimbot == true or _G.AimbotSelect then
                    if _G.TargetPlayerAim ~= nil then
                        args[2] =  game.Players[_G.TargetPlayerAim].Character.HumanoidRootPart.Position
                        return old(unpack(args))
                    end
                elseif _G.UseBf then
                    if tostring(typeof(args[2])) == "CFrame" then
                        args[2] = _G.PosMonMasteryFruit
                    elseif tostring(typeof(args[2])) == "Vector3" then
                        if tostring(typeof(_G.PosMonMasteryFruit)) == "Vector3" then
                            args[2] = _G.PosMonMasteryFruit
                        elseif tostring(typeof(_G.PosMonMasteryFruit)) == "CFrame" then
                            args[2] = _G.PosMonMasteryFruit.Position
                        end
                    end
                    return old(unpack(args))
                elseif _G.UseGun then
                    if tostring(typeof(args[2])) == "CFrame" then
                        args[2] = _G.PosMonMasteryGun
                    elseif tostring(typeof(args[2])) == "Vector3" then
                        if tostring(typeof(_G.PosMonMasteryGun)) == "Vector3" then
                            args[2] = _G.PosMonMasteryGun
                        elseif tostring(typeof(_G.PosMonMasteryGun)) == "CFrame" then
                            args[2] = _G.PosMonMasteryGun.Position
                        end
                    end
                    return old(unpack(args))
                else
                    args[2] = args[2]
                    return old(unpack(args))
                end
            end
        end
    end 
    return old(...)
end)
