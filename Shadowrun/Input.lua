Input =
{
    Current = {},
    Previous = {},
    Clear =
    {
        Up = false,
        Down = false,
        Left = false,
        Right = false,
        A = false,
        B = false,
        C = false,
        Start = false,
        X = false,
        Y = false,
        Z = false,
        Mode = false
    },
    
    DisableJoypad = true,
    Typing = false,
    Text = "",
    
    Timer = 0,
    RepeatDelay = 60,
    
    MenuKey = "F",
    UpKey = "UpArrow",
    DownKey = "DownArrow",
    LeftKey = "LeftArrow",
    RightKey = "RightArrow",
    UseKey = "A",
    BackKey = "R",
    SwitchCharKey = "D",
    FreezeKey = "Q",
    ZeroKey = "W",
    MaxKey = "E",
    TypeKey = "S",
    SellFilesKey = "T"
}

function KeyPressed(key)
	if Input.Current[key] then
		Input.Timer = Input.Timer + 1
	elseif Input.Current[key] == nil and Input.Previous[key] then
		Input.Timer = 0
	end
	
	if Input.Timer >= Input.RepeatDelay then
		return Input.Current[key]
	else
		return Input.Current[key] and Input.Previous[key] == nil
	end
end

function UpdateInput()
    Input.Current = input.get()
    
    if KeyPressed(Input.MenuKey) then
        Menu.Open = not Menu.Open
    end
        
    if KeyPressed(Input.TypeKey) then
        local entry = Menu[Menu.Page][Menu.Index]
        
        if entry.Address ~= nil then
            Input.Typing = not Input.Typing
        end
    end
    
    if not Input.Typing and KeyPressed(Input.SellFilesKey) then
        SellFiles()
    end
    
    if Menu.Open then
        local entry = Menu[Menu.Page][Menu.Index]
        
        if Input.DisableJoypad then
            joypad.set(Input.Clear, 1)
        end
        
        if Input.Typing then
            UpdateTyping(entry)
        else
            if KeyPressed(Input.BackKey) and Menu.Page ~= MenuPage.Main then
                Menu.Page = MenuPage.Main
                Menu.Index = Menu[Menu.Page].DefaultIndex
            end
            
            if KeyPressed(Input.SwitchCharKey) and Menu.Page >= MenuPage.PlayerBasic and Menu.Page <= MenuPage.PlayerStats then
                Menu.Runner = Menu.Runner + 1
                
                if Menu.Runner > 2 then
                    Menu.Runner = 0
                end
            end
            
            if KeyPressed(Input.FreezeKey) then
                entry.Frozen = not entry.Frozen
                entry.FrozenValue = ReadValue(entry.Address, entry.Type)
            end
            
            if KeyPressed(Input.ZeroKey) then
                local entry = Menu[Menu.Page][Menu.Index]
                
                if entry.Values ~= nil then
                    WriteValue(entry.Address, entry.Type, entry.Values[1].Value)
                elseif entry.BitField ~= nil or entry.Enum ~= nil then
                    WriteValue(entry.Address, entry.Type, 0)
                else
                    WriteValue(entry.Address, entry.Type, entry.Min)
                end
            end
            
            if KeyPressed(Input.MaxKey) then
                local entry = Menu[Menu.Page][Menu.Index]
                
                if entry.Values ~= nil then
                    WriteValue(entry.Address, entry.Type, entry.Values[#entry.Values].Value)
                elseif entry.BitField ~= nil then
                    local value = 0
                    
                    for i, v in pairs(entry.BitField) do
                        value = bit.bor(value, v.Value)
                    end
                    
                    WriteValue(entry.Address, entry.Type, value)
                elseif entry.Enum ~= nil then
                    WriteValue(entry.Address, entry.Type, #entry.Enum - 1)
                else
                    WriteValue(entry.Address, entry.Type, entry.Max)
                end
            end
            
            if KeyPressed(Input.UpKey) then
                Menu.Index = Menu.Index - 1
                
                while Menu[Menu.Page][Menu.Index] ~= nil and Menu[Menu.Page][Menu.Index].Skip == true do
                    Menu.Index = Menu.Index - 1
                end
                
                if Menu.Index < 1 then
                    Menu.Index = Menu[Menu.Page].Max
                    
                    while Menu[Menu.Page][Menu.Index] ~= nil and Menu[Menu.Page][Menu.Index].Skip == true do
                        Menu.Index = Menu.Index - 1
                    end
                end
            end
            if KeyPressed(Input.DownKey) then
                Menu.Index = Menu.Index + 1
                
                while Menu[Menu.Page][Menu.Index] ~= nil and Menu[Menu.Page][Menu.Index].Skip == true do
                    Menu.Index = Menu.Index + 1
                end
                
                if Menu.Index > Menu[Menu.Page].Max then
                    Menu.Index = Menu[Menu.Page].DefaultIndex or 1
                    
                    while Menu[Menu.Page][Menu.Index] ~= nil and Menu[Menu.Page][Menu.Index].Skip == true do
                        Menu.Index = Menu.Index + 1
                    end
                end
            end
            
            if entry.Address ~= nil then
                if entry.Values ~= nil then
                    if KeyPressed(Input.LeftKey) then
                        entry.Index = entry.Index - 1
                        
                        if entry.Index < 1 then
                            entry.Index = #entry.Values
                        end
                        
                        WriteValue(entry.Address, entry.Type, entry.Values[entry.Index].Value)
                    end
                    if KeyPressed(Input.RightKey) then
                        entry.Index = entry.Index + 1
                        
                        if entry.Index > #entry.Values then
                            entry.Index = 1
                        end
                        
                        WriteValue(entry.Address, entry.Type, entry.Values[entry.Index].Value)
                    end
                elseif entry.Enum ~= nil then
                    if KeyPressed(Input.LeftKey) then
                        WriteValueRelative(entry.Address, entry.Type, -1, 0, #entry.Enum - 1)
                    end
                    if KeyPressed(Input.RightKey) then
                        WriteValueRelative(entry.Address, entry.Type, 1, 0, #entry.Enum - 1)
                    end
                else
                    if KeyPressed(Input.LeftKey) then
                        WriteValueRelative(entry.Address, entry.Type, -1, entry.Min, entry.Max)
                    end
                    if KeyPressed(Input.RightKey) then
                        WriteValueRelative(entry.Address, entry.Type, 1, entry.Min, entry.Max)
                    end
                end
            end
        end
    end
end

function UpdateTyping(entry)
    if string.len(Input.Text) < 10 then
        if KeyPressed("D0") or KeyPressed("NumberPad0") then
            Input.Text = Input.Text .. "0"
        end
        if KeyPressed("D1") or KeyPressed("NumberPad1") then
            Input.Text = Input.Text .. "1"
        end
        if KeyPressed("D2") or KeyPressed("NumberPad2") then
            Input.Text = Input.Text .. "2"
        end
        if KeyPressed("D3") or KeyPressed("NumberPad3") then
            Input.Text = Input.Text .. "3"
        end
        if KeyPressed("D4") or KeyPressed("NumberPad4") then
            Input.Text = Input.Text .. "4"
        end
        if KeyPressed("D5") or KeyPressed("NumberPad5") then
            Input.Text = Input.Text .. "5"
        end
        if KeyPressed("D6") or KeyPressed("NumberPad6") then
            Input.Text = Input.Text .. "6"
        end
        if KeyPressed("D7") or KeyPressed("NumberPad7") then
            Input.Text = Input.Text .. "7"
        end
        if KeyPressed("D8") or KeyPressed("NumberPad8") then
            Input.Text = Input.Text .. "8"
        end
        if KeyPressed("D9") or KeyPressed("NumberPad9") then
            Input.Text = Input.Text .. "9"
        end
    end
    
    if KeyPressed("Backspace") and string.len(Input.Text) > 0 then
        Input.Text = bizstring.remove(Input.Text, #Input.Text - 1, 1)
    end
    
    if (KeyPressed("NumberPadEnter") or KeyPressed("Return")) and string.len(Input.Text) > 0 then
        local value = tonumber(Input.Text)
        
        if entry.Values ~= nil then
            local found = false
            
            for i, v in ipairs(entry.Values) do
                if value == v.Value then
                    found = true
                    break
                end
            end
            
            if found then
                WriteValue(entry.Address, entry.Type, value)
            else
                NewMessage("The value " .. value .. " is outside the range of known values!", 300, Color.Red, Color.Black)
            end
        elseif entry.Enum ~= nil then
            if value < 0 then
                value = 0
            elseif value > #entry.Enum then
                value = #entry.Enum
            end
            
            WriteValue(entry.Address, entry.Type, value)
        else
            if value < entry.Min then
                value = entry.Min
            elseif value > entry.Max then
                value = entry.Max
            end
            
            WriteValue(entry.Address, entry.Type, value)
        end
        
        Input.Typing = false
        Input.Text = ""
    end
end
