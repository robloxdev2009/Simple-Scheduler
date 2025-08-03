local MarketplaceService = game:GetService("MarketplaceService")
local mod = {}
mod.__index = mod

function mod.new(plr, id)
    return setmetatable({id = id, plr = plr}, mod)
end

function mod:PromptProduct()
    MarketplaceService:PromptProductPurchase(self.plr, self.id, false)
end

function mod:OnProductBought(callback)
    local conn
    conn = MarketplaceService.PromptProductPurchaseFinished:Connect(function(userId, productId, isPurchased)
        if userId == self.plr.userId and productId == self.id then
            callback(isPurchased)
            conn:Disconnect()
        end
    end)
end

return mod