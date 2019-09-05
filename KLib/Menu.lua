KLib.Menu =
{
    Open = false,
    Index = 1,
    OffsetIndex = 1,
    PageIndex = 1,
    CreateIndex = 0,
    IndexMemory = {},
    PageMemory = {},

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
        Toggle = { "+@X1 Back", "@X1 LeftShoulder" },
        Back = "@X1 B",
        Up = "@X1 DpadUp",
        Down = "@X1 DpadDown",
        Left = "@X1 DpadLeft",
        Right = "@X1 DpadRight",
        OffsetUp = "@X1 RStickUp",
        OffsetDown = "@X1 RStickDown",
        Use = "@X1 A",
        Min = "@X1 RStickLeft",
        Max = "@X1 RStickRight",
        ToggleBit = "@X1 X",
        Freeze = "@X1 Y",
        Type = "@Insert"
    },

    Typing = false,
    String = "",

    Pages = {}
}

function KLib.Menu.Color(text, background, outline, highlight, frozen, highlightFrozen)
    KLib.Menu.Colors.Text = text
    KLib.Menu.Colors.Background = background or KLib.Menu.Colors.Background
    KLib.Menu.Colors.Outline = outline or KLib.Menu.Colors.Outline
    KLib.Menu.Colors.Highlight = highlight or KLib.Menu.Colors.Highlight
    KLib.Menu.Colors.Frozen = frozen or KLib.Menu.Colors.Frozen
    KLib.Menu.Colors.HighlightFrozen = highlightFrozen or KLib.Menu.Colors.HighlightFrozen
end

function KLib.Menu.Switch(page, back)
    KLib.Menu.IndexMemory[KLib.Menu.PageIndex] = KLib.Menu.Index

    if not back then
        table.insert(KLib.Menu.PageMemory, KLib.Menu.PageIndex)
    end

    KLib.Menu.PageIndex = page
    KLib.Menu.Index = KLib.Menu.IndexMemory[page] or 1
    KLib.Menu.OffsetIndex = 1
end

function KLib.Menu.Back()
    KLib.Menu.Switch(KLib.Menu.PageMemory[#KLib.Menu.PageMemory], true)

    table.remove(KLib.Menu.PageMemory, #KLib.Menu.PageMemory)
end

function KLib.Menu.Page(header, width, height, onUpdate)
    local page = {}

    page.header = header
    page.width = width or client.bufferwidth() - 1
    page.height = height or client.bufferheight() - 1
    page.onUpdate = onUpdate or nil
    page.offset = false
    page.offsetAmount = 0
    page.items = {}

    table.insert(KLib.Menu.Pages, page)

    KLib.Menu.CreateIndex = #KLib.Menu.Pages

    return #KLib.Menu.Pages
end

function KLib.Menu.SubPage(name, create, onUpdate, data, width, height)
    local base = KLib.Menu.CreateIndex
    local page = KLib.Menu.Page(name, width or nil, height or nil, onUpdate or nil)
    
    create(data or nil)

    KLib.Menu.CreateIndex = base

    KLib.Menu.Text(name).onUse = function()
        KLib.Menu.Switch(page)
    end
end

function KLib.Menu.Offset(titles, max, amount)
    local page = KLib.Menu.Pages[KLib.Menu.CreateIndex]

    page.offset = true
    page.offsetTitles = titles
    page.offsetMax = max
    page.offsetAmount = amount
end

function KLib.Menu.Item(type)
    local item = {}

    item.type = type
    item.tag = ""
    item.realAddress = nil
    item.frozen = false
    item.frozenValue = 0
    item.onUpdate = nil
    item.onUse = nil

    table.insert(KLib.Menu.Pages[KLib.Menu.CreateIndex].items, item)

    return item
end

function KLib.Menu.Separator()
    return KLib.Menu.Item("separator")
end

function KLib.Menu.Text(text, color, header)
    local item = KLib.Menu.Item("text")

    item.text = text
    item.color = color or KLib.Menu.Colors.Text
    item.header = header or false

    if #KLib.Menu.Pages[#KLib.Menu.Pages].items == 1 and item.header then
        KLib.Menu.IndexMemory[#KLib.Menu.Pages] = 2

        if #KLib.Menu.Pages == KLib.Menu.PageIndex then
            KLib.Menu.Index = 2
        end
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
    item.barVisible = barOffset or 0 > 0
    item.barOffset = barOffset or nil
    item.barWidth = barWidth or nil
    item.barColor = barColor or nil
    item.hex = false

    if bizstring.contains(name, "$") then
        item.name = string.sub(name, 2, #name)
        item.hex = true
    end

    if min == nil and max == nil then
        item.min, item.max = KLib.Memory.GetMinMax(item.size)
    end

    return item
end

function KLib.Menu.FieldGroup(amount, name, address, size, min, max, barOffset, barWidth, barColor)
    local fields = {}
    
    for i = 1, amount do
        table.insert(fields, KLib.Menu.Field(name .. " " .. i, address + ((KLib.Memory.GetBits(size) / 8) * (i - 1)), size, min, max, barOffset, barWidth, barColor))
    end
    
    return fields
end

function KLib.Menu.Bitfield(name, address, size, values)
    local item = KLib.Menu.Item("bitfield")

    item.name = name
    item.address = address
    item.size = size
    item.min = 0
    item.max = #values or KLib.Memory.GetBits(size)
    item.values = values
    item.index = 1

    KLib.Menu.Separator()
    
    return item
end

function KLib.Menu.BitfieldGroup(amount, name, address, size, values)
    local bitfields = {}
    
    for i = 1, amount do
        table.insert(bitfields, KLib.Menu.Bitfield(name .. " " .. i, address + ((KLib.Memory.GetBits(size) / 8) * (i - 1)), size, (type(values[1]) == "table" and values[i] or values)))
    end
    
    return bitfields
end

function KLib.Menu.Enum(name, address, size, values)
    local item = KLib.Menu.Item("enum")

    item.name = name
    item.address = address
    item.size = size
    item.min, item.max = KLib.Memory.GetMinMax(size)
    item.values = values
    
    return item
end

function KLib.Menu.EnumGroup(amount, name, address, size, values)
    local enums = {}
    
    for i = 1, amount do
        table.insert(enums, KLib.Menu.Enum(name .. " " .. i, address + ((KLib.Memory.GetBits(size) / 8) * (i - 1)), size, (type(values[1]) == "table" and values[i] or values)))
    end
    
    return enums
end

function KLib.Menu.Find(page, text)
    for i, v in ipairs(page.items) do
        if v.tag ~= nil and bizstring.contains(v.tag, text) or v.text ~= nil and bizstring.contains(v.text, text) or v.name ~= nil and bizstring.contains(v.name, text) then
            return v
        end
    end
    
    return nil
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
        local header = page.header
        local entries = #page.items
        local max = math.floor(page.height - 20) / 8 - 1
        local start = 1
        local stop = 1
        local y = 0

        if emu.getsystemid() == "NES" then
            y = y + 8
        end

        if page.offset then
            if page.offsetTitles ~= nil then
                header = header .. " - " .. page.offsetTitles[KLib.Menu.OffsetIndex] .. " (" .. KLib.Menu.OffsetIndex .. "/" .. page.offsetMax .. ")"
            else
                header = header .. " (" .. KLib.Menu.OffsetIndex .. "/" .. page.offsetMax .. ")"
            end
        end

        gui.drawRectangle(0, y, page.width, page.height, KLib.Menu.Colors.Outline, KLib.Menu.Colors.Background)
        gui.pixelText(4, y + 4, header, (bizstring.contains(page.header, "\r") and KLib.Color.Rainbow() or KLib.Menu.Colors.Text), KLib.Color.Transparent)
        gui.drawLine(0, y + 16, page.width, y + 16, KLib.Menu.Colors.Outline)

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

        y = y + 20

        for i = start, start + max do
            if i > entries then break end

            local item = page.items[i]
            local color = KLib.Menu.Colors.Text
            local address = 0
            local value = 0

            if item.address then
                address = page.offset and item.address + (page.offsetAmount * (KLib.Menu.OffsetIndex - 1)) or item.address
                value = KLib.Memory.GetReader(item.size)(address)
                
                item.realAddress = address
            end

            if i == KLib.Menu.Index and item.frozen then
                color = KLib.Color.Pulse(KLib.Menu.Colors.HighlightFrozen, 32, 8)
            elseif i == KLib.Menu.Index then
                color = KLib.Color.Pulse(KLib.Menu.Colors.Highlight, 32, 8)
            elseif item.frozen then
                color = KLib.Color.Pulse(KLib.Menu.Colors.Frozen, 32, 8, 16)
            end

            if item.onUpdate ~= nil then
                item:onUpdate()
            end
            
            if item.type == "text" then
                gui.pixelText(4, y, item.text, (item.header and (bizstring.contains(item.text, "\r") and KLib.Color.Rainbow() or item.color) or color), KLib.Color.Transparent)
            end

            if item.type == "field" then
                local text = ((i == KLib.Menu.Index and KLib.Menu.Typing) and Typing(item, y) or item.name .. ": " .. (item.hex and string.format("%0" .. KLib.Memory.GetBits(item.size) / 4 .. "X", value) or value))

                if item.suffix ~= nil then
                    text = text .. item.suffix
                end
                
                gui.pixelText(4, y, text, color, KLib.Color.Transparent)

                if item.barVisible and not (KLib.Menu.Typing and i == KLib.Menu.Index) then
                    local length = ((item.barWidth - 2) / item.max) * value
                    local x = item.barOffset + 1
                    local x2 = x + length

                    gui.drawRectangle(item.barOffset, y + 1, item.barWidth, 6, item.barColor, KLib.Color.Transparent)

                    for j = 1, 5 do
                        gui.drawLine(x, y + 1 + j, x2, y + 1 + j, KLib.Color.Pulse(item.barColor, 63, 16, j / 2))
                    end
                end
            end

            if item.type == "bitfield" then
                local text = ((i == KLib.Menu.Index and KLib.Menu.Typing) and Typing(item, y) or item.name .. ": " .. (item.values[item.index] ~= nil and item.values[item.index] or "Unknown"))
                local x = 5

                gui.pixelText(4, y, text, color, KLib.Color.Transparent)

                if y + 18 < page.height then
                    for j = 1, item.max do
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
            end

            if item.type == "enum" then
                local text = ((i == KLib.Menu.Index and KLib.Menu.Typing) and Typing(item, y) or item.name .. ": " .. value .. " (" .. (item.values[item.values.wrap ~= nil and value % item.values.wrap or value] ~= nil and item.values[item.values.wrap ~= nil and value % item.values.wrap or value] or "Unknown") .. ")")
                
                if item.suffix ~= nil then
                    text = text .. item.suffix
                end
                
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
        return item.type == "separator" or item.type == "empty" or item.header ~= nil and item.header
    end

    if KLib.Input.Parse(KLib.Menu.Keys.Toggle) then
        KLib.Menu.Open = not KLib.Menu.Open
    end

    if #KLib.Menu.Pages > 0 and KLib.Menu.Open then
        local page = KLib.Menu.Pages[KLib.Menu.PageIndex]
        local item = page.items[KLib.Menu.Index]

        KLib.Input.BlockJoypad()

        if not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Use) and item.onUse ~= nil then
            item:onUse()
        end

        if not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Back) and KLib.Menu.PageIndex > 1 then
            KLib.Menu.Back()
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

        if page.offset then
            if not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.OffsetUp) then
                KLib.Menu.OffsetIndex = KLib.Menu.OffsetIndex - 1

                if KLib.Menu.OffsetIndex < 1 then
                    KLib.Menu.OffsetIndex = page.offsetMax
                end
            elseif not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.OffsetDown) then
                KLib.Menu.OffsetIndex = KLib.Menu.OffsetIndex + 1

                if KLib.Menu.OffsetIndex > page.offsetMax then
                    KLib.Menu.OffsetIndex = 1
                end
            end
        end

        if item ~= nil and item.size ~= nil then
            local reader = KLib.Memory.GetReader(item.size)
            local writer = KLib.Memory.GetWriter(item.size)
            local address = page.offset and item.address + (page.offsetAmount * (KLib.Menu.OffsetIndex - 1)) or item.address
            local value = reader(address)
            local write = function(address, value)
                if item.frozen then
                    item.frozenValue = value
                else
                    writer(address, value)
                end
            end

            if not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Left) then
                if item.type == "field" then
                    write(address, KLib.Math.Clamp(value - 1, item.min, item.max))

                    if value - 1 < item.min then
                        write(address, item.max)
                    end
                elseif item.type == "bitfield" then
                    item.index = item.index - 1

                    if item.index < 1 then
                        item.index = item.max
                    end
                elseif item.type == "enum" then
                    write(address, KLib.Math.Clamp(value - 1, 0, item.max))

                    if value - 1 < 0 then
                        write(address, item.max)
                    end
                end
            elseif not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Right) then
                if item.type == "field" then
                    write(address, KLib.Math.Clamp(value + 1, item.min, item.max))

                    if value + 1 > item.max then
                        write(address, item.min)
                    end
                elseif item.type == "bitfield" then
                    item.index = item.index + 1

                    if item.index > item.max then
                        item.index = 1
                    end
                elseif item.type == "enum" then
                    write(address, KLib.Math.Clamp(value + 1, 0, item.max))

                    if value + 1 > item.max then
                        write(address, 0)
                    end
                end
            end

            if not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Min) then
                write(address, item.min)
            elseif not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Max) then
                if item.type == "bitfield" then
                    local bits = 0

                    for i = 0, item.max - 1 do
                        bits = bit.set(bits, i)
                    end

                    write(address, bits)
                else
                    write(address, item.max)
                end
            end

            if not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.ToggleBit) and item.type == "bitfield" then
                if bit.check(value, item.index - 1) then
                    value = bit.clear(value, item.index - 1)
                else
                    value = bit.set(value, item.index - 1)
                end

                write(address, value)
            end

            if not KLib.Menu.Typing and KLib.Input.Parse(KLib.Menu.Keys.Freeze) then
                item.frozen = not item.frozen

                if item.frozen then
                    item.frozenValue = reader(address)
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
                        writer(address, KLib.Math.Clamp(value, item.min, item.max))

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

function KLib.Menu.GetOffset(page)
    return (KLib.Menu.OffsetIndex - 1) * KLib.Menu.Pages[page or KLib.Menu.PageIndex].offsetAmount
end
