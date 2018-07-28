GUI =
{
    FancyBars = false -- CPU intensive!
}

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
            local value = 0
            
            if i == Menu.Index and entry.Frozen then
                color = ColorPulse(Color.HighlightFrozen, 31, 8)
            elseif i == Menu.Index then
                color = ColorPulse(Color.Highlight, 31, 8)
            elseif entry.Frozen then
                color = ColorPulse(Color.Frozen, 31, 8, 16)
            end
            
            if entry.Address ~= nil then
                value = ReadValue(entry.Address, entry.Type)
            end
            
            if entry.Bar ~= nil then
                local bar = entry.Bar
                local offset = 8 + (bar.Offset or 128)
                local width = bar.Width or 172
                local progress = (width / entry.Max) * value
                local color = bit.band(entry.Bar.Color, 0x00FFFFFF) + bit.lshift(192, 24)
                
                if progress > width then
                    progress = width
                end
                
                if not (Input.Typing and i == Menu.Index) then
                    gui.drawRectangle(offset, 16 + (i * 8), width, 7, color, Color.Transparent)
                    
                    if GUI.FancyBars then
                        for j = 1, progress - 1 do
                            gui.drawLine(offset + j, 17 + (i * 8), offset + j, 17 + (i * 8) + 5, ColorPulse(color, 63, 32, j / 4))
                        end
                    else
                        gui.drawRectangle(offset + 1, 17 + (i * 8), progress - 2, 5, color, color)
                    end
                end
            end
            
            if entry.Text ~= nil then
                if entry.Address ~= nil then
                    local text = entry.Text .. ": "
                    
                    if Input.Typing and i == Menu.Index then
                        local offset = 8 + ((string.len(text) + string.len(Input.Text)) * 6)
                        local color = ColorPulse(0xFFAFAFAF, 32, 8, 16)
                        
                        text = text .. Input.Text
                        
                        gui.drawRectangle(offset, 16 + (i * 8), 4, 8, color, color)
                    else
                        text = text .. value
                        
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
                    end
                    
                    gui.pixelText(8, 16 + (i * 8), text, color, 0)
                else
                    gui.pixelText(8, 16 + (i * 8), entry.Text, color, 0)
                end
            end
        end
    end
end
