KLib.Input =
{
    Joypad = joypad.get(),
    PrevJoypad = joypad.get(),

    Keyboard = input.get(),
    PrevKeyboard = input.get(),

    Mouse = input.getmouse(),
    PrevMouse = input.getmouse(),

    HoldTime = 0,
    HoldTimeThreshold = 60
}

function KLib.Input.ButtonPressed(button, hold)
    hold = hold or true

    if hold then
        if KLib.Input.Joypad[button] then
            KLib.Input.HoldTime = KLib.Input.HoldTime + 1
        elseif not KLib.Input.Joypad[button] and KLib.Input.PrevJoypad[button] then
            KLib.Input.HoldTime = 0
        end
    end

	if KLib.Input.HoldTime >= KLib.Input.HoldTimeThreshold then
		return KLib.Input.Joypad[button]
    else
		return KLib.Input.Joypad[button] and not KLib.Input.PrevJoypad[button]
	end
end

function KLib.Input.KeyPressed(key, hold)
    hold = hold or true

    if hold then
        if KLib.Input.Keyboard[key] then
            KLib.Input.HoldTime = KLib.Input.HoldTime + 1
        elseif KLib.Input.Keyboard[key] == nil and KLib.Input.PrevKeyboard[key] then
            KLib.Input.HoldTime = 0
        end
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

function KLib.Input.BlockJoypad()
    joypad.set(joypad.get())
end

function KLib.Input.ParseString(text)
    local start = 0
    local hold = false
    local prefix = ""
    local input = ""

    if string.sub(text, 1, 1) == "+" then
        start = 3
        hold = true
    else
        start = 2
    end

    prefix = string.sub(text, start - 1, start - 1)
    input = string.sub(text, start, #text)

    if prefix == "@" then
        if hold then
            return KLib.Input.Keyboard[input]
        else
            return KLib.Input.KeyPressed(input)
        end
    elseif prefix == "#" then
        if hold then
            return KLib.Input.Joypad[input]
        else
            return KLib.Input.ButtonPressed(input)
        end
    elseif prefix == "$" then
        if hold then
            return KLib.Input.Mouse[input]
        else
            return KLib.Input.MousePressed(input)
        end
    end
end

function KLib.Input.ParseTable(t)
    local input = true

    for _, key in ipairs(t) do
        if not KLib.Input.ParseString(key) then
            input = false
            break
        end
    end

    return input
end

function KLib.Input.Parse(value)
    if type(value) == "table" then
        return KLib.Input.ParseTable(value)
    else
        return KLib.Input.ParseString(value)
    end
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
