KLib.Math = {}

function KLib.Math.Clamp(value, min, max)
    if value < min then
        return min
    elseif value > max then
        return max
    else
        return value
    end
end
