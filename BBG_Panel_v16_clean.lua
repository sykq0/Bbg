do local Rayfield=loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
    local Players=game:GetService("Players")
    local RunService=game:GetService("RunService")
    local ReplicatedStorage=game:GetService("ReplicatedStorage")
    local UIS=game:GetService("UserInputService")
    local TweenService=game:GetService("TweenService")
    local Stats=game:GetService("Stats")
    local Camera=workspace.CurrentCamera
    local LocalPlayer=Players.LocalPlayer
    local Mouse=LocalPlayer:GetMouse()
    local isMobile=UIS.TouchEnabled and  not UIS.KeyboardEnabled
    if  not LPH_OBFUSCATED then local v1032=0
        while true do if (v1032==0) then function LPH_JIT(...) return ...
                end function LPH_NO_VIRTUALIZE(...) return ...
            end break
end end end local function findRemote() local v330=0
local v331
local v332
while true do if (v330==3) then v332=ReplicatedStorage:FindFirstChild("Packages")
        if v332 then local v1880=0
            local v1881
            while true do if (v1880==0) then v1881=v332:FindFirstChild("Knit")
                    if (v1881 and v1881:FindFirstChild("Services")) then local v2312=0
                        local v2313
                        while true do if (v2312==0) then v2313=v1881.Services:FindFirstChild("ToolService")
                                if (v2313 and v2313:FindFirstChild("RE")) then local v2495=v2313.RE
                                    if v2495:FindFirstChild("UpdateAim") then return v2495.UpdateAim
                                end end break
                    end end end break
        end end end v330=4
    end if (v330==4) then return nil
end if (1==v330) then if ReplicatedStorage:FindFirstChild("Remote") then return ReplicatedStorage.Remote
end if ReplicatedStorage:FindFirstChild("Bullets") then return ReplicatedStorage.Bullets
end v330=2
end if (v330==2) then v331=ReplicatedStorage:FindFirstChild("MainRemotes")
if (v331 and v331:FindFirstChild("MainRemoteEvent")) then return v331.MainRemoteEvent
end v330=3
end if (0==v330) then if ReplicatedStorage:FindFirstChild("MainEvent") then return ReplicatedStorage.MainEvent
end if ReplicatedStorage:FindFirstChild("MAINEVENT") then return ReplicatedStorage.MAINEVENT
end v330=1
end end end local MainRemote=findRemote()
local CommF
pcall(function() CommF=ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_")
end)
local aimEnabled=false
local v15=nil
local v16=false
local v17=nil
local v18=false
local v19=false
local v20=false
local v21=false
local isActive=false
local v23=nil
local renderConn=nil
local function disconnectRender() if renderConn then local v1244=0
        while true do if (0==v1244) then pcall(function() renderConn:Disconnect()
                end)
                renderConn=nil
                break
end end end end local function startRateLimit() local v333=0
local v334
local v335
while true do if (v333==1) then v335=1/v334
        renderConn=RunService.RenderStepped:Connect(function() local v1731=0
            local v1732
            while true do if (v1731==0) then if  not isActive then local v2199=0
                        local v2200
                        while true do if (v2199==0) then v2200=0
                                while true do if (v2200==0) then disconnectRender()
                                        return
                                end end break
                    end end end v1732=tick()
                    v1731=1
            end if (v1731==1) then while (tick() -v1732)<v335  do end break
end end end)
break
end if (v333==0) then disconnectRender()
v334=20
end end end local frameTime=2000
local Config={TargetAim={Enabled=false,Target="None",AutoSelect=false,AutoFire=false,Strafe=false,ToggleStrafe=false,VisualizeStrafe=false,VisualizeStrafeInlineColor=Color3.fromRGB(255,255,255 ),VisualizeStrafeOutlineColor=Color3.fromRGB(255 ,255 ,255),StrafeMethod="Randomize",StrafePrediction=975.-974 ,Highlight=false,HighlightOutlineColor=Color3.fromRGB(255,255 ,255),Tracer=false,TracerPosition="Mouse",TracerFillColor=Color3.fromRGB(255 ,255 ,255 ),TracerOutlineColor=Color3.fromRGB(0,0 ,0),LookAt=false,AutoStomp=false,Prediction=0 ,AutoPredict=false,PredictMode="Ping Sets",HitPart="Head",Offset=0 ,JumpOffset=0 ,AirPartEnabled=false,AirPart="Head",Resolver=false,Autokill=false,DotCircle=false,Spoofer=false},HitEffects={HitSounds=false,HitSoundID="rbxassetid://6534948092",HitSoundVolume=5 ,HitNotifications=false,HitNotificationsTime=3 ,HitChams={Enabled=false,Color=Color3.fromRGB(255 ,255 ,255 ),Lifetime=3,Transparency=0.7,Material="Neon"},HitSkeleton={Enabled=false,Color=Color3.fromRGB(255,255 ,255 )}},Checks={Wall=false,Forcefield=false,Alive=false},KillAura={Enabled=false,Active=false,Range=250,Silent=false,Visualize=false,StompAura=false,Whitelist={}},HitboxExpander={Enabled=false,Visualize=false,Color=Color3.fromRGB(255 ,255 ,255 ),OutlineColor=Color3.fromRGB(255,255 ,255),FillTransparency=0.5,OutlineTransparency=0.3,Size=15}}
local v29={}
local v30={}
local v31={}
local v32={}
local v33={}
local v34=false
local v35=nil
local v36=nil
local v37={}
local v38=0
local v39=false
local dotCircle=Drawing.new("Circle")
dotCircle.Visible=false
dotCircle.Filled=true
dotCircle.Radius=5
dotCircle.Thickness=2.4
dotCircle.Color=Color3.fromRGB(255 ,255 ,255 )
dotCircle.Transparency=1
local fovEnabled=false
local fovRadius=300
local v49=Color3.fromRGB(255 ,255 ,255 )
local v50=false
local v51=Color3.fromRGB(255,255 ,255 )
local v52=Color3.fromRGB(0  ,0  ,0)
local v53=0.5
local fovCircleOutline=Drawing.new("Circle")
fovCircleOutline.Visible=false
fovCircleOutline.Thickness=1
fovCircleOutline.NumSides=64
fovCircleOutline.Filled=false
fovCircleOutline.Color=v49
fovCircleOutline.Radius=fovRadius
fovCircleOutline.ZIndex=10001
local fovCircleFill=Drawing.new("Circle")
fovCircleFill.Visible=false
fovCircleFill.Filled=true
fovCircleFill.Transparency=v53
fovCircleFill.NumSides=64
fovCircleFill.Radius=fovRadius
fovCircleFill.Color=v51
fovCircleFill.ZIndex=10001
RunService.RenderStepped:Connect(function() if fovEnabled then local v1245=Vector2.new(Camera.ViewportSize.X/2 ,Camera.ViewportSize.Y/2 )
        fovCircleOutline.Position=v1245
        fovCircleFill.Position=v1245
        if v50 then local v1733=0
            local v1734
            local v1735
            local v1736
            local v1737
            local v1738
            while true do if (0==v1733) then v1734=0
                    v1735=nil
                end if (v1733==1) then v1736=nil
                v1737=nil
            end if (v1733==2) then v1738=nil
            while true do if (v1734==0) then v1735=(math.sin(tick() * 2 ) * (0.5)) + (0.5)
                    v1736=v51.R + ((v52.R-v51.R) * v1735)
                end if (v1734==1) then v1737=v51.G + ((v52.G-v51.G) * v1735)
                v1738=v51.B + ((v52.B-v51.B) * v1735)
            end if (v1734==2) then fovCircleFill.Color=Color3.new(v1736,v1737,v1738)
            break
    end end break
end end end end end)
local tracerOutline=Drawing.new("Line")
tracerOutline.Visible=false
tracerOutline.Color=Config.TargetAim.TracerOutlineColor
tracerOutline.Thickness=4
local tracerFill=Drawing.new("Line")
tracerFill.Visible=false
tracerFill.Color=Config.TargetAim.TracerFillColor
tracerFill.Thickness=2
local v80=Drawing.new("Line")
v80.Thickness=2
v80.Color=Color3.fromRGB(255 ,255,255 )
v80.Visible=false
v80.Transparency=1
local dummyRig=game:GetObjects("rbxassetid://8246626421")[1]
dummyRig.Parent=workspace
dummyRig.Humanoid:Destroy()
dummyRig.Head.Face:Destroy()
for v336,v337 in pairs(dummyRig:GetDescendants()) do if (v337:IsA("BasePart") or v337:IsA("MeshPart")) then local v1248=0
        while true do if (v1248==0) then v337.CanCollide=false
                v337.Transparency=1
                break
end end end end dummyRig.HumanoidRootPart.Transparency=1
dummyRig.HumanoidRootPart.Velocity=Vector3.zero
dummyRig.HumanoidRootPart.CFrame=CFrame.new(9999 ,9999,9999 )
local highlight=Instance.new("Highlight")
highlight.Enabled=false
highlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
highlight.FillColor=Color3.fromRGB(0 ,255 ,0  )
highlight.OutlineColor=Color3.fromRGB(255 ,255 ,255)
highlight.FillTransparency=0.3
highlight.OutlineTransparency=0
highlight.Adornee=dummyRig
highlight.Parent=dummyRig
local hitPart=Instance.new("Part")
hitPart.Size=Vector3.new(520.-518 ,1282.-1280 ,0.2 )
hitPart.Material=Enum.Material.Neon
hitPart.Color=Color3.fromRGB(255 ,255 ,255)
hitPart.Transparency=1
hitPart.Anchored=true
hitPart.CanCollide=false
hitPart.Parent=workspace
local function v110(v338,v339) for v1033,v1034 in pairs(v338:GetDescendants()) do if (v1034:IsA("BasePart") or v1034:IsA("MeshPart")) then v1034.Transparency=v339
end end end local function v111(v340,v341) for v1035,v1036 in pairs(v340:GetDescendants()) do if (v1036:IsA("BasePart") or v1036:IsA("MeshPart")) then v1036.Color=v341
end end end local function v112(v342) local v343=0
local v344
while true do if (v343==0) then if ( not v342 or  not v342.Character) then return false
        end v344=v342.Character:FindFirstChildOfClass("Humanoid")
    end if (1==v343) then return v344 and (v344.Health>0)
end end end local function v113(v345) if (v345 and v345.Character and v345.Character:FindFirstChild("BodyEffects")) then local v1249=0
local v1250
while true do if (v1249==0) then v1250=v345.Character.BodyEffects:FindFirstChild("K.O")
        return (v1250 and v1250.Value) or false
end end end return false
end local function v114(v346) local v347=0
local v348
local v349
local v350
local v351
local v352
while true do if (v347==0) then if ( not v346.Character or  not v346.Character:FindFirstChild("Head")) then return false
        end v348=v346.Character.Head
        v347=1
    end if (1==v347) then v349=Camera.CFrame.Position
    v350=(v348.Position-v349).Unit * (v348.Position-v349).Magnitude
end if (v347==4) then return  not v352 or v352.Instance:IsDescendantOf(v346.Character)
end if (v347==3) then v351.FilterType=Enum.RaycastFilterType.Blacklist
v352=workspace:Raycast(v349,v350,v351)
v347=4
end if (v347==2) then v351=RaycastParams.new()
v351.FilterDescendantsInstances={LocalPlayer.Character}
v347=3
end end end local function v115() local v353=0
local v354
while true do local v1037=0
    while true do if (v1037==0) then if (v353==0) then v354={}
                for v2069,v2070 in pairs(Players:GetPlayers()) do if (v2070~=LocalPlayer) then table.insert(v354,v2070.Name)
                end end v353=1
            end if (v353==1) then if ( #v354==0) then v354={"No players"}
            end return v354
        end break
end end end end local function v116() local v355=math.huge
local v356=nil
local v357
if isMobile then v357=Vector2.new(Camera.ViewportSize.X/2 ,Camera.ViewportSize.Y/2 )
else v357=UIS:GetMouseLocation()
end for v1038,v1039 in pairs(Players:GetPlayers()) do if (v1039==LocalPlayer) then continue
end local v1040=v1039.Character
if ( not v1040 or  not v1040:FindFirstChild("Head") or  not v1040:FindFirstChild("HumanoidRootPart")) then continue
end if ( not v112(v1039) and Config.Checks.Alive) then continue
end if (Config.Checks.Forcefield and v1039.Character:FindFirstChildWhichIsA("ForceField")) then continue
end local v1041,v1042=Camera:WorldToViewportPoint(v1040.Head.Position)
local v1043=Vector2.new(v1041.X,v1041.Y)
local v1044=(v1043-v357).Magnitude
if (fovEnabled and (v1044>fovRadius)) then continue
end local v1045=true
if Config.Checks.Wall then local v1455=0
    local v1456
    local v1457
    while true do if (v1455==0) then v1456=RaycastParams.new()
            v1456.FilterDescendantsInstances={LocalPlayer.Character}
        end if (v1455==2) then if (v1457 and v1457.Instance and  not v1457.Instance:IsDescendantOf(v1040)) then v1045=false
        end break
    end if (v1455==1) then v1456.FilterType=Enum.RaycastFilterType.Blacklist
    v1457=workspace:Raycast(Camera.CFrame.Position,v1040.Head.Position-Camera.CFrame.Position ,v1456)
end end end if (v1042 and v1045 and (v1044<v355)) then local v1458=0
local v1459
while true do if (v1458==0) then v1459=0
        while true do if (v1459==0) then v355=v1044
                v356=v1039
                break
        end end break
end end end end return v356
end local function v117() pcall(function() local v1046=Instance.new("Sound")
    v1046.Parent=LocalPlayer.Character.HumanoidRootPart
    v1046.SoundId=Config.HitEffects.HitSoundID
    v1046.Volume=Config.HitEffects.HitSoundVolume
    v1046:Play()
    v1046.Ended:Connect(function() v1046:Destroy()
    end)
end)
end local v118=LPH_NO_VIRTUALIZE(function(v358) local v359=0
local v360
local v361
local v362
local v363
while true do if (v359==1) then v360.Name="BBGClone"
        v361={"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot"}
        for v1739,v1740 in ipairs(v360:GetChildren()) do if v1740:IsA("BasePart") then local v1961=0
                local v1962
                while true do if (v1961==0) then v1962=false
                        for v2315,v2316 in ipairs(v361) do if (v1740.Name==v2316) then v1962=true
                                break
                        end end v1961=1
                    end if (v1961==1) then if  not v1962 then v1740:Destroy()
                    end break
            end end elseif (v1740:IsA("Accessory") or v1740:IsA("Tool") or (v1740.Name=="face") or v1740:IsA("Shirt") or v1740:IsA("Pants") or v1740:IsA("Hat")) then v1740:Destroy()
    end end if v360:FindFirstChild("Humanoid") then v360.Humanoid:Destroy()
end v359=2
end if (v359==3) then v363=TweenInfo.new(Config.HitEffects.HitChams.Lifetime,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0  ,true)
for v1741,v1742 in ipairs(v360:GetChildren()) do if v1742:IsA("BasePart") then TweenService:Create(v1742,v363,{Transparency=1 }):Play()
end end task.delay(Config.HitEffects.HitChams.Lifetime,function() if (v360 and v360.Parent) then v360:Destroy()
end end)
break
end if (2==v359) then for v1743,v1744 in ipairs(v360:GetChildren()) do if v1744:IsA("BasePart") then local v1963=0
        while true do if (v1963==1) then v1744.Transparency=Config.HitEffects.HitChams.Transparency
                v1744.Color=Config.HitEffects.HitChams.Color
                v1963=2
            end if (v1963==0) then v1744.CanCollide=false
            v1744.Anchored=true
        end if (v1963==2) then v1744.Material=Config.HitEffects.HitChams.Material
        break
end end end end v362=v360:FindFirstChild("Head")
if v362 then local v1884=0
    while true do if (v1884==1) then v362.Material=Config.HitEffects.HitChams.Material
            if v362:FindFirstChild("face") then v362.face:Destroy()
            end break
        end if (v1884==0) then v362.Transparency=Config.HitEffects.HitChams.Transparency
        v362.Color=Config.HitEffects.HitChams.Color
end end end v360.Parent=workspace
end if (v359==0) then if  not Config.HitEffects.HitChams.Enabled then return
end if  not (v358 and v358.Character and v358.Character:FindFirstChild("HumanoidRootPart")) then return
end v358.Character.Archivable=true
v360=v358.Character:Clone()
end end end)
local v119={[50 ]=0.1433  ,[55]=0.1412 ,[60 ]=0.1389,[65 ]=0.1367,[70 ]=0.1346,[75 ]=0.1324,[80 ]=0.1303,[85 ]=0.1282  ,[90]=722.539 ,[95 ]=0.124  ,[100 ]=1556.-337 ,[110 ]=0.1177  ,[120]=0.1136,[130 ]=0.1095,[140 ]=1445.-390 ,[150]=0.1015 ,[160]=0.0975 ,[170]=0.0936 ,[180]=0.0897,[190]=351.0859 -351 ,[200 ]=0.0821,[210 ]=0.0783  ,[220]=299.0746 -299 ,[230 ]=0.071,[240]=0.0674  ,[250 ]=0.0638,[260]=0.0603  ,[270 ]=0.0568,[280 ]=0.0534,[290 ]=315.05 -315 }
local v120=0.13
task.spawn(function() while true do local v1053=0
        while true do if (0==v1053) then pcall(function() local v1885=Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
                    local v1886,v1887=100 ,math.huge
                    for v1964 in pairs(v119) do local v1965=math.abs(v1964-v1885 )
                        if (v1965<v1887) then v1887=v1965
                            v1886=v1964
                    end end v120=v119[v1886] or (0.13 )
                end)
                task.wait(0.3  )
                break
end end end end)
local v121=getrawmetatable(game)
local v122=v121.__index
setreadonly(v121,false)
v121.__index=newcclosure(function(v364,v365) local v366=0
    while true do if (0==v366) then if ((v364==Mouse) and ((v365=="Hit") or (v365=="Target"))) then local v1888=0
                while true do if (v1888==0) then if (aimEnabled and v15) then local v2317=0
                            local v2318
                            local v2319
                            while true do if (v2317==0) then v2318=Players:FindFirstChild(v15)
                                    v2319=v2318 and v2318.Character and v2318.Character:FindFirstChild("HumanoidRootPart")
                                end if (v2317==1) then if v2319 then local v2496=0
                                    local v2497
                                    local v2498
                                    while true do if (v2496==1) then if v2498 then local v2546=0
                                                local v2547
                                                while true do if (v2546==0) then v2547=(v2319.Position-v2498.Position).Magnitude
                                                        if (v2547<=frameTime) then if (v365=="Hit") then return CFrame.new(v2319.Position)
                                                                elseif (v365=="Target") then return v2319
                                                            end end break
                                                end end end break
                                            end if (v2496==0) then v2497=LocalPlayer.Character
                                            v2498=v2497 and v2497:FindFirstChild("HumanoidRootPart")
                                end end end break
                    end end end if (SA_Enabled and (SA_Playersaimbot~=nil) and (SA_PlayersPosition~=nil)) then local v2320=0
                    local v2321
                    while true do if (v2320==0) then v2321=Players:FindFirstChild(SA_Playersaimbot)
                            if (v2321 and v2321.Character) then local v2499=0
                                local v2500
                                while true do if (0==v2499) then v2500=v2321.Character:FindFirstChild("Head") or v2321.Character:FindFirstChild("HumanoidRootPart")
                                        if v2500 then if (v365=="Hit") then return CFrame.new(SA_PlayersPosition)
                                            end if (v365=="Target") then return v2500
                                    end end break
                        end end end break
            end end end v1888=1
        end if (v1888==1) then if (Config.TargetAim.Enabled and (Config.TargetAim.Target~="None") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then local v2322=Players:FindFirstChild(Config.TargetAim.Target)
            if (v2322 and v2322.Character and v2322.Character:FindFirstChildOfClass("Humanoid") and (v2322.Character:FindFirstChildOfClass("Humanoid").Health>0) and  not v2322.Character:FindFirstChild("ForceField")) then local v2411=0
                local v2412
                local v2413
                while true do if (v2411==1) then if Config.TargetAim.AirPartEnabled then local v2521=v2322.Character.Humanoid:GetState()
                            if ((v2521==Enum.HumanoidStateType.Freefall) or (v2521==Enum.HumanoidStateType.Jumping)) then v2412=Config.TargetAim.AirPart
                        end end v2413=v2322.Character:FindFirstChild(v2412)
                        v2411=2
                    end if (v2411==2) then if v2413 then local v2522=0
                        local v2523
                        local v2524
                        local v2525
                        local v2526
                        while true do if (v2522==3) then v2526=v2413.Position + (v2523 * v2524) + Vector3.new(0,v2525,0 )
                                if (v365=="Hit") then return CFrame.new(Camera.CFrame.Position,v2526)
                                end v2522=4
                            end if (v2522==2) then local v2548=0
                            while true do if (v2548==0) then v2525=Config.TargetAim.Offset
                                    pcall(function() if ((v2322.Character.Humanoid:GetState()==Enum.HumanoidStateType.Freefall) or (v2523.Y>20)) then v2525=Config.TargetAim.JumpOffset
                                    end end)
                                end if (v2548==1) then v2522=3
                                break
                    end end end if (v2522==0) then v2523=(v32[v2322] and v32[v2322].Velocity) or v2413.AssemblyLinearVelocity
                    v2524=Config.TargetAim.Prediction
                end if (v2522==4) then if (v365=="Target") then return v2413
                end break
            end if (v2522==1) then if Config.TargetAim.AutoPredict then if (Config.TargetAim.PredictMode=="Ping Sets") then v2524=v120
                    elseif (Config.TargetAim.PredictMode=="Calculate") then local v2565=0
                        local v2566
                        while true do if (v2565==1) then v2524=(1755.0368 -1755) + v2566
                                break
                            end if (v2565==0) then local v2569=0
                            while true do if (v2569==1) then v2565=1
                                    break
                                end if (v2569==0) then v2566=0
                                pcall(function() v2566=Stats.Network.ServerStatsItem["Data Ping"]:GetValue()/1000
                                end)
        end end end end end end if Config.TargetAim.Resolver then v2524=v2524 + (302.015 -302)
    end v2522=2
end end end break
end if (v2411==0) then if (Config.Checks.Forcefield and v2322.Character:FindFirstChildWhichIsA("ForceField")) then return v122(v364,v365)
end v2412=Config.TargetAim.HitPart
end end end end break
end end end return v122(v364,v365)
end end end)
setreadonly(v121,true)
RunService.Heartbeat:Connect(function(v367) local v368=0
    while true do if (v368==0) then if (v367>0.5) then return
            end for v1745,v1746 in Players:GetPlayers() do if (v1746.Character and v1746.Character:FindFirstChild("HumanoidRootPart")) then local v1966=0
                local v1967
                local v1968
                while true do if (v1966==0) then v1967=v1746.Character.HumanoidRootPart
                        if  not v32[v1746] then v32[v1746]={PreviousPosition=v1967.Position,Velocity=Vector3.zero}
                        end v1966=1
                    end if (v1966==2) then v1968.PreviousPosition=v1967.Position
                    break
                end if (v1966==1) then local v2212=0
                while true do if (v2212==0) then v1968=v32[v1746]
                        v1968.Velocity=(v1967.Position-v1968.PreviousPosition)/v367
                    end if (v2212==1) then v1966=2
                    break
end end end end end end break
end end end)
Players.PlayerRemoving:Connect(function(v369) v32[v369]=nil
end)
RunService.RenderStepped:Connect(function() if (Config.TargetAim.Enabled and (Config.TargetAim.Target~="None")) then local v1251=0
        local v1252
        while true do if (v1251==0) then v1252=Players:FindFirstChild(Config.TargetAim.Target)
                if (v1252 and v1252.Character) then local v2071=0
                    local v2072
                    while true do if (v2071==0) then v2072=v1252.Character:FindFirstChild(Config.TargetAim.HitPart)
                            if (v2072 and Config.TargetAim.DotCircle) then local v2416=0
                                local v2417
                                local v2418
                                local v2419
                                local v2420
                                while true do if (v2416==0) then v2417=(v32[v1252] and v32[v1252].Velocity) or v2072.AssemblyLinearVelocity
                                        v2418=(Config.TargetAim.AutoPredict and v120) or Config.TargetAim.Prediction
                                    end if (v2416==1) then v2419,v2420=Camera:WorldToViewportPoint(v2072.Position + (v2417 * v2418) )
                                    if v2420 then local v2527=0
                                        while true do if (v2527==0) then dotCircle.Position=Vector2.new(v2419.X,v2419.Y)
                                                dotCircle.Visible=true
                                                break
                                        end end else dotCircle.Visible=false
                                        end break
                                end end else dotCircle.Visible=false
                                end break
                        end end else dotCircle.Visible=false
                        end break
                end end else dotCircle.Visible=false
            end end)
            UIS.InputBegan:Connect(function(v371,v372) local v373=0
                local v374
                while true do if (v373==0) then v374=0
                        while true do if (v374==0) then if v372 then return
                                end if ((v371.UserInputType==Enum.UserInputType.MouseButton1) or (v371.UserInputType==Enum.UserInputType.Touch)) then v34=true
                            end break
                    end end break
        end end end)
        UIS.InputEnded:Connect(function(v375,v376) local v377=0
            while true do if (v377==0) then if v376 then return
                    end if ((v375.UserInputType==Enum.UserInputType.MouseButton1) or (v375.UserInputType==Enum.UserInputType.Touch)) then v34=false
                end break
    end end end)
    RunService.Heartbeat:Connect(function(v378) v39=false
        local v379=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local v380=LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local v381=v379 and v379.CFrame
        if (Config.TargetAim.Enabled and (Config.TargetAim.Target~="None")) then local v1254=0
            local v1255
            while true do if (v1254==0) then v1255=Players:FindFirstChild(Config.TargetAim.Target)
                    if (v1255 and v1255.Character and v1255.Character:FindFirstChildOfClass("Humanoid")) then local v2074=v1255.Character:FindFirstChildOfClass("Humanoid")
                        local v2075=math.round(v2074.Health)
                        local v2076=v33[v1255.Name]
                        if ((v2076~=nil) and (v2075<v2076)) then if Config.HitEffects.HitSounds then v117()
                            end if Config.HitEffects.HitNotifications then Rayfield:Notify({Title="BBG AIM",Content="Hit: "   .. v1255.Name   .. " HP:"   .. v2075 ,Duration=Config.HitEffects.HitNotificationsTime})
                        end if Config.HitEffects.HitChams.Enabled then v118(v1255)
                end end v33[v1255.Name]=v2075
            end break
end end end if  not v379 then return
end if (Config.TargetAim.Enabled and (Config.TargetAim.Target~="None") and Config.TargetAim.Tracer) then local v1256=0
local v1257
while true do if (v1256==0) then v1257=Players:FindFirstChild(Config.TargetAim.Target)
        if (v1257 and v1257.Character and v1257.Character:FindFirstChild("Head")) then local v2078=0
            local v2079
            local v2080
            while true do if (v2078==0) then v2079,v2080=Camera:WorldToViewportPoint(v1257.Character.Head.Position)
                    if v2080 then local v2422=UIS:GetMouseLocation()
                        if ((Config.TargetAim.TracerPosition=="Tool") and v380 and v380:FindFirstChild("Handle")) then local v2471=Camera:WorldToViewportPoint(v380.Handle.Position)
                            v2422=Vector2.new(v2471.X,v2471.Y)
                        end tracerFill.From=v2422
                        tracerOutline.From=v2422
                        tracerFill.To=Vector2.new(v2079.X,v2079.Y)
                        tracerOutline.To=Vector2.new(v2079.X,v2079.Y)
                        tracerFill.Visible=true
                        tracerOutline.Visible=true
                        tracerFill.Color=Config.TargetAim.TracerFillColor
                        tracerOutline.Color=Config.TargetAim.TracerOutlineColor
                    else tracerFill.Visible=false
                        tracerOutline.Visible=false
                    end break
        end end end break
end end else tracerFill.Visible=false
    tracerOutline.Visible=false
end if (Config.TargetAim.Strafe and (Config.TargetAim.Target~="None")) then local v1260=Players:FindFirstChild(Config.TargetAim.Target)
if (v1260 and v1260.Character and v1260.Character:FindFirstChild("Head") and  not v1260.Character:FindFirstChild("ForceField")) then if  not v113(v1260) then local v1969=0
        local v1970
        local v1971
        local v1972
        local v1973
        local v1974
        local v1975
        while true do if (v1969==0) then v39=true
                v1970=v1260.Character.Head.Position
                v1971=v30[v1260] or v1970
            end if (v1969==1) then v1972=(v1970-v1971)/v378
            v1973=0.5
            v31[v1260]=((v31[v1260] or Vector3.zero) * v1973) + (v1972 * (1 -v1973))
            v1969=2
        end if (3==v1969) then v1975=v1970 + (v31[v1260] * Config.TargetAim.StrafePrediction) + v1974
        v379.CFrame=CFrame.lookAt(v1975,v1970)
        if Config.TargetAim.Spoofer then RunService:BindToRenderStep("RestoreStrafe",199 ,function() local v2435=0
                while true do if (0==v2435) then v379.CFrame=v381
                        RunService:UnbindFromRenderStep("RestoreStrafe")
                        break
            end end end)
        end v1969=4
    end if (v1969==4) then if Config.TargetAim.VisualizeStrafe then dummyRig:SetPrimaryPartCFrame(v379.CFrame)
        highlight.Enabled=true
        v110(dummyRig,0)
        v111(dummyRig,Config.TargetAim.VisualizeStrafeInlineColor)
        highlight.FillColor=Config.TargetAim.VisualizeStrafeInlineColor
        highlight.OutlineColor=Config.TargetAim.VisualizeStrafeOutlineColor
    else local v2373=0
        while true do if (v2373==0) then highlight.Enabled=false
                dummyRig:SetPrimaryPartCFrame(CFrame.new(9999 ,9999 ,9999))
            end if (v2373==1) then v110(dummyRig,1)
            break
end end end if (v380 and MainRemote) then local v2374=0
local v2375
local v2376
while true do if (v2374==0) then v2375=v1970 + (v31[v1260] * Config.TargetAim.StrafePrediction)
        v2376={"ShootGun",v380:FindFirstChild("Handle"),(v380:FindFirstChild("Handle") and v380.Handle.Position) or Vector3.zero ,v2375,v1260.Character.Head,Vector3.zero}
        v2374=1
    end if (v2374==1) then if ((Config.TargetAim.AutoFire or v34) and v380:FindFirstChild("Handle")) then MainRemote:FireServer(unpack(v2376))
    end break
end end end break
end if (v1969==2) then v30[v1260]=v1970
v1974=nil
if (Config.TargetAim.StrafeMethod=="Orbit") then v1974=Vector3.new(math.cos(tick() * 10 ) * 10 ,0 ,math.sin(tick() * 10 ) * 10 )
else v1974=Vector3.new(math.random( -15,15 ),math.random( -15,15 ),math.random( -15,15 ))
end v1969=3
end end end end elseif  not Config.KillAura.Active then local v1747=0
while true do if (v1747==0) then dummyRig:SetPrimaryPartCFrame(CFrame.new(9999 ,9999 ,9999))
        highlight.Enabled=false
        break
end end end if (Config.TargetAim.AutoStomp and (Config.TargetAim.Target~="None")) then local v1261=0
local v1262
while true do if (0==v1261) then v1262=Players:FindFirstChild(Config.TargetAim.Target)
        if (v1262 and v113(v1262) and MainRemote) then local v2082=0
            local v2083
            local v2084
            while true do if (v2082==1) then if (v2084==false) then local v2436=0
                        while true do if (v2436==1) then MainRemote:FireServer("Stomp")
                                break
                            end if (v2436==0) then v379.CFrame=CFrame.new(v1262.Character.UpperTorso.Position + Vector3.new(0,3 ,0) )
                            RunService:BindToRenderStep("RestoreStomp",199 ,function() local v2517=0
                                while true do if (v2517==0) then v379.CFrame=v381
                                        RunService:UnbindFromRenderStep("RestoreStomp")
                                        break
                            end end end)
                end end end break
            end if (v2082==0) then local v2323=0
            while true do if (v2323==0) then v2083=v1262.Character and v1262.Character:FindFirstChild("BodyEffects")
                    v2084=v2083 and v2083:FindFirstChild("SDeath") and v2083.SDeath.Value
                    v2323=1
                end if (v2323==1) then v2082=1
                break
end end end end end break
end end end if (Config.KillAura.Enabled and Config.KillAura.Active and v380 and v380:FindFirstChild("Handle")) then local v1263,v1264=math.huge,nil
for v1463,v1464 in pairs(Players:GetPlayers()) do if ((v1464~=LocalPlayer) and  not Config.KillAura.Whitelist[v1464.Name] and v1464.Character and v1464.Character:FindFirstChild("Head")) then if ( not v113(v1464) and v112(v1464)) then local v2085=0
            local v2086
            while true do if (v2085==0) then v2086=(v379.Position-v1464.Character.Head.Position).Magnitude
                    if ((v2086<v1263) and (v2086<=Config.KillAura.Range)) then local v2437=0
                        while true do if (v2437==0) then v1263=v2086
                                v1264=v1464
                                break
                    end end end break
end end end end end if (v1264 and v1264.Character and v1264.Character:FindFirstChild("Head")) then local v1748=0
local v1749
while true do if (v1748==1) then v1749=(Config.KillAura.Silent and Vector3.new(0 , -12,0 )) or Vector3.zero
        if MainRemote then MainRemote:FireServer("ShootGun",v380.Handle,v380.Handle.CFrame.Position + v1749 ,v1264.Character.Head.Position + v1749 ,v1264.Character.Head,Vector3.new(0 ,0 , -1))
        end break
    end if (v1748==0) then v379.CFrame=CFrame.lookAt(v379.Position,v1264.Character.Head.Position)
    if Config.KillAura.Visualize then local v2217=0
        while true do if (0==v2217) then hitPart.Transparency=0
                hitPart.Size=Vector3.new(0.2 ,104.-102 ,(v379.Position-v1264.Character.Head.Position).Magnitude)
                v2217=1
            end if (1==v2217) then hitPart.CFrame=CFrame.lookAt(v379.Position,v1264.Character.Head.Position) * CFrame.new(0 ,0 , -hitPart.Size.Z/2 )
            break
    end end else hitPart.Transparency=1
    end v1748=1
end end else hitPart.Transparency=1
end end if (Config.TargetAim.Autokill and (Config.TargetAim.Target~="None") and  not Config.TargetAim.Strafe) then local v1265=0
local v1266
while true do if (v1265==0) then v1266=Players:FindFirstChild(Config.TargetAim.Target)
        if (v1266 and v1266.Character and LocalPlayer.Character) then local v2088=v1266.Character:FindFirstChild("Head")
            if (v2088 and v380 and v380:FindFirstChild("Handle") and MainRemote) then if ( not v113(v1266) and  not v1266.Character:FindFirstChild("ForceField")) then local v2377=0
                    while true do if (v2377==0) then v379.CFrame=CFrame.lookAt(v1266.Character.Head.Position + Vector3.new(math.random( -15,15 ),math.random( -15,15 ),math.random( -15,15)) ,v1266.Character.Head.Position)
                            MainRemote:FireServer("ShootGun",v380.Handle,v380.Handle.Position,v1266.Character.Head.Position,v2088,Vector3.new(0,1 ,0 ))
                            v2377=1
                        end if (v2377==1) then if Config.TargetAim.Spoofer then RunService:BindToRenderStep("RestoreAK",199,function() local v2529=0
                                local v2530
                                while true do if (v2529==0) then v2530=0
                                        while true do if (v2530==0) then v379.CFrame=v381
                                                RunService:UnbindFromRenderStep("RestoreAK")
                                                break
                                        end end break
                            end end end)
                        end break
    end end end end end break
end end end end)
RunService.Heartbeat:Connect(function() if  not Config.HitboxExpander.Enabled then return
    end for v1054,v1055 in pairs(Players:GetPlayers()) do local v1056=0
    local v1057
    local v1058
    local v1059
    while true do if (v1056==1) then v1059=nil
            while true do if (v1057==2) then if  not v1059 then continue
                    end v1059.Size=Vector3.new(Config.HitboxExpander.Size,Config.HitboxExpander.Size,Config.HitboxExpander.Size)
                    break
                end if (1==v1057) then if  not v1058 then continue
                end v1059=v1058:FindFirstChild("HumanoidRootPart")
                v1057=2
            end if (0==v1057) then if (v1055==LocalPlayer) then continue
            end v1058=v1055.Character
    end end break
end if (v1056==0) then v1057=0
v1058=nil
end end end end)
local Window=Rayfield:CreateWindow({Name="BBG Panel",LoadingTitle="AHK Mobile",LoadingSubtitle="By BBG",ConfigurationSaving={Enabled=false},KeySystem=false})
local v125=Window:CreateTab("Discord",4483362458 )
v125:CreateSection("BBG Community")
v125:CreateLabel("discord.gg/abhtkBceun")
v125:CreateButton({Name="Copy Discord Link",Callback=function() local v382=0
    while true do if (v382==0) then setclipboard("https://discord.gg/abhtkBceun")
            Rayfield:Notify({Title="BBG Panel",Content="Discord link copied!",Duration=3 })
            break
end end end})
local v126=Window:CreateTab("Soru",4483362458 )
v126:CreateSection("Target")
local v127={"None"}
for v383,v384 in ipairs(Players:GetPlayers()) do if (v384~=LocalPlayer) then table.insert(v127,v384.Name)
end end local v128=v126:CreateDropdown({Name="Select Target",Options=v127,CurrentOption={"None"},MultipleOptions=false,Flag="Soru_TargetDrop",Callback=function(v385) local v386=0
local v387
while true do if (v386==0) then v387=((type(v385)=="table") and v385[1]) or v385
        v15=((v387=="None") and nil) or v387
        break
end end end})
v126:CreateButton({Name="Refresh Player List",Callback=function() local v388={"None"}
    for v1060,v1061 in ipairs(Players:GetPlayers()) do if (v1061~=LocalPlayer) then table.insert(v388,v1061.Name)
    end end v128:Refresh(v388,true)
    Rayfield:Notify({Title="Soru Silent",Content="Player list refreshed",Duration=2  })
end})
v126:CreateSection("Soru Silent")
v126:CreateToggle({Name="Soru Silent",CurrentValue=false,Flag="SoruSilent_Main",Callback=function(v389) local v390=0
    while true do if (v390==0) then aimEnabled=v389
            Rayfield:Notify({Title="Soru Silent",Content=(v389 and "Soru Silent ON") or "Soru Silent OFF" ,Duration=2})
            break
end end end})
v126:CreateToggle({Name="Soru Silent Window",CurrentValue=false,Flag="SoruSilent_Window",Callback=function(v391) if _SoruMiniGui then _SoruMiniGui.Enabled=v391
end end})
v126:CreateSection("Distance")
v126:CreateSlider({Name="Max Distance",Range={100 ,2000},Increment=50 ,Suffix=" studs",CurrentValue=2000 ,Flag="Soru_MaxDist",Callback=function(v392) frameTime=v392
end})
v126:CreateSection("Infinity Soru")
v126:CreateToggle({Name="Infinite Soru",CurrentValue=false,Flag="Soru_InfSoru",Callback=function(v393) local v394=0
    while true do if (0==v394) then infiniteSoruEnabled=v393
            if (v393 and LocalPlayer.Character) then pcall(function() LocalPlayer.Character:SetAttribute("FlashstepCooldown",1)
                end)
            end v394=1
        end if (v394==1) then Rayfield:Notify({Title="Infinite Soru",Content=(v393 and "ON â No cooldown") or "OFF" ,Duration=2 })
        break
end end end})
v126:CreateSection("AHK Soru")
local v129=nil
local v130={}
local v131={Melee=95.-80 ,Fruit=421.-406 ,Sword=0.15  ,Gun=64.-49 }
local v132=0.0167
local v133=0.0334
local v134=0.1
local v135=0.2
local function v136(v395) local v396=(v395-v134)/(v135-v134)
    v396=math.clamp(v396,0,1  )
    return v132 + ((v133-v132) * v396)
end local v137={bg=Color3.fromRGB(8 ,8 ,8 ),card=Color3.fromRGB(18,18 ,18 ),cardHov=Color3.fromRGB(26 ,26 ,26),titleBg=Color3.fromRGB(12 ,12 ,12 ),accent=Color3.fromRGB(220 ,30 ,30 ),accentDk=Color3.fromRGB(140 ,15 ,15 ),white=Color3.fromRGB(255,255,255 ),whiteDim=Color3.fromRGB(180 ,180 ,180 ),grey=Color3.fromRGB(90 ,90 ,90),greyLight=Color3.fromRGB(120 ,120 ,120 ),btnOff=Color3.fromRGB(22 ,22 ,22),stepOff=Color3.fromRGB(22,22 ,22 ),minusRed=Color3.fromRGB(220 ,30,30 ),shadow=Color3.fromRGB(0,0 ,0  ),redBtn=Color3.fromRGB(180 ,20 ,20 )}
local function v138(v397,v398,v399,v400,v401) local v402=0
    local v403
    while true do if (1==v402) then v403.BorderSizePixel=0
            v403.Parent=v397
        end if (v402==2) then if v401 then Instance.new("UICorner",v403).CornerRadius=UDim.new(0  ,v401)
        end return v403
    end if (v402==0) then v403=Instance.new("Frame")
    v403.Size,v403.Position,v403.BackgroundColor3=v398,v399,v400 or v137.bg
end end end local function v139(v404,v405,v406,v407,v408,v409,v410) local v411=0
local v412
while true do if (4==v411) then return v412
    end if (v411==0) then v412=Instance.new("TextLabel")
    v412.Size,v412.Position=v406,v407
end if (v411==3) then v412.TextXAlignment=Enum.TextXAlignment.Left
v412.Parent=v404
end if (2==v411) then v412.Font=(v410 and Enum.Font.GothamBold) or Enum.Font.Gotham
v412.BackgroundTransparency,v412.BorderSizePixel=1 ,0
end if (v411==1) then v412.Text,v412.TextColor3=v405,v408 or v137.white
v412.TextSize=v409 or 13
end end end local function v140(v413,v414,v415,v416,v417,v418,v419) local v420=Instance.new("TextButton")
v420.Size,v420.Position=v415,v416
v420.Text,v420.TextColor3=v414,v418 or v137.white
v420.TextSize,v420.Font=12,Enum.Font.GothamBold
v420.BackgroundColor3=v417 or v137.card
v420.BorderSizePixel,v420.AutoButtonColor=0  ,false
v420.Parent=v413
if v419 then Instance.new("UICorner",v420).CornerRadius=UDim.new(0  ,v419)
end return v420
end local function v141(v432,v433) local v434=0
local v435
while true do if (0==v434) then v435=Instance.new("UIStroke",v432)
        v435.Color=v137.accent
    end if (v434==2) then return v435
end if (v434==1) then v435.Thickness=v433 or 1.5
v435.Transparency=0
end end end local function v142(v436,v437) local v438=0
local v439
while true do if (v438==0) then v439=Instance.new("UIStroke",v436)
        v439.Color=v137.grey
    end if (v438==1) then v439.Thickness=v437 or 1
    v439.Transparency=0.4
    v438=2
end if (v438==2) then return v439
end end end local function v143(v440) local v441=0
local v442
local v443
local v444
while true do if (v441==1) then v443=Instance.new("UIGradient",v440)
        v443.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(230,40 ,40 )),ColorSequenceKeypoint.new(0.5  ,Color3.fromRGB(180 ,20 ,20 )),ColorSequenceKeypoint.new(1,Color3.fromRGB(120 ,10 ,10 ))})
        v441=2
    end if (v441==3) then v444=v440:FindFirstChildOfClass("UIStroke")
    if v444 then v444:Destroy()
    end break
end if (v441==0) then local v1490=0
while true do if (v1490==1) then v441=1
        break
    end if (v1490==0) then v442=v440:FindFirstChildOfClass("UIGradient")
    if v442 then v442:Destroy()
    end v1490=1
end end end if (v441==2) then v443.Rotation=90
v440.TextColor3=v137.accent
end end end local function v144(v445) local v446=0
local v447
local v448
local v449
while true do if (v446==1) then v449=nil
        while true do if (v447==1) then v449=v445:FindFirstChildOfClass("UIStroke")
                if v449 then v449:Destroy()
                end v447=2
            end if (v447==0) then local v1976=0
            while true do if (v1976==1) then v447=1
                    break
                end if (v1976==0) then v448=v445:FindFirstChildOfClass("UIGradient")
                if v448 then v448:Destroy()
                end v1976=1
    end end end if (2==v447) then v445.TextColor3=v137.white
    break
end end break
end if (v446==0) then v447=0
v448=nil
v446=1
end end end local function v145(v450,v451) local v452=0
local v453
local v454
local v455
local v456
while true do if (v452==0) then v453,v454,v455,v456=nil
        v451.InputBegan:Connect(function(v1751) if ((v1751.UserInputType==Enum.UserInputType.Touch) or (v1751.UserInputType==Enum.UserInputType.MouseButton1)) then local v1979=0
                while true do if (0==v1979) then v453=true
                        v454=v1751.Position
                        v1979=1
                    end if (v1979==1) then v455=v450.Position.X.Offset
                    v456=v450.Position.Y.Offset
                    break
    end end end end)
end if (v452==1) then v451.InputChanged:Connect(function(v1752) if (v453 and ((v1752.UserInputType==Enum.UserInputType.MouseMovement) or (v1752.UserInputType==Enum.UserInputType.Touch))) then local v1980=v1752.Position-v454
        local v1981=workspace.CurrentCamera.ViewportSize
        v450.Position=UDim2.new(0 ,math.clamp(v455 + v1980.X ,0  ,v1981.X-v450.AbsoluteSize.X ),0 ,math.clamp(v456 + v1980.Y , -(v450.AbsoluteSize.Y-40),v1981.Y-36 ))
end end)
v451.InputEnded:Connect(function(v1753) if ((v1753.UserInputType==Enum.UserInputType.Touch) or (v1753.UserInputType==Enum.UserInputType.MouseButton1)) then v453=false
end end)
break
end end end local function v146(v457,v458) return (v129~=nil) and (v129.cat==v457) and (v129.skill==v458)
end local function v147(v459,v460) local v461=0
while true do if (v461==0) then if (v129 and (v129.cat==v459) and (v129.skill==v460)) then v129=nil
            return
        end v129={cat=v459,skill=v460}
        break
end end end local function v148() for v1062,v1063 in ipairs(v130) do if v146(v1063.cat,v1063.skill) then v1063.btn.BackgroundColor3=v137.accentDk
v143(v1063.btn)
else local v1496=0
    while true do if (0==v1496) then v1063.btn.BackgroundColor3=v137.btnOff
            v144(v1063.btn)
            break
end end end end end local v149=nil
local function v150() local v462=0
    while true do if (v462==0) then if  not v149 then return
            end if  not v129 then local v1890=0
            while true do if (v1890==0) then v149.Text="Selected: None"
                    v149.TextColor3=v137.greyLight
                    break
            end end else v149.Text="Selected: "   .. v129.cat   .. "  ["   .. v129.skill   .. "]"
                v149.TextColor3=v137.white
            end break
end end end local v151=Instance.new("ScreenGui")
v151.Name="BBG_SoruDetectorV10"
v151.ResetOnSpawn=false
v151.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
v151.Enabled=false
v151.Parent=game:GetService("CoreGui")
local v158=310
local v159=410
local v160=v138(v151,UDim2.new(0  ,v158,0 ,v159),UDim2.new(0.5, -v79 ,1664.-1642 ,0 ),v137.bg,12 )
v141(v160,2.4 )
v160.ClipsDescendants=true
local v162=v138(v160,UDim2.new(1 ,0,0 ,40 ),UDim2.new(0,0 ,0 ,0),v137.titleBg,12)
local v163=v138(v162,UDim2.new(1,0,0 ,1  ),UDim2.new(0 ,0 ,1  , -1),v137.accent,0)
v163.BackgroundTransparency=1844.-1841
local v165=Instance.new("TextLabel")
v165.Size=UDim2.new(1 , -60,1,0 )
v165.Position=UDim2.new(0 ,14 ,0 ,0  )
v165.Text="SORU DETECTOR"
v165.TextColor3=v137.accent
v165.TextSize=13
v165.Font=Enum.Font.GothamBold
v165.BackgroundTransparency=1
v165.BorderSizePixel=0
v165.TextXAlignment=Enum.TextXAlignment.Left
v165.Parent=v162
local v179=v140(v162,"â",UDim2.new(0 ,30 ,0 ,30 ),UDim2.new(1 , -36,725.-720 , -15),v137.redBtn,v137.white,6 )
v179.TextSize=14
v141(v179,1)
v145(v160,v162)
local v181=false
v179.MouseButton1Click:Connect(function() local v463=0
    while true do if (v463==1) then v179.Text=(v181 and "+") or "â"
            v179.TextColor3=v137.white
            break
        end if (v463==0) then v181= not v181
        v160.Size=(v181 and UDim2.new(0,v158,0,40)) or UDim2.new(0,v158,0 ,v159)
end end end)
local v182=v138(v160,UDim2.new(1 , -16,0,30 ),UDim2.new(0 ,8 ,0,48 ),v137.card,8 )
v142(v182,1)
local v183=Instance.new("TextLabel",v182)
v183.Size=UDim2.new(1 , -12,1  ,0  )
v183.Position=UDim2.new(0 ,8 ,0 ,0 )
v183.Text="Starter: None"
v183.TextColor3=v137.greyLight
v183.TextSize=11
v183.Font=Enum.Font.Gotham
v183.BackgroundTransparency=1
v183.BorderSizePixel=0
v183.TextXAlignment=Enum.TextXAlignment.Center
v149=v183
local v196={{cat="Melee",skills={"Z","X","C"},y=88 },{cat="Fruit",skills={"Z","X","C","V","F"},y=172},{cat="Sword",skills={"Z","X"},y=256 },{cat="Gun",skills={"Z","X"},y=340}}
local v197=76
for v464,v465 in ipairs(v196) do local v466=0
    local v467
    local v468
    local v469
    local v470
    local v471
    local v472
    local v473
    local v474
    while true do if (v466==8) then v474.TextSize=13
            v141(v474,1 )
            v473.MouseButton1Click:Connect(function() v131[v467]=math.max(v134,math.floor(((v131[v467] -(0.01)) * 100) + (683.-678) )/100 )
                v472.Text=string.format("%.2f",v131[v467])
            end)
            v474.MouseButton1Click:Connect(function() local v1756=0
                while true do if (v1756==0) then v131[v467]=math.min(v135,math.floor(((v131[v467] + (0.01)) * 100) + (36.-31) )/100 )
                        v472.Text=string.format("%.2f",v131[v467])
                        break
            end end end)
            break
        end if (v466==7) then v472.TextXAlignment=Enum.TextXAlignment.Left
        v473=v140(v468,"â",UDim2.new(0,22 ,0 ,18 ),UDim2.new(0,90 ,0  ,40 ),v137.redBtn,v137.white,4 )
        v473.TextSize=13
        v141(v473,1  )
        v474=v140(v468,"+",UDim2.new(0 ,22,0 ,18 ),UDim2.new(0 ,116 ,0,40 ),v137.redBtn,v137.white,4)
    end if (v466==2) then v469.BackgroundTransparency=1
    v469.BorderSizePixel=0
    v469.TextXAlignment=Enum.TextXAlignment.Left
    v469.Parent=v468
    v470=68
end if (v466==5) then v471.TextXAlignment=Enum.TextXAlignment.Left
v472=Instance.new("TextLabel",v468)
v472.Size=UDim2.new(0,40 ,0 ,14 )
v472.Position=UDim2.new(0 ,46,0 ,44)
v472.Text=string.format("%.2f",v131[v467])
v466=6
end if (3==v466) then local v1515=0
while true do if (v1515==1) then v471.Size=UDim2.new(0  ,36 ,0 ,14 )
        v471.Position=UDim2.new(0 ,8 ,0 ,44 )
        v1515=2
    end if (v1515==0) then for v2093,v2094 in ipairs(v465.skills) do local v2095=v140(v468,v2094,UDim2.new(0  ,34,0 ,26),UDim2.new(0  ,v470,0,4 ),v137.btnOff,v137.white,7)
        v2095.TextSize=11
        v142(v2095,1 )
        table.insert(v130,{btn=v2095,cat=v467,skill=v2094})
        v2095.MouseButton1Click:Connect(function() local v2172=0
            while true do if (1==v2172) then v150()
                    break
                end if (0==v2172) then v147(v467,v2094)
                v148()
    end end end)
    v470=v508
end v471=Instance.new("TextLabel",v468)
end if (2==v1515) then v471.Text="Delay:"
v466=4
break
end end end if (v466==1) then v469.Position=UDim2.new(0 ,8,0 ,6)
v469.Text=v467
v469.TextColor3=v137.white
v469.TextSize=11
v469.Font=Enum.Font.GothamBold
v466=2
end if (v466==6) then v472.TextColor3=v137.white
v472.TextSize=9
v472.Font=Enum.Font.GothamBold
v472.BackgroundTransparency=1
v472.BorderSizePixel=0
v466=7
end if (v466==0) then v467=v465.cat
v468=v138(v160,UDim2.new(1, -16,0 ,v197),UDim2.new(0 ,8,0 ,v465.y),v137.card,8 )
v142(v468,1 )
v469=Instance.new("TextLabel",v468)
v469.Size=UDim2.new(0,56 ,0 ,18 )
end if (v466==4) then v471.TextColor3=v137.white
v471.TextSize=9
v471.Font=Enum.Font.Gotham
v471.BackgroundTransparency=1
v471.BorderSizePixel=0
v466=5
end end end local v198={"combat","step","electro","fishman","dragon","human","karate","claw"}
local v199={"gun","rifle","musket","cannon","kabucha"}
local function v200(v475) local v476=0
    local v477
    local v478
    while true do if (v476==2) then for v1757,v1758 in ipairs(v198) do if string.find(v478,v1758) then return "Melee"
            end end for v1759,v1760 in ipairs(v199) do if string.find(v478,v1760) then return "Gun"
    end end v476=3
end if (v476==1) then if v477 then local v1894=0
    while true do if (v1894==0) then if ((v477=="Demon Fruit") or (v477=="Fruit")) then return "Fruit"
            end return v477
end end end v478=string.lower(v475.Name)
end if (v476==0) then if ( not v475 or  not v475:IsA("Tool")) then return "None"
end v477=v475:GetAttribute("WeaponType")
v476=1
end if (v476==3) then local v1539=0
while true do if (0==v1539) then if string.find(v478,"fruit") then return "Fruit"
        end return "Sword"
end end end end end local function v201() local v479=0
local v480
local v481
while true do if (v479==2) then return v200(v481)
    end if (v479==0) then v480=LocalPlayer.Character
    if  not v480 then return "None"
    end v479=1
end if (v479==1) then v481=v480:FindFirstChildOfClass("Tool")
if  not v481 then return "None"
end v479=2
end end end local function v202(v482) local v483=0
local v484
local v485
local v486
local v487
while true do if (2==v483) then if  not v487 then return false
        end v486:EquipTool(v487)
        for v1761=1,17  do if (v201()==v482) then return true
            end task.wait()
        end return v201()==v482
    end if (v483==0) then if (v201()==v482) then return true
    end v484=LocalPlayer.Character
    v485=LocalPlayer.Backpack
    if ( not v484 or  not v485) then return false
    end v483=1
end if (v483==1) then v486=v484:FindFirstChildOfClass("Humanoid")
if  not v486 then return false
end v487=nil
for v1762,v1763 in ipairs(v485:GetChildren()) do if (v1763:IsA("Tool") and (v200(v1763)==v482)) then v487=v1763
        break
end end v483=2
end end end local v203=game:GetService("VirtualInputManager")
local function v204(v488) local v489=Enum.KeyCode[v488]
    if  not v489 then return
    end v203:SendKeyEvent(true,v489,false,game)
    v203:SendKeyEvent(false,v489,false,game)
    v203:SendKeyEvent(true,v489,false,game)
    task.wait()
    v203:SendKeyEvent(false,v489,false,game)
end local v205=false
local function v206() local v490=0
    local v491
    while true do if (v490==0) then if  not v129 then return
            end if v205 then return
        end v490=1
    end if (v490==1) then v491={cat=v129.cat,skill=v129.skill}
    task.spawn(function() local v1764=0
        local v1765
        while true do if (1==v1764) then if v1765 then local v2222=0
                    local v2223
                    while true do if (v2222==1) then v204(v491.skill)
                            break
                        end if (0==v2222) then local v2441=0
                        while true do if (v2441==0) then v2223=v136(v131[v491.cat])
                                task.wait(v2223)
                            end if (v2441==1) then v2222=1
                            break
        end end end end end task.wait(0.05 )
        v1764=2
    end if (v1764==2) then v205=false
    break
end if (0==v1764) then v205=true
v1765=v202(v491.cat)
end end end)
break
end end end local function v207(v492) local v493=v492:WaitForChild("Humanoid",5 )
if  not v493 then return
end v493.AnimationPlayed:Connect(function(v1064) if  not v151.Enabled then return
end local v1065=v1064.Animation.AnimationId
local v1066=v1065:match("%d+") or v1065
if ((v1064.Name=="FlashStepRegular") or (v1064.Name=="FlashStepDraco") or (v1066=="17555632156") or (v1066=="18461649274")) then v206()
end end)
end if LocalPlayer.Character then v207(LocalPlayer.Character)
end LocalPlayer.CharacterAdded:Connect(function(v494) v207(v494)
end)
v126:CreateToggle({Name="Soru Detector",CurrentValue=false,Flag="AHK_SoruDetector",Callback=function(v495) local v496=0
    while true do if (0==v496) then v151.Enabled=v495
            Rayfield:Notify({Title="Soru Detector",Content=(v495 and "ON â Soru Detector UI visible") or "OFF â UI hidden" ,Duration=2 })
            break
end end end})
Players.PlayerRemoving:Connect(function(v497) if (v15==v497.Name) then v15=nil
    end local v498={"None"}
    for v1067,v1068 in ipairs(Players:GetPlayers()) do if ((v1068~=LocalPlayer) and (v1068~=v497)) then table.insert(v498,v1068.Name)
    end end pcall(function() v128:Refresh(v498,true)
end)
end)
Players.PlayerAdded:Connect(function() local v499={"None"}
    for v1069,v1070 in ipairs(Players:GetPlayers()) do if (v1070~=LocalPlayer) then table.insert(v499,v1070.Name)
    end end pcall(function() v128:Refresh(v499,true)
end)
end)
local v208=false
local function v209(v500) local v501=0
    while true do if (v501==0) then if  not v208 then return
            end pcall(function() v500:SetAttribute("FlashstepCooldown",1 )
        end)
        break
end end end LocalPlayer.CharacterAdded:Connect(function(v502) v209(v502)
end)
if LocalPlayer.Character then v209(LocalPlayer.Character)
end task.spawn(function() while true do local v1071=0
    while true do if (v1071==0) then task.wait(0.5 )
            if v208 then pcall(function() local v2097=0
                    local v2098
                    while true do if (v2097==0) then v2098=LocalPlayer.Character
                            if v2098 then v2098:SetAttribute("FlashstepCooldown",1  )
                            end break
                end end end)
            end break
end end end end)
do local v503=Color3.fromRGB(220,30 ,30)
    local v504=Color3.fromRGB(100 ,10 ,10)
    local v505=Color3.fromRGB(180,30 ,30 )
    local v506=Color3.fromRGB(100 ,10 ,10 )
    local v507=Color3.fromRGB(180,30 ,30 )
    _SoruMiniGui=Instance.new("ScreenGui")
    _SoruMiniGui.Name="BBGSoruMini"
    _SoruMiniGui.ResetOnSpawn=false
    _SoruMiniGui.IgnoreGuiInset=true
    _SoruMiniGui.DisplayOrder=1002
    _SoruMiniGui.Enabled=false
    _SoruMiniGui.Parent=game:GetService("CoreGui")
    local v514=Instance.new("Frame",_SoruMiniGui)
    v514.Size=UDim2.new(0,155 ,0,185)
    v514.Position=UDim2.new(0 ,10 ,0.5, -80)
    v514.BackgroundColor3=Color3.fromRGB(12 ,12 ,18 )
    v514.BorderSizePixel=0
    v514.Active=true
    v514.Draggable=true
    Instance.new("UICorner",v514).CornerRadius=UDim.new(0,10 )
    local v522=Instance.new("UIStroke",v514)
    v522.Color=v503
    v522.Thickness=1.5
    v522.Transparency=0.2
    local v526=Instance.new("TextLabel",v514)
    v526.Size=UDim2.new(1 , -28,0 ,22 )
    v526.Position=UDim2.new(0,0,0 ,4 )
    v526.BackgroundTransparency=1
    v526.Text="Soru Silent"
    v526.TextColor3=v503
    v526.TextStrokeColor3=Color3.fromRGB(0,0  ,0)
    v526.TextStrokeTransparency=0.4
    v526.Font=Enum.Font.GothamBold
    v526.TextSize=12
    local v537=false
    local v538=185
    local v539=Instance.new("TextButton",v514)
    v539.Size=UDim2.new(0 ,22,0  ,22 )
    v539.Position=UDim2.new(1 , -24,0,4 )
    v539.Text="â"
    v539.TextColor3=v503
    v539.TextStrokeColor3=Color3.fromRGB(0  ,0,0 )
    v539.TextStrokeTransparency=0.4
    v539.Font=Enum.Font.GothamBold
    v539.TextSize=14
    v539.BackgroundColor3=Color3.fromRGB(30 ,30 ,42 )
    v539.BorderSizePixel=0
    Instance.new("UICorner",v539).CornerRadius=UDim.new(0 ,6 )
    local v551=Instance.new("Frame",v514)
    v551.Size=UDim2.new(1,0 ,1, -30)
    v551.Position=UDim2.new(0,0  ,0 ,30)
    v551.BackgroundTransparency=1
    v551.ClipsDescendants=true
    v539.MouseButton1Click:Connect(function() local v1072=0
        local v1073
        while true do if (v1072==0) then v1073=0
                while true do if (v1073==1) then v514.Size=(v537 and UDim2.new(0,155 ,0  ,30 )) or UDim2.new(0 ,155 ,0  ,v538)
                        v551.Visible= not v537
                        break
                    end if (0==v1073) then v537= not v537
                    v539.Text=(v537 and "+") or "â"
                    v1073=1
            end end break
end end end)
local v556=Instance.new("TextLabel",v551)
v556.Size=UDim2.new(1  , -10,0 ,14)
v556.Position=UDim2.new(0 ,6 ,0,2 )
v556.BackgroundTransparency=1
v556.Text="Target: None"
v556.TextColor3=Color3.fromRGB(160 ,160 ,170)
v556.Font=Enum.Font.Gotham
v556.TextSize=11
v556.TextXAlignment=Enum.TextXAlignment.Left
local v567=Instance.new("ScrollingFrame",v551)
v567.Size=UDim2.new(1  , -8,0  ,70)
v567.Position=UDim2.new(0  ,4 ,0,20 )
v567.BackgroundColor3=Color3.fromRGB(20 ,20,22 )
v567.BorderSizePixel=0
v567.ScrollBarThickness=3
v567.ScrollBarImageColor3=Color3.fromRGB(100 ,100 ,110 )
v567.AutomaticCanvasSize=Enum.AutomaticSize.Y
v567.CanvasSize=UDim2.new(0 ,0 ,0,0 )
Instance.new("UICorner",v567).CornerRadius=UDim.new(0 ,6 )
local v578=Instance.new("UIListLayout",v567)
v578.Padding=UDim.new(0,2)
v578.SortOrder=Enum.SortOrder.LayoutOrder
Instance.new("UIPadding",v567).PaddingTop=UDim.new(0 ,3)
local function v583() local v1074=0
    local v1075
    while true do if (v1074==2) then local v1766=0
            while true do if (v1766==1) then v1075.Font=Enum.Font.Gotham
                    v1074=3
                    break
                end if (v1766==0) then v1075.TextStrokeColor3=Color3.fromRGB(255,255,255 )
                v1075.TextStrokeTransparency=0.7
    end end end if (v1074==1) then v1075.BackgroundColor3=Color3.fromRGB(32,32 ,36 )
    v1075.Text="None"
    v1075.TextColor3=Color3.fromRGB(235,235 ,235 )
end if (v1074==4) then v1075.MouseButton1Click:Connect(function() local v1895=0
    local v1896
    while true do if (v1895==0) then v1896=0
            while true do if (v1896==0) then v15=nil
                    v556.Text="Target: None"
                    break
            end end break
end end end)
for v1897,v1898 in pairs(Players:GetPlayers()) do if (v1898~=LocalPlayer) then local v2106=0
        local v2107
        while true do if (v2106==0) then v2107=Instance.new("TextButton",v567)
                v2107.Size=UDim2.new(1  , -6,0 ,20)
                v2107.BackgroundColor3=Color3.fromRGB(32 ,32 ,36 )
                v2107.Text=v1898.Name
                v2106=1
            end if (1==v2106) then v2107.TextColor3=Color3.fromRGB(235,235 ,235)
            v2107.TextStrokeColor3=Color3.fromRGB(255,255 ,255 )
            v2107.TextStrokeTransparency=0.7
            v2107.Font=Enum.Font.Gotham
        end if (2==v2106) then v2107.TextSize=11
        v2107.BorderSizePixel=0
        Instance.new("UICorner",v2107).CornerRadius=UDim.new(0  ,4 )
        v2107.MouseButton1Click:Connect(function() local v2379=0
            while true do if (v2379==0) then v15=v1898.Name
                    v556.Text="Target: "   .. v1898.Name
                    break
        end end end)
        break
end end end end break
end if (v1074==3) then v1075.TextSize=11
v1075.BorderSizePixel=0
Instance.new("UICorner",v1075).CornerRadius=UDim.new(0 ,4)
v1074=4
end if (0==v1074) then for v1899,v1900 in pairs(v567:GetChildren()) do if v1900:IsA("TextButton") then v1900:Destroy()
end end v1075=Instance.new("TextButton",v567)
v1075.Size=UDim2.new(1  , -6,0 ,20 )
end end end v583()
local v584=Instance.new("TextButton",v551)
v584.Size=UDim2.new(1, -12,0  ,20 )
v584.Position=UDim2.new(0 ,6 ,0,94)
v584.BackgroundColor3=Color3.fromRGB(35 ,35 ,40)
v584.Text="Refresh"
v584.TextColor3=Color3.fromRGB(235 ,235 ,235 )
v584.TextStrokeColor3=Color3.fromRGB(255 ,255 ,255 )
v584.TextStrokeTransparency=1289.-1282
v584.Font=Enum.Font.GothamBold
v584.TextSize=11
v584.BorderSizePixel=0
Instance.new("UICorner",v584).CornerRadius=UDim.new(0,5)
v584.MouseButton1Click:Connect(v583)
local v596=Instance.new("TextButton",v551)
v596.Size=UDim2.new(1 , -12,0 ,34)
v596.Position=UDim2.new(0,6,0  ,118)
v596.TextScaled=true
v596.TextColor3=Color3.new(1,1,1 )
v596.TextStrokeColor3=Color3.fromRGB(0 ,0 ,0 )
v596.TextStrokeTransparency=0.3
v596.BorderSizePixel=0
v596.Font=Enum.Font.GothamBold
v596.AutoButtonColor=false
Instance.new("UICorner",v596).CornerRadius=UDim.new(0 ,9 )
local v607=Instance.new("UIGradient",v596)
v607.Rotation=45
local function v609() v596.Text="Soru  "   .. ((aimEnabled and "ON") or "OFF")
    v607.Color=ColorSequence.new({ColorSequenceKeypoint.new(0 ,(aimEnabled and v504) or v506 ),ColorSequenceKeypoint.new(1  ,(aimEnabled and v505) or v507 )})
end v596.MouseButton1Click:Connect(function() aimEnabled= not aimEnabled
v609()
end)
v609()
local v610,v611,v612=false,nil,nil
v514.InputBegan:Connect(function(v1078) if ((v1078.UserInputType==Enum.UserInputType.Touch) or (v1078.UserInputType==Enum.UserInputType.MouseButton1)) then v610=true
        v611=v1078.Position
        v612=v514.Position
        v1078.Changed:Connect(function() if (v1078.UserInputState==Enum.UserInputState.End) then v610=false
        end end)
end end)
v514.InputChanged:Connect(function(v1079) if (v610 and ((v1079.UserInputType==Enum.UserInputType.Touch) or (v1079.UserInputType==Enum.UserInputType.MouseMovement))) then local v1546=v1079.Position-v611
        v514.Position=UDim2.new(0  ,math.clamp(v612.X.Offset + v1546.X ,0 ,Camera.ViewportSize.X-v514.AbsoluteSize.X ),0 ,math.clamp(v612.Y.Offset + v1546.Y ,0 ,Camera.ViewportSize.Y-v514.AbsoluteSize.Y ))
end end)
_SoruMiniGui.Enabled=false
end local v210=game:GetService("VirtualInputManager")
local v211=false
local v212=400
local v213=0.9
local v214=false
local function v215() local v613=0
    local v614
    local v615
    local v616
    local v617
    local v618
    local v619
    while true do if (v613==2) then v619.MaxForce=9999999
            v619.VelocityConstraintMode=Enum.VelocityConstraintMode.Vector
            v619.VectorVelocity=v617 * v212
            v619.Attachment0=v618
            v613=3
        end if (v613==0) then v614=LocalPlayer.Character
        v615=v614 and v614:FindFirstChild("HumanoidRootPart")
        v616=v614 and v614:FindFirstChild("Humanoid")
        if ( not v615 or  not v616) then return
        end v613=1
    end if (v613==1) then local v1554=0
    while true do if (0==v1554) then v617=(Mouse.Hit.p-v615.Position).Unit
            v616.PlatformStand=true
        end if (v1554==2) then v613=2
        break
    end if (v1554==1) then v618=Instance.new("Attachment",v615)
    v619=Instance.new("LinearVelocity",v615)
end end end if (v613==3) then task.wait(v213)
if v619 then v619:Destroy()
end if v618 then v618:Destroy()
end v616.PlatformStand=false
break
end end end local function v216(v620) v620.AnimationPlayed:Connect(function(v1080) local v1081=0
while true do if (v1081==0) then if  not v211 then return
        end if (v1080.Animation.AnimationId:find("6875496851") or (v1080.Name=="ElectroClawXImpact")) then v214=false
        v1080.Stopped:Connect(function() local v2108=0
            local v2109
            while true do if (v2108==0) then v2109=0
                    while true do if (v2109==0) then if  not v211 then return
                            end if  not v214 then local v2504=0
                            local v2505
                            while true do if (v2504==0) then v2505=0
                                    while true do if (v2505==0) then v214=true
                                            task.spawn(v215)
                                            break
                                    end end break
                        end end end break
                end end break
    end end end)
end break
end end end)
end local function v217(v621) local v622=v621:WaitForChild("Humanoid")
v216(v622)
end LocalPlayer.CharacterAdded:Connect(v217)
if LocalPlayer.Character then v217(LocalPlayer.Character)
end local v218=false
local v219=400
local v220=2
local v221=false
local function v222() local v623=LocalPlayer.Character
    local v624=v623 and v623:FindFirstChild("HumanoidRootPart")
    local v625=v623 and v623:FindFirstChild("Humanoid")
    if ( not v624 or  not v625) then return
    end local v626=(Mouse.Hit.p-v624.Position).Unit
    v625.PlatformStand=true
    local v628=Instance.new("Attachment",v624)
    local v629=Instance.new("LinearVelocity",v624)
    v629.MaxForce=9999999
    v629.VelocityConstraintMode=Enum.VelocityConstraintMode.Vector
    v629.VectorVelocity=v626 * v219
    v629.Attachment0=v628
    task.wait(v220)
    if v629 then v629:Destroy()
    end if v628 then v628:Destroy()
end v625.PlatformStand=false
end local function v223(v635) v635.AnimationPlayed:Connect(function(v1082) if  not v218 then return
    end if ((v1082.Animation.AnimationId:find("14418370048") or v1082.Animation.AnimationId:find("14418367908") or v1082.Name:lower():find("sanguine") or v1082.Name:lower():find("sang")) and  not v1082.Animation.AnimationId:find("14586873525") and  not v1082.Name:lower():find("basic") and  not v1082.Name:lower():find("m1")) then v221=false
    v1082.Stopped:Connect(function() if  not v218 then return
        end if  not v221 then v221=true
        task.spawn(v222)
end end)
end end)
end local function v224(v636) local v637=0
local v638
while true do if (0==v637) then v638=v636:WaitForChild("Humanoid")
        v223(v638)
        break
end end end LocalPlayer.CharacterAdded:Connect(v224)
if LocalPlayer.Character then v224(LocalPlayer.Character)
end local v225=false
local v226=400
local v227=0.6
local v228=false
local function v229() local v639=0
    local v640
    local v641
    local v642
    local v643
    local v644
    local v645
    while true do if (v639==1) then v643=(Mouse.Hit.p-v641.Position).Unit
            v642.PlatformStand=true
            v644=Instance.new("Attachment",v641)
            v645=Instance.new("LinearVelocity",v641)
            v639=2
        end if (v639==2) then v645.MaxForce=9999999
        v645.VelocityConstraintMode=Enum.VelocityConstraintMode.Vector
        v645.VectorVelocity=v643 * v226
        v645.Attachment0=v644
        v639=3
    end if (v639==3) then task.wait(v227)
    if v645 then v645:Destroy()
    end if v644 then v644:Destroy()
end v642.PlatformStand=false
break
end if (v639==0) then local v1564=0
while true do if (v1564==0) then v640=LocalPlayer.Character
        v641=v640 and v640:FindFirstChild("HumanoidRootPart")
        v1564=1
    end if (2==v1564) then v639=1
    break
end if (v1564==1) then v642=v640 and v640:FindFirstChild("Humanoid")
if ( not v641 or  not v642) then return
end v1564=2
end end end end end local function v230(v646) v646.AnimationPlayed:Connect(function(v1083) local v1084=0
while true do if (v1084==0) then if  not v225 then return
        end if (v1083.Animation.AnimationId:find("14414815375") or (v1083.Name:lower():find("diamond") and (v1083.Name:lower():find("m1") or v1083.Name:lower():find("hold")))) then local v1991=0
        while true do if (v1991==0) then v228=false
                v1083.Stopped:Connect(function() local v2338=0
                    while true do if (0==v2338) then if  not v225 then return
                            end if  not v228 then local v2506=0
                            while true do if (v2506==0) then v228=true
                                    task.spawn(v229)
                                    break
                        end end end break
            end end end)
            break
end end end break
end end end)
end local function v231(v647) local v648=0
local v649
while true do if (v648==0) then v649=v647:WaitForChild("Humanoid")
        v230(v649)
        break
end end end LocalPlayer.CharacterAdded:Connect(v231)
if LocalPlayer.Character then v231(LocalPlayer.Character)
end local v232=Window:CreateTab("Glitches",4483362458 )
local v233=workspace.CurrentCamera
local function v234(v650) local v651=Instance.new("ScreenGui")
    v651.Name=v650.guiName
    v651.ResetOnSpawn=false
    v651.IgnoreGuiInset=true
    v651.DisplayOrder=1001
    v651.Enabled=false
    v651.Parent=game:GetService("CoreGui")
    local v659=Instance.new("Frame",v651)
    v659.Size=UDim2.new(0 ,150 ,0,175 )
    v659.Position=v650.defaultPos
    v659.BackgroundColor3=Color3.fromRGB(12,12 ,18 )
    v659.BorderSizePixel=0
    v659.Active=true
    v659.Draggable=true
    local v667=Instance.new("UICorner",v659)
    v667.CornerRadius=UDim.new(0 ,10 )
    local v669=Instance.new("UIStroke",v659)
    v669.Color=v650.accentColor
    v669.Thickness=1.5
    v669.Transparency=0.25
    local v674=Instance.new("TextLabel",v659)
    v674.Size=UDim2.new(1  , -28,0  ,22)
    v674.Position=UDim2.new(0 ,0 ,0,4)
    v674.BackgroundTransparency=1
    v674.Text=v650.name   .. " Boost"
    v674.TextColor3=v650.accentColor
    v674.TextStrokeColor3=Color3.fromRGB(0  ,0 ,0)
    v674.TextStrokeTransparency=0.4
    v674.Font=Enum.Font.GothamBold
    v674.TextSize=12
    local v685=false
    local v686=175
    local v687=Instance.new("TextButton",v659)
    v687.Size=UDim2.new(0 ,22,0 ,22)
    v687.Position=UDim2.new(1, -24,0 ,4 )
    v687.Text="â"
    v687.TextColor3=v650.accentColor
    v687.TextStrokeColor3=Color3.fromRGB(0 ,0  ,0)
    v687.TextStrokeTransparency=0.4
    v687.Font=Enum.Font.GothamBold
    v687.TextSize=14
    v687.BackgroundColor3=Color3.fromRGB(30 ,30,42 )
    v687.BorderSizePixel=0
    v687.ZIndex=10
    local v699=Instance.new("UICorner",v687)
    v699.CornerRadius=UDim.new(0  ,6 )
    local v701=Instance.new("Frame",v659)
    v701.Size=UDim2.new(1 ,0  ,1 , -30)
    v701.Position=UDim2.new(0  ,0,0 ,30)
    v701.BackgroundTransparency=1
    v701.ClipsDescendants=true
    v687.MouseButton1Click:Connect(function() local v1085=0
        while true do if (0==v1085) then v685= not v685
                if v685 then local v1992=0
                    while true do if (v1992==1) then v701.Visible=false
                            break
                        end if (v1992==0) then v687.Text="+"
                        v659.Size=UDim2.new(0 ,150,0,30 )
                end end else local v1993=0
                    while true do if (v1993==1) then v701.Visible=true
                            break
                        end if (v1993==0) then v687.Text="â"
                        v659.Size=UDim2.new(0,150,0 ,v686)
                        v1993=1
            end end end break
end end end)
local function v706(v1086,v1087,v1088) local v1089=0
    local v1090
    while true do if (v1089==0) then v1090=Instance.new("TextLabel",v1086)
            v1090.Size=UDim2.new(1, -10,0  ,14 )
            v1090.Position=UDim2.new(0 ,6 ,0,v1088)
        end if (v1089==3) then v1090.TextSize=11
        v1090.TextXAlignment=Enum.TextXAlignment.Left
        return v1090
    end if (v1089==2) then local v1779=0
    while true do if (v1779==0) then v1090.TextStrokeColor3=Color3.fromRGB(255 ,255 ,255)
            v1090.TextStrokeTransparency=0.7
            v1779=1
        end if (v1779==1) then v1090.Font=Enum.Font.Gotham
        break
end end end if (v1089==1) then v1090.BackgroundTransparency=1
v1090.Text=v1087
v1090.TextColor3=Color3.fromRGB(235 ,235 ,235)
v1089=2
end end end local function v707(v1091,v1092,v1093,v1094,v1095,v1096,v1097,v1098) local v1099=0
local v1100
local v1101
local v1102
local v1103
local v1104
while true do if (6==v1099) then v1103.Font=Enum.Font.GothamBold
        v1103.TextSize=14
        v1103.BackgroundColor3=Color3.fromRGB(40,40,55)
        v1103.BorderSizePixel=0
        v1099=7
    end if (v1099==4) then v1102.TextColor3=Color3.new(1  ,1 ,1)
    v1102.Font=Enum.Font.GothamBold
    v1102.TextSize=12
    v1103=Instance.new("TextButton",v1091)
    v1099=5
end if (5==v1099) then v1103.Size=UDim2.new(0  ,28,0  ,22 )
v1103.Position=UDim2.new(0,104,0  ,v1092)
v1103.Text="+"
v1103.TextColor3=Color3.new(1,1,1)
v1099=6
end if (v1099==1) then v1100.TextColor3=Color3.new(1,1  ,1 )
v1100.Font=Enum.Font.GothamBold
v1100.TextSize=14
v1100.BackgroundColor3=Color3.fromRGB(40 ,40 ,55)
end if (v1099==3) then v1102.Size=UDim2.new(0 ,62 ,0,22 )
v1102.Position=UDim2.new(0 ,38 ,0 ,v1092)
v1102.BackgroundTransparency=1
v1102.Text=tostring(v1093())
end if (v1099==2) then v1100.BorderSizePixel=0
v1101=Instance.new("UICorner",v1100)
v1101.CornerRadius=UDim.new(0 ,6 )
v1102=Instance.new("TextLabel",v1091)
v1099=3
end if (v1099==0) then v1100=Instance.new("TextButton",v1091)
v1100.Size=UDim2.new(0 ,28,0  ,22 )
v1100.Position=UDim2.new(0,6 ,0 ,v1092)
v1100.Text="-"
end if (v1099==7) then v1104=Instance.new("UICorner",v1103)
v1104.CornerRadius=UDim.new(0  ,6 )
v1100.MouseButton1Click:Connect(function() local v1901=math.clamp(v1093() -v1095 ,v1096,v1097)
    v1094(v1901)
    v1102.Text=tostring(v1901)
end)
v1103.MouseButton1Click:Connect(function() local v1903=0
    local v1904
    while true do if (v1903==0) then v1904=math.clamp(v1093() + v1095 ,v1096,v1097)
            v1094(v1904)
        end if (v1903==1) then v1102.Text=tostring(v1904)
        break
end end end)
break
end end end v706(v701,"Power",0)
v707(v701,15,v650.getPower,v650.setPower,50 ,v650.powerRange[1  ],v650.powerRange[2],nil)
v706(v701,"Duration (cs)",45)
v707(v701,60 ,function() return math.floor(v650.getDuration() * 100 )
end,function(v1105) v650.setDuration(findRemote.05 )
end,10,v650.durRange[1 ],v650.durRange[2 ],nil)
local v708=Instance.new("TextButton",v701)
v708.Size=UDim2.new(1 , -12,0 ,38 )
v708.Position=UDim2.new(0 ,6 ,0,98 )
v708.TextScaled=true
v708.TextColor3=Color3.new(1,1 ,1)
v708.TextStrokeColor3=Color3.fromRGB(0 ,0,0  )
v708.TextStrokeTransparency=0.3
v708.BorderSizePixel=0
v708.Font=Enum.Font.GothamBold
v708.AutoButtonColor=false
local v718=Instance.new("UICorner",v708)
v718.CornerRadius=UDim.new(0 ,9 )
local v720=Instance.new("UIGradient",v708)
v720.Rotation=45
local function v722() local v1106=0
    local v1107
    while true do if (v1106==1) then v720.Color=ColorSequence.new({ColorSequenceKeypoint.new(0 ,(v1107 and v650.onColor[1]) or v650.offColor[1 ] ),ColorSequenceKeypoint.new(1,(v1107 and v650.onColor[2]) or v650.offColor[2] )})
            break
        end if (v1106==0) then v1107=v650.getEnabled()
        v708.Text=v650.name   .. "  "   .. ((v1107 and "ON") or "OFF")
end end end v708.MouseButton1Click:Connect(function() local v1108=0
local v1109
while true do if (v1108==1) then if  not v1109 then v650.setBoosted(false)
        end v722()
        break
    end if (0==v1108) then v1109= not v650.getEnabled()
    v650.setEnabled(v1109)
end end end)
v722()
local v723,v724,v725=false,nil,nil
v659.InputBegan:Connect(function(v1110) if ((v1110.UserInputType==Enum.UserInputType.Touch) or (v1110.UserInputType==Enum.UserInputType.MouseButton1)) then local v1565=0
        local v1566
        while true do if (v1565==0) then v1566=0
                while true do if (v1566==0) then v723=true
                        v724=v1110.Position
                    end if (1==v1566) then v725=v659.Position
                    v1110.Changed:Connect(function() if (v1110.UserInputState==Enum.UserInputState.End) then v723=false
                    end end)
                    break
            end end break
end end end end)
v659.InputChanged:Connect(function(v1111) if (v723 and ((v1111.UserInputType==Enum.UserInputType.Touch) or (v1111.UserInputType==Enum.UserInputType.MouseMovement))) then local v1567=v1111.Position-v724
        v659.Position=UDim2.new(0 ,math.clamp(v725.X.Offset + v1567.X ,0,v233.ViewportSize.X-v659.AbsoluteSize.X ),0 ,math.clamp(v725.Y.Offset + v1567.Y ,0  ,v233.ViewportSize.Y-v659.AbsoluteSize.Y ))
end end)
return v651,v722
end local v235,v236=v234({name="EClaw X",guiName="BBGEClawFloat",defaultPos=UDim2.new(0,20 ,1881.-1836 ,0 ),accentColor=Color3.fromRGB(220 ,30 ,30 ),onColor={Color3.fromRGB(100 ,10 ,10 ),Color3.fromRGB(180 ,30 ,30 )},offColor={Color3.fromRGB(100,10 ,10 ),Color3.fromRGB(180 ,30 ,30 )},getEnabled=function() return v211
end,setEnabled=function(v726) v211=v726
end,getBoosted=function() return v214
end,setBoosted=function(v727) v214=v727
end,getPower=function() return v212
end,setPower=function(v728) v212=v728
end,getDuration=function() return v213
end,setDuration=function(v729) v213=v729
end,powerRange={50,1000 },durRange={10,500 }})
local v237,v238=v234({name="Sang Z",guiName="BBGSangFloat",defaultPos=UDim2.new(0 ,20 ,0.62 ,0),accentColor=Color3.fromRGB(220 ,30,30 ),onColor={Color3.fromRGB(100,10 ,10),Color3.fromRGB(180,30 ,30)},offColor={Color3.fromRGB(100 ,10 ,10),Color3.fromRGB(180 ,30,30)},getEnabled=function() return v218
end,setEnabled=function(v730) v218=v730
end,getBoosted=function() return v221
end,setBoosted=function(v731) v221=v731
end,getPower=function() return v219
end,setPower=function(v732) v219=v732
end,getDuration=function() return v220
end,setDuration=function(v733) v220=v733
end,powerRange={50 ,1000 },durRange={10,500}})
local v239,v240=v234({name="Diamond M1",guiName="BBGDiamondFloat",defaultPos=UDim2.new(0 ,20 ,0.79 ,0),accentColor=Color3.fromRGB(220,30 ,30 ),onColor={Color3.fromRGB(100 ,10 ,10 ),Color3.fromRGB(180 ,30 ,30 )},offColor={Color3.fromRGB(100 ,10,10),Color3.fromRGB(180 ,30,30 )},getEnabled=function() return v225
end,setEnabled=function(v734) v225=v734
end,getBoosted=function() return v228
end,setBoosted=function(v735) v228=v735
end,getPower=function() return v226
end,setPower=function(v736) v226=v736
end,getDuration=function() return v227
end,setDuration=function(v737) v227=v737
end,powerRange={50 ,1000},durRange={10 ,500 }})
v232:CreateSection("EClaw X Boost")
v232:CreateToggle({Name="EClaw X Boost",CurrentValue=false,Flag="EClaw_MainToggle",Callback=function(v738) local v739=0
    while true do if (v739==0) then v211=v738
            if  not v738 then v214=false
            end v739=1
        end if (v739==1) then v236()
        Rayfield:Notify({Title="EClaw X",Content=(v738 and "ON") or "OFF" ,Duration=2})
        break
end end end})
v232:CreateSlider({Name="EClaw Power",Range={50 ,1000 },Increment=50 ,Suffix=" power",CurrentValue=400 ,Flag="EClaw_MainPower",Callback=function(v740) v212=v740
end})
v232:CreateSlider({Name="EClaw Duration (cs)",Range={10 ,500},Increment=10 ,Suffix=" cs",CurrentValue=90 ,Flag="EClaw_MainDur",Callback=function(v741) v213=Camera.41
end})
v232:CreateToggle({Name="Enable EClaw Window",CurrentValue=false,Flag="EClaw_Enabled",Callback=function(v742) local v743=0
    while true do if (v743==1) then Rayfield:Notify({Title="EClaw X",Content=(v742 and "Window Opened") or "Window Closed" ,Duration=2 })
            break
        end if (0==v743) then v235.Enabled=v742
        if  not v742 then local v1905=0
            while true do if (v1905==1) then v236()
                    break
                end if (v1905==0) then v211=false
                v214=false
    end end end v743=1
end end end})
v232:CreateKeybind({Name="Keybind EClaw",CurrentKeybind="None",HoldToInteract=false,Flag="EClaw_Keybind",Callback=function() end})
v232:CreateSection("Sanguine Z Boost")
v232:CreateToggle({Name="Sanguine Z Boost",CurrentValue=false,Flag="Sang_MainToggle",Callback=function(v744) local v745=0
    while true do if (v745==0) then v218=v744
            if  not v744 then v221=false
            end v745=1
        end if (v745==1) then v238()
        Rayfield:Notify({Title="Sang Z Boost",Content=(v744 and "ð¢ ON â Boost aktiv") or "ð´ OFF" ,Duration=2 })
        break
end end end})
v232:CreateSlider({Name="Sang Power",Range={50 ,1000},Increment=50,Suffix=" power",CurrentValue=400,Flag="Sang_MainPower",Callback=function(v746) v219=v746
end})
v232:CreateSlider({Name="Sang Duration (cs)",Range={10 ,500},Increment=10 ,Suffix=" cs",CurrentValue=200 ,Flag="Sang_MainDur",Callback=function(v747) v220=Camera.47
end})
v232:CreateToggle({Name="Show Sang Z Window",CurrentValue=false,Flag="Sang_Enabled",Callback=function(v748) local v749=0
    while true do if (v749==1) then Rayfield:Notify({Title="Sang Z",Content=(v748 and "Window Opened") or "Window Closed" ,Duration=2})
            break
        end if (v749==0) then v237.Enabled=v748
        if  not v748 then local v1906=0
            while true do if (v1906==0) then v218=false
                    v221=false
                end if (v1906==1) then v238()
                break
    end end end v749=1
end end end})
v232:CreateKeybind({Name="Keybind Sanguine",CurrentKeybind="None",HoldToInteract=false,Flag="Sang_Keybind",Callback=function() end})
v232:CreateSection("Diamond M1 Booster")
v232:CreateToggle({Name="Diamond M1 Boost",CurrentValue=false,Flag="Diamond_MainToggle",Callback=function(v750) local v751=0
    while true do if (v751==1) then v240()
            Rayfield:Notify({Title="Diamond M1",Content=(v750 and "ON") or "OFF" ,Duration=2 })
            break
        end if (v751==0) then v225=v750
        if  not v750 then v228=false
        end v751=1
end end end})
v232:CreateSlider({Name="Diamond Power",Range={50 ,1000},Increment=50,Suffix=" power",CurrentValue=400 ,Flag="Diamond_MainPower",Callback=function(v752) v226=v752
end})
v232:CreateSlider({Name="Diamond Duration (cs)",Range={10,500},Increment=10,Suffix=" cs",CurrentValue=60,Flag="Diamond_MainDur",Callback=function(v753) v227=Camera.53
end})
v232:CreateToggle({Name="Enable Diamond Window",CurrentValue=false,Flag="Diamond_Enabled",Callback=function(v754) v239.Enabled=v754
    if  not v754 then local v1269=0
        while true do if (v1269==0) then v225=false
                v228=false
                v1269=1
            end if (v1269==1) then v240()
            break
end end end Rayfield:Notify({Title="Diamond M1",Content=(v754 and "Window Opened") or "Window Closed" ,Duration=2})
end})
v232:CreateKeybind({Name="Keybind Diamond M1",CurrentKeybind="None",HoldToInteract=false,Flag="Diamond_Keybind",Callback=function() end})
local v241=(function() local v756={}
    local v757=game:GetService("Players")
    local v758=v757.LocalPlayer
    local v759=game:GetService("RunService")
    local v760=game:GetService("ReplicatedStorage")
    local v761=game:GetService("UserInputService")
    local v762=workspace.CurrentCamera
    local v763=nil
    pcall(function() v763=v760:WaitForChild("Remotes",5 ) and v760.Remotes:WaitForChild("CommE",5 )
    end)
    local v764=false
    local v765=false
    local v766=false
    local v767=false
    local v768=false
    local v769=false
    local v770=false
    local v771=false
    local v772=nil
    local v773=nil
    local v774=nil
    local v775=nil
    local v776=nil
    local v777=nil
    local v778=nil
    local v779=nil
    local v780=nil
    local v781={}
    local v782={"X"}
    local v783={"TAP"}
    local v784=754.-753
    local v785=1000
    v756._getPlayersPosition=function() return v775
    end
    v756._getNPCPosition=function() return v777
    end
    v756._getPlayersAimbot=function() return v774
    end
    local function v789(v1112) local v1113=0
        while true do if (v1113==0) then if ( not v1112 or  not v1112:FindFirstChild("HumanoidRootPart")) then return nil
                end return v1112.HumanoidRootPart
    end end end local function v790() local v1114=0
    while true do if (v1114==0) then for v1907,v1908 in ipairs(v781) do pcall(function() v1908:Disconnect()
                end)
            end v781={}
            break
end end end local function v791(v1115) local v1116=0
local v1117
while true do if (v1116==1) then local v1813=0
        while true do if (v1813==0) then if ( not v768 or  not v1117 or (v1117.WalkSpeed<5)) then return v1115.Position
                end return v1115.Position + (v1115.Velocity * v784)
    end end end if (0==v1116) then if  not v1115 then return nil
end v1117=v1115.Parent:FindFirstChildOfClass("Humanoid")
end end end local function v792(v1118) local v1119=0
local v1120
local v1121
while true do if (0==v1119) then v1120=v758:FindFirstChild("PlayerGui")
        if  not v1120 then return false
        end v1119=1
    end if (v1119==2) then return false
end if (v1119==1) then v1121=v1120:FindFirstChild("Main") and v1120.Main:FindFirstChild("Allies") and v1120.Main.Allies:FindFirstChild("Container") and v1120.Main.Allies.Container:FindFirstChild("Allies") and v1120.Main.Allies.Container.Allies:FindFirstChild("ScrollingFrame")
if v1121 then for v2114,v2115 in pairs(v1121:GetDescendants()) do if (v2115:IsA("ImageButton") and (v2115.Name==v1118.Name)) then return true
end end end v1119=2
end end end local function v793(v1122) local v1123=0
local v1124
local v1125
while true do local v1270=0
    while true do if (v1270==0) then if (v1123==1) then v1125=v1122.Team
                if (v1124 and v1125) then local v2232=0
                    while true do if (v2232==0) then if ((v1124.Name=="Pirates") and (v1125.Name=="Marines")) then return true
                            end if ((v1124.Name=="Marines") and (v1125.Name=="Pirates")) then return true
                        end v2232=1
                    end if (v2232==1) then if ((v1124.Name=="Pirates") and (v1125.Name=="Pirates")) then return  not v792(v1122)
                    end if ((v1124.Name=="Marines") and (v1125.Name=="Marines")) then return false
                end break
    end end end v1123=2
end if (v1123==2) then return true
end v1270=1
end if (v1270==1) then if (v1123==0) then if ( not v1122 or (v1122==v758)) then return false
    end v1124=v758.Team
end break
end end end end local function v794(v1126) local v1127=0
local v1128
local v1129
while true do if (v1127==0) then if  not v1126 then return nil
        end if v780 then local v1994=0
        local v1995
        while true do if (v1994==0) then v1995=v757:FindFirstChild(v780)
                if (v1995 and v1995.Character and v1995.Character:FindFirstChild("HumanoidRootPart")) then local v2380=0
                    local v2381
                    while true do if (v2380==0) then v2381=v1995.Character:FindFirstChildOfClass("Humanoid")
                            if (v2381 and (v2381.Health>0)) then return v1995
                            end break
                end end end v1994=1
            end if (1==v1994) then return nil
end end end v1127=1
end if (v1127==2) then return v1128
end if (v1127==1) then v1128,v1129=nil,v785
for v1909,v1910 in ipairs(v757:GetPlayers()) do if ((v1910~=v758) and v793(v1910) and v1910.Character and (v1910.Character.Parent~=nil)) then local v2118=v1910.Character:FindFirstChildWhichIsA("Humanoid")
        local v2119=v789(v1910.Character)
        if (v2118 and (v2118.Health>0) and v2119) then local v2233=0
            local v2234
            while true do if (v2233==0) then v2234=(v2119.Position-v1126.Position).Magnitude
                    if ((v2234<=v785) and (v2234<v1129)) then local v2476=0
                        while true do if (v2476==0) then v1129=v2234
                                v1128=v1910
                                break
                    end end end break
end end end end end v1127=2
end end end local function v795(v1130) local v1131=0
local v1132
local v1133
local v1134
while true do if (v1131==2) then for v1911,v1912 in ipairs(v1132:GetChildren()) do if v1912:IsA("Model") then local v2120=0
                local v2121
                local v2122
                while true do if (v2120==1) then if (v2121 and (v2121.Health>0) and v2122) then local v2443=(v2122.Position-v1130.Position).Magnitude
                            if ((v2443<=v785) and (v2443<v1134)) then v1134=v2443
                                v1133=v1912
                        end end break
                    end if (v2120==0) then v2121=v1912:FindFirstChildWhichIsA("Humanoid")
                    v2122=v789(v1912)
    end end end end return v1133
end if (v1131==1) then if  not v1132 then return nil
end v1133,v1134=nil,v785
end if (v1131==0) then if  not v1130 then return nil
end v1132=workspace:FindFirstChild("Enemies")
v1131=1
end end end local function v796(v1135) local v1136=0
local v1137
while true do if (v1136==0) then if  not v769 then return
        end if  not v1135 then return
    end if (v778 and (v778.Adornee==v1135)) then return
end if v778 then local v1996=0
while true do if (v1996==0) then v778:Destroy()
        v778=nil
        break
end end end v1136=1
end if (v1136==1) then v1137=Instance.new("Highlight")
v1137.FillColor=Color3.fromRGB(255,255 ,0)
v1137.OutlineColor=Color3.fromRGB(255 ,255,0 )
v1137.FillTransparency=0.5
v1136=2
end if (v1136==2) then v1137.OutlineTransparency=0
v1137.Adornee=v1135
v1137.Parent=v1135
v778=v1137
break
end end end local function v797() local v1138=0
while true do if (v1138==0) then if v778 then local v1997=0
            while true do if (v1997==0) then v778:Destroy()
                    v778=nil
                    break
        end end end v779=nil
        break
end end end local function v798(v1139) if  not v1139 then return false
end local v1140=v758:FindFirstChild("PlayerGui")
if  not v1140 then return false
end local v1141=v1140:FindFirstChild("Main") and v1140.Main:FindFirstChild("Skills")
if  not v1141 then return false
end local v1142=v1141:FindFirstChild(v1139)
if  not v1142 then return false
end for v1271,v1272 in ipairs({"Z","X","C","V"}) do local v1273=0
local v1274
while true do if (v1273==0) then v1274=v1142:FindFirstChild(v1272)
        if (v1274 and v1274:FindFirstChild("Cooldown") and v1274.Cooldown:IsA("Frame")) then if (v1274.Cooldown.Size.X.Scale==1) then return true
        end end break
end end end return false
end local function v799() if v772 then return
end v772=v759.RenderStepped:Connect(function() local v1275=v758.Character
if  not v1275 then return
end local v1276=v1275:FindFirstChild("HumanoidRootPart")
if  not v1276 then return
end if ( not v764 and  not v765) then return
end local v1277=nil
local v1278=nil
if v764 then local v1820=0
    local v1821
    while true do if (v1820==0) then v1821=v794(v1276)
            if (v1821 and (v1821~=v758) and v1821.Character) then local v2235=0
                while true do if (0==v2235) then v774=v1821.Name
                        v775=v791(v789(v1821.Character))
                    end if (v2235==2) then v796(v1277)
                    break
                end if (v2235==1) then v1278=v775
                v1277=v1821.Character
        end end else local v2236=0
            while true do if (v2236==0) then v774=nil
                    v775=nil
                    v2236=1
                end if (v2236==1) then if (v779=="player") then v797()
                end break
    end end end break
end end end if v765 then local v1822=0
local v1823
while true do if (v1822==0) then v1823=v795(v1276)
        if v1823 then local v2237=0
            while true do if (v2237==0) then v776=v1823.Name
                    v777=v791(v789(v1823))
                    v2237=1
                end if (1==v2237) then v1278=v1278 or v777
                if  not v1277 then local v2477=0
                    local v2478
                    while true do if (v2477==0) then v2478=0
                            while true do if (v2478==0) then v1277=v1823
                                    v796(v1823)
                                    break
                            end end break
                end end end break
        end end else v776=nil
            v777=nil
            if (v779=="NPC") then v797()
        end end break
end end end if (v773 and v1278 and v798(v773.Name)) then local v1824=(Vector3.new(v1278.X,v1276.Position.Y,v1278.Z) -v1276.Position).Unit
v1276.CFrame=CFrame.new(v1276.Position,v1276.Position + v1824 )
end end)
end local function v800() if v772 then local v1571=0
    while true do if (v1571==0) then v772:Disconnect()
            v772=nil
            break
end end end end local function v801(v1143) v773=v1143
table.insert(v781,v1143.AncestryChanged:Connect(function(v1279,v1280) if  not v1280 then v773=nil
end end))
end spawn(function() local v1144=0
local v1145
local v1146
while true do if (0==v1144) then v1145,v1146=pcall(getrawmetatable,game)
        if (v1145 and v1146) then local v1998=0
            local v1999
            while true do if (v1998==1) then v1999=hookmetamethod(game,"__namecall",function(v2339,v2340,v2341,...) local v2342=0
                        local v2343
                        while true do if (v2342==1) then return v1999(v2339,v2340,v2341,...)
                            end if (0==v2342) then v2343=(getnamecallmethod and getnamecallmethod():lower()) or ""
                            if ((tostring(v2339)=="RemoteEvent") and (v2343=="fireserver")) then if (typeof(v2340)=="Vector3") then if (v764 and v775) then return v1999(v2339,v775,v2341,...)
                                        elseif (v765 and v777) then return v1999(v2339,v777,v2341,...)
                                    end end elseif (v2343=="invokeserver") then if (v773 and (v773.Name=="Buddy Sword")) then if ((type(v2340)=="string") and table.find(v782,v2340)) then if (v764 and v775) then return v1999(v2339,v2340,v775,nil,...)
                                            elseif (v765 and v777) then return v1999(v2339,v2340,v777,nil,...)
                                end end end end v2342=1
                    end end end)
                    setreadonly(v1146,true)
                    break
                end if (v1998==0) then setreadonly(v1146,false)
                v1999=nil
    end end end break
end end end)
local function v802() local v1147=0
    while true do if (v1147==0) then if v771 then return
            end v771=true
        end if (v1147==1) then task.spawn(function() local v1913=0
            while true do if (v1913==0) then while v770 do task.wait(0.1  )
                        pcall(function() local v2344=0
                            local v2345
                            local v2346
                            while true do if (v2344==1) then function v2346(v2479) return game:GetService("CollectionService"):HasTag(v2345,v2479)
                                    end if v2346("Ken") then local v2507=0
                                    local v2508
                                    local v2509
                                    while true do if (v2507==1) then v2509=getrenv()._G.OM
                                            if (v2509 and  not v2509.active) then local v2552=0
                                                local v2553
                                                while true do if (v2552==0) then v2553=0
                                                        while true do if (1==v2553) then if v763 then v763:FireServer("Ken",true)
                                                                end break
                                                            end if (v2553==0) then v2509.radius=0
                                                            v2509:setActive(true)
                                                            v2553=1
                                                    end end break
                                        end end end break
                                    end if (v2507==0) then v2508=v758:FindFirstChild("PlayerGui")
                                    if v2508 then local v2554=0
                                        local v2555
                                        while true do if (v2554==0) then v2555=v2508:FindFirstChild("MobileContextButtons") and v2508.MobileContextButtons.ContextButtonFrame and v2508.MobileContextButtons.ContextButtonFrame:FindFirstChild("BoundActionKen")
                                                if (v2555 and (v2555:GetAttribute("Selected")~=true)) then v2555:SetAttribute("Selected",true)
                                                end break
                                    end end end v2507=1
                        end end end break
                    end if (v2344==0) then v2345=v758.Character
                    if  not v2345 then return
                    end v2344=1
        end end end)
    end v771=false
    break
end end end)
break
end end end local function v803(v1148) local v1149=0
local v1150
while true do if (1==v1149) then table.insert(v781,v1148.ChildAdded:Connect(function(v1914) if v1914:IsA("Tool") then v801(v1914)
        end end))
        table.insert(v781,v1148.ChildRemoved:Connect(function(v1915) if (v1915==v773) then v773=nil
        end end))
    end if (v1149==2) then v1150=v1148:FindFirstChildOfClass("Humanoid")
    if v1150 then v1150.Died:Connect(function() local v2123=0
            local v2124
            local v2125
            local v2126
            while true do if (v2123==0) then v2124=0
                    v2125=nil
                end if (v2123==1) then v2126=nil
                while true do if (v2124==3) then v764=(v2125 and v766) or false
                        v765=(v2126 and v767) or false
                        break
                    end if (v2124==1) then v765=false
                    v774=nil
                    v775=nil
                end if (v2124==0) then local v2462=0
                while true do if (v2462==0) then v2125=v764
                        v2126=v765
                        v2462=1
                    end if (v2462==1) then v764=false
                    v2124=1
                    break
        end end end if (v2124==2) then v776=nil
        v777=nil
        task.wait3
end end break
end end end)
end break
end if (v1149==0) then v790()
for v1916,v1917 in ipairs(v1148:GetChildren()) do if v1917:IsA("Tool") then v801(v1917)
end end v1149=1
end end end v758.CharacterAdded:Connect(v803)
if v758.Character then v803(v758.Character)
end v756.SetPlayerSilentAim=function(v1151,v1152) local v1153=0
while true do if (v1153==1) then if v1152 then v799()
        else local v2000=0
            while true do if (v2000==0) then v774=nil
                    v775=nil
                    v2000=1
                end if (v2000==1) then if  not v765 then v800()
                end break
    end end end break
end if (v1153==0) then v766=v1152
v764=v1152
v1153=1
end end end
v756.SetNPCSilentAim=function(v1154,v1155) local v1156=0
    local v1157
    while true do if (0==v1156) then v1157=0
            while true do if (v1157==0) then v767=v1155
                    v765=v1155
                end if (v1157==1) then if v1155 then v799()
                else v776=nil
                    v777=nil
                    if  not v764 then v800()
                end end break
        end end break
end end end
v756.SetMiniToggleNpcSilentAim=function(v1158,v1159) local v1160=0
    while true do if (v1160==0) then v765=v1159
            if v1159 then v799()
            else local v2001=0
                while true do if (v2001==0) then v776=nil
                        v777=nil
                        break
            end end end break
end end end
v756.SetPrediction=function(v1161,v1162) v768=v1162
end
v756.SetPredictionAmount=function(v1163,v1164) v784=v1164
end
v756.SetDistanceLimit=function(v1165,v1166) v785=v1166
end
v756.SetSelectedPlayer=function(v1167,v1168) v780=v1168
end
v756.SetHighlight=function(v1169,v1170) local v1171=0
    while true do if (v1171==0) then v769=v1170
            if  not v1170 then v797()
            end break
end end end
v756.SetAutoKen=function(v1172,v1173) local v1174=0
    while true do if (v1174==0) then v770=v1173
            if v1173 then v802()
            end break
end end end
v756.Pause=function(v1175) local v1176=0
    while true do if (0==v1176) then v764=false
            v765=false
            break
end end end
v756.Restore=function(v1177) local v1178=0
    local v1179
    while true do if (v1178==0) then v1179=0
            while true do if (v1179==0) then v764=v766
                    v765=v767
                    break
            end end break
end end end
v756.IsPlayerAimEnabled=function(v1180) return v764
end
return v756
end)()
local v242=(function() local v816={}
    local v817=game:GetService("Players")
    local v818=v817.LocalPlayer
    local v819=game:GetService("RunService")
    local v820=game:GetService("UserInputService")
    local v821=v818:WaitForChild("PlayerGui")
    local v822=nil
    local v823=false
    local v824=nil
    local v825={}
    local v826=false
    local v827=nil
    local v828=nil
    local v829=nil
    local v830=false
    local v831=false
    local v832=nil
    local v833=workspace.CurrentCamera
    local v834=false
    local v835=false
    local v836=false
    local v837=false
    local v838={}
    local v839=nil
    local v840=nil
    local v841=Instance.new("ScreenGui")
    v841.Name="BBGTargetUI"
    v841.ResetOnSpawn=false
    v841.Parent=v821
    local v845=Instance.new("Frame",v841)
    v845.Name="TargetFrame"
    v845.Size=UDim2.new(0.25,0 ,1999.08 -1999 ,0 )
    v845.Position=UDim2.new(0.5  ,0,0.05  ,0)
    v845.AnchorPoint=Vector2.new(0.5,0)
    v845.BackgroundTransparency=1
    v845.Visible=false
    local v852=Instance.new("TextLabel",v845)
    v852.Size=UDim2.new(1 ,0  ,214.-209 ,0)
    v852.BackgroundTransparency=1
    v852.TextScaled=true
    v852.Font=Enum.Font.GothamBold
    v852.TextColor3=Color3.new(1,1 ,1)
    local v859=Instance.new("Frame",v845)
    v859.Name="HealthBarBackground"
    v859.Size=UDim2.new(1 ,0 ,198.-163 ,0)
    v859.Position=UDim2.new(0,0,0.55,0  )
    v859.BackgroundColor3=Color3.fromRGB(40 ,40  ,40)
    v859.BorderSizePixel=0
    local v865=Instance.new("Frame",v859)
    v865.Name="HealthBarFill"
    v865.Size=UDim2.new(1 ,0 ,1  ,0)
    v865.BackgroundColor3=Color3.fromRGB(0,255 ,0 )
    v865.BorderSizePixel=0
    local function v870(v1181) local v1182=v818:FindFirstChild("PlayerGui")
        if  not v1182 then return false
        end local v1183=v1182:FindFirstChild("Main") and v1182.Main:FindFirstChild("Allies") and v1182.Main.Allies:FindFirstChild("Container") and v1182.Main.Allies.Container:FindFirstChild("Allies") and v1182.Main.Allies.Container.Allies:FindFirstChild("ScrollingFrame")
        if v1183 then for v1826,v1827 in pairs(v1183:GetDescendants()) do if (v1827:IsA("ImageButton") and (v1827.Name==v1181.Name)) then return true
        end end end return false
    end local function v871(v1184) if ( not v1184 or (v1184==v818)) then return false
    end local v1185=v818.Team
    local v1186=v1184.Team
    if (v1185 and v1186) then local v1572=0
        local v1573
        while true do if (0==v1572) then v1573=0
                while true do if (1==v1573) then if ((v1185.Name=="Pirates") and (v1186.Name=="Pirates")) then return  not v870(v1184)
                        end if ((v1185.Name=="Marines") and (v1186.Name=="Marines")) then return false
                    end break
                end if (v1573==0) then if ((v1185.Name=="Pirates") and (v1186.Name=="Marines")) then return true
                end if ((v1185.Name=="Marines") and (v1186.Name=="Pirates")) then return true
            end v1573=1
    end end break
end end end return true
end local function v872(v1187) local v1188=v818.Character
if ( not v1188 or  not v1188:FindFirstChild("HumanoidRootPart")) then return nil
end local v1189=v1188.HumanoidRootPart
local v1190,v1191=nil,v1187 or 100
for v1281,v1282 in ipairs(v817:GetPlayers()) do if ((v1282~=v818) and v871(v1282) and v1282.Character and v1282.Character:FindFirstChild("HumanoidRootPart")) then local v1828=0
        local v1829
        local v1830
        while true do if (v1828==1) then if (v1829 and v1830 and (v1830.Health>0)) then local v2238=0
                    local v2239
                    while true do if (v2238==0) then v2239=(v1829.Position-v1189.Position).Magnitude
                            if (v2239<v1191) then v1191=v2239
                                v1190=v1282.Character
                            end break
                end end end break
            end if (v1828==0) then v1829=v1282.Character.HumanoidRootPart
            v1830=v1282.Character:FindFirstChild("Humanoid")
end end end end return v1190
end local function v873() local v1192=0
while true do if (v1192==2) then if v828 then local v2002=0
            while true do if (v2002==0) then pcall(function() task.cancel(v828)
                    end)
                    v828=nil
                    break
        end end end break
    end if (v1192==0) then for v1918,v1919 in ipairs(v825) do pcall(function() v1919:Disconnect()
        end)
    end v825={}
end if (v1192==1) then if v824 then local v2003=0
    local v2004
    while true do if (v2003==0) then v2004=0
            while true do if (v2004==0) then pcall(function() v824:Disconnect()
                    end)
                    v824=nil
                    break
            end end break
end end end if v827 then local v2005=0
local v2006
while true do if (v2005==0) then v2006=0
        while true do if (v2006==0) then pcall(function() v827:Disconnect()
                end)
                v827=nil
                break
        end end break
end end end v1192=2
end end end local function v874() local v1193=0
while true do if (v1193==2) then if v827 then local v2007=0
            while true do if (0==v2007) then pcall(function() v827:Disconnect()
                    end)
                    v827=nil
                    break
        end end end if v828 then local v2008=0
        while true do if (v2008==0) then pcall(function() task.cancel(v828)
                end)
                v828=nil
                break
    end end end break
end if (v1193==1) then v829=nil
v823=false
v1193=2
end if (v1193==0) then if  not v826 then return
end v826=false
end end end local function v875() local v1194=0
local v1195
while true do if (v1194==0) then v1195=0
        while true do if (2==v1195) then v827=v819.RenderStepped:Connect(function() local v2174=0
                    while true do if (0==v2174) then if  not v830 then local v2463=0
                                while true do if (v2463==0) then v874()
                                        return
                            end end end if (v826 and v829 and v829:FindFirstChild("HumanoidRootPart")) then local v2464=workspace.CurrentCamera
                            if v2464 then v2464.CFrame=CFrame.lookAt(v2464.CFrame.Position,v829.HumanoidRootPart.Position)
                            end else v874()
                            end break
                end end end)
                v828=task.delay(1,function() if v826 then v874()
                end end)
                break
            end if (v1195==1) then if  not v829 then return
            end v826=true
            v1195=2
        end if (v1195==0) then if ( not v830 or v826) then return
        end v829=v872(1000)
end end break
end end end local function v876() local v1196=0
local v1197
local v1198
local v1199
while true do if (v1196==1) then v1197=v818:WaitForChild("PlayerGui"):WaitForChild("Main",5 )
        if  not v1197 then return
        end v1196=2
    end if (v1196==0) then if  not v830 then return
    end if v824 then pcall(function() v824:Disconnect()
    end)
    v824=nil
end v1196=1
end if (v1196==4) then v824=v1199:GetPropertyChangedSignal("Text"):Connect(function() if  not v830 then return
    end local v1920=tonumber(v1199.Text) or 0
    if ((v1920>0) and v826) then v874()
    end if ((v1920>0) and canTilt()) then local v2128=0
    while true do if (0==v2128) then v837=true
            if next(v838) then startTilt()
            end break
    end end else local v2129=0
        while true do if (v2129==0) then v837=false
                stopTiltSmooth()
                break
end end end end)
break
end if (v1196==3) then v1199=v1198:FindFirstChild("Text")
if  not v1199 then local v2009=0
    while true do if (v2009==0) then table.insert(v825,v1198.ChildAdded:Connect(function(v2347) if (v2347.Name=="Text") then local v2448=0
                    local v2449
                    while true do if (v2448==0) then v2449=0
                            while true do if (v2449==0) then task.wait()
                                    v876()
                                    break
                            end end break
            end end end end))
            return
end end end v1196=4
end if (2==v1196) then v1198=v1197:FindFirstChild("DmgCounter")
if  not v1198 then local v2010=0
    while true do if (v2010==0) then table.insert(v825,v1197.ChildAdded:Connect(function(v2348) if (v2348.Name=="DmgCounter") then task.wait()
                    v876()
            end end))
            return
end end end v1196=3
end end end local function v877(v1200) local v1201=0
local v1202
while true do if (v1201==0) then v1202=0
        while true do if (0==v1202) then if  not v1200 then return
                end v822=v1200
                v1202=1
            end if (v1202==1) then table.insert(v825,v1200.AncestryChanged:Connect(function(v2175,v2176) if  not v2176 then local v2349=0
                    while true do if (v2349==3) then v837=false
                            v838={}
                            break
                        end if (v2349==2) then v835=false
                        v836=false
                        v2349=3
                    end if (v2349==0) then v822=nil
                    v823=false
                    v2349=1
                end if (1==v2349) then v826=false
                v834=false
end end end end))
break
end end break
end end end local function v878() return (v822 and (v822.Name=="Dough-Dough") and v834) or (v822 and (v822.Name=="Shark Anchor") and v835) or (v822 and (v822.Name=="Cursed Dual Katana") and v836)
end local function v879() if v839 then pcall(function() v839:Disconnect()
    end)
    v839=nil
end end local function v880() local v1203=0
local v1204
local v1205
local v1206
local v1207
local v1208
while true do if (v1203==1) then v1206=nil
        v1207=nil
        v1203=2
    end if (v1203==2) then v1208=nil
    while true do if (v1204==1) then v1205=v833.CFrame
            v1206=v840
        end if (v1204==0) then v879()
        if  not v840 then return
        end v1204=1
    end if (v1204==2) then v840=nil
    v1204=3
end if (v1204==3) then v1208=nil
v1208=v819.RenderStepped:Connect(function(v2177) v1207=math.min(v1207 + (v10885) ,1 )
    v833.CFrame=v1205:Lerp(v1206,v1207)
    if (v1207>=1) then v1208:Disconnect()
end end)
break
end end break
end if (0==v1203) then v1204=0
v1205=nil
end end end local function v881() local v1209=0
local v1210
local v1211
local v1212
local v1213
local v1214
local v1215
local v1216
local v1217
local v1218
while true do if (v1209==2) then v1215=nil
        if (v1212.FloorMaterial~=Enum.Material.Air) then v1215=Vector3.new(0,6,0  )
        else v1215=Vector3.new(0,40 ,0  )
        end v1216=v1211.Position-v1215
        v1217=CFrame.new(v1214,v1216)
    end if (v1209==0) then v879()
    v840=v840 or v833.CFrame
    v1210=v818.Character
    v1211=v1210 and v1210:FindFirstChild("HumanoidRootPart")
end if (v1209==3) then v1218=0
v839=v819.RenderStepped:Connect(function(v1921) local v1922=0
    while true do if (v1922==0) then if  not (v837 and next(v838) and v1211.Parent) then local v2350=0
                while true do if (v2350==0) then v880()
                        return
            end end end if (v1218<1) then local v2351=0
            while true do if (v2351==0) then v1218=math.min(v1218 + (v3842) ,1)
                    v833.CFrame=v1213:Lerp(v1217,v1218)
                    break
            end end else v833.CFrame=v1217
            end break
end end end)
break
end if (v1209==1) then v1212=v1210 and v1210:FindFirstChildOfClass("Humanoid")
if ( not v1211 or  not v1212) then return
end v1213=v833.CFrame
v1214=v1213.Position
end end end v820.TouchEnded:Connect(function(v1219) if  not v830 then return
end local v1220=workspace.CurrentCamera
if ( not v1220 or  not v1219 or  not v1219.Position) then return
end if (v1219.Position.X>(v1220.ViewportSize.X/2)) then if (v822 and (v822.Name=="Godhuman") and v823) then if  not v826 then v875()
end end end end)
v820.TouchStarted:Connect(function(v1221) local v1222=0
    local v1223
    while true do if (v1222==0) then v1223=0
            while true do if (v1223==1) then if  not v833 then return
                    end if (v1221.Position.X>(v833.ViewportSize.X/2)) then v838[v1221]=true
                    if (v837 and v878()) then v881()
                end end break
            end if (0==v1223) then if  not v830 then return
            end v833=workspace.CurrentCamera
    end end break
end end end)
v820.TouchEnded:Connect(function(v1224) local v1225=0
    while true do if (v1225==0) then if  not v830 then return
            end if v838[v1224] then local v2011=0
            while true do if (v2011==0) then v838[v1224]=nil
                    if  not next(v838) then local v2382=0
                        while true do if (v2382==1) then v834=false
                                v835=false
                            end if (v2382==0) then v880()
                            v837=false
                            v2382=1
                        end if (v2382==2) then v836=false
                        break
            end end end break
end end end break
end end end)
if  not getgenv().ZSkillHooked then getgenv().ZSkillHooked=true
    pcall(function() local v1574
        v1574=hookmetamethod(game,"__namecall",function(v1834,...) local v1835=0
            local v1836
            local v1837
            while true do if (v1835==1) then if ((v1836=="InvokeServer") or (v1836=="FireServer")) then local v2242=0
                        local v2243
                        while true do if (v2242==1) then if ((typeof(v2243)=="string") and (v2243:upper()=="V")) then if (v822 and (v822.Name=="Dough-Dough")) then local v2518=0
                                        local v2519
                                        while true do if (0==v2518) then v834=true
                                                v2519=os.clock()
                                            end if (v2518==1) then task.delay(2,function() if ((os.clock() -v2519)>=2) then local v2556=0
                                                    local v2557
                                                    while true do if (v2556==0) then v2557=0
                                                            while true do if (v2557==0) then v834=false
                                                                    if (v837 and next(v838)) then v837=false
                                                                        v880()
                                                                        v838={}
                                                                    end break
                                                            end end break
                                            end end end end)
                                            break
                            end end end end break
                        end if (v2242==0) then v2243=v1837[1 ]
                        if ((typeof(v2243)=="string") and (v2243:upper()=="Z")) then local v2481=0
                            while true do if (1==v2481) then if (v822 and (v822.Name=="Cursed Dual Katana")) then local v2543=0
                                        local v2544
                                        while true do if (0==v2543) then v836=true
                                                v2544=os.clock()
                                                v2543=1
                                            end if (v2543==1) then task.delay(2,function() if ((os.clock() -v2544)>=2) then local v2562=0
                                                    local v2563
                                                    while true do if (v2562==0) then v2563=0
                                                            while true do if (v2563==0) then v836=false
                                                                    if (v837 and next(v838)) then local v2570=0
                                                                        while true do if (v2570==0) then v837=false
                                                                                v880()
                                                                                v2570=1
                                                                            end if (v2570==1) then v838={}
                                                                            break
                                                                end end end break
                                                        end end break
                                        end end end end)
                                        break
                            end end end break
                        end if (v2481==0) then if (v822 and (v822.Name=="Godhuman")) then v823=true
                        end if (v822 and (v822.Name=="Shark Anchor")) then v835=true
                        local v2545=os.clock()
                        task.delay(2 ,function() if ((os.clock() -v2545)>=2) then local v2558=0
                                while true do if (v2558==0) then v835=false
                                        if (v837 and next(v838)) then local v2568=0
                                            while true do if (v2568==0) then v837=false
                                                    v880()
                                                end if (v2568==1) then v838={}
                                                break
                                    end end end break
                    end end end end)
                end v2481=1
    end end end v2242=1
end end end return v1574(v1834,...)
end if (v1835==0) then v1836=getnamecallmethod()
v1837={...}
end end end)
end)
end local function v882(v1226) local v1227=0
while true do if (v1227==3) then for v1923,v1924 in ipairs(v1226:GetChildren()) do if v1924:IsA("Tool") then v877(v1924)
        end end table.insert(v825,v1226.ChildAdded:Connect(function(v1925) if v1925:IsA("Tool") then v877(v1925)
end end))
table.insert(v825,v1226.ChildRemoved:Connect(function(v1926) if (v1926==v822) then local v2132=0
        local v2133
        while true do if (v2132==0) then v2133=0
                while true do if (v2133==3) then v838={}
                        break
                    end if (v2133==1) then v834=false
                    v835=false
                end if (v2133==0) then v822=nil
                v823=false
                v2133=1
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            