KLib.GUI =
{
    X = 0,
    Y = 0,
    ForeColor = KLib.Color.White,
    BackColor = KLib.Color.Black,
    SubColor = { KLib.Color.Gray, KLib.Color.Make(32, 32, 32) },
    Size = 12,
    FontFamily = nil,
    FontStyle = nil,
    
    ActiveWindow = nil,
    Windows = {}
}

function KLib.GUI.Inside(x, y, width, height)
    local mx = KLib.Input.Mouse.X
    local my = KLib.Input.Mouse.Y
    
    if mx >= x and mx <= x + width and
       my >= y and my <= y + height then
        return true
    else
        return false
    end
end

function KLib.GUI.Position(x, y)
    KLib.GUI.X = x
    KLib.GUI.Y = y
end

function KLib.GUI.Move(x, y)
    KLib.GUI.X = KLib.GUI.X + x
    KLib.GUI.Y = KLib.GUI.Y + y
end

function KLib.GUI.Color(fore, back, sub)
    KLib.GUI.ForeColor = fore or KLib.Color.White
    KLib.GUI.BackColor = back or KLib.Color.Black
    KLib.GUI.SubColor = sub or { KLib.Color.Gray, KLib.Color.Make(32, 32, 32) }
end

function KLib.GUI.Font(size, family, style)
    KLib.GUI.Size = size
    KLib.GUI.FontFamily = family or KLib.GUI.FontFamily
    KLib.GUI.FontStyle = style or KLib.GUI.FontStyle
end

function KLib.GUI.Page(page)
    KLib.GUI.ActiveWindow.page = page
end

function KLib.GUI.Switch(window)
    KLib.GUI.ActiveWindow = window
end

function KLib.GUI.Window(width, height, title)
    local window = {}
    
    window.x = KLib.GUI.X
    window.y = KLib.GUI.Y
    window.width = width
    window.height = height
    window.title = title or ""
    window.titleSize = KLib.GUI.Size
    window.titleHeight = window.titleSize + 3
    window.lineColor = KLib.GUI.ForeColor
    window.backColor = KLib.GUI.BackColor
    window.titleColor = KLib.GUI.SubColor
    window.visible = true
    window.draggable = true
    window.dragging = false
    window.page = 1
    window.controls = {}
    
    KLib.GUI.X = KLib.GUI.X + 2
    KLib.GUI.Y = KLib.GUI.Y + window.titleHeight + 1
    KLib.GUI.ActiveWindow = window
    
    table.insert(KLib.GUI.Windows, window)
    
    return window
end

function KLib.GUI.Control(type)
    local control = {}
    
    control.type = type
    control.x = KLib.GUI.X
    control.y = KLib.GUI.Y
    control.width = 0
    control.height = 0
    control.visible = true
    control.value = nil
    control.onUpdate = nil
    
    table.insert(KLib.GUI.ActiveWindow.controls, control)
    
    return control
end

function KLib.GUI.CustomControl(type, t)
    local control = KLib.GUI.Control(type)
    
    for k, v in pairs(t) do
        control[k] = v
    end
    
    return control
end

function KLib.GUI.Separator(height, mode)
    local control = KLib.GUI.Control("separator")
    
    control.width = KLib.GUI.ActiveWindow.width - 4
    control.height = height or 6
    control.mode = mode or "none"
    control.color = KLib.GUI.ForeColor
    
    KLib.GUI.Y = KLib.GUI.Y + control.height
    
    return control
end

function KLib.GUI.PixelText(text)
    local control = KLib.GUI.Control("pixeltext")
    
    control.text = text
    control.color = KLib.GUI.ForeColor
    
    KLib.GUI.Y = KLib.GUI.Y + 7
    
    return control
end

function KLib.GUI.Text(text, halign, valign)
    local control = KLib.GUI.Control("text")
    
    control.text = text
    control.size = KLib.GUI.Size
    control.family = KLib.GUI.FontFamily
    control.style = KLib.GUI.FontStyle
    control.halign = halign or "left"
    control.valign = valign or "bottom"
    control.color = KLib.GUI.ForeColor
    
    KLib.GUI.Y = KLib.GUI.Y + control.size + 1
    
    return control
end

function KLib.GUI.Checkbox(text, enabled)
    local control = KLib.GUI.Control("checkbox")
    
    control.width = KLib.GUI.Size
    control.height = KLib.GUI.Size
    control.text = text
    control.textSize = KLib.GUI.Size
    control.textFamily = KLib.GUI.FontFamily
    control.textStyle = KLib.GUI.FontStyle
    control.textColor = KLib.GUI.ForeColor
    control.checkColor = KLib.GUI.ForeColor
    control.boxColor = KLib.GUI.ForeColor
    control.enabled = enabled or false
    
    KLib.GUI.Y = KLib.GUI.Y + control.height + 1
    
    return control
end

function KLib.GUI.Image(path, width, height)
    local control = KLib.GUI.Control("image")
    
    control.width = width
    control.height = height
    control.path = path
    
    KLib.GUI.Y = KLib.GUI.Y + control.height + 1
    
    return control
end

function KLib.GUI.Update()
    local window = KLib.GUI.ActiveWindow
    
    if window ~= nil and window.visible then
        gui.drawRectangle(window.x, window.y, window.width, window.titleHeight, window.lineColor, window.titleColor[1])
        gui.drawRectangle(window.x, window.y + window.titleHeight, window.width, window.height - window.titleHeight, window.lineColor, window.backColor)
        gui.drawText(window.x, window.y, window.title, window.lineColor, KLib.Color.Transparent, window.titleSize, KLib.GUI.FontFamily, KLib.GUI.FontStyle)
        
        for _, control in pairs(window.controls) do
            local x = window.x + control.x
            local y = window.y + control.y
            
            if control.visible then
                if control.onUpdate ~= nil then
                    control.onUpdate(control)
                end
                
                if control.type == "separator" then
                    if control.mode == "draw_top" then
                        gui.drawLine(x, y, x + control.width, y, control.color)
                    elseif control.mode == "draw_middle" then
                        gui.drawLine(x, y + (control.height / 2), x + control.width, y + (control.height / 2), control.color)
                    elseif control.mode == "draw_bottom" then
                        gui.drawLine(x, y + control.height, x + control.width, y + control.height, control.color)
                    end
                end
            
                if control.type == "pixeltext" then
                    gui.pixelText(x, y, control.text, control.color, KLib.Color.Transparent)
                end
                
                if control.type == "text" then
                    gui.drawText(x, y, control.text, control.color, KLib.Color.Transparent, control.size, control.family, control.style, control.halign, control.valign)
                end
                
                if control.type == "checkbox" then
                    gui.drawRectangle(x, y, control.width, control.height, control.boxColor)
                    gui.drawText(x + control.width + 4, y - 1, control.text, control.textColor, KLib.Color.Transparent, control.textSize, control.textFamily, control.textStyle)
                    
                    if control.enabled then
                        gui.drawRectangle(x + 2, y + 2, control.width - 4, control.height - 4, control.checkColor, control.checkColor)
                    end
                end
                
                if control.type == "image" then
                    gui.drawImage(control.path, x, y, control.width, control.height)
                end
            end
        end
        
        if window.draggable and KLib.Input.Mouse.Left and
           KLib.GUI.Inside(window.x, window.y, window.width, window.titleHeight) then
            window.dragging = true
        elseif window.dragging and not KLib.Input.Mouse.Left then
            window.dragging = false
        end
        if window.dragging then
            window.x = KLib.Math.Clamp(window.x + (KLib.Input.Mouse.X - KLib.Input.PrevMouse.X), 0, client.bufferwidth() - window.width - 1)
            window.y = KLib.Math.Clamp(window.y + (KLib.Input.Mouse.Y - KLib.Input.PrevMouse.Y), 0, client.bufferheight() - window.height - 1)
        end
    end
end

function KLib.GUI.Input()
    local window = KLib.GUI.ActiveWindow
    
    if window ~= nil and window.visible then
        for _, control in pairs(window.controls) do
            if control.visible then
                if control.onClick ~= nil and KLib.Input.MousePressed("Left") and KLib.GUI.Inside(x, y, control.width, control.height) then
                    control.onClick(control)
                end
                
                if control.type == "checkbox" then
                    if KLib.Input.MousePressed("Left") and KLib.GUI.Inside(x, y, control.width, control.height) then
                        control.enabled = not control.enabled
                    end
                end
            end
        end
    end
end
