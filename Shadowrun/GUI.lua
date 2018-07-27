function UpdateGUI()
    if Menu.Open then
        local entries = 0
        
        for i = 1, #Menu[Menu.Page] do
            if type(Menu[Menu.Page][i]) == "table" then
                entries = entries + 1
            end
        end
        
        gui.drawBox(0, 0, 319, 30 + entries * 8, Color.Outline, ColorPulse(Color.Background, 16))
        
        if Menu.Page >= MenuPage.PlayerBasic and Menu.Page <= MenuPage.PlayerStats then
            gui.pixelText(8, 8, Menu[Menu.Page].Header .. " (" .. Menu.Runner + 1 .. "/" .. "3)", Color.Header, 0)
        elseif bizstring.contains(Menu[Menu.Page].Header, "\r") then
            gui.pixelText(8, 8, Menu[Menu.Page].Header, ColorRainbow(), 0)
        else
            gui.pixelText(8, 8, Menu[Menu.Page].Header, Color.Header, 0)
        end
        
        for i = 1, Menu[Menu.Page].Max do
            local entry = Menu[Menu.Page][i]
            local color = entry.Color or Color.Text
            
            if i == Menu.Index and entry.Frozen then
                color = ColorPulse(Color.HighlightFrozen, 31, 8)
            elseif i == Menu.Index then
                color = ColorPulse(Color.Highlight, 31, 8)
            elseif entry.Frozen then
                color = ColorPulse(Color.Frozen, 31, 8, 16)
            end
            
            if entry.Text ~= nil then
                if entry.Address ~= nil then
                    local value = ReadValue(entry.Address, entry.Type)
                    local text = entry.Text .. ": " .. value
                    
                    if entry.Enum ~= nil and entry.Enum[value + 1] ~= nil then
                        text = text .. " (" .. entry.Enum[value + 1] .. ")"
                    elseif entry.BitField ~= nil then
                        for j = 1, #entry.BitField do
                            if value > 0 and value == bit.band(value, entry.BitField[j].Value) then
                                text = text .. " (" .. entry.BitField[j].Name .. ")"
                            end
                        end
                    elseif entry.Values ~= nil then
                        text = text .. " (" .. entry.Values[entry.Index].Name .. ")"
                    end
                    
                    gui.pixelText(8, 16 + (i * 8), text, color, 0)
                else
                    gui.pixelText(8, 16 + (i * 8), entry.Text, color, 0)
                end
            end
        end
    end
end
