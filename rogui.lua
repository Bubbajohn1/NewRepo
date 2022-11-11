local RoGui = {
    name = "RoGui",
    screenparent = nil,
    begunFrames = {},
    ListLayout = nil,
    menuOptions = nil
}
getgenv().RoGui = RoGui

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService('UserInputService')
local Camera = game.Workspace.CurrentCamera
local WorldtoScreenPoint = Camera.worldToViewportPoint
local TextService = game:GetService("TextService")

--local vars
--[[
     RoGuiStyleVar_FramePadding
     RoGuiStyleVar_FrameTransparency
     RoGuiStyleVar_ButtonColor
     RoGuiStyleVar_TextColor
     RoGuiSeperatorFlags_Horizontal
     RoGuiSeperatorFlags_Vertical
     RoGuiStyleVar_
]]
RoGui.vars = {
    RoGuiStyleVar_FramePadding = nil,
    RoGuiStyleVar_FrameTransparency = nil,
    RoGuiStyleVar_ButtonColor = nil,
    RoGuiStyleVar_TextColor = nil,
    RoGuiSeperatorFlags_Horizontal = nil,
    RoGuiSeperatorFlags_Vertical = nil,
    RoGuiStyleVar_BorderSize = nil,
    RoGuiStyleVar_BorderColor = nil,
    RoGuiStyleVar_BorderTransparency = nil
}


function MakeLighter(color)
    local H, S, V = color:ToHSV()
    V = math.clamp(V + 6, 0, 1)
    return Color3.fromHSV(H, S, V)
end


function RoGUi_UTF8ICONTOTEXT(icon)

end
function RoGui:ThrowError(start)

end
function RoColor(r, g, b) return Color3.fromRGB(r, g, b) end
function RoVec2(x, y) return Vector2.new(x, y) end
function RoVec2Ud(x, y) return UDim2.new(0, x, 0, y) end
function RoVec3(x, y, z) return Vector3.new(x, y, z) end
function RoValue(v) return v end
function RoGui:Create(x, y)
    local obj = Instance.new(x)
    for i,v in pairs(y) do
        obj[i] = v
    end
    return obj
end
local style = {
    Colors = {
        MainBg = RoColor(22,22,22),
        TitleMenuBg = RoColor(41, 74, 122),
        TitleTextColor = RoColor(220, 220, 220),
        MainColor = RoColor(41, 74, 122)
    },
    fonts = {
        TitleFont = Enum.Font.Code
    },
    windowSize = nil
}
getgenv().style = style
local IO = {
    fonts = {
       AddNewFont = function(font)

       end 
    },
    AddMouseButtonEvent = function()

    end,
    openKey = Enum.KeyCode.RightShift
}
getgenv().IO = IO

function RoGui:GetIO() return IO end
function RoGui:GetStyle() return style end
do
    if(not isfolder("./" .. RoGui.name)) then
        makefolder("./" .. RoGui.name)
    end if(not isfile("./" .. RoGui.name  .. "/version.txt")) then
        writefile("./" .. RoGui.name  .. "/version.txt", "")
    end
end
function ROGUI_GETVERSION()
    local response; local data; local suc,err = pcall(function()
        response = game:HttpGet("https://raw.githubusercontent.com/Bubbajohn1/RoGui/main/httpchecks/version.json")
        data = HttpService:JSONDecode(response)
    end) if(err) then
        error("RoGui Error: HttpError, Could not find ROGUI_CHECKVERSION")
    elseif(suc) then
        return data.version
    end
end
function RoGui:CreateContext()
    if(game:GetService("CoreGui"):FindFirstChild("RoGui")) then game:GetService("CoreGui"):FindFirstChild("RoGui"):Destroy() end
    if(RoGui.screenparent == nil) then
        RoGui.screenparent = RoGui:Create("ScreenGui", {
            ResetOnSpawn = false,
            Name = "RoGui"
        })
    end
    
    return RoGui.screenparent
end
function RoGui.GetItem()
    local things = {
        Parent = "a"
    }

    return things
end
function RoGui:DestroyContext()
    game:GetService("CoreGui"):FindFirstChild("RoGui"):Destroy()
end
function RoGui:NewFrame()

end
function RoGui:EndFrame()
    
end
function RoGui:PushFont(font)

end
function RoGui:Spacing()
    RoGui:Create("Frame", {
        Size = UDim2.new(1, 0, 0, 2),
        Parent = RoGui.menuOptions,
        BackgroundTransparency = 1
    })
end
function RoGui:SameLine()
    RoGui.ListLayout.FillDirection = Enum.FillDirection.Horizontal
    RoGui.ListLayout.FillDirection = Enum.FillDirection.Vertical
end
function RoGui:Seperator(type)
    if(type == RoGuiSeperatorFlags_Vertical) then
        
    elseif(type == RoGuiSeperatorFlags_Horizontal) then
        
    end
end
local main
function RoGui:Begin(text, openBool, flags)
    if(openBool == nil) then openBool = true end
    local MainFrame = RoGui:Create("Frame", {
        Name = "MainFrame",
        Parent = RoGui.screenparent,
        BackgroundColor3 = RoGui:GetStyle().Colors.MainBg,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(0, 472, 0, 600),
        Visible = openBool,
        ClipsDescendants = true
    })
    local function YOXZW_fake_script() -- MainFrame.LocalScript 
        local script = Instance.new('LocalScript', MainFrame)
        local UserInputService = game:GetService("UserInputService")
        local Camera = game.Workspace.CurrentCamera
        
        script.Parent.InputBegan:Connect( function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging = true
                StartDragPos = Vector2.new(Input.Position.X, Input.Position.Y)
                ItemPosition = Vector2.new(script.Parent.Position.X.Scale, script.Parent.Position.Y.Scale)
            end
        end)
        
        script.Parent.InputEnded:Connect( function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging = false
            end
        end)
        
        UserInputService.InputChanged:Connect( function(Input)  
            if Dragging then
                local NewPos = ItemPosition + ((Vector2.new(Input.Position.X, Input.Position.Y) - StartDragPos) / Camera.ViewportSize)   
                script.Parent.Position = UDim2.new(NewPos.X, 0, NewPos.Y, 0)
            end
        end)
    end
    coroutine.wrap(YOXZW_fake_script)()
    
    
    local TitleFrame = RoGui:Create("Frame", {
        Name = "TitleFrame",
        Parent = MainFrame,
        BackgroundColor3 = RoGui:GetStyle().Colors.TitleMenuBg,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 20)
    })
    local UIPadding = RoGui:Create("UIPadding", {
        Parent = TitleFrame
    })
    local Title = RoGui:Create("TextLabel", {
        Name = "Title",
        Parent = TitleFrame,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0.02, 0, 0, 0),
        Size = UDim2.new(0.90, 0, 1, 0),
        Font = RoGui:GetStyle().fonts.TitleFont,
        TextColor3 = RoGui:GetStyle().Colors.TitleTextColor,
        TextSize = 15.000,
        Text = text,
        TextXAlignment = Enum.TextXAlignment.Left
    })

    local close = RoGui:Create("ImageButton", {
        Name = "close",
        Parent = TitleFrame,
        BackgroundTransparency = 1.000,
        LayoutOrder = 5,
        Position = UDim2.new(0.95, 0, 0.0, 0),
        Size = UDim2.new(0, 20, 0, 20),
        ZIndex = 2,
        Image = "rbxassetid://3926305904",
        ImageRectOffset = Vector2.new(284, 4),
        ImageRectSize = Vector2.new(24, 24),
        BorderSizePixel = 0
    })
    local UICorner = RoGui:Create("UICorner", {
        CornerRadius = UDim.new(0, 219030123),
        Parent = close
    })


    close.MouseEnter:Connect(function()
        --25, 76, 128
        close.BackgroundColor3 = MakeLighter(RoGui:GetStyle().Colors.MainColor)
        close.BackgroundTransparency = 0
    end)

    close.MouseLeave:Connect(function()
        close.BackgroundTransparency = 1
    end)

    close.MouseButton1Down:Connect(function()
        RoGui:DestroyContext()
    end)

    local MainContainer = RoGui:Create("ScrollingFrame", {
        Name = "MainContainer",
        Parent = MainFrame,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0.0211864412, 0, 0.0466666669, 0),
        Size = UDim2.new(0.963983059, 0, 0.953333318, 0),
        ScrollBarThickness = 8
    })
    local UIPadding = RoGui:Create("UIPadding", {
        Parent = MainContainer
    })
    local UIListLayout = RoGui:Create("UIListLayout", {
        Parent = MainContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0.004, 0)
    })
    local function ReSize()
        MainContainer.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
    end

    ReSize()
    MainContainer.ChildAdded:Connect(ReSize)
    MainContainer.ChildRemoved:Connect(ReSize)

    RoGui.ListLayout = UIListLayout
    RoGui.menuOptions = MainContainer

    UserInputService.InputBegan:Connect(function(Key)
        if(Key.KeyCode == RoGui:GetIO().openKey) then
            openBool = not openBool
            MainFrame.Visible = openBool
        end
    end)

    if(flags.NoTitle == true) then
        TitleFrame:Destroy()
        MainContainer.Size = UDim2.new(0.963983059, 0, 0.98, 0)
        MainContainer.Position = UDim2.new(0.0211864412, 0, 0.01, 0)
    elseif(flags == nil) then
        return
    end
end
function RoGui:Text(text)
    text = text or "New text"
    local TextLabelFrame = RoGui:Create("Frame", {
        Name = "TextLabelFrame",
        Parent = RoGui.menuOptions,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0.0211864412, 0, 0.00174825173, 0),
        Size = UDim2.new(1, 0, 0, 25)
    })
    local UIPadding = RoGui:Create("UIPadding", {
        Parent = TextLabelFrame
    })
    local TextLabelFrameText = RoGui:Create("TextLabel", {
        Name = "TextLabelFrameText",
        Parent = TextLabelFrame,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1.000,
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.SourceSans,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16.000,
        TextStrokeTransparency = 0.000,
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = text
    })

    local color = {}
    function color:PushStyleVar(var)
        var = var or {}
        if(var.textcolor or var.TextColor or var.textColor) then
            TextLabelFrameText.TextColor3 = var.textcolor or var.TextColor or var.textColor
        end
        if(var.background or var.Background) then
            TextLabelFrame.BackgroundTransparency = 0
            TextLabelFrame.BackgroundColor3 = var.background or var.Background
        end
    end

    local labelsize = game:GetService("TextService"):GetTextSize(TextLabelFrameText.Text, TextLabelFrameText.TextSize, TextLabelFrameText.Font, Vector2.new(math.huge, math.huge))
    TextLabelFrame.Size = UDim2.new(0, labelsize.x + 6, 0, labelsize.y + 3)

    return color
end
function RoGui:Button(text, callback)    --\
    text = text or "New Button"
    callback = callback or function () end
    local ButtonFrame = RoGui:Create("Frame", {
        Name = "ButtonFrame",
        Parent = RoGui.menuOptions,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1.000,
        BorderSizePixel = 0,
        Position = UDim2.new(0.0211864412, 0, 0.00174825173, 0),
        Size = UDim2.new(1, 0, 0, 25)
    })
    local UIPadding = RoGui:Create("UIPadding", {
        Parent = ButtonFrame
    })
    local TextButton = RoGui:Create("TextButton", {
        Parent = ButtonFrame,
        BackgroundColor3 =Color3.fromRGB(41, 74, 122),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1,0),
        Font = Enum.Font.SourceSans,
        Text = text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14.000,
        TextStrokeTransparency = 0.000
    })

    local labelsize = game:GetService("TextService"):GetTextSize(TextButton.Text, TextButton.TextSize, TextButton.Font, Vector2.new(math.huge, math.huge))
    ButtonFrame.Size = UDim2.new(0, labelsize.x + 10, 0, labelsize.y + 5)

    local color
    TextButton.MouseEnter:Connect(function()
        TextButton.BackgroundColor3 = MakeLighter(TextButton.BackgroundColor3)
    end)
    TextButton.MouseLeave:Connect(function()
        TextButton.BackgroundColor3 = color
    end)
    TextButton.MouseButton1Down:Connect(function()
        pcall(callback)
    end)

    local color = {}

    function color:PushStyleVar(var)
        var = var or {}
        if(var.textcolor or var.TextColor or var.textColor) then
            TextButton.TextColor3 = var.textcolor or var.TextColor or var.textColor
        end
        if(var.background or var.Background) then
            TextButton.BackgroundTransparency = 0
            TextButton.BackgroundColor3 = var.background or var.Background
        end
    end

    return color
end
function RoGui:CheckBox(text, bool, callback)
    local actions = {} 
    text = text or "New Checkbox"
    bool = bool or false
    callback = callback or function() end

    local CheckBoxFrame = RoGui:Create("Frame", {
        Name = "CheckBoxFrame",
        Parent = RoGui.menuOptions,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1.000,
        Size = UDim2.new(1, 0, 0, 25)
    })
    local UIPadding = RoGui:Create("UIPadding", {
        Parent = CheckBoxFrame
    })
    local CheckBoxButon = RoGui:Create("TextButton", {
        Name = "CheckBoxButon",
        Parent = CheckBoxFrame,
        BackgroundColor3 = Color3.fromRGB(41, 74, 122),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 25, 0, 25),
        Font = Enum.Font.SourceSans,
        Text = "",
        TextColor3 = Color3.fromRGB(66, 150, 250),
        TextSize = 18.000,
        TextScaled = true
    })
    local TextLabel = RoGui:Create("TextLabel", {
        Parent = CheckBoxFrame,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1.000,
        Position = UDim2.new(0.07, 0, 0, 0),
        Size = UDim2.new(0.918681324, 0, 1, 0),
        Font = Enum.Font.SourceSans,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16.000,
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = text,
        TextStrokeTransparency = 0.000
    })

    if(bool == true) then
        CheckBoxButon.BackgroundColor3 = RoColor(66, 150, 250)
    elseif(bool == false) then
        CheckBoxButon.BackgroundColor3 = RoColor(41, 74, 122)
    end
    CheckBoxButon.MouseButton1Down:Connect(function()
        bool = not bool
        if(bool == true) then
            CheckBoxButon.BackgroundColor3 = RoColor(66, 150, 250)
        elseif(bool == false) then
            CheckBoxButon.BackgroundColor3 = RoColor(41, 74, 122)
        end
        pcall(callback, bool)
    end)
end
function RoGui:Ratio(text, bool, callback)
    text = text or "New Checkbox"
    bool = bool or false
    callback = callback or function() end

    local CheckBoxFrame = RoGui:Create("Frame", {
        Name = "CheckBoxFrame",
        Parent = RoGui.menuOptions,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1.000,
        Size = UDim2.new(1, 0, 0, 25)
    })
    local UIPadding = RoGui:Create("UIPadding", {
        Parent = CheckBoxFrame
    })
    local CheckBoxButon = RoGui:Create("TextButton", {
        Name = "RatioBoxButon",
        Parent = CheckBoxFrame,
        BackgroundColor3 = Color3.fromRGB(41, 74, 122),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 25, 0, 25),
        Font = Enum.Font.SourceSans,
        Text = "",
        TextColor3 = Color3.fromRGB(66, 150, 250),
        TextSize = 18.000,
        TextScaled = true
    })
    local TextLabel = RoGui:Create("TextLabel", {
        Parent = CheckBoxFrame,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1.000,
        Position = UDim2.new(0.07, 0, 0, 0),
        Size = UDim2.new(0.918681324, 0, 1, 0),
        Font = Enum.Font.SourceSans,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16.000,
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = text,
        TextStrokeTransparency = 0.000
    })

    local Round = RoGui:Create("UICorner", {
        Parent = CheckBoxButon,
        CornerRadius = UDim.new(0, 20)
    })
    
    local UiStroke = RoGui:Create("UIStroke", {
        Parent = CheckBoxButon,
        Thickness = 0,
        Color = RoColor(21, 54, 102)
    })
    if(bool == true) then
        CheckBoxButon.BackgroundColor3 = RoColor(66, 150, 250)
    elseif(bool == false) then
        CheckBoxButon.BackgroundColor3 = RoColor(41, 74, 122)
    end
    CheckBoxButon.MouseEnter:Connect(function()
        UiStroke.Thickness = 2
    end)
    CheckBoxButon.MouseLeave:Connect(function()
        UiStroke.Thickness = 0
    end)
    CheckBoxButon.MouseButton1Down:Connect(function()
        bool = not bool
        if(bool == true) then
            CheckBoxButon.BackgroundColor3 = RoColor(66, 150, 250)
        elseif(bool == false) then
            CheckBoxButon.BackgroundColor3 = RoColor(41, 74, 122)
        end
        pcall(callback, bool)
    end)
end
function RoGui:ComboBox(text, options, callback)
    
end
function RoGui:Slider(text, min, max, callback)

end
function RoGui:Input(text, callback)
    callback = callback or function() end
    local TextBoxFrame = RoGui:Create("Frame", {
        Name = "TextBoxFrame",
        Parent = RoGui.menuOptions,
        BackgroundColor3 = Color3.fromRGB(58, 58, 58),
        BackgroundTransparency = 1.000,
        Size = UDim2.new(1, 0, 0, 25)
    })
    local UIPadding = RoGui:Create("UIPadding", {
        Parent = TextBoxFrame
    })
    local TextBox : TextBox = RoGui:Create("TextBox", {
        Parent = TextBoxFrame,
        BackgroundColor3 = RoGui:GetStyle().Colors.MainColor,
        BorderSizePixel = 0,
        Size = UDim2.new(0.5, 0, 1, 0),
        Font = Enum.Font.SourceSans,
        Text = "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 15.5,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        TextStrokeTransparency = 0.000
    })
    local TextLabel = RoGui:Create("TextLabel", {
        Parent = TextBoxFrame,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1.000,
        Position = UDim2.new(0.516483545, 0, 0, 0),
        Size = UDim2.new(0.483516484, 0, 1, 0),
        Font = Enum.Font.SourceSans,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16.000,
        TextStrokeTransparency = 0.000,
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = text
    })

    if(text == false) then
        TextLabel:Destroy()
    end

    local a = RoGui:GetIO().openKey
    local function onFocusLost(enterPressed, inputThatCausedFocusLost)
        pcall(callback, TextBox.Text)
        RoGui:GetIO().openKey = a
    end

    TextBox.FocusLost:Connect(onFocusLost)
    TextBox.Focused:Connect(function()
        RoGui:GetIO().openKey = nil
    end)
end
function RoGui:Child(childId)

end
function RoGui:Color()

end
function RoGui:List()

end
function RoGui:Header()

end
function RoGui:End()

end
function RoGui:Render()
    RoGui.screenparent.Parent = game:GetService("CoreGui")
end
-------
-------
-------
-------
-------
-------
-------
-------
-------
-------

local io = RoGui:GetIO()
local style = RoGui:GetStyle()

RoGui:CreateContext()

RoGui:NewFrame()

    local openBool = true
    RoGui:Begin("Test Menu", openBool, {NoTitle = false})
            RoGui:Input("InputBox", function(text)
                print(text)
            end)

            RoGui:CheckBox("Check", false, function(state)
                print(state)
            end)

            RoGui:Ratio("Ratio", true, function(state)
                print(state)
            end)

            RoGui:Text("Normal Text")
            RoGui:Text("Different Text"):PushStyleVar({textcolor = RoColor(255, 255, 0), RoGuiStyleVar_BorderTransparency = nil})
            RoGui:Button("Button", function()
                print("hello")
            end):PushStyleVar({textcolor = RoColor(0, 255, 0), background = RoColor(255, 0, 0)})
    RoGui:End()
    
RoGui:EndFrame()
RoGui:Render()