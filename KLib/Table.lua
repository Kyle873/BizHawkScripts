KLib.Table = {}

function KLib.Table.Init2D(size, value)
    local t = {}
    
    for i = 1, size do
        table.insert(t, value)
    end
    
    return t
end

function KLib.Table.Init2DArray(size)
    local t = {}
    
    for i = 1, size do
        t[i] = {}
    end
    
    return t
end

function KLib.Table.FindIndex(t, v)
    for index, value in pairs(t) do
        if value == v then
            return index
        end
    end
end
