repeat
    task.wait()
until getgenv().Toggles;

local Live = workspace:WaitForChild('Live');

ReplicatedStorage.NanamiCheck.OnClientInvoke = function(Target, TimeDur, User)
    local TempGUI = ReplicatedStorage.NanamiCutGUI:Clone();
    TempGUI.MainBar.Rotation = -80;
    TempGUI.Parent = Live[Target.Name].HumanoidRootPart;
    TempGUI.Adornee = Live[Target.Name].HumanoidRootPart;
    local MainBar = TempGUI.MainBar;
    local Cutter = MainBar.Cutter;
    local Temp1,Temp2,Temp3 = false,false,false
    local InputConnection = UserInputService.InputBegan:Connect(function(InputObject)
        if not Temp1 then
            if InputObject.UserInputType == Enum.UserInputType.MouseButton1 or InputObject.KeyCode == Enum.KeyCode.ButtonB then
                if Temp2 then
                    Temp3 = true;
                    return;
                end;
                Temp1 = true;
            end;
        end;
    end);
    
    local Counter = .005;
    local Time = 0;
    while Counter < 1 and (User:GetAttribute('NANAMIAIM') and not (Temp3 or Temp1)) do
        local Timed = task.wait();
        local Division = Timed / TimeDur;
        local Difference = math.abs(.7 - Counter);

        if Counter < .7 then
            MainBar.Rotation = Counter/.7*80-80;
        else
            MainBar.Rotation = 0;
        end;
        if Difference < .025 then
            Division = Division / 8;
        elseif Difference < .05 then
            Division = Division / 4;
        end;
        Counter = Counter + Division;
        Cutter.Position = UDim2.fromScale(Counter, .5);
        if Difference < .02 then
            Temp2 = true;
            if Toggles.AutoNanami.Value then
                Temp3 = true;
            end;
        else
            Temp2 = false;
        end;
        if Temp2 then
            Time = Time + Timed;
        end;
    end;
    InputConnection:Disconnect();
    if Temp3 and User:GetAttribute('NANAMIAIM') then
        Cutter.Position = UDim2.fromScale(.7,.5);
        TweenService:Create(TempGUI, TweenInfo.new(.25), {['Size'] = UDim2.new(10,200,10,200)}):Play();
        Cutter.Size = UDim2.fromScale(.016, 12);
        TweenService:Create(Cutter, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
            ['Size'] = UDim2.fromScale(0, 24);
            ['BackgroundColor3'] = Color3.new(1,0,0);
            ['BackgroundTransparency'] = 1
        }):Play();
        local ColorCorrection = Instance.new("ColorCorrectionEffect", game.Lighting);
        ColorCorrection.TintColor = Color3.new(0,0,0);
        Debris:AddItem(ColorCorrection, .15);
    end;
    Debris:AddItem(TempGUI,.5);
    return Temp3;
end;