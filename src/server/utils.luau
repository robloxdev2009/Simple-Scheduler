local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local mod = {}
mod.__index = mod

function mod.new()
    return setmetatable({}, mod)
end

function mod:getplrs()
    return Players:GetPlayers()
end

function mod:getchars()
    local chars = {}
    for k, plr in self:getplrs() do
        local char = plr.Character or plr.CharacterAdded:Wait()
        chars[plr] = char
    end
    return chars
end

function mod:plradded()
    return Players.PlayerAdded
end

function mod:plrleaving()
    return Players.PlayerRemoving
end

function mod:wait(seconds, callback)
    local start = tick()
    local current

    repeat
        current = tick()

        if callback then
            callback(math.round(current - start))
        end

        RunService.Heartbeat:Wait()
    until current - start > seconds
end

return mod