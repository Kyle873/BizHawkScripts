function ReadValue(address, type)
    if type == DataType.Byte then
        return memory.readbyte(address)
    elseif type == DataType.Word then
        return memory.read_s16_be(address)
    elseif type == DataType.Long then
        return memory.read_s32_be(address)
    end
end

function WriteValue(address, type, value)
    if type == DataType.Byte then
        memory.writebyte(address, value)
    elseif type == DataType.Word then
        memory.write_s16_be(address, value)
    elseif type == DataType.Long then
        memory.write_s32_be(address, value)
    end
end

function WriteValueRelative(address, type, amount, min, max)
    local value = nil
    
    min = min or nil
    max = max or nil
    
    if type == DataType.Byte then
        value = memory.readbyte(address)
    elseif type == DataType.Word then
        value = memory.read_s16_be(address)
    elseif type == DataType.Long then
        value = memory.read_s32_be(address)
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
        memory.write_s16_be(address, value)
    elseif type == DataType.Long then
        memory.write_s32_be(address, value)
    end
end
