-- LocalScript in StarterPlayerScripts

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- ====== SOUND SETUP ======
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://1837768517"
sound.Volume = 1
sound.PlaybackSpeed = 1
sound.Parent = PlayerGui
sound:Play()

-- Wait 50 seconds before starting fade
wait(50)

-- ====== MUSIC FADE ======
local fadeTime = 5
local steps = 50
local delayPerStep = fadeTime / steps

for i = 1, steps do
    sound.Volume = sound.Volume - (1 / steps)
    sound.PlaybackSpeed = sound.PlaybackSpeed - 0.01
    wait(delayPerStep)
end

sound:Stop()
sound:Destroy()

-- ====== FOG, TIME, AND DIM EFFECT ======
Lighting.FogColor = Color3.new(1,1,1)
Lighting.FogEnd = 150
Lighting.TimeOfDay = "13:00:00"
Lighting.Brightness = math.max(Lighting.Brightness - 0.1, 0.1)

-- ====== WINNING EVENT AFTER 100 SECONDS ======
wait(30)

-- Display Trophy Image
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = PlayerGui

local trophyImage = Instance.new("ImageLabel")
trophyImage.Size = UDim2.new(0, 300, 0, 300)
trophyImage.Position = UDim2.new(0.5, -150, 0.5, -150)
trophyImage.BackgroundTransparency = 1 -- fully transparent
trophyImage.ZIndex = 10
trophyImage.Image = "rbxassetid://3100736018" -- your trophy ID
trophyImage.Parent = screenGui

-- Optional: animate the trophy fading in and scaling
trophyImage.Size = UDim2.new(0, 0, 0, 0)
for i = 1, 20 do
    trophyImage.Size = trophyImage.Size + UDim2.new(15,0,15,0)
    wait(0.05)
end

-- Play Winning Sound
local winSound = Instance.new("Sound")
winSound.SoundId = "rbxassetid://109961399514238"
winSound.Volume = 3
winSound.Parent = PlayerGui
winSound:Play()

-- Wait a bit so player sees trophy, then kick
wait(5)
player:Kick("Error")
