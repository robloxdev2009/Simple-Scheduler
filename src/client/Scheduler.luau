local RunService = game:GetService("RunService")
local Scheduler = {}
Scheduler.__index = Scheduler

function Scheduler.new(func)
    return setmetatable({func = func}, Scheduler)
end

function Scheduler:After(Seconds, Callback, ...)
    assert(Seconds and typeof(Seconds) == "number", "Argument #1 on function 'After' requires a number.")
    local Args = {...}
    
    task.spawn(function()
        local Start = tick()
        
        while tick() - Start < Seconds do
            if self.cancelled then
                return
            end

            if Callback then
                Callback(unpack(Args))
            end

            RunService.Heartbeat:Wait()
        end

        self.func(unpack(Args))
    end)
end

function Scheduler:Every(Seconds, Callback, ...)
    assert(Seconds and typeof(Seconds) == "number", "Argument #1 on function 'Every' requires a number.")
    local Args = {...}

    task.spawn(function()
        local Start = tick()

        while true do
            if self.cancelled then
                return
            end

            if tick() - Start >= Seconds then
                Start = tick()
                self.func(unpack(Args))
            end

            Callback(unpack(Args))

            RunService.Heartbeat:Wait()
        end
    end)
end

function Scheduler:Cancel()
    self.cancelled = true
end

return Scheduler