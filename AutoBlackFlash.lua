repeat
    task.wait()
until getgenv().Toggles;

local ReplicatedStorage = game:GetService('ReplicatedStorage');

ReplicatedStorage.BlackFlashCheck.OnClientInvoke = function(p90, p91) --// .285, 0
    local v92 = p90 - p91
    game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(v92, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
        ["FieldOfView"] = 6
    }):Play()
    local v93 = game:GetService("UserInputService")
    local v_u_94 = false
    local v_u_95 = false
    local v_u_96 = false
    local v98 = v93.InputBegan:Connect(function(p97)
        -- upvalues: (ref) v_u_94, (ref) v_u_95, (ref) v_u_96
        if not v_u_94 then
            if p97.UserInputType == Enum.UserInputType.MouseButton1 or p97.KeyCode == Enum.KeyCode.ButtonB then
                if v_u_95 then
                    v_u_96 = true
                    return
                end
                v_u_94 = true
            end
        end
    end)
    wait(v92)
    v_u_95 = true
    if p91 <= 0 then
        workspace.CurrentCamera.FieldOfView = 70
        task.spawn(function()
            wait(0.1)
            workspace.CurrentCamera.FieldOfView = 70
        end)
        v98:disconnect()
        return false
    end
    game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(p91), {
        ["FieldOfView"] = 70
    }):Play()
    wait(p91)
    workspace.CurrentCamera.FieldOfView = 70
    task.spawn(function()
        wait(0.1)
        workspace.CurrentCamera.FieldOfView = 70
    end)
    v_u_95 = false
    v98:disconnect()
    return (p91 ~= 0 and (Toggles.AutoBlackFlash.Value and true)) or v_u_96
end;