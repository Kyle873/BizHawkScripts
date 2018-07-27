function ColorPulse(color, mult, time, offset)
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

function ColorRainbow()
    local r = math.sin(emu.framecount() / 64) * 127 + 128
    local g = math.sin((emu.framecount() / 64) + 2) * 127 + 128
    local b = math.sin((emu.framecount() / 64) + 4) * 127 + 128
    
    return bit.lshift(255, 24) + bit.lshift(r, 16) + bit.lshift(g, 8) + b
end

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
        
        NewMessage("Datafiles Cashed: " .. total .. " Nuyen Earned (" .. nuyen + total .. " Total)", 300, Color.Yellow)
        
        WriteValue(Address.Global.Nuyen, DataType.Long, nuyen + total)
end
