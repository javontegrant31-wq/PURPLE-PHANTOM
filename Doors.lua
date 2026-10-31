
-- DOORS GUI | EDITSCLIPS
-- PURPLE PHANTOM | MOBILE Fix

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local purple = Color3.fromRGB(145, 0, 255)
local dark = Color3.fromRGB(15, 10, 22)
local white = Color3.fromRGB(240, 220, 255)
local buttonColor = Color3.fromRGB(35, 23, 48)

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "DoorsScriptHub"
gui.ResetOnSpawn = false
gui.DisplayOrder = 999

if gethui then
    gui.Parent = gethui()
else
    gui.Parent = player:WaitForChild("PlayerGui")
end

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0.92, 0, 0.82, 0)
main.Position = UDim2.new(0.04, 0, 0.09, 0)
main.BackgroundColor3 = dark
main.BorderSizePixel = 0
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke", main)
stroke.Color = purple
stroke.Thickness = 2

-- TITLE
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -110, 0, 45)
title.Position = UDim2.new(0, 12, 0, 3)
title.BackgroundTransparency = 1
title.Text = "DOORS GUI"
title.TextColor3 = purple
title.TextSize = 23
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local function makeTopButton(text, position)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 38, 0, 35)
    b.Position = position
    b.BackgroundColor3 = purple
    b.TextColor3 = white
    b.Text = text
    b.TextSize = 20
    b.Font = Enum.Font.GothamBold
    b.Parent = main
    Instance.new("UICorner", b)
    return b
end

local minimize = makeTopButton(
    "-", UDim2.new(1, -91, 0, 8)
)

local close = makeTopButton(
    "X", UDim2.new(1, -47, 0, 8)
)

-- CONTENT
local content = Instance.new("Frame")
content.Position = UDim2.new(0, 150, 0, 65)
content.Size = UDim2.new(1, -160, 1, -75)
content.BackgroundColor3 = Color3.fromRGB(23, 17, 32)
content.Parent = main
Instance.new("UICorner", content)

-- SIDEBAR
local sidebar = Instance.new("Frame")
sidebar.Position = UDim2.new(0, 8, 0, 65)
sidebar.Size = UDim2.new(0, 135, 1, -75)
sidebar.BackgroundTransparency = 1
sidebar.Parent = main

-- PAGE SYSTEM
local pages = {}

local function makePage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Size = UDim2.new(1, -12, 1, -12)
    page.Position = UDim2.new(0, 6, 0, 6)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.CanvasSize = UDim2.new(0, 0, 0, 550)
    page.Visible = false
    page.Parent = content

    pages[name] = page
    return page
end

-- LABEL
local function label(parent, text, y)
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, -10, 0, 35)
    l.Position = UDim2.new(0, 5, 0, y)
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = purple
    l.TextSize = 18
    l.Font = Enum.Font.GothamBold
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = parent
    return l
end

-- BUTTON FUNCTION
local function button(parent, text, y, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -15, 0, 38)
    b.Position = UDim2.new(0, 5, 0, y)
    b.BackgroundColor3 = buttonColor
    b.TextColor3 = white
    b.Text = text
    b.TextSize = 15
    b.Font = Enum.Font.Gotham
    b.AutoButtonColor = true
    b.Active = true
    b.Parent = parent

    Instance.new("UICorner", b)

    b.Activated:Connect(function()
        if callback then
            callback()
        end
    end)

    return b
end

-- TOGGLE FUNCTION
local toggleStates = {}

local function toggle(parent, name, y, callback)
    local enabled = false

    local b
    b = button(parent, name .. " : OFF", y, function()
        enabled = not enabled
        toggleStates[name] = enabled

        b.Text = name .. (enabled and " : ON" or " : OFF")
        b.BackgroundColor3 = enabled
            and purple
            or buttonColor

        if callback then
            callback(enabled)
        end
    end)

    return b
end

-- HOME
local home = makePage("Home")

label(home, "WELCOME TO DOORS HUB!", 15)

local welcome = Instance.new("TextLabel")
welcome.Size = UDim2.new(1, -10, 0, 50)
welcome.Position = UDim2.new(0, 5, 0, 55)
welcome.BackgroundTransparency = 1
welcome.Text = "Made by EDITSCLIPS"
welcome.TextColor3 = white
welcome.TextSize = 16
welcome.Font = Enum.Font.Gotham
welcome.Parent = home

button(home, "Check GUI Status", 115, function()
    print("PURPLE PHANTOM GUI is working!")
end)

-- ESP
local esp = makePage("ESP")
label(esp, "ESP SETTINGS", 5)

toggle(esp, "Enable ESP", 45)
toggle(esp, "Show Entities", 90)
toggle(esp, "Show Items", 135)
toggle(esp, "Show Traps", 180)
toggle(esp, "Show Players", 225)
toggle(esp, "Highlight Doors", 270)

-- MAIN FLOORS
local floors = makePage("Main Floors")
label(floors, "MAIN FLOORS", 5)

toggle(floors, "Auto Skip Rooms", 45)
toggle(floors, "No Rush", 90)
toggle(floors, "No Figure", 135)
toggle(floors, "Infinite Revives", 180)

local floorNames = {
    "Hotel",
    "Mines",
    "Backdoor",
    "Rooms"
}

local currentFloor = 1
local floorButton

floorButton = button(
    floors,
    "Floor Selector: Hotel",
    235,
    function()
        currentFloor = currentFloor % #floorNames + 1
        floorButton.Text =
            "Floor Selector: " .. floorNames[currentFloor]
    end
)

button(floors, "Teleport Feature: Not Connected", 285, function()
    warn("Teleport feature has not been implemented.")
end)

-- SETTINGS
local settings = makePage("Settings")
label(settings, "SETTINGS", 5)

toggle(settings, "Show Notifications", 45)
toggle(settings, "Dark Theme", 90)

-- ABOUT
local about = makePage("About")
label(about, "ABOUT PURPLE PHANTOM", 10)

local aboutText = Instance.new("TextLabel")
aboutText.Size = UDim2.new(1, -15, 0, 120)
aboutText.Position = UDim2.new(0, 5, 0, 55)
aboutText.BackgroundTransparency = 1
aboutText.TextColor3 = white
aboutText.TextSize = 16
aboutText.Font = Enum.Font.Gotham
aboutText.TextWrapped = true
aboutText.Text = "PURPLE PHANTOM\nMade by EDITSCLIPS\nDOORS GUI"
aboutText.Parent = about

-- PAGE NAVIGATION
local names = {
    "Home",
    "ESP",
    "Main Floors",
    "Settings",
    "About"
}

local function showPage(name)
    for pageName, page in pairs(pages) do
        page.Visible = pageName == name
    end

    print("Opened page: " .. name)
end

for i, name in ipairs(names) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 43)
    b.Position = UDim2.new(0, 0, 0, (i - 1) * 50)
    b.BackgroundColor3 = buttonColor
    b.TextColor3 = white
    b.Text = name
    b.TextSize = 15
    b.Font = Enum.Font.GothamBold
    b.Parent = sidebar

    Instance.new("UICorner", b)

    b.Activated:Connect(function()
        showPage(name)
    end)
end

showPage("Home")

-- MINIMIZE / RESTORE
local minimized = false

minimize.Activated:Connect(function()
    minimized = not minimized

    sidebar.Visible = not minimized
    content.Visible = not minimized

    minimize.Text = minimized and "+" or "-"
end)

-- CLOSE
close.Activated:Connect(function()
    gui:Destroy()
end)

-- DRAG WINDOW USING TITLE
local dragging = false
local dragStart
local startPosition

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then

        dragging = true
        dragStart = input.Position
        startPosition = main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - dragStart

        main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

print("PURPLE PHANTOM GUI loaded successfully!")
