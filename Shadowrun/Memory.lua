function ReadValue(address, type)
    if type == DataType.Byte then
        return memory.readbyte(address)
    elseif type == DataType.Word then
        return memory.readword(address)
    elseif type == DataType.Long then
        return memory.readlong(address)
    end
end

function WriteValue(address, type, value)
    if type == DataType.Byte then
        memory.writebyte(address, value)
    elseif type == DataType.Word then
        memory.writeword(address, value)
    elseif type == DataType.Long then
        memory.writelong(address, value)
    end
end

function WriteValueRelative(address, type, amount, min, max)
    local value = nil
    
    min = min or nil
    max = max or nil
    
    if type == DataType.Byte then
        value = memory.readbyte(address)
    elseif type == DataType.Word then
        value = memory.readword(address)
    elseif type == DataType.Long then
        value = memory.readlong(address)
    end
    
    value = value + amount
    
    if min ~= nil and max ~= nil then
        if value < min then
            value = max
        end
        if value > max then
            value = min
        end
    end
    
    if type == DataType.Byte then
        memory.writebyte(address, value)
    elseif type == DataType.Word then
        memory.writeword(address, value)
    elseif type == DataType.Long then
        memory.writelong(address, value)
    end
end
