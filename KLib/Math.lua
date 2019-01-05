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

function KLib.Math.Round(value, increment)
    if increment then
        return KLib.Math.Round(value / increment) * increment
    end

    return value > 0 and math.floor(value + .5) or math.ceil(value - .5)
end

function KLib.Math.Inside(x, y, x2, y2, width, height)
    return x2 >= x and x2 <= x + width and
           y2 >= y and y2 <= y + height
end
