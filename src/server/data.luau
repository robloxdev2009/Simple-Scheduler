local DataStoreService = game:GetService("DataStoreService")
local mod = {}
mod.__index = mod

function mod.new(Datastore)
    return setmetatable({Datastore = DataStoreService:GetDataStore(Datastore)}, mod)
end

function mod:Get(key)
    return self.Datastore:GetAsync(key)
end

function mod:Set(key, value)
    self.Datastore:SetAsync(key, value)
end

return mod