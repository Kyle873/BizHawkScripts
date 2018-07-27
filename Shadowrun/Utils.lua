function IsSpell()
    if ReadValue(Address.Player.Equipped.Flag + (Menu.Runner * Menu.RunnerOffset), DataType.Byte) == 255 then
        return true
    else
        return false
    end
end

function SellFiles()
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
        
        NewMessage("Datafiles Cashed: " .. total .. " Nuyen Earned (" .. nuyen + total .. " Total)", 300, 0xFFFFFF00)
        
        WriteValue(Address.Global.Nuyen, DataType.Long, nuyen + total)
end
