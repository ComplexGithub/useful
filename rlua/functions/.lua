-- Functions for scripts
-- complex#0002 (900187302016471092)

local F = {}

function F:HTTPEncode(Data)
    return game:GetService("HttpService"):JSONEncode(Data)
end

function F:HTTPDecode(Data)
    return game:GetService("HttpService"):JSONDecode(Data)
end

function F:GetPlayers()
    return game:GetService("Players"):GetPlayers()
end

function F.TableDelete(Table, Value)
    assert(type(Table) == "table", "Invalid argument #1 (table expected, got " .. type(Table) .. ")")
    table.remove(Table, table.find(Table, Value))
end

function F:Tween(Object, TweenInfoData, PropertyData)
    assert(type(Object) == "userdata", "Invalid argument #1 (userdata expected, got " .. type(Object) .. ")")
    assert(type(TweenInfoData) == "table", "Invalid argument #2 (table expected, got " .. type(TweenInfoData) .. ")")
    assert(type(PropertyData) == "table", "Invalid argument #3 (table expected, got " .. type(PropertyData) .. ")")
    
    local TI = TweenInfo.new(unpack(TweenInfoData))
    local Tween = game:GetService("TweenService"):Create(Object, TI, PropertyData)
    Tween:Play()
end

function F:Create(InstanceName, Properties)
    assert(type(InstanceName) == "string", "Invalid argument #1 (string expected, got " .. type(InstanceName) .. ")")
    assert(type(Properties) == "table", "Invalid argument #2 (table expected, got " .. type(Properties) .. ")")
    
    local CreatedInstance = Instance.new(InstanceName)
    
    for Property, Value in pairs(Properties) do
        CreatedInstance[Property] = Value
    end
    
    return CreatedInstance
end

function F:Color3Hex(Color)
    assert((type(Color) == "string") or (type(Color) == "number"), "Invalid argument #1 (string/number expected, got " .. type(Color) .. ")")

    if type(Color) == "string" then
        Color = tonumber("0x" .. Color:gsub("0x", ""):gsub("#", ""))

        R = ((Color / (256 ^ 2)) % 256) / 255
        G = ((Color / 256) % 256) / 255
        B = (Color % 256) / 255

        return Color3.new(R, G, B)
    elseif type(Color) == "number" then
        Color = tonumber(Color)

        R = ((Color / (256 ^ 2)) % 256) / 255
        G = ((Color / 256) % 256) / 255
        B = (Color % 256) / 255

        return Color3.new(R, G, B)
    end
end

function F:Color3Inverse(Color)
    assert(type(Color) == "userdata", "Invalid argument #1 (userdata expected, got " .. type(Color) .. ")")

    R = 1 - Color.R
    G = 1 - Color.G
    B = 1 - Color.B

    return Color3.new(R, G, B)
end

return F
