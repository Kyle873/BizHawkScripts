KLib =
{
    Color =
    {
        Transparent     = 0x00000000,
        Black           = 0xFF000000,
        Red             = 0xFFFF0000,
        Orange          = 0xFFFF7F00,
        Yellow          = 0xFFFFFF00,
        Green           = 0xFF00FF00,
        Blue            = 0xFF007FFF,
        Cyan            = 0xFF00FFFF,
        Purple          = 0xFFFF00FF,
        Pink            = 0xFFFF7FFF,
        White           = 0xFFFFFFFF
    },
    
    GUI =
    {
        Mouse = input.getmouse(),
        PreviousMouse = input.getmouse(),
        
        ActiveWindow = nil,
        Windows = {}
    }
}

-- ================================================== --
--                                                    --
-- UTILITY                                            --
--                                                    --
-- ================================================== --

function KLib.Clamp(value, min, max)
    if value < min then
        return min
    elseif value > max then
        return max
    else
        return value
    end
end

function KLib.Inside(x, y, x2, y2, width, height)
    if x >= x2 and x <= x2 + width and
       y >= y2 and y <= y2 + height then
        return true
    else
        return false
    end
end

function KLib.TableFind(t, v)
    for index, value in pairs(t) do
        if value == v then
            return index
        end
    end
end

-- ================================================== --
--                                                    --
-- GUI                                                --
--                                                    --
-- ================================================== --

function KLib.GUI.CreateWindow(x, y, width, height, title, backColor, lineColor)
    local window = {}
    
    window.x = x
    window.y = y
    window.width = width
    window.height = height
    window.title = title or ""
    window.backColor = backColor or KLib.Color.Black
    window.lineColor = lineColor or KLib.Color.White
    window.visible = true
    window.draggable = false
    window.dragging = false
    window.controls = {}
    
    KLib.GUI.ActiveWindow = window
    
    table.insert(KLib.GUI.Windows, window)
    
    return window
end

function KLib.GUI.CreateText(x, y, text, foreColor, backColor)
    local control = {}
    
    control.type = "text"
    control.x = x
    control.y = y
    control.width = string.len(text) * 4
    control.height = 6
    control.text = text
    control.foreColor = foreColor or KLib.Color.White
    control.backColor = backColor or KLib.Color.Transparent
    control.onClick = nil
    control.onUpdate = nil
    
    table.insert(KLib.GUI.ActiveWindow.controls, control)
    
    return control
end

function KLib.GUI.CreateImage(x, y, width, height, path)
    local control = {}
    
    control.type = "image"
    control.x = x
    control.y = y
    control.width = width
    control.height = height
    control.path = path
    
    table.insert(KLib.GUI.ActiveWindow.controls, control)
    
    return control
end

function KLib.GUI.Update()
    local function IsActive(window)
        return KLib.GUI.ActiveWindow == window
    end
    
    local function HalfAlpha(color)
        local a = bit.rshift(bit.band(color, 0xFF000000), 24)
        local r = bit.rshift(bit.band(color, 0x00FF0000), 16)
        local g = bit.rshift(bit.band(color, 0x0000FF00), 8)
        local b = bit.band(color, 0x000000FF)
        
        return bit.lshift(a / 2, 24) + bit.lshift(r, 16) + bit.lshift(g, 8) + b
    end
    
    KLib.GUI.Mouse = input.getmouse()
    
    for i = 1, #KLib.GUI.Windows do
        local window = KLib.GUI.Windows[i]
        
        if window.visible then
            if IsActive(window) then
                gui.drawRectangle(window.x, window.y, window.width, window.height, window.lineColor, window.backColor)
                gui.pixelText(window.x + 2, window.y + 2, window.title, window.lineColor, KLib.Color.Transparent)
                gui.drawLine(window.x, window.y + 10, window.x + window.width, window.y + 10, window.lineColor)
            else
                gui.drawRectangle(window.x, window.y, window.width, window.height, HalfAlpha(window.lineColor), HalfAlpha(window.backColor))
                gui.pixelText(window.x + 2, window.y + 2, window.title, HalfAlpha(window.lineColor), KLib.Color.Transparent)
                gui.drawLine(window.x, window.y + 10, window.x + window.width, window.y + 10, HalfAlpha(window.lineColor))
            end
            
            for _, control in pairs(window.controls) do
                local x = window.x + control.x
                local y = window.y + control.y + 10
                
                if control.onClick ~= nil and KLib.GUI.Mouse.Left and not KLib.GUI.PreviousMouse.Left and KLib.Inside(KLib.GUI.Mouse.X, KLib.GUI.Mouse.Y, x, y, control.width, control.height) then
                    control.onClick(control)
                end
                
                if control.onUpdate ~= nil then
                    control.onUpdate(control)
                end
                
                if control.type == "text" then
                    if IsActive(window) then
                        gui.pixelText(x, y, control.text, control.foreColor, control.backColor)
                    else
                        gui.pixelText(x, y, control.text, HalfAlpha(control.foreColor), HalfAlpha(control.backColor))
                    end
                end
                
                if control.type == "image" then
                    gui.drawImage(control.path, x, y, control.width, control.height)
                end
            end
            
            --[[ TODO: Click passthrough so that dragging/rearrangement can actually work
            if not IsActive(window) and not KLib.GUI.ActiveWindow.dragging then
                if window ~= KLib.GUI.ActiveWindow then
                    if KLib.GUI.Mouse.Left and not KLib.GUI.PreviousMouse.Left and KLib.Inside(KLib.GUI.Mouse.X, KLib.GUI.Mouse.Y, window.x, window.y, window.width, window.height) then
                        KLib.GUI.ActiveWindow = window
                        table.remove(KLib.GUI.Windows, KLib.TableFind(KLib.GUI.Windows, window))
                        table.insert(KLib.GUI.Windows, window)
                    end
                end
            end
            --]]
            
            if IsActive(window) and window.draggable and KLib.GUI.Mouse.Left and
               KLib.Inside(KLib.GUI.Mouse.X, KLib.GUI.Mouse.Y, window.x, window.y, window.width, 10) then
                window.dragging = true
            elseif window.dragging and not KLib.GUI.Mouse.Left then
                window.dragging = false
            end
            if window.dragging then
                window.x = KLib.Clamp(window.x + (KLib.GUI.Mouse.X - KLib.GUI.PreviousMouse.X), 0, client.bufferwidth() - window.width - 1)
                window.y = KLib.Clamp(window.y + (KLib.GUI.Mouse.Y - KLib.GUI.PreviousMouse.Y), 0, client.bufferheight() - window.height - 1)
            end
        end
    end
    
    KLib.GUI.PreviousMouse = KLib.GUI.Mouse
end
