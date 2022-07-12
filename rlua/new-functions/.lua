-- Remade/new functions for scripts
-- complex#0002 (900187302016471092)

local F = {}

F.HTTPEncode = function(Data)
    return game:GetService("HttpService"):JSONEncode(Data)
end

F.HTTPDecode = function(Data)
    return game:GetService("HttpService"):JSONDecode(Data)
end

F.GetPlayers = function()
    return game:GetService("Players"):GetPlayers()
end

F.C3 = {
    Hex = function(Color)
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
    end,
    Inverse = function(Color)
        assert(type(Color) == "userdata", "Invalid argument #1 (userdata expected, got " .. type(Color) .. ")")
        
        R = 1 - Color.R
        G = 1 - Color.G
        B = 1 - Color.B
        
        return Color3.new(R, G, B)
    end
}

F.TableDelete = function(Table, Value)
    table.remove(Table, table.find(Table, Value))
end

F.Tween = function(Object, TweenInfoData, PropertyData)
    local TI = TweenInfo.new(unpack(TweenInfoData))
    local Tween = game:GetService("TweenService"):Create(Object, TI, PropertyData)
    Tween:Play()
end

return F
