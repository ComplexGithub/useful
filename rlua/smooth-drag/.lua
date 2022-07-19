-- Smooth drag for UIs
-- complex#0002 (900187302016471092)

return function(Frame, DragInfo)
    assert(type(Frame) == "userdata", "Invalid argument #1 (userdata expected, got " .. type(Frame) .. ")")
    assert(type(DragInfo) == "table", "Invalid argument #1 (table expected, got " .. type(DragInfo) .. ")")
    
    local UIS = game:GetService("UserInputService")
    
    local DragInput
    local DragStart
    local StartPosition
    local Dragging
    
    local function Update(Input)
        local Delta = Input.Position - DragStart
        Frame:TweenPosition(
            UDim2.new(
                StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, 
                StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y
            ), 
            DragInfo.Direction, 
            DragInfo.Style, 
            DragInfo.Time,
            true
        )
    end
    
    Frame.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = true
            DragStart = Input.Position
            StartPosition = Frame.Position

            Input.Changed:Connect(function()
                if Input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)
    
    Frame.InputChanged:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseMovement then
            DragInput = Input
        end
    end)
    
    UIS.InputChanged:Connect(function(Input)
        if Input == DragInput and Dragging then
            Update(Input)
        end
    end)
end
