Input =
{
    Current = {},
    Previous = {},
    
    Timer = 0,
    RepeatDelay = 60,
    
    MenuKey = "NumberPadMinus",
    UpKey = "NumberPad8",
    DownKey = "NumberPad2",
    LeftKey = "NumberPad4",
    RightKey = "NumberPad6",
    UseKey = "NumberPad5",
    BackKey = "NumberPad0",
    SwitchCharKey = "NumberPadPlus",
    FreezeKey = "NumberPadEnter",
    ZeroKey = "NumberPad1",
    MaxKey = "NumberPad3",
    SellFilesKey = "NumberPadPeriod"
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
    if KeyPressed(Input.MenuKey) then
        Menu.Open = not Menu.Open
    end
    
    if KeyPressed(Input.SellFilesKey) then
        SellFiles()
    end
    
    if Menu.Open then
        local entry = Menu[Menu.Page][Menu.Index]
        
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
                WriteValue(entry.Address, entry.Type, entry.Values[0].Value)
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
