repeat
    task.wait()
until Toggles

game.ReplicatedStorage.KokushiboCheck.OnClientInvoke = function(p101, p102)
    local v103 = p101 * 2
    local v104 = p102 * 2
    local v105 = v103 - v104
    local v_u_106 = game.ReplicatedStorage.FrenchKokushibo:Clone()
    for _, v107 in pairs(v_u_106:GetChildren()) do
        game.TweenService:Create(v107, TweenInfo.new(v105, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            ["Position"] = UDim2.new(v107.Position.X.Scale + math.random(1, 2) / 60 * (math.random(0, 1) == 0 and -1 or 1), 0, v107.Position.Y.Scale + math.random(1, 3) / 90 * (math.random(0, 1) == 0 and -1 or 1), 0)
        }):Play()
    end
    v_u_106.Parent = game.Players.LocalPlayer.PlayerGui
    local v108 = game:GetService("UserInputService")
    local v_u_109 = false
    local v_u_110 = false
    local v_u_111 = false
    local v_u_112 = tick()
    local v117 = v108.InputBegan:Connect(function(p113)
        -- upvalues: (ref) v_u_109, (ref) v_u_99, (ref) v_u_110, (ref) v_u_111, (ref) v_u_100, (copy) v_u_112, (copy) v_u_106
        if v_u_109 then
            return
        elseif not table.find({}, game.Players.LocalPlayer.UserId) then
            if p113.UserInputType == Enum.UserInputType.MouseButton2 or p113.KeyCode == Enum.KeyCode.DPadRight then
                if v_u_110 then
                    v_u_111 = true
                    local v114 = v_u_100
                    local v115 = tick() - v_u_112
                    table.insert(v114, v115)
                    for _, v116 in pairs(v_u_106:GetChildren()) do
                        game.TweenService:Create(v116.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            ["Scale"] = 1.2
                        }):Play()
                        game.TweenService:Create(v116, TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            ["ImageTransparency"] = 1
                        }):Play()
                        v116.ImageColor3 = Color3.new(0.345098, 0.847059, 1)
                    end
                    return
                end
                v_u_109 = true
            end
        end
    end)
    wait(v105)
    local v118 = tick()
    v_u_110 = true
    if v104 <= 0 then
        if v_u_106 then
            v_u_106:Destroy()
        end
        v117:disconnect()
        return false
    end
    wait(v104)
    for _, v120 in pairs(v_u_106:GetChildren()) do
        game:GetService('TweenService'):Create(v120, TweenInfo.new(v104, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            ["Rotation"] = v120.Rotation + 360
        }):Play()
    end
    v_u_110 = false
    if #v_u_100 > 3 then
        local v121 = -1
        for _, v122 in pairs(v_u_100) do
            if v118 == v122 then
                v121 = v121 + 1
            end
        end
        if v121 >= 4 then
            --//game.Players.LocalPlayer:Kick()
        end
    end
    v117:Disconnect();
    v_u_111 = (Toggles.AutoKokushibo.Value and true) or v_u_111
    if not v_u_111 then
        for _, v124 in pairs(v_u_106:GetChildren()) do
            game.TweenService:Create(v124.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Scale"] = 0.6
            }):Play()
            game.TweenService:Create(v124, TweenInfo.new(0.65, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["ImageTransparency"] = 1
            }):Play()
        end
    end
    game.Debris:AddItem(v_u_106, 0.65)
    for _, v116 in pairs(v_u_106:GetChildren()) do
        if v116.ImageTransparency ~= 1 then
            game.TweenService:Create(v116.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Scale"] = 1.2
            }):Play()
                game.TweenService:Create(v116, TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["ImageTransparency"] = 1
            }):Play()
            v116.ImageColor3 = Color3.new(0.345098, 0.847059, 1)
        end
    end
    return v_u_111;
end;