Input =
{
    Current = {},
    Previous = {},
    
    Clear =
    {
        up = false,
        down = false,
        left = false,
        right = false,
        A = false,
        B = false,
        C = false,
        start = false,
        X = false,
        Y = false,
        Z = false,
        mode = false
    },
    
    Timer = 0,
    RepeatDelay = 60
}

function KeyPressed(key)
	if Input.Current[key] then
		Input.Timer = Input.Timer + 1
	elseif not Input.Current[key] and Input.Previous[key] then
		Input.Timer = 0
	end
	
	if Input.Timer >= Input.RepeatDelay then
		return Input.Current[key]
	else
		return Input.Current[key] and not Input.Previous[key]
	end
end

function CheckInput()
    if KeyPressed("mode") then
        Menu.Open = not Menu.Open
    end
    
    if KeyPressed("X") then
        local nuyen = ReadValue(Address.Global.Nuyen, DataType.Long)
        local total = 0
        
        for i = 1, 5 do
            local address = Address.Cyberdeck.Datafiles[i]
            local size = ReadValue(address + 1, DataType.Byte)
            local value = ReadValue(address + 2, DataType.Byte)
            local amount = 0
            
            if value ~= 255 then
                amount = size * 5
                amount = amount * value
                
                total = total + amount
                
                WriteValue(address, DataType.Byte, 0xFF)
                WriteValue(address + 1, DataType.Byte, 0)
                WriteValue(address + 2, DataType.Byte, 0)
            end
        end
        
        NewMessage("Datafiles Cashed: " .. total .. " Nuyen Earned (" .. nuyen + total .. " Total)", 300, 0xFFFF00FF)
        
        WriteValue(Address.Global.Nuyen, DataType.Long, nuyen + total)
    end
    
    if Menu.Open then
        local entry = Menu[Menu.Page][Menu.Index]
        
        joypad.set(Input.Clear)
        
        if KeyPressed("start") and Menu.Page ~= MenuPage.Main then
            Menu.Page = MenuPage.Main
            Menu.Index = Menu[Menu.Page].DefaultIndex
        end
        
        if KeyPressed("C") and Menu.Page >= MenuPage.PlayerBasic and Menu.Page <= MenuPage.PlayerStats then
            Menu.Runner = Menu.Runner + 1
            
            if Menu.Runner > 2 then
                Menu.Runner = 0
            end
        end
                
        if KeyPressed("Z") then
            entry.Frozen = not entry.Frozen
            entry.FrozenValue = ReadValue(entry.Address, entry.Type)
        end
        
        if KeyPressed("up") then
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
        if KeyPressed("down") then
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
                if KeyPressed("left") then
                    entry.Index = entry.Index - 1
                    
                    if entry.Index < 1 then
                        entry.Index = #entry.Values
                    end
                    
                    WriteValue(entry.Address, entry.Type, entry.Values[entry.Index].Value)
                end
                if KeyPressed("right") then
                    entry.Index = entry.Index + 1
                    
                    if entry.Index > #entry.Values then
                        entry.Index = 1
                    end
                    
                    WriteValue(entry.Address, entry.Type, entry.Values[entry.Index].Value)
                end
            -- TODO: Check enum 0 ~ #enum here to get rid of redundant Min/Nax properties
            else
                if KeyPressed("left") then
                    WriteValueRelative(entry.Address, entry.Type, -1, entry.Min, entry.Max)
                end
                if KeyPressed("right") then
                    WriteValueRelative(entry.Address, entry.Type, 1, entry.Min, entry.Max)
                end
            end
        end
    end
end
