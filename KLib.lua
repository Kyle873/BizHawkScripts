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
    
    Input =
    {
        Joypad = joypad.get(),
        PrevJoypad = joypad.get(),
        
        Keyboard = input.get(),
        PrevKeyboard = input.get(),
        
        Mouse = input.getmouse(),
        PrevMouse = input.getmouse(),
        
        HoldTime = 0,
        HoldTimeThreshold = 60
    },
    
    GUI =
    {
        X = 0,
        Y = 0,
        ForeColor = 0,
        BackColor = 0,
        SubColor = {},
        Font = nil,
        Size = 12,
        
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

function KLib.FindTable(t, v)
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
    x2 = x2 or KLib.Input.Mouse.X
    y2 = y2 or KLib.Input.Mouse.Y
    
    if x2 >= x and x2 <= x + width and
       y2 >= y and y2 <= y + height then
        return true
    else
        return false
    end
end

-- ================================================== --
--                                                    --
-- COLOR                                              --
--                                                    --
-- ================================================== --

function KLib.Color.GetRed(color)
    return bit.rshift(bit.band(color, 0x00FF0000), 16)
end

function KLib.Color.GetGreen(color)
    return bit.rshift(bit.band(color, 0x0000FF00), 8)
end

function KLib.Color.GetBlue(color)
    return bit.band(color, 0x000000FF)
end

function KLib.Color.GetAlpha(color)
    return bit.rshift(bit.band(color, 0xFF000000), 24)
end

function KLib.Color.Make(r, g, b, a)
    return bit.lshift(a or 255, 24) + bit.lshift(r, 16) + bit.lshift(g, 8) + b
end

function KLib.Color.Get(color)
    return KLib.Color.GetRed(color), KLib.Color.GetGreen(color), KLib.Color.GetBlue(color), KLib.Color.GetAlpha(color)
end

function KLib.Color.RGBToHSV(r, g, b, a)
    r, g, b, a = r / 255, g / 255, b / 255, a / 255
    
    local max, min = math.max(r, g, b), math.min(r, g, b)
    local h, s, v
    local d = max - min
    
    v = max
    
    if max == 0 then
        s = 0
    else
        s = d / max
    end

    if max == min then
        h = 0
    else
        if max == r then
            h = (g - b) / d
            
            if g < b then
                h = h + 6
            end
        elseif max == g then
            h = (b - r) / d + 2
        elseif max == b then
            h = (r - g) / d + 4
        end
        
        h = h / 6
    end
    
    return h, s, v, a
end

function KLib.Color.HSVToRGB(h, s, v, a)
    local r, g, b
    
    local i = math.floor(h * 6);
    local f = h * 6 - i;
    local p = v * (1 - s);
    local q = v * (1 - f * s);
    local t = v * (1 - (1 - f) * s);
    
    i = i % 6
    
    if i == 0 then
        r, g, b = v, t, p
    elseif i == 1 then
        r, g, b = q, v, p
    elseif i == 2 then
        r, g, b = p, v, t
    elseif i == 3 then
        r, g, b = p, q, v
    elseif i == 4 then
        r, g, b = t, p, v
    elseif i == 5 then
        r, g, b = v, p, q
    end
    
    return r * 255, g * 255, b * 255, a * 255
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
-- INPUT                                              --
--                                                    --
-- ================================================== --

function KLib.Input.ButtonPressed(button)
    if KLib.Input.Joypad[button] then
        KLib.Input.HoldTime = KLib.Input.HoldTime + 1
    elseif not KLib.Input.Joypad[button] and KLib.Input.PrevJoypad[button] then
        KLib.Input.HoldTime = 0
    end
    
    if KLib.Input.HoldTime >= KLib.Input.HoldTimeThreshold then
		return KLib.Input.Joypad[button]
	else
		return KLib.Input.Joypad[button] and not KLib.Input.PrevJoypad[button]
	end
end

function KLib.Input.KeyPressed(key)
    if KLib.Input.Keyboard[key] then
        KLib.Input.HoldTime = KLib.Input.HoldTime + 1
    elseif KLib.Input.Keyboard[key] == nil and KLib.Input.PrevKeyboard[key] then
        KLib.Input.HoldTime = 0
    end
    
    if KLib.Input.HoldTime >= KLib.Input.HoldTimeThreshold then
		return KLib.Input.Keyboard[key]
	else
		return KLib.Input.Keyboard[key] and KLib.Input.PrevKeyboard[key] == nil
	end
end

function KLib.Input.MousePressed(click)
    return KLib.Input.Mouse[click] and not KLib.Input.PrevMouse[click]
end

function KLib.Input.Update()
    KLib.Input.Joypad = joypad.get()
    KLib.Input.Keyboard = input.get()
    KLib.Input.Mouse = input.getmouse()
end

function KLib.Input.PostUpdate()
    KLib.Input.PrevJoypad = KLib.Input.Joypad
    KLib.Input.PrevKeyboard = KLib.Input.Keyboard
    KLib.Input.PrevMouse = KLib.Input.Mouse
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
    KLib.GUI.BackColor = back or KLib.Color.Black
    KLib.GUI.SubColor = sub or { KLib.Color.Gray, KLib.Color.Make(32, 32, 32) }
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

function KLib.GUI.Text(text, size, style, halign, valign)
    local control = KLib.GUI.Control("text")
    
    control.text = text
    control.size = size or KLib.GUI.Size
    control.style = style or "regular"
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
    
    if window.visible then
        gui.drawRectangle(window.x, window.y, window.width, window.titleHeight, window.lineColor, window.titleColor[1])
        gui.drawRectangle(window.x, window.y + window.titleHeight, window.width, window.height - window.titleHeight, window.lineColor, window.backColor)
        gui.drawText(window.x, window.y, window.title, window.lineColor, KLib.Color.Transparent, window.titleSize, KLib.GUI.Font)
        
        for _, control in pairs(window.controls) do
            local x = window.x + control.x
            local y = window.y + control.y
            
            if control.visible then
                if control.onClick ~= nil and KLib.Input.MousePressed("Left") and KLib.Inside(x, y, control.width, control.height) then
                    control.onClick(control)
                end
                
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
                    gui.drawText(x, y, control.text, control.color, KLib.Color.Transparent, control.size, KLib.GUI.Font, control.style, control.halign, control.valign)
                end
                
                if control.type == "checkbox" then
                    gui.drawRectangle(x, y, control.width, control.height, control.boxColor)
                    gui.drawText(x + control.width + 4, y - 1, control.text, control.textColor, KLib.Color.Transparent, control.textSize, KLib.GUI.Font)
                    
                    if control.enabled then
                        gui.drawRectangle(x + 2, y + 2, control.width - 4, control.height - 4, control.checkColor, control.checkColor)
                    end
                    
                    if KLib.Input.MousePressed("Left") and KLib.Inside(x, y, control.width, control.height) then
                        control.enabled = not control.enabled
                    end
                end
                
                if control.type == "image" then
                    gui.drawImage(control.path, x, y, control.width, control.height)
                end
            end
        end
        
        if window.draggable and KLib.Input.Mouse.Left and
           KLib.Inside(window.x, window.y, window.width, window.titleHeight) then
            window.dragging = true
        elseif window.dragging and not KLib.Input.Mouse.Left then
            window.dragging = false
        end
        if window.dragging then
            window.x = KLib.Clamp(window.x + (KLib.Input.Mouse.X - KLib.Input.PrevMouse.X), 0, client.bufferwidth() - window.width - 1)
            window.y = KLib.Clamp(window.y + (KLib.Input.Mouse.Y - KLib.Input.PrevMouse.Y), 0, client.bufferheight() - window.height - 1)
        end
    end
end
