function OnChatMessage(message, sender)
    if sender == nil then return end
    if sender.GetID() ~= Player.GetLocal().GetID() then return end
    
    local cmd, url = string.match(message, "^!(%S+)%s*(.-)$")
    
    if cmd == "open" or cmd == "url" or cmd == "link" then
        if url and url ~= "" then
            if not string.find(url, "://") then
                url = "https://" .. url
            end
            
            local tempObj = GameObject.Create("LinkOpener")
            local browserComp = tempObj.AddComponent("BrowserLink")
            browserComp.SetField("url", url)
            browserComp.CallMethod("OpenLink")
            tempObj.Destroy()
        end
    end
end
