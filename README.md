**Simple Scheduler**

A simple scheduling tool that schedules events on command!

**How to use:**

simply run the ```.new``` function with your target function as the first argument:

```local Scheduler = require(script.Scheduler).new(function(arg1, arg2) print("Hello world!", arg1, arg2) end)```

to use the function, call either Every or After with at least one argument, the number of seconds to wait:

```Scheduler:After(5, false, "Hello world, again!", "Hello world, for a third time!")```

the second argument is an optional callback that runs every frame while waiting. if you don’t need it, you can either leave it out or just set it to false.

any other arguments will be passed into:

- the per-frame callback, if included
- the main function you gave to .new once the time is up