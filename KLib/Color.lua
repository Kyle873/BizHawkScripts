KLib.Color =
{
    Transparent = 0x00000000,
    Black       = 0xFF000000,
    Gray        = 0xFF3F3F3F,
    Red         = 0xFFFF0000,
    Orange      = 0xFFFF7F00,
    Yellow      = 0xFFFFFF00,
    Green       = 0xFF00FF00,
    Blue        = 0xFF007FFF,
    Cyan        = 0xFF00FFFF,
    Purple      = 0xFFFF00FF,
    Pink        = 0xFFFF7FFF,
    White       = 0xFFFFFFFF
}

function KLib.Color.GetRed(color)
    return bit.rshift(bit.band(color, 0x00FF0000), 16)
end

function KLib.Color.GetGreen(color)
    return bit.rshift(bit.band(color, 0x0000FF00), 8)
end

function KLib.Color.GetBlue(color)
    return bit.band(color, 0x000000FF)
end

function KLib.Color.GetAlpha(color)
    return bit.rshift(bit.band(color, 0xFF000000), 24)
end

function KLib.Color.Make(r, g, b, a)
    return bit.lshift(a or 255, 24) + bit.lshift(r, 16) + bit.lshift(g, 8) + b
end

function KLib.Color.Get(color)
    return KLib.Color.GetRed(color), KLib.Color.GetGreen(color), KLib.Color.GetBlue(color), KLib.Color.GetAlpha(color)
end

function KLib.Color.RGBToHSV(r, g, b, a)
    r, g, b, a = r / 255, g / 255, b / 255, a / 255
    
    local max, min = math.max(r, g, b), math.min(r, g, b)
    local h, s, v
    local d = max - min
    
    v = max
    
    if max == 0 then
        s = 0
    else
        s = d / max
    end

    if max == min then
        h = 0
    else
        if max == r then
            h = (g - b) / d
            
            if g < b then
                h = h + 6
            end
        elseif max == g then
            h = (b - r) / d + 2
        elseif max == b then
            h = (r - g) / d + 4
        end
        
        h = h / 6
    end
    
    return h, s, v, a
end

function KLib.Color.HSVToRGB(h, s, v, a)
    local r, g, b
    
    local i = math.floor(h * 6);
    local f = h * 6 - i;
    local p = v * (1 - s);
    local q = v * (1 - f * s);
    local t = v * (1 - (1 - f) * s);
    
    i = i % 6
    
    if i == 0 then
        r, g, b = v, t, p
    elseif i == 1 then
        r, g, b = q, v, p
    elseif i == 2 then
        r, g, b = p, v, t
    elseif i == 3 then
        r, g, b = p, q, v
    elseif i == 4 then
        r, g, b = t, p, v
    elseif i == 5 then
        r, g, b = v, p, q
    end
    
    return r * 255, g * 255, b * 255, a * 255
end

function KLib.Color.Pulse(color, mult, time, offset)
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

function KLib.Color.Rainbow(speed, alpha, offset)
    speed = speed or 64
    alpha = alpha or 255
    offset = offset or 0
    
    local r = math.sin(emu.framecount() / speed + offset) * 127 + 128
    local g = math.sin((emu.framecount() / speed + offset) + 2) * 127 + 128
    local b = math.sin((emu.framecount() / speed + offset) + 4) * 127 + 128
    
    return bit.lshift(alpha, 24) + bit.lshift(r, 16) + bit.lshift(g, 8) + b
end
