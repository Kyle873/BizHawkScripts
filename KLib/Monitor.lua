KLib.Monitor =
{
    X = 0,
    Y = 24,
    Offset = 12,
    
    Variables = {}
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

function KLib.Monitor.AddVariable(name, value)
    local variable = {}
    
    variable.x = KLib.Monitor.X
    variable.y = KLib.Monitor.Y
    variable.name = name
    variable.value = value
    
    KLib.Monitor.Y = KLib.Monitor.Y + KLib.Monitor.Offset
    
    table.insert(KLib.Monitor.Variables, variable)
end

function KLib.Monitor.Registers(x, y, decimal)
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

function KLib.Monitor.Update()
    for i = 1, #KLib.Monitor.Variables do
        local variable = KLib.Monitor.Variables[i]
        
        gui.text(variable.x, variable.y, variable.name .. ": " .. variable.value())
    end
end
