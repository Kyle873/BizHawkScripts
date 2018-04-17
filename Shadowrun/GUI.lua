function DrawGUI()
    if Menu.Open then
        gui.box(0, 0, Menu[Menu.Page].Width, Menu[Menu.Page].Height, Color.Background, Color.Outline)
        
        if Menu.Page >= MenuPage.PlayerBasic and Menu.Page <= MenuPage.PlayerStats then
            gui.text(8, 8, Menu[Menu.Page].Header .. " (" .. Menu.Runner + 1 .. "/" .. "3)", Color.Header)
        else
            gui.text(8, 8, Menu[Menu.Page].Header, Color.Header)
        end
        
        for i = 1, Menu[Menu.Page].Max do
            local entry = Menu[Menu.Page][i]
            local color = entry.Color or Color.Text
            
            if i == Menu.Index and entry.Frozen then
                color = Color.HighlightFrozen
            elseif i == Menu.Index then
                color = Color.Highlight
            elseif entry.Frozen then
                color = Color.Frozen
            end
            
            if entry.Text ~= nil then
                if entry.Address ~= nil then
                    local value = ReadValue(entry.Address, entry.Type)
                    local text = entry.Text .. ": " .. value
                    
                    if entry.Enum ~= nil and entry.Enum[value + 1] ~= nil then
                        text = text .. " (" .. entry.Enum[value + 1] .. ")"
                    elseif entry.BitField ~= nil then
                        for j = 1, #entry.BitField do
                            if value == AND(entry.BitField[j].Value) then
                                text = text .. " (" .. entry.BitField[j].Name .. ")"
                            end
                        end
                    elseif entry.Values ~= nil then
                        text = text .. " (" .. entry.Values[entry.Index].Name .. ")"
                    end
                    
                    gui.text(8, 16 + (i * 8), text, color)
                else
                    gui.text(8, 16 + (i * 8), entry.Text, color)
                end
            end
        end
    end
    
    UpdateMessage()
end
gui.register(DrawGUI)
