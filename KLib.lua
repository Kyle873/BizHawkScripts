KLib =
{
    Color =
    {
        Transparent     = 0x00000000,
        Black           = 0xFF000000,
        Gray            = 0xFF3F3F3F,
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
        
        X = 0,
        Y = 0,
        ForeColor = KLib.Color.White,
        BackColor = KLib.Color.Black,
        SubColor = { KLib.Color.Gray, KLib.Color.Black },
        
        ActiveWindow = nil,
        Windows = {}
    }
}

-- ================================================== --
--                                                    --
-- UTILITY                                            --
--                                                    --
-- ================================================== --

function KLib.ValueToString(v)
    if type(v) == "string" then
        v = string.gsub(v, "\n", "\\n")
        
        if string.match(string.gsub(v, "[^'\"]", ""), '^"+$') then
            return "'" .. v .. "'"
        end
        
        return '"' .. string.gsub(v, '"', '\\"') .. '"'
    else
        return type(v) == "table" and KLib.TableToString(v) or tostring(v)
    end
end

function KLib.KeyToString(k)
    if type(k) == "string" and string.match(k, "^[_%a][_%a%d]*$") then
        return k
    else
        return "[" .. KLib.ValueToString(k) .. "]"
    end
end

function KLib.TableToString(t)
    local result, done = {}, {}
    
    for k, v in ipairs(t) do
        table.insert(result, KLib.ValueToString(v))
        done[k] = true
    end
    
    for k, v in pairs(t) do
        if not done[k] then
            table.insert(result, KLib.KeyToString(k) .. " = " .. KLib.ValueToString(v))
        end
    end
    
    return "{" .. table.concat(result, ",") .. "}"
end

function KLib.TableFind(t, v)
    for index, value in pairs(t) do
        if value == v then
            return index
        end
    end
end

function KLib.Clamp(value, min, max)
    if value < min then
        return min
    elseif value > max then
        return max
    else
        return value
    end
end

function KLib.Inside(x, y, width, height, x2, y2)
    x2 = x2 or KLib.GUI.Mouse.X
    y2 = y2 or KLib.GUI.Mouse.Y
    
    if x2 >= x and x2 <= x + width and
       y2 >= y and y2 <= y + height then
        return true
    else
        return false
    end
end

function KLib.Color.Pulse(color, mult, time, offset)
    time = time or 256
    offset = offset or 0
    
    local mod = math.sin(emu.framecount() / time + offset) * mult
    local a = bit.rshift(bit.band(color, 0xFF000000), 24)
    local r = bit.rshift(bit.band(color, 0x00FF0000), 16) + mod
    local g = bit.rshift(bit.band(color, 0x0000FF00), 8) + mod
    local b = bit.band(color, 0x000000FF) + mod
    
    if r < 0 then r = 0 elseif r > 255 then r = 255 end
    if g < 0 then g = 0 elseif g > 255 then g = 255 end
    if b < 0 then b = 0 elseif b > 255 then b = 255 end
    
    return bit.lshift(a, 24) + bit.lshift(r, 16) + bit.lshift(g, 8) + b
end

function KLib.Color.Rainbow(speed, alpha, offset)
    speed = speed or 64
    alpha = alpha or 255
    offset = offset or 0
    
    local r = math.sin(emu.framecount() / speed + offset) * 127 + 128
    local g = math.sin((emu.framecount() / speed + offset) + 2) * 127 + 128
    local b = math.sin((emu.framecount() / speed + offset) + 4) * 127 + 128
    
    return bit.lshift(alpha, 24) + bit.lshift(r, 16) + bit.lshift(g, 8) + b
end

-- ================================================== --
--                                                    --
-- GUI                                                --
--                                                    --
-- ================================================== --

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
    KLib.GUI.BackColor = back or KLib.Color.Transparent
    KLib.GUI.SubColor = sub or { KLib.Color.Gray, KLib.Color.Black }
end

function KLib.GUI.Window(width, height, title)
    local window = {}
    
    window.x = KLib.GUI.X
    window.y = KLib.GUI.Y
    window.width = width
    window.height = height
    window.titleHeight = 10
    window.title = title or ""
    window.lineColor = KLib.GUI.ForeColor
    window.backColor = KLib.GUI.BackColor
    window.titleColor = KLib.GUI.SubColor
    window.visible = true
    window.draggable = true
    window.dragging = false
    window.controls = {}
    
    KLib.GUI.X = KLib.GUI.X + 2
    KLib.GUI.Y = KLib.GUI.Y + 12
    KLib.GUI.ActiveWindow = window
    
    table.insert(KLib.GUI.Windows, window)
    
    return window
end

function KLib.GUI.Control(type)
    local control = {}
    
    control.type = type
    control.x = KLib.GUI.X
    control.y = KLib.GUI.Y
    control.visible = true
    control.value = nil
    control.onUpdate = nil
    
    table.insert(KLib.GUI.ActiveWindow.controls, control)
    
    return control
end

function KLib.GUI.PixelText(text)
    local control = KLib.GUI.Control("pixeltext")
    
    control.text = text
    control.color = KLib.GUI.ForeColor
    
    KLib.GUI.Y = KLib.GUI.Y + 7
    
    return control
end

function KLib.GUI.Text(text, size, family, style, halign, valign)
    local control = KLib.GUI.Control("text")
    
    control.text = text
    control.size = size or 12
    control.family = family or nil
    control.style = style or "regular"
    control.halign = halign or "left"
    control.valign = valign or "bottom"
    control.color = KLib.GUI.ForeColor
    
    KLib.GUI.Y = KLib.GUI.Y + control.size + 1
    
    return control
end

function KLib.GUI.Checkbox(text, enabled)
    local control = KLib.GUI.Control("checkbox")
    
    control.width = 6
    control.height = 6
    control.text = text
    control.enabled = enabled or false
    control.textColor = KLib.GUI.ForeColor
    control.checkColor = KLib.GUI.ForeColor
    control.boxColor = KLib.GUI.ForeColor
    
    KLib.GUI.Y = KLib.GUI.Y + 7
    
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
    local function IsActive(window)
        return KLib.GUI.ActiveWindow == window
    end
    
    KLib.GUI.Mouse = input.getmouse()
    
    for i = 1, #KLib.GUI.Windows do
        local window = KLib.GUI.Windows[i]
        
        if window.visible then
            if IsActive(window) then
                gui.drawRectangle(window.x, window.y, window.width, window.titleHeight, window.lineColor, window.titleColor[1])
            else
                gui.drawRectangle(window.x, window.y, window.width, window.titleHeight, window.lineColor, window.titleColor[2])
            end
            
            gui.drawRectangle(window.x, window.y + window.titleHeight, window.width, window.height - window.titleHeight, window.lineColor, window.backColor)
            gui.pixelText(window.x + 2, window.y + 2, window.title, window.lineColor, KLib.Color.Transparent)
            
            for _, control in pairs(window.controls) do
                if control.visible then
                    local x = window.x + control.x
                    local y = window.y + control.y
                    
                    if control.onClick ~= nil and KLib.GUI.Mouse.Left and not KLib.GUI.PreviousMouse.Left and KLib.Inside(x, y, control.width, control.height) then
                        control.onClick(control)
                    end
                    
                    if control.onUpdate ~= nil then
                        control.onUpdate(control)
                    end
                    
                    if control.type == "pixeltext" then
                        gui.pixelText(x, y, control.text, control.color, KLib.Color.Transparent)
                    end
                    
                    if control.type == "text" then
                        gui.drawText(x, y, control.text, control.color, KLib.Color.Transparent, control.size, control.family, control.style, control.halign, control.valign)
                    end
                    
                    if control.type == "checkbox" then
                        gui.drawRectangle(x, y, control.width, control.height, control.boxColor)
                        gui.pixelText(x + 8, y, control.text, control.textColor)
                        
                        if control.enabled then
                            gui.drawRectangle(x + 2, y + 2, control.width - 4, control.height - 4, control.checkColor, control.checkColor)
                        end
                        
                        if KLib.GUI.Mouse.Left and not KLib.GUI.PreviousMouse.Left and KLib.Inside(x, y, control.width, control.height) then
                            control.enabled = not control.enabled
                        end
                    end
                    
                    if control.type == "image" then
                        gui.drawImage(control.path, x, y, control.width, control.height)
                    end
                end
            end
            
            --[[ TODO: Click passthrough so that dragging/rearrangement can actually work
            if not IsActive(window) and not KLib.GUI.ActiveWindow.dragging then
                if window ~= KLib.GUI.ActiveWindow then
                    if KLib.GUI.Mouse.Left and not KLib.GUI.PreviousMouse.Left and KLib.Inside(window.x, window.y, window.width, window.height) then
                        KLib.GUI.ActiveWindow = window
                        table.remove(KLib.GUI.Windows, KLib.TableFind(KLib.GUI.Windows, window))
                        table.insert(KLib.GUI.Windows, window)
                    end
                end
            end
            --]]
            
            if IsActive(window) and window.draggable and KLib.GUI.Mouse.Left and
               KLib.Inside(window.x, window.y, window.width, window.titleHeight) then
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
