KLib.Memory = {}

function KLib.Memory.ReadByte(address)
    return memory.readbyte(address)
end

function KLib.Memory.WriteByte(address, value)
    memory.writebyte(address, value)
end

function KLib.Memory.ReadShort(address)
    return memory.read_s16_le(address)
end

function KLib.Memory.ReadShortBig(address)
    return memory.read_s16_be(address)
end

function KLib.Memory.ReadUnsignedShort(address)
    return memory.read_u16_le(address)
end

function KLib.Memory.ReadUnsignedShortBig(address)
    return memory.read_u16_be(address)
end

function KLib.Memory.WriteShort(address, value)
    memory.write_s16_le(address, value)
end

function KLib.Memory.WriteShortBig(address, value)
    memory.write_s16_be(address, value)
end

function KLib.Memory.WriteUnsignedShort(address, value)
    memory.write_u16_le(address, value)
end

function KLib.Memory.WriteUnsignedShortBig(address, value)
    memory.write_u16_be(address, value)
end

function KLib.Memory.ReadSesqui(address)
    return memory.read_s24_le(address)
end

function KLib.Memory.ReadSesquiBig(address)
    return memory.read_s24_be(address)
end

function KLib.Memory.ReadUnsignedSesqui(address)
    return memory.read_u24_le(address)
end

function KLib.Memory.ReadUnsignedSesquiBig(address)
    return memory.read_u24_be(address)
end

function KLib.Memory.WriteSesqui(address, value)
    return memory.write_s24_le(address, value)
end

function KLib.Memory.WriteSesquiBig(address, value)
    return memory.write_s24_be(address, value)
end

function KLib.Memory.WriteUnsignedSesqui(address, value)
    return memory.write_u24_le(address, value)
end

function KLib.Memory.WriteUnsignedSesquiBig(address, value)
    return memory.write_u24_be(address, value)
end

function KLib.Memory.ReadInt(address)
    return memory.read_s32_le(address)
end

function KLib.Memory.ReadIntBig(address)
    return memory.read_s32_be(address)
end

function KLib.Memory.ReadUnsignedInt(address)
    return memory.read_u32_le(address)
end

function KLib.Memory.ReadUnsignedIntBig(address)
    return memory.read_u32_be(address)
end

function KLib.Memory.WriteInt(address, value)
    memory.write_s32_le(address, value)
end

function KLib.Memory.WriteIntBig(address, value)
    memory.write_s32_be(address, value)
end

function KLib.Memory.WriteUnsignedInt(address, value)
    memory.write_u32_le(address, value)
end

function KLib.Memory.WriteUnsignedIntBig(address, value)
    memory.write_u32_be(address, value)
end

function KLib.Memory.ReadFloat(address)
    return memory.readfloat(address)
end

function KLib.Memory.WriteFloat(address, value)
    memory.writefloat(address, value)
end

function KLib.Memory.ReadRange(address, length)
    return memory.readbyterange(address, length)
end

function KLib.Memory.WriteRange(block)
    memory.writebyterange(block)
end

function KLib.Memory.GetReader(type)
    if type == "byte" then
        return KLib.Memory.ReadByte
    elseif type == "s16_le" then
        return KLib.Memory.ReadShort
    elseif type == "s16_be" then
        return KLib.Memory.ReadShortBig
    elseif type == "u16_le" then
        return KLib.Memory.ReadUnsignedShort
    elseif type == "u16_be" then
        return KLib.Memory.ReadUnsignedShortBig
    elseif type == "s24_le" then
        return KLib.Memory.ReadSesqui
    elseif type == "s24_be" then
        return KLib.Memory.ReadSesquiBig
    elseif type == "u24_le" then
        return KLib.Memory.ReadUnsignedSesqui
    elseif type == "u24_be" then
        return KLib.Memory.ReadUnsignedSesquiBig
    elseif type == "s32_le" then
        return KLib.Memory.ReadInt
    elseif type == "s32_be" then
        return KLib.Memory.ReadIntBig
    elseif type == "u32_le" then
        return KLib.Memory.ReadUnsignedInt
    elseif type == "u32_be" then
        return KLib.Memory.ReadUnsignedIntBig
    elseif type == "float" then
        return KLib.Memory.ReadFloat
    end
end

function KLib.Memory.GetWriter(type)
    if type == "byte" then
        return KLib.Memory.WriteByte
    elseif type == "s16_le" then
        return KLib.Memory.WriteShort
    elseif type == "s16_be" then
        return KLib.Memory.WriteShortBig
    elseif type == "u16_le" then
        return KLib.Memory.WriteUnsignedShort
    elseif type == "u16_be" then
        return KLib.Memory.WriteUnsignedShortBig
    elseif type == "s24_le" then
        return KLib.Memory.WriteSesqui
    elseif type == "s24_be" then
        return KLib.Memory.WriteSesquiBig
    elseif type == "u24_le" then
        return KLib.Memory.WriteUnsignedSesqui
    elseif type == "u24_be" then
        return KLib.Memory.WriteUnsignedSesquiBig
    elseif type == "s32_le" then
        return KLib.Memory.WriteInt
    elseif type == "s32_be" then
        return KLib.Memory.WriteIntBig
    elseif type == "u32_le" then
        return KLib.Memory.WriteUnsignedInt
    elseif type == "u32_be" then
        return KLib.Memory.WriteUnsignedIntBig
    elseif type == "float" then
        return KLib.Memory.WriteFloat
    end
end

function KLib.Memory.GetBits(type)
    if type == "byte" then
        return 8
    elseif type == "s16_le" or type == "s16_be" or type == "u16_le" or type == "u16_be" then
        return 16
    elseif type == "s24_le" or type == "s24_be" or type == "u24_le" or type == "u24_be" then
        return 24
    elseif type == "s32_le" or type == "s32_be" or type == "u32_le" or type == "u32_be" then
        return 32
    end
end

function KLib.Memory.GetMinMax(type)
    if type == "byte" then
        return 0, 0xFF
    elseif type == "s16_le" or type == "s16_be" then
        return -0xFFFF, 0xFFFF
    elseif type == "u16_le" or type == "u16_be" then
        return 0, 0xFFFF
    elseif type == "s16_le" or type == "s16_be" then
        return -0xFFFFFF, 0xFFFFFF
    elseif type == "u24_le" or type == "u24_be" then
        return 0, 0xFFFFFF
    elseif type == "s32_le" or type == "s32_be" then
        return -0xFFFFFFFF, 0xFFFFFFFF
    elseif type == "u32_le" or type == "u32_be" then
        return 0, 0xFFFFFFFF
    end
end
