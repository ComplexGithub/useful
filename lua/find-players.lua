local FP = {}

local LP = game:GetService("Players").LocalPlayer

FP.LP = function()
    return LP
end

FP.Others = function()
    local PlayerList = {}
    for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
        if Player ~= LP then
            table.insert(PlayerList, Player)
        end
    end
    return PlayerList
end

FP.All = function()
    local PlayerList = {}
    for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
        table.insert(PlayerList, Player)
    end
    return PlayerList
end

FP.Random = function()
    local PlayerList = {}
    for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
        table.insert(PlayerList, Player)
    end
    return PlayerList[math.random(1, #PlayerList)]
end

FP.Player = function(String)
    for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
        if Player.DisplayName:lower():find(String:lower()) or Player.Name:lower():find(String:lower()) then
            if Player ~= LP then
                return Player
            end
        end
    end
end

FP.UserId = function(Id)
    local Check = game:GetService("Players"):GetPlayerByUserId(Id)
    if Check then
        return game:GetService("Players"):GetPlayerByUserId(Id)
    else
        return game:GetService("Players"):GetNameFromUserIdAsync(Id)
    end
end

FP.Age = function(Option)
    local OldestAliases = {"old", "oldest"}
    local YoungestAliases = {"young", "youngest"}
    if table.find(OldestAliases, Option:lower()) then
        local AccountAge = 0
        local OldestPlayer
        for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
            if Player ~= LP then
                if Player.AccountAge > AccountAge then
                    AccountAge = Player.AccountAge
                    OldestPlayer = Player
                end
            end
        end
        return {["Player"] = OldestPlayer, ["Age"] = AccountAge}
    end
    if table.find(YoungestAliases, Option:lower()) then
        local AccountAge = math.huge
        local YoungestPlayer
        for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
            if Player ~= LP then
                if Player.AccountAge < AccountAge then
                    AccountAge = Player.AccountAge
                    YoungestPlayer = Player
                end
            end
        end
        return {["Player"] = YoungestPlayer, ["Age"] = AccountAge}
    end
end

FP.Distance = function(Option)
    local FarthestAliases = {"far", "farthest"}
    local NearestAliases = {"near", "nearest"}
    if table.find(FarthestAliases, Option:lower()) then
        local Distance = 0
        local FarthestPlayer
        for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
            if Player ~= nil and Player ~= game:GetService("Players").LocalPlayer and Player.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                local Magnitude = math.round((Player.Character:FindFirstChild("HumanoidRootPart").Position - LP.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude)
                if Magnitude > Distance then
                    Distance = Magnitude
                    FarthestPlayer = Player
                end
            end
        end
        return {["Player"] = FarthestPlayer, ["Distance"] = Distance}
    end
    if table.find(NearestAliases, Option:lower()) then
        local Distance = math.huge
        local NearestPlayer
        for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
            if Player ~= nil and Player ~= game:GetService("Players").LocalPlayer and Player.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                local Magnitude = math.round((Player.Character:FindFirstChild("HumanoidRootPart").Position - LP.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude)
                if Magnitude < Distance then
                    Distance = Magnitude
                    NearestPlayer = Player
                end
            end
        end
        return {["Player"] = NearestPlayer, ["Distance"] = Distance}
    end
end

return FP
