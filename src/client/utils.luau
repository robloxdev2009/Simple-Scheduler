local Players = game:GetService("Players")
local mod = {}
mod.__index = mod

function mod.new()
    return setmetatable({}, mod)
end

function mod:getplr()
    if not self.plr then
        self.plr = Players.LocalPlayer
    end

    return self.plr
end

function mod:getchar()
    if not self.plr then
        self:getplr()
    end

    if not self.char then
        self.char = self.plr.Character or self.plr.CharacterAdded:Wait()
    end

    return self.char
end

return mod