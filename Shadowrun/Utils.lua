function IsSpell()
    if ReadValue(Address.Player.Equipped.Flag + (Menu.Runner * Menu.RunnerOffset), DataType.Byte) == 255 then
        return true
    else
        return false
    end
end
