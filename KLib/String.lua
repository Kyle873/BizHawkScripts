KLib.String = {}

function KLib.String.Key(k)
    if type(k) == "string" and string.match(k, "^[_%a][_%a%d]*$") then
        return k
    else
        return "[" .. KLib.String.Value(k) .. "]"
    end
end

function KLib.String.Value(v)
    if type(v) == "string" then
        v = string.gsub(v, "\n", "\\n")
        
        if string.match(string.gsub(v, "[^'\"]", ""), '^"+$') then
            return "'" .. v .. "'"
        end
        
        return '"' .. string.gsub(v, '"', '\\"') .. '"'
    else
        return type(v) == "table" and KLib.String.Table(v) or tostring(v)
    end
end

function KLib.String.Table(t)
    local result, done = {}, {}
    
    for k, v in ipairs(t) do
        table.insert(result, KLib.String.Value(v))
        done[k] = true
    end
    
    for k, v in pairs(t) do
        if not done[k] then
            table.insert(result, KLib.String.Key(k) .. " = " .. KLib.String.Value(v))
        end
    end
    
    return "{" .. table.concat(result, ",") .. "}"
end

function KLib.String.OnOff(b)
    if b then
        return "On"
    elseif not b then
        return "Off"
    else
        return "Unknown"
    end
end
