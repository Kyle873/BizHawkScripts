KLib.Menu =
{
    Open = true,
    Index = 1,
    IndexMemory = {},
    PageIndex = 1,
    SubPage = 1,
    
    Colors =
    {
        Text = KLib.Color.White,
        Background = KLib.Color.Black,
        Outline = KLib.Color.White,
        Highlight = KLib.Color.Green,
        Frozen = KLib.Color.Yellow,
        HighlightFrozen = KLib.Color.Cyan
    },
    
    Keys =
    {
        Toggle = "+@F",
        Back = "+@R",
        Up = "+@UpArrow",
        Down = "+@DownArrow",
        Left = "+@LeftArrow",
        Right = "+@RightArrow",
        Use = "+@A",
        PageFirst = "+@Q",
        PageLeft = "+@W",
        PageRight = "+@E",
        Min = "+@S",
        Max = "+@D",
        ToggleBit = "+@Z",
        Freeze = "+@X",
        Type = "+@C"
    },
    
    Typing = false,
    String = "",
    
    FancyBars = true,
    
    Pages = {}
}

function KLib.Menu.Color(text, background, outlinbe, highlight, frozen, highlightFrozen)
    KLib.Menu.Colors.Text = text
    KLib.Menu.Colors.Background = background or KLib.Menu.Colors.Background
    KLib.Menu.Colors.Outline = outline or KLib.Menu.Colors.Outline
    KLib.Menu.Colors.Highlight = highlight or KLib.Menu.Colors.Highlight
    KLib.Menu.Colors.Frozen = frozen or KLib.Menu.Colors.Frozen
    KLib.Menu.Colors.HighlightFrozen = highlightFrozen or KLib.Menu.Colors.HighlightFrozen
end

function KLib.Menu.Switch(page)
    KLib.Menu.IndexMemory[KLib.Menu.PageIndex] = KLib.Menu.Index
    KLib.Menu.PageIndex = page
    KLib.Menu.Index = KLib.Menu.IndexMemory[page] or 1
    KLib.Menu.SubPage = 1
end

function KLib.Menu.Page(header, width, height, onUpdate)
    local page = {}
    
    page.header = header
    page.width = width
    page.height = height
    page.onUpdate = onUpdate or nil
    page.items = {}
    
    table.insert(KLib.Menu.Pages, page)
end

function KLib.Menu.Item(type)
    local item = {}
    
    item.type = type
    item.onUse = nil
    
    table.insert(KLib.Menu.Pages[#KLib.Menu.Pages].items, item)
    
    return item
end

function KLib.Menu.Separator()
    KLib.Menu.Item("separator")
end

function KLib.Menu.Text(text, color, header)
    local item = KLib.Menu.Item("text")
    
    item.text = text
    item.color = color or KLib.Menu.Colors.Text
    item.header = header or false
    
    if header and #KLib.Menu.Pages[KLib.Menu.PageIndex].items == 1 then
        KLib.Menu.Index = KLib.Menu.Index + 1
    end
    
    return item
end

function KLib.Menu.Field(name, address, size, min, max, barOffset, barWidth, barColor)
    local item = KLib.Menu.Item("field")
    
    item.name = name
    item.address = address
    item.size = size
    item.min = min or nil
    item.max = max or nil
    item.barOffset = barOffset or nil
    item.barWidth = barWidth or nil
    item.barColor = barColor or nil
    item.frozen = false
    item.frozenValue = 0
    
    if min == nil and max == nil then
        item.min, item.max = KLib.Memory.GetMinMax(item.size)
    end
    
    return item
end

function KLib.Menu.Bitfield(name, address, size, values)
    local item = KLib.Menu.Item("bitfield")
    
    item.name = name
    item.address = address
    item.size = size
    item.min, item.max = KLib.Memory.GetMinMax(size)
    item.values = values
    item.index = 1
    item.frozen = false
    item.frozenValue = 0
    
    KLib.Menu.Separator()
end

function KLib.Menu.Enum(name, address, size, values)
    local item = KLib.Menu.Item("enum")
    
    item.name = name
    item.address = address
    item.size = size
    item.min, item.max = KLib.Memory.GetMinMax(size)
    item.values = values
    item.frozen = false
    item.frozenValue = 0
end

function KLib.Menu.Update()
    local function Typing(item, y)
        local text = item.name .. ": " .. KLib.Menu.String
        local offset = 4 + string.len(text) * 6
        local color = KLib.Color.Pulse(KLib.Color.Make(224, 224, 224), 32, 8, 16)
        
        gui.drawRectangle(offset + 1, y + 1, 4, 6, color, color)
        
        return text
    end
    
    if #KLib.Menu.Pages > 0 and KLib.Menu.Open then
        local page = KLib.Menu.Pages[KLib.Menu.PageIndex]
        local entries = #page.items
        local max = math.floor(page.height - 20) / 8 - 1
        local start = 1
        local stop = 1
        local y = 20
        
        gui.drawRectangle(0, 0, page.width, page.height, KLib.Menu.Colors.Outline, KLib.Menu.Colors.Background)
        gui.pixelText(4, 4, page.header, (bizstring.contains(page.header, "\r") and KLib.Color.Rainbow() or KLib.Menu.Colors.Text), KLib.Color.Transparent)
        gui.drawLine(0, 16, page.width, 16, KLib.Menu.Colors.Outline)
        
        if page.onUpdate ~= nil then
            page:onUpdate()
        end
        
        if entries > max + 1 and KLib.Menu.Index > max / 2 + 1 then
            start = math.ceil(math.abs(KLib.Menu.Index - (max / 2 + 1)))
            stop = math.ceil((entries + 1) - (max + 1))
            
            if start > stop then
                start = stop
            end
        end
        
        for i = start, start + max do
            if i > entries then break end
            
            local item = page.items[i]
            local color = KLib.Menu.Color.Text
            
            if i == KLib.Menu.Index and item.frozen then
                color = KLib.Color.Pulse(KLib.Menu.Colors.HighlightFrozen, 32, 8)
            elseif i == KLib.Menu.Index then
                color = KLib.Color.Pulse(KLib.Menu.Colors.Highlight, 32, 8)
            elseif item.frozen then
                color = KLib.Color.Pulse(KLib.Menu.Colors.Frozen, 32, 8, 16)
            end
            
            if item.type == "text" then
                gui.pixelText(4, y, item.text, (item.header and (bizstring.contains(item.text, "\r") and KLib.Color.Rainbow() or item.color) or color), KLib.Color.Transparent)
            end
        
            if item.type == "field" then
                local value = KLib.Memory.GetReader(item.size)(item.address)
                local text = ((i == KLib.Menu.Index and KLib.Menu.Typing) and Typing(item, y) or item.name .. ": " .. value)
                
                gui.pixelText(4, y, text, color, KLib.Color.Transparent)
                
                if item.barOffset ~= nil and not (KLib.Menu.Typing and i == KLib.Menu.Index) then
                    local length = (item.barWidth / item.max) * value
                    
                    gui.drawRectangle(item.barOffset, y + 1, item.barWidth, 6, item.barColor, KLib.Color.Transparent)
                    
                    if KLib.Menu.FancyBars then
                        for j = 1, length - 1 do
                            gui.drawLine(item.barOffset + j, y + 2, item.barOffset + j, y + 6, KLib.Color.Pulse(item.barColor, 63, 32, j / 4))
                        end
                    else
                        gui.drawRectangle(item.barOffset, y + 1, length - 1, 6, item.barColor, item.barColor)
                    end
                end
            end
            
            if item.type == "bitfield" then
                local value = KLib.Memory.GetReader(item.size)(item.address)
                local text = ((i == KLib.Menu.Index and KLib.Menu.Typing) and Typing(item, y) or item.name .. ": " .. (item.values[item.index] ~= nil and item.values[item.index] or "Unknown"))
                local x = 5
                
                gui.pixelText(4, y, text, color, KLib.Color.Transparent)
                
                for j = 1, KLib.Memory.GetBits(item.size) do
                    local color = KLib.Color.Red
                    
                    if bit.check(value, j - 1) then
                        color = KLib.Color.Green
                    end
                    
                    if i == KLib.Menu.Index and j == item.index then
                        color = KLib.Color.Pulse(color, 64, 8)
                    end
                    
                    gui.drawRectangle(x, y + 9, 6, 6, color, color)
                    
                    x = x + 8
                end
            end
            
            if item.type == "enum" then
                local value = KLib.Memory.GetReader(item.size)(item.address)
                local text = ((i == KLib.Menu.Index and KLib.Menu.Typing) and Typing(item, y) or item.name .. ": " .. value .. " (" .. (item.values[value] ~= nil and item.values[value] or "Unknown") .. ")")
                    
                gui.pixelText(4, y, text, color, KLib.Color.Transparent)
            end
            
            y = y + 8
        end
    end
end

function KLib.Menu.Input()
    local function GetItem()
        return KLib.Menu.Pages[KLib.Menu.PageIndex].items[KLib.Menu.Index]
    end
    
    local function IsSeparator(item)
        return item.type == "separator" or item.header ~= nil and item.header
    end
    
    if KLib.Input.Parse(KLib.Menu.Keys.Toggle) then
        KLib.Menu.Open = not KLib.Menu.Open
    end
    
    if #KLib.Menu.Pages > 0 and KLib.Menu.Open then
        local page = KLib.Menu.Pages[KLib.Menu.PageIndex]
        local item = page.items[KLib.Menu.Index]
        
        if not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Use) and item.onUse ~= nil then
            item:onUse()
        end
    
        if not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Up) then
            KLib.Menu.Index = KLib.Menu.Index - 1
            
            while GetItem() ~= nil and IsSeparator(GetItem()) do
                KLib.Menu.Index = KLib.Menu.Index - 1
            end
            
            if KLib.Menu.Index < 1 then
                KLib.Menu.Index = #page.items
                
                while GetItem() ~= nil and IsSeparator(GetItem()) do
                    KLib.Menu.Index = KLib.Menu.Index - 1
                end
            end
        elseif not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Down) then
            KLib.Menu.Index = KLib.Menu.Index + 1
            
            while GetItem() ~= nil and IsSeparator(GetItem()) do
                KLib.Menu.Index = KLib.Menu.Index + 1
            end
            
            if KLib.Menu.Index > #page.items then
                KLib.Menu.Index = 1
                
                while GetItem() ~= nil and IsSeparator(GetItem()) do
                    KLib.Menu.Index = KLib.Menu.Index + 1
                end
            end
        end
        
        if item ~= nil and item.size ~= nil then
            local reader = KLib.Memory.GetReader(item.size)
            local writer = KLib.Memory.GetWriter(item.size)
            local min, max = KLib.Memory.GetMinMax(item.size)
            
            if not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Left) then
                if item.type == "field" then
                    writer(item.address, KLib.Math.Clamp(reader(item.address) - 1, item.min, item.max))
                elseif item.type == "bitfield" then
                    item.index = item.index - 1
                    
                    if item.index < 1 then
                        item.index = KLib.Memory.GetBits(item.size)
                    end
                elseif item.type == "enum" then
                    writer(item.address, KLib.Math.Clamp(reader(item.address) - 1, 0, item.max))
                end
            elseif not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Right) then
                if item.type == "field" then
                    writer(item.address, KLib.Math.Clamp(reader(item.address) + 1, item.min, item.max))
                elseif item.type == "bitfield" then
                    item.index = item.index + 1
                    
                    if item.index > KLib.Memory.GetBits(item.size) then
                        item.index = 1
                    end
                elseif item.type == "enum" then
                    writer(item.address, KLib.Math.Clamp(reader(item.address) + 1, 0, item.max))
                end
            end
            
            if not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Min) then
                if item.type == "field" or item.type == "enum" then
                    writer(item.address, item.min)
                elseif item.type == "bitfield" then
                    writer(item.address, 0)
                end
            elseif not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Max) then
                if item.type == "field" or item.type == "enum" then
                    writer(item.address, item.max)
                elseif item.type == "bitfield" then
                    writer(item.address, max)
                end
            end
            
            if not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.ToggleBit) and item.type == "bitfield" then
                local value = reader(item.address)
                
                if bit.check(value, item.index - 1) then
                    value = bit.clear(value, item.index - 1)
                else
                    value = bit.set(value, item.index - 1)
                end
                
                writer(item.address, value)
            end
            
            if not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Freeze) then
                item.frozen = not item.frozen
                
                if item.frozen then
                    item.frozenValue = reader(item.address)
                end
            end
            
            if KLib.Input.Parse(KLib.Menu.Keys.Type) then
                KLib.Menu.Typing = not KLib.Menu.Typing
                
                if not KLib.Menu.Typing then
                    KLib.Menu.String = ""
                end
            end
            
            if KLib.Menu.Typing then
                if string.len(KLib.Menu.String) < 10 then
                    if KLib.Input.KeyPressed("D0") or KLib.Input.KeyPressed("NumberPad0") then
                        KLib.Menu.String = KLib.Menu.String .. "0"
                    end
                    if KLib.Input.KeyPressed("D1") or KLib.Input.KeyPressed("NumberPad1") then
                        KLib.Menu.String = KLib.Menu.String .. "1"
                    end
                    if KLib.Input.KeyPressed("D2") or KLib.Input.KeyPressed("NumberPad2") then
                        KLib.Menu.String = KLib.Menu.String .. "2"
                    end
                    if KLib.Input.KeyPressed("D3") or KLib.Input.KeyPressed("NumberPad3") then
                        KLib.Menu.String = KLib.Menu.String .. "3"
                    end
                    if KLib.Input.KeyPressed("D4") or KLib.Input.KeyPressed("NumberPad4") then
                        KLib.Menu.String = KLib.Menu.String .. "4"
                    end
                    if KLib.Input.KeyPressed("D5") or KLib.Input.KeyPressed("NumberPad5") then
                        KLib.Menu.String = KLib.Menu.String .. "5"
                    end
                    if KLib.Input.KeyPressed("D6") or KLib.Input.KeyPressed("NumberPad6") then
                        KLib.Menu.String = KLib.Menu.String .. "6"
                    end
                    if KLib.Input.KeyPressed("D7") or KLib.Input.KeyPressed("NumberPad7") then
                        KLib.Menu.String = KLib.Menu.String .. "7"
                    end
                    if KLib.Input.KeyPressed("D8") or KLib.Input.KeyPressed("NumberPad8") then
                        KLib.Menu.String = KLib.Menu.String .. "8"
                    end
                    if KLib.Input.KeyPressed("D9") or KLib.Input.KeyPressed("NumberPad9") then
                        KLib.Menu.String = KLib.Menu.String .. "9"
                    end
                end
                
                if KLib.Input.KeyPressed("Backspace") and string.len(KLib.Menu.String) > 0 then
                    KLib.Menu.String = bizstring.remove(KLib.Menu.String, #KLib.Menu.String - 1, 1)
                end
                
                if (KLib.Input.KeyPressed("NumberPadEnter") or KLib.Input.KeyPressed("Return")) and string.len(KLib.Menu.String) > 0 then
                    local value = tonumber(KLib.Menu.String)
                    
                    if type(value) == "number" then
                        writer(item.address, KLib.Math.Clamp(value, item.min, item.max))
                        
                        if item.frozen then
                            item.frozenValue = value
                        end
                    end
                    
                    KLib.Menu.Typing = false
                    KLib.Menu.String = ""
                end
            end
        end
    end
end

function KLib.Menu.Freeze()
    for i = 1, #KLib.Menu.Pages do
        for j = 1, #KLib.Menu.Pages[i].items do
            local item = KLib.Menu.Pages[i].items[j]
            
            if item.size ~= nil and item.frozen ~= nil and item.frozen then
                KLib.Memory.GetWriter(item.size)(item.address, item.frozenValue)
            end
        end
    end
end
