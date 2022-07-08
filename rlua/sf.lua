-- "Shortened" Functions Library
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

F.Color3 = {
    fromHex = function(Integer)
        if type(Integer) == "string" then
            if Integer:find("0x") then
                Integer = tonumber(Integer)
            
                R = ((Integer / (256 ^ 2)) % 256) / 255
                G = ((Integer / 256) % 256) / 255
                B = (Integer % 256) / 255

                return Color3.new(R, G, B)
            elseif Integer:find("#") then
                Integer = tonumber("0x" .. Integer:gsub("#", ""))
            
                R = ((Integer / (256 ^ 2)) % 256) / 255
                G = ((Integer / 256) % 256) / 255
                B = (Integer % 256) / 255

                return Color3.new(R, G, B)
            else
                Integer = tonumber("0x" .. Integer)
            
                R = ((Integer / (256 ^ 2)) % 256) / 255
                G = ((Integer / 256) % 256) / 255
                B = (Integer % 256) / 255

                return Color3.new(R, G, B)
            end
        elseif type(Integer) == "number" then
            Integer = tonumber(Integer)
            
            R = ((Integer / (256 ^ 2)) % 256) / 255
            G = ((Integer / 256) % 256) / 255
            B = (Integer % 256) / 255
            
            return Color3.new(R, G, B)
        end
    end
}

return F
