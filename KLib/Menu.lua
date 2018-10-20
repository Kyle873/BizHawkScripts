KLib.Menu =
{
    Open = true,
    Index = 1,
    IndexMemory = {},
    PageIndex = 1,
    SubPage = 1,
    
    ForeColor = KLib.Color.White,
    BackColor = KLib.Color.Black,
    
    Color =
    {
        Text            = 0xFFFFFFFF,
        Highlight       = 0xFF00E000,
        Frozen          = 0xFFE0E000,
        HighlightFrozen = 0xFF00E0E0,
        Header          = 0xFF00FF00,
        Background      = 0xAF004F00,
        Outline         = 0xAF00FF00
    },
    
    Key =
    {
        Toggle = "@F",
        Back = "@R",
        Up = "@UpArrow",
        Down = "@DownArrow",
        Left = "@LeftArrow",
        Right = "@RightArrow",
        Use = "@A",
        PageFirst = "@Q",
        PageLeft = "@W",
        PageRight = "@E",
        Min = "@S",
        Max = "@D",
        Freeze = "@Z",
        Type = "@X"
    },
    
    Pages = {}
}

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
    item.color = color or KLib.Menu.Color.Text
    item.header = header or false
    
    return item
end

function KLib.Menu.Field(name, address, size, min, max)
    local item = KLib.Menu.Item("field")
    
    item.name = name
    item.address = address
    item.size = size
    item.min = min or nil
    item.max = max or nil
    item.frozen = false
    item.frozenValue = 0
    
    if min == nil and max == nil then
        item.min, item.max = KLib.Memory.GetMinMax()
    end
    
    return item
end

function KLib.Menu.Bitfield()
    -- TODO
end

function KLib.Menu.Enum()
    -- TODO
end

function KLib.Menu.Update()
    if KLib.Menu.Open then
        local page = KLib.Menu.Pages[KLib.Menu.PageIndex]
        local y = 20
        
        gui.drawRectangle(0, 0, page.width, page.height, KLib.Menu.Color.Outline, KLib.Menu.Color.Background)
        gui.pixelText(4, 4, page.header, KLib.Menu.Color.Text)
        gui.drawLine(0, 16, page.width, 16, KLib.Menu.Color.Outline)
        
        if page.onUpdate ~= nil then
            page:onUpdate()
        end
        
        for i = 1, #page.items do
            local item = page.items[i]
            local color = KLib.Menu.ForeColor
            
            if i == KLib.Menu.Index and item.frozen then
                color = KLib.Color.Pulse(KLib.Menu.Color.HighlightFrozen, 32, 8)
            elseif i == KLib.Menu.Index then
                color = KLib.Color.Pulse(KLib.Menu.Color.Highlight, 32, 8)
            elseif item.frozen then
                color = KLib.Color.Pulse(KLib.Menu.Color.Frozen, 32, 8, 16)
            end
            
            if item.type == "text" then
                gui.pixelText(4, y, item.text, (header and item.color or color), KLib.Color.Transparent)
            end
            
            if item.type == "field" then
                gui.pixelText(4, y, item.name .. ": " .. KLib.Memory.GetReader(item.size)(item.address), color, KLib.Color.Transparent)
            end
            
            y = y + 8
        end
    end
end

function KLib.Menu.Input()
    if KLib.Input.Parse(KLib.Menu.Key.Toggle) then
        KLib.Menu.Open = not KLib.Menu.Open
    end
    
    if KLib.Menu.Open then
        local page = KLib.Menu.Pages[KLib.Menu.PageIndex]
        local item = page.items[KLib.Menu.Index]
        
        if KLib.Input.Parse(KLib.Menu.Key.Use) and item.onUse ~= nil then
            item:onUse()
        end
    
        if KLib.Input.Parse(KLib.Menu.Key.Up) then
            KLib.Menu.Index = KLib.Menu.Index - 1
            
            while item ~= nil and item.type == "separator" do
                KLib.Menu.Index = KLib.Menu.Index - 1
            end
            
            if KLib.Menu.Index < 1 then
                KLib.Menu.Index = #page.items
            end
        elseif KLib.Input.Parse(KLib.Menu.Key.Down) then
            KLib.Menu.Index = KLib.Menu.Index + 1
            
            while item ~= nil and item.type == "separator" do
                KLib.Menu.Index = KLib.Menu.Index + 1
            end
            
            if KLib.Menu.Index > #page.items then
                KLib.Menu.Index = 1
            end
        end
        
        if item ~= nil and item.size ~= nil then
            local reader = KLib.Memory.GetReader(item.size)
            local writer = KLib.Memory.GetWriter(item.size)
            
            if KLib.Input.Parse(KLib.Menu.Key.Left) then
                writer(item.address, KLib.Math.Clamp(reader(item.address) - 1, item.min, item.max))
            elseif KLib.Input.Parse(KLib.Menu.Key.Right) then
                writer(item.address, KLib.Math.Clamp(reader(item.address) + 1, item.min, item.max))
            end
            
            if KLib.Input.Parse(KLib.Menu.Key.Min) then
                writer(item.address, item.min)
            elseif KLib.Input.Parse(KLib.Menu.Key.Max) then
                writer(item.address, item.max)
            elseif KLib.Input.Parse(KLib.Menu.Key.Freeze) then
                item.frozen = not item.frozen
                
                if item.frozen then
                    item.frozenValue = reader(item.address)
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
