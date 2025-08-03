return function()
    local toret = {}
    for idx, v in script.Parent:GetDescendants() do
        if v:IsA("ModuleScript") and v ~= script then
            local ok
            ok, toret[v.Name] = pcall(require, v)
        end
    end
    return toret
end