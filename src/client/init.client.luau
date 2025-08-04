local Scheduler = require(script.Scheduler).new(function(arg1, arg2)
    print("Hello world!", arg1, arg2)
end)

Scheduler:After(5, false, "Hello world, again!", "Hello world, for a third time!")