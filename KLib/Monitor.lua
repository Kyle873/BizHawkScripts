KLib.Monitor =
{
    X = 0,
    Y = 24,
    Offset = 12,
    
    Entries = {}
}

function KLib.Monitor.Position(x, y, offset)
    KLib.Monitor.X = x
    KLib.Monitor.Y = y
    KLib.Monitor.Offset = offset or KLib.Monitor.Offset
end

function KLib.Monitor.Move(x, y, offset)
    KLib.Monitor.X = KLib.Monitor.X + x
    KLib.Monitor.Y = KLib.Monitor.Y + y
    KLib.Monitor.Offset = offset or KLib.Monitor.Offset
end

function KLib.Monitor.Entry(type)
    local entry = {}
    
    entry.type = type
    entry.x = KLib.Monitor.X
    entry.y = KLib.Monitor.Y
    
    KLib.Monitor.Y = KLib.Monitor.Y + KLib.Monitor.Offset
    
    table.insert(KLib.Monitor.Entries, entry)
    
    return entry
end

function KLib.Monitor.Variable(name, address, size)
    local entry = KLib.Monitor.Entry("variable")
    
    entry.name = name
    entry.address = address
    entry.size = size
end

function KLib.Monitor.VariableUpdate(name, value)
    local entry = KLib.Monitor.Entry("variable_update")
    
    entry.name = name
    entry.value = value
end

function KLib.Monitor.Registers(x, y, decimal)
    x = x or KLib.Monitor.X
    y = y or KLib.Monitor.Y
    decimal = decimal or false
    
    local system = emu.getsystemid()
    local registers = emu.getregisters()
    local index = 1
    
    if registers ~= nil then
        for register, value in pairs(registers) do
            gui.text(x, y + index * 12, tostring(register) .. ": " .. (decimal and tostring(value) or string.format("%08X", value)))
            
            index = index + 1
        end
    end
end

function KLib.Monitor.Cheats(x, y)
    x = x or KLib.Monitor.X
    y = y or KLib.Monitor.Y
    
    for i = 1, #KLib.Cheat.Cheats do
        local cheat = KLib.Cheat.Cheats[i]
        
        gui.text(x, y + i * 12, cheat.name .. ": " .. KLib.Memory.GetReader(cheat.size)(cheat.address) .. " (" .. KLib.String.OnOff(cheat.enabled) .. ")")
    end
end

function KLib.Monitor.Update()
    for i = 1, #KLib.Monitor.Entries do
        local entry = KLib.Monitor.Entries[i]
        
        if entry.type == "variable" then
            gui.text(entry.x, entry.y, entry.name .. ": " .. KLib.Memory.GetReader(entry.size)(entry.address))
        end
        
        if entry.type == "variable_update" then
            gui.text(entry.x, entry.y, entry.name .. ": " .. entry.value())
        end
    end
end
