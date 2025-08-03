local Module = {}

function Module.Load(Loading)
    local ContentProvider = game:GetService("ContentProvider")
    local AssetsToLoad = game:GetDescendants()
    local FinishedLoading = false
    local LoadedAssets = 0
    task.spawn(function()
        while not FinishedLoading do
            local LoadingLabel = Loading.LoadingLabel
            LoadingLabel.Text = LoadingLabel.Text.."."
            if LoadingLabel.Text == "Loading...." then
               LoadingLabel.Text = "Loading"
            end
            task.wait(0.25)
        end
    end)
    for idx, prt in AssetsToLoad do
        ContentProvider:PreloadAsync({prt})
        LoadedAssets = idx
        Loading.Percentage.Text = tostring(math.round(LoadedAssets / #AssetsToLoad * 100)).."%"
    end
    task.wait(1)
    FinishedLoading = true
    Loading:Destroy()
    Loading = nil
end

return Module