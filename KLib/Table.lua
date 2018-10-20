KLib.Table = {}

function KLib.Table.FindIndex(t, v)
    for index, value in pairs(t) do
        if value == v then
            return index
        end
    end
end
