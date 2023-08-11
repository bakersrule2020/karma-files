--credit to openai's chatgpt
deletePartsWithScriptOrTouchInterest = function(parent)
    local parts = parent:GetDescendants()
    for _, part in pairs(parts) do
        if part:IsA("BasePart") then
            local hasScriptOrTouchInterest = false

            for _, descendant in pairs(part:GetDescendants()) do
                if descendant:IsA("Script") or descendant:IsA("TouchTransmitter") then
                    hasScriptOrTouchInterest = true
                    break
                end
            end

            if hasScriptOrTouchInterest then
                part:Destroy()
            end
        end
    end
end

deletePartsWithScriptOrTouchInterest(game.Workspace["Glass Bridge"])
