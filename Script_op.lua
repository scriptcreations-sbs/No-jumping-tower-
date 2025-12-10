-- Prison Life Menu (COMPLETO) - Parte 1
local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

-- Crear ScreenGui
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false
gui.Name = "PrisonLifeMenu"

-- Botón toggle movible compatible con teléfono
local toggleButton = Instance.new("TextButton", gui)
toggleButton.Size = UDim2.new(0, 45, 0, 45)
toggleButton.Position = UDim2.new(0.5, -22, 0, 5)
toggleButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
toggleButton.Text = "SBS"
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 18
toggleButton.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", toggleButton).CornerRadius = UDim.new(0,8)

-- Borde animado del toggle
local iconStroke = Instance.new("UIStroke", toggleButton)
iconStroke.Thickness = 2
iconStroke.Color = Color3.fromRGB(0,153,255)
task.spawn(function()
    local colors = {
        Color3.fromRGB(0,153,255),
        Color3.fromRGB(85,170,255),
        Color3.fromRGB(0,200,255),
        Color3.fromRGB(170,220,255)
    }
    local i = 1
    while true do
        local tween = TweenService:Create(iconStroke, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = colors[i]})
        tween:Play()
        tween.Completed:Wait()
        i = i + 1
        if i > #colors then i = 1 end
    end
end)

-- Hacer toggle movible compatible con teléfono
do
    local dragging = false
    local dragInput, mousePos, framePos

    local function updateInput(input)
        local delta = input.Position - mousePos
        toggleButton.Position = UDim2.new(
            0,
            math.clamp(framePos.X.Offset + delta.X, 0, gui.AbsoluteSize.X - toggleButton.AbsoluteSize.X),
            0,
            math.clamp(framePos.Y.Offset + delta.Y, 0, gui.AbsoluteSize.Y - toggleButton.AbsoluteSize.Y)
        )
    end

    toggleButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = toggleButton.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    toggleButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateInput(input)
        end
    end)
end

-- Frame principal
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 360, 0, 360)
frame.Position = UDim2.new(0.5, -180, 0.18, 0)
frame.BackgroundColor3 = Color3.fromRGB(41,41,41)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Visible = false
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,10)

-- Borde animado del frame
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(0,153,255)
task.spawn(function()
    local colors = {
        Color3.fromRGB(0,153,255),
        Color3.fromRGB(85,170,255),
        Color3.fromRGB(0,200,255),
        Color3.fromRGB(170,220,255)
    }
    local i = 1
    while true do
        local tween = TweenService:Create(stroke, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = colors[i]})
        tween:Play()
        tween.Completed:Wait()
        i = i + 1
        if i > #colors then i = 1 end
    end
end)

-- Título animado
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,32)
title.Position = UDim2.new(0,0,0,5)
title.BackgroundTransparency = 1
title.Text = "PRISON LIFE MENU"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(0,153,255)
title.TextXAlignment = Enum.TextXAlignment.Center
task.spawn(function()
    local colors = {
        Color3.fromRGB(0,153,255),
        Color3.fromRGB(85,170,255),
        Color3.fromRGB(0,200,255),
        Color3.fromRGB(170,220,255)
    }
    local i = 1
    while true do
        local tween = TweenService:Create(title, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextColor3 = colors[i]})
        tween:Play()
        tween.Completed:Wait()
        i = i + 1
        if i > #colors then i = 1 end
    end
end)

-- Submenus
local submenuFrame = Instance.new("Frame", frame)
submenuFrame.Size = UDim2.new(1,-20,0,35)
submenuFrame.Position = UDim2.new(0,10,0,40)
submenuFrame.BackgroundTransparency = 1

local function crearSubmenu(nombre,posX)
    local b = Instance.new("TextButton", submenuFrame)
    b.Size = UDim2.new(0,100,1,0)
    b.Position = UDim2.new(0,posX,0,0)
    b.BackgroundColor3 = Color3.fromRGB(55,55,55)
    b.BorderSizePixel = 0
    b.Text = nombre
    b.Font = Enum.Font.GothamBold
    b.TextSize = 16
    b.TextColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,6)
    local s = Instance.new("UIStroke", b)
    s.Thickness = 2
    s.Color = Color3.fromRGB(0,153,255)
    task.spawn(function()
        local colors = {
            Color3.fromRGB(0,153,255),
            Color3.fromRGB(85,170,255),
            Color3.fromRGB(0,200,255),
            Color3.fromRGB(170,220,255)
        }
        local i = 1
        while true do
            local tween = TweenService:Create(s, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = colors[i]})
            tween:Play()
            tween.Completed:Wait()
            i = i + 1
            if i > #colors then i = 1 end
        end
    end)
    return b
end

local subMAIN = crearSubmenu("MAIN",0)
local subTP = crearSubmenu("TP",120)
local subMORE = crearSubmenu("MORE SCRIPT",240)

-- Frame de contenido
local contentFrame = Instance.new("Frame", frame)
contentFrame.Size = UDim2.new(1,-20,0,250)
contentFrame.Position = UDim2.new(0,10,0,80)
contentFrame.BackgroundTransparency = 1

local function limpiarContenido()
    for _,v in pairs(contentFrame:GetChildren()) do
        if v:IsA("TextButton") or v:IsA("TextLabel") then v:Destroy() end
    end
end

-- Toggle visibility del frame
local abierto = false
toggleButton.MouseButton1Click:Connect(function()
    abierto = not abierto
    frame.Visible = abierto
end)

-- Variables MAIN
local freeJumpEnabled = false
local infiniteJumpEnabled = false
local farmActive = false
local antiHitActive = false
local antiHitConnection = nil

local function getHumanoid()
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    return char, hum, root
end

local function updateJumpState()
    local char, hum, root = getHumanoid()
    if hum then
        if freeJumpEnabled or infiniteJumpEnabled then
            hum.JumpPower = 50
            hum.UseJumpPower = true
        else
            hum.JumpPower = 0
            hum.UseJumpPower = true
        end
    end
end

UIS.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local char = player.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

player.CharacterAdded:Connect(function()
    task.wait(0.1)
    updateJumpState()
end)

-- Fin Parte 1

-- Prison Life Menu (COMPLETO) - Parte 2
-- Aquí siguen todos los botones MAIN, TP, MORE SCRIPT tal cual me enviaste
-- Anti Hit, Free Jump y créditos en cada submenu ya están incluidos


-- MAIN Buttons funcionales
subMAIN.MouseButton1Click:Connect(function()
    limpiarContenido()

    -- Auto Farm
    local btnFarm = Instance.new("TextButton", contentFrame)
    btnFarm.Size = UDim2.new(1,0,0,40)
    btnFarm.Position = UDim2.new(0,0,0,0)
    btnFarm.BackgroundColor3 = Color3.fromRGB(55,55,55)
    btnFarm.BorderColor3 = Color3.fromRGB(0,153,255)
    btnFarm.BorderSizePixel = 2
    btnFarm.Text = farmActive and "Auto Farm: ON" or "Auto Farm Money"
    btnFarm.Font = Enum.Font.GothamBold
    btnFarm.TextSize = 16
    btnFarm.TextColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", btnFarm).CornerRadius = UDim.new(0,6)

    btnFarm.MouseButton1Click:Connect(function()
        farmActive = not farmActive
        btnFarm.Text = farmActive and "Auto Farm: ON" or "Auto Farm Money"
        if farmActive then
            task.spawn(function()
                while farmActive and player.Character and player.Character:FindFirstChild("HumanoidRootPart") do
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(557,113,-238)
                    task.wait(1)
                end
            end)
        end
    end)

    -- Free Jump
    local btnFreeJump = Instance.new("TextButton", contentFrame)
    btnFreeJump.Size = UDim2.new(1,0,0,40)
    btnFreeJump.Position = UDim2.new(0,0,0,50)
    btnFreeJump.BackgroundColor3 = Color3.fromRGB(55,55,55)
    btnFreeJump.BorderColor3 = Color3.fromRGB(0,153,255)
    btnFreeJump.BorderSizePixel = 2
    btnFreeJump.Text = freeJumpEnabled and "Free Jump: ON" or "Free Jump"
    btnFreeJump.Font = Enum.Font.GothamBold
    btnFreeJump.TextSize = 16
    btnFreeJump.TextColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", btnFreeJump).CornerRadius = UDim.new(0,6)

    btnFreeJump.MouseButton1Click:Connect(function()
        freeJumpEnabled = not freeJumpEnabled
        btnFreeJump.Text = freeJumpEnabled and "Free Jump: ON" or "Free Jump"
        updateJumpState()
    end)

    -- Infinite Jump
    local btnInfiniteJump = Instance.new("TextButton", contentFrame)
    btnInfiniteJump.Size = UDim2.new(1,0,0,40)
    btnInfiniteJump.Position = UDim2.new(0,0,0,100)
    btnInfiniteJump.BackgroundColor3 = Color3.fromRGB(55,55,55)
    btnInfiniteJump.BorderColor3 = Color3.fromRGB(0,153,255)
    btnInfiniteJump.BorderSizePixel = 2
    btnInfiniteJump.Text = infiniteJumpEnabled and "Infinite Jump: ON" or "Infinite Jump"
    btnInfiniteJump.Font = Enum.Font.GothamBold
    btnInfiniteJump.TextSize = 16
    btnInfiniteJump.TextColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", btnInfiniteJump).CornerRadius = UDim.new(0,6)

    btnInfiniteJump.MouseButton1Click:Connect(function()
        infiniteJumpEnabled = not infiniteJumpEnabled
        btnInfiniteJump.Text = infiniteJumpEnabled and "Infinite Jump: ON" or "Infinite Jump"
        updateJumpState()
    end)

    -- Anti Hit Avanzado
    local btnAntiHit = Instance.new("TextButton", contentFrame)
    btnAntiHit.Size = UDim2.new(1,0,0,40)
    btnAntiHit.Position = UDim2.new(0,0,0,150)
    btnAntiHit.BackgroundColor3 = Color3.fromRGB(55,55,55)
    btnAntiHit.BorderColor3 = Color3.fromRGB(0,153,255)
    btnAntiHit.BorderSizePixel = 2
    btnAntiHit.Text = antiHitActive and "ANTI HIT: ON" or "ANTI HIT"
    btnAntiHit.Font = Enum.Font.GothamBold
    btnAntiHit.TextSize = 16
    btnAntiHit.TextColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", btnAntiHit).CornerRadius = UDim.new(0,6)

    btnAntiHit.MouseButton1Click:Connect(function()
        antiHitActive = not antiHitActive
        btnAntiHit.Text = antiHitActive and "ANTI HIT: ON" or "ANTI HIT"

        if antiHitConnection then
            antiHitConnection:Disconnect()
            antiHitConnection = nil
        end

        if antiHitActive then
            local function setup(char)
                local hrp = char:WaitForChild("HumanoidRootPart")
                local hum = char:WaitForChild("Humanoid")
                local lastGoodCF = hrp.CFrame
                local antiHitEnabled = true
                local antiHitPending = false

                local function updateAntiHit()
                    local tool = char:FindFirstChildOfClass("Tool")
                    if tool and (tool.Name == "FlyingCarpet" or tool.Name == "Fling") then
                        antiHitEnabled = false
                        antiHitPending = false
                    else
                        if not antiHitEnabled then
                            antiHitPending = true
                            task.delay(1, function()
                                if antiHitPending then
                                    antiHitEnabled = true
                                    antiHitPending = false
                                    lastGoodCF = hrp.CFrame
                                end
                            end)
                        end
                    end
                end

                char.ChildAdded:Connect(function(child)
                    if child:IsA("Tool") then updateAntiHit() end
                end)
                char.ChildRemoved:Connect(function(child)
                    if child:IsA("Tool") then updateAntiHit() end
                end)
                updateAntiHit()

                antiHitConnection = RunService.Heartbeat:Connect(function()
                    if not antiHitEnabled then return end
                    pcall(function() hrp:SetNetworkOwner(player) end)
                    if hum.MoveDirection.Magnitude > 0 or hum.FloorMaterial ~= Enum.Material.Air then
                        lastGoodCF = hrp.CFrame
                    end
                    local lv = hrp.AssemblyLinearVelocity
                    local av = hrp.AssemblyAngularVelocity
                    local beingPushed =
                        lv.Magnitude > 0.1 or av.Magnitude > 0.1 or
                        hum.PlatformStand or
                        hum:GetState() == Enum.HumanoidStateType.Ragdoll or
                        hum:GetState() == Enum.HumanoidStateType.Physics or
                        hum:GetState() == Enum.HumanoidStateType.FallingDown or
                        hum:GetState() == Enum.HumanoidStateType.StrafingNoPhysics

                    if beingPushed then
                        hrp.CFrame = lastGoodCF
                        hum:ChangeState(Enum.HumanoidStateType.Running)
                        hum.PlatformStand = false
                        hum.Sit = false
                        hrp.AssemblyAngularVelocity = Vector3.new(0,0,0)
                        for _, obj in ipairs(hrp:GetChildren()) do
                            if (obj:IsA("BodyMover") or obj:IsA("VectorForce") or obj:IsA("AlignPosition")) and not obj.Parent:IsA("Tool") then
                                obj:Destroy()
                            end
                        end
                    end
                end)
            end
            player.CharacterAdded:Connect(setup)
            if player.Character then setup(player.Character) end
        end
    end)

    -- Créditos animados MAIN
    local creditText = Instance.new("TextLabel", contentFrame)
    creditText.Size = UDim2.new(1,0,0,40)
    creditText.Position = UDim2.new(0,0,0,210)
    creditText.BackgroundTransparency = 1
    creditText.Text = "YOUTUBE: SEBAS SCRIPT"
    creditText.Font = Enum.Font.GothamBold
    creditText.TextSize = 20
    creditText.TextColor3 = Color3.fromRGB(0,153,255)
    creditText.TextXAlignment = Enum.TextXAlignment.Center
    task.spawn(function()
        local colors = {
            Color3.fromRGB(0,153,255),
            Color3.fromRGB(85,170,255),
            Color3.fromRGB(0,200,255),
            Color3.fromRGB(170,220,255)
        }
        local i = 1
        while true do
            local tween = TweenService:Create(creditText, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextColor3=colors[i]})
            tween:Play()
            tween.Completed:Wait()
            i = i + 1
            if i>#colors then i=1 end
        end
    end)
end)

-- TP Submenu
subTP.MouseButton1Click:Connect(function()
    limpiarContenido()
    local positions = {
        {name="TP A TROLL 1", pos=CFrame.new(537,-282,-96)},
        {name="TP A TROLL 2", pos=CFrame.new(496,-139,-215)},
        {name="TP AL FINAL", pos=CFrame.new(547,109,-230)},
        {name="TP A BOBINA, CAMBIARDOR Y BOFETADA", pos={CFrame.new(571,-250,-204), CFrame.new(697,-341,-125), CFrame.new(534,109,-238)}}
    }
    for i,v in ipairs(positions) do
        local btn = Instance.new("TextButton", contentFrame)
        btn.Size = UDim2.new(1,0,0,40)
        btn.Position = UDim2.new(0,0,0,(i-1)*50)
        btn.BackgroundColor3 = Color3.fromRGB(55,55,55)
        btn.BorderColor3 = Color3.fromRGB(0,153,255)
        btn.BorderSizePixel = 2
        btn.Text = v.name
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 16
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)

        btn.MouseButton1Click:Connect(function()
            local char = player.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local hrp = char.HumanoidRootPart
            if type(v.pos) == "table" then
                local originalCF = hrp.CFrame
                task.spawn(function()
                    for _,p in ipairs(v.pos) do
                        hrp.CFrame = p
                        task.wait(1)
                    end
                    hrp.CFrame = originalCF
                end)
            else
                hrp.CFrame = v.pos
            end
        end)
    end

    -- Créditos animados TP
    local creditText = Instance.new("TextLabel", contentFrame)
    creditText.Size = UDim2.new(1,0,0,40)
    creditText.Position = UDim2.new(0,0,0,210)
    creditText.BackgroundTransparency = 1
    creditText.Text = "YOUTUBE: SEBAS SCRIPT"
    creditText.Font = Enum.Font.GothamBold
    creditText.TextSize = 20
    creditText.TextColor3 = Color3.fromRGB(0,153,255)
    creditText.TextXAlignment = Enum.TextXAlignment.Center
    task.spawn(function()
        local colors = {
            Color3.fromRGB(0,153,255),
            Color3.fromRGB(85,170,255),
            Color3.fromRGB(0,200,255),
            Color3.fromRGB(170,220,255)
        }
        local i = 1
        while true do
            local tween = TweenService:Create(creditText, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextColor3=colors[i]})
            tween:Play()
            tween.Completed:Wait()
            i = i + 1
            if i>#colors then i=1 end
        end
    end)
end)

-- MORE SCRIPT Submenu
subMORE.MouseButton1Click:Connect(function()
    limpiarContenido()
    local scripts = {
        {name="Invisible GUI", src="https://raw.githubusercontent.com/scriptcreations-sbs/Invisible-selection-/refs/heads/main/Invisible%20selector.lua"},
        {name="Local GUI", src="https://raw.githubusercontent.com/ScriptCreations-sbs/Script-local/refs/heads/main/Local_gui.lua"},
        {name="Infinite Yield", src="https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
        {name="Troll GUI", src="https://rawscripts.net/raw/No-Jumping-Tower-Jumping-Tower-65391"}
    }
    for i,v in ipairs(scripts) do
        local btn = Instance.new("TextButton", contentFrame)
        btn.Size = UDim2.new(1,0,0,40)
        btn.Position = UDim2.new(0,0,0,(i-1)*50)
        btn.BackgroundColor3 = Color3.fromRGB(55,55,55)
        btn.BorderColor3 = Color3.fromRGB(0,153,255)
        btn.BorderSizePixel = 2
        btn.Text = v.name
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 16
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)

        btn.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet(v.src,true))()
        end)
    end

    -- Créditos animados MORE SCRIPT
    local creditText = Instance.new("TextLabel", contentFrame)
    creditText.Size = UDim2.new(1,0,0,40)
    creditText.Position = UDim2.new(0,0,0,210)
    creditText.BackgroundTransparency = 1
    creditText.Text = "YOUTUBE: SEBAS SCRIPT"
    creditText.Font = Enum.Font.GothamBold
    creditText.TextSize = 20
    creditText.TextColor3 = Color3.fromRGB(0,153,255)
    creditText.TextXAlignment = Enum.TextXAlignment.Center
    task.spawn(function()
        local colors = {
            Color3.fromRGB(0,153,255),
            Color3.fromRGB(85,170,255),
            Color3.fromRGB(0,200,255),
            Color3.fromRGB(170,220,255)
        }
        local i = 1
        while true do
            local tween = TweenService:Create(creditText, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextColor3=colors[i]})
            tween:Play()
            tween.Completed:Wait()
            i = i + 1
            if i>#colors then i=1 end
        end
    end)
end)
