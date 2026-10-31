-- DOORS GUI | EDITSCLIPS
-- Purple Neon Edition

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui")
gui.Name = "DoorsScriptHub"
gui.ResetOnSpawn = false

if gethui then
    gui.Parent = gethui()
else
    gui.Parent = game:GetService("CoreGui")
end

local purple = Color3.fromRGB(145, 0, 255)
local dark = Color3.fromRGB(15, 10, 22)
local white = Color3.fromRGB(240, 220, 255)

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 700, 0, 440)
main.Position = UDim2.new(0.5, -350, 0.5, -220)
main.BackgroundColor3 = dark
main.BorderSizePixel = 0

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke", main)
stroke.Color = purple
stroke.Thickness = 2

local function label(parent, text, size, pos, color)
    local l = Instance.new("TextLabel", parent)
    l.Size = size
    l.Position = pos
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = color or white
    l.TextSize = 18
    l.Font = Enum.Font.GothamBold
    return l
end

label(main, "DOORS GUI", UDim2.new(1, -80, 0, 55),
    UDim2.new(0, 20, 0, 5), purple)

label(main, "Script  •  ESP  •  Main Floors",
    UDim2.new(1, -40, 0, 25),
    UDim2.new(0, 20, 0, 55))

local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0, 40, 0, 40)
close.Position = UDim2.new(1, -50, 0, 10)
close.Text = "X"
close.TextSize = 22
close.TextColor3 = white
close.BackgroundColor3 = purple
close.Font = Enum.Font.GothamBold
Instance.new("UICorner", close)
close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local minimize = Instance.new("TextButton", main)
minimize.Size = UDim2.new(0, 40, 0, 40)
minimize.Position = UDim2.new(1, -100, 0, 10)
minimize.Text = "-"
minimize.TextSize = 25
minimize.TextColor3 = white
minimize.BackgroundColor3 = purple
minimize.Font = Enum.Font.GothamBold
Instance.new("UICorner", minimize)

local content = Instance.new("Frame", main)
content.Position = UDim2.new(0, 180, 0, 105)
content.Size = UDim2.new(1, -195, 1, -120)
content.BackgroundColor3 = Color3.fromRGB(23, 17, 32)
Instance.new("UICorner", content)

local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0, 165, 1, -110)
sidebar.Position = UDim2.new(0, 8, 0, 105)
sidebar.BackgroundTransparency = 1

local pages = {}

local function makePage(name)
    local page = Instance.new("ScrollingFrame", content)
    page.Size = UDim2.new(1, -15, 1, -15)
    page.Position = UDim2.new(0, 8, 0, 8)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.CanvasSize = UDim2.new(0, 0, 0, 550)
    page.Visible = false
    pages[name] = page
    return page
end

local function button(parent, text, y, callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, -15, 0, 38)
    b.Position = UDim2.new(0, 5, 0, y)
    b.BackgroundColor3 = Color3.fromRGB(35, 23, 48)
    b.TextColor3 = white
    b.Text = text
    b.TextSize = 16
    b.Font = Enum.Font.Gotham
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(callback)
    return b
end

local function toggle(parent, text, y)
    local enabled = false
    local b = button(parent, text .. " : OFF", y, function()
        enabled = not enabled
        b.Text = text .. (enabled and " : ON" or " : OFF")
        b.BackgroundColor3 = enabled and purple
            or Color3.fromRGB(35, 23, 48)
    end)
    return b
end

-- ESP PAGE
local esp = makePage("ESP")
label(esp, "ESP SETTINGS", UDim2.new(1,0,0,35),
    UDim2.new(0,5,0,0), purple)

toggle(esp, "Enable ESP", 45)
toggle(esp, "Show Entities", 90)
toggle(esp, "Show Items", 135)
toggle(esp, "Show Traps", 180)
toggle(esp, "Show Players", 225)
toggle(esp, "Highlight Doors", 270)

-- MAIN FLOORS PAGE
local floors = makePage("Main Floors")
label(floors, "MAIN FLOORS", UDim2.new(1,0,0,35),
    UDim2.new(0,5,0,0), purple)

toggle(floors, "Auto Skip Rooms", 45)
toggle(floors, "No Rush", 90)
toggle(floors, "No Figure", 135)
toggle(floors, "Infinite Revives", 180)

local floorButton = button(floors, "Floor Selector: Hotel", 235,
    function()
        floorButton.Text = "Floor Selector: Hotel"
    end)

button(floors, "Teleport to Next Floor (Unavailable)", 285,
    function() end)

-- SETTINGS PAGE
local settings = makePage("Settings")
label(settings, "SETTINGS", UDim2.new(1,0,0,35),
    UDim2.new(0,5,0,0), purple)

toggle(settings, "Show Notifications", 45)
toggle(settings, "Dark Theme", 90)

-- HOME PAGE
local home = makePage("Home")
label(home, "WELCOME TO DOORS HUB!",
    UDim2.new(1,0,0,50),
    UDim2.new(0,5,0,10), purple)

label(home, "Made by EDITSCLIPS",
    UDim2.new(1,0,0,35),
    UDim2.new(0,5,0,65))

-- SIDEBAR
local names = {"Home", "ESP", "Main Floors", "Settings", "About"}

for i, name in ipairs(names) do
    local b = Instance.new("TextButton", sidebar)
    b.Size = UDim2.new(1, 0, 0, 43)
    b.Position = UDim2.new(0, 0, 0, (i-1)*52)
    b.BackgroundColor3 = Color3.fromRGB(35, 20, 50)
    b.TextColor3 = white
    b.Text = name
    b.TextSize = 17
    b.Font = Enum.Font.GothamBold
    Instance.new("UICorner", b)

    b.MouseButton1Click:Connect(function()
        for _, page in pairs(pages) do
            page.Visible = false
        end

        if pages[name] then
            pages[name].Visible = true
        end
    end)
end

home.Visible = true

minimize.MouseButton1Click:Connect(function()
    content.Visible = not content.Visible
    sidebar.Visible = not sidebar.Visible
end)

-- DRAGGABLE WINDOW
local dragging, dragStart, startPos

main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

print("DOORS GUI loaded successfully!")
