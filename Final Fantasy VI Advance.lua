dofile("KLib/KLib.lua")
dofile("Data/Final Fantasy VI Advance.lua")

memory.usememorydomain("Combined WRAM")

KLib.Monitor.Variable(nil, 0x0011DF, "byte")
KLib.Monitor.Variable(nil, 0x001E87, "byte")
KLib.Monitor.Variable(nil, 0x001F6E, "byte")

function CreateMenu()
    KLib.Menu.Color(KLib.Color.White, KLib.Color.Make(32, 32, 128, 192))
    
    KLib.Menu.Page("Final Fantasy VI Advance\r")
    
    KLib.Menu.SubPage("Characters", CreateCharacterPage)
    KLib.Menu.SubPage("Items", CreateItemsPage)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Misc/Debugging", KLib.Color.Pink, true)
    KLib.Menu.Field("Time (Hours)", Address.Time, "byte", 0, 99)
    KLib.Menu.Field("Time (Minutes)", Address.Time + 1, "byte", 0, 59)
    KLib.Menu.Field("Time (Seconds)", Address.Time + 2, "byte", 0, 59)
    KLib.Menu.Field("Time (Centiseconds)", Address.Time + 3, "byte", 0, 59)
    KLib.Menu.Field("Steps", Address.Steps, "u16_le", 0, 9999999)
    KLib.Menu.Field("Main Menu Index", Address.MenuIndex, "byte")
end

function CreateCharacterPage(data)
    local barOffset = 112
    local barWidth = 120
    local page = KLib.Menu.Page("Characters")
    
    KLib.Menu.Offset(nil, Address.Character.Max, Address.Character.Size)
    
    KLib.Menu.Text("Basic", KLib.Color.Green, true)
    KLib.Menu.Enum("ID", Address.Character.Base + Address.Character.Offset.ID, "byte", Characters)
    KLib.Menu.Field("Level", Address.Character.Base + Address.Character.Offset.Level, "byte", 1, 99, barOffset, barWidth, KLib.Color.White)
    KLib.Menu.Field("Current HP", Address.Character.Base + Address.Character.Offset.CurrentHP, "s16_le", 0, 9999, barOffset, barWidth, KLib.Color.Green)
    KLib.Menu.Field("Max HP", Address.Character.Base + Address.Character.Offset.MaxHP, "s16_le", 0, 9999, barOffset, barWidth, KLib.Color.Green)
    KLib.Menu.Field("Current MP", Address.Character.Base + Address.Character.Offset.CurrentMP, "s16_le", 0, 999, barOffset, barWidth, KLib.Color.Cyan)
    KLib.Menu.Field("Max MP", Address.Character.Base + Address.Character.Offset.MaxMP, "s16_le", 0, 999, barOffset, barWidth, KLib.Color.Cyan)
    KLib.Menu.Field("Experience", Address.Character.Base + Address.Character.Offset.Experience, "u24_le", 0, 9999999)
    KLib.Menu.Bitfield("Status", Address.Character.Base + Address.Character.Offset.Status, "s16_le", {})
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Commands", KLib.Color.Orange, true)
    for i = 1, 4 do
        KLib.Menu.Enum("Command " .. i, Address.Character.Base + Address.Character.Offset.Commands + (i - 1), "byte", Commands)
    end
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Stats", KLib.Color.Green, true)
    KLib.Menu.Field("Strength", Address.Character.Base + Address.Character.Offset.Strength, "byte", 0, 255, barOffset, barWidth, KLib.Color.Orange)
    KLib.Menu.Field("Speed", Address.Character.Base + Address.Character.Offset.Speed, "byte", 0, 255, barOffset, barWidth, KLib.Color.Yellow)
    KLib.Menu.Field("Stamina", Address.Character.Base + Address.Character.Offset.Stamina, "byte", 0, 255, barOffset, barWidth, KLib.Color.Green)
    KLib.Menu.Field("Magic", Address.Character.Base + Address.Character.Offset.Magic, "byte", 0, 255, barOffset, barWidth, KLib.Color.Cyan)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Equipment", KLib.Color.Cyan, true)
    KLib.Menu.Enum("Esper", Address.Character.Base + Address.Character.Offset.Esper, "byte", {})
    KLib.Menu.Field("Right Hand", Address.Character.Base + Address.Character.Offset.RightHand, "byte")
    KLib.Menu.Field("Left Hand", Address.Character.Base + Address.Character.Offset.LeftHand, "byte")
    KLib.Menu.Field("Head", Address.Character.Base + Address.Character.Offset.Head, "byte")
    KLib.Menu.Field("Body", Address.Character.Base + Address.Character.Offset.Body, "byte")
    KLib.Menu.Field("Relic 1", Address.Character.Base + Address.Character.Offset.Relic1, "byte")
    KLib.Menu.Field("Relic 2", Address.Character.Base + Address.Character.Offset.Relic2, "byte")
    
    return page
end

function CreateItemsPage(data)
    local max = 36
    local page = KLib.Menu.Page("Items")
    
    KLib.Menu.Field("Gil", Address.Gil, "u24_le", 0, 9999999)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Items", KLib.Color.Cyan, true)
    KLib.Menu.SubPage("Items", function()
            local page = KLib.Menu.Page("Items")
            
            KLib.Menu.Offset(nil, 8, 36)
            KLib.Menu.EnumGroup(36, "Item", Address.Items.Base, "byte", Items)
            
            return page
        end)
    KLib.Menu.SubPage("Quantities", function()
            local page = KLib.Menu.Page("Quantities")
            
            KLib.Menu.Offset(nil, 8, 36)
            KLib.Menu.FieldGroup(36, "Quantity", Address.Items.Quantity, "byte")
            
            return page
        end)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Key Items", KLib.Color.Yellow, true)
    KLib.Menu.BitfieldGroup(2, "Key Items", Address.Items.Key, "s16_le", KeyItems)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Magicite", KLib.Color.Pink, true)
    KLib.Menu.BitfieldGroup(2, "Magicite", Address.Items.Magicite, "s16_le", Magicite)
    
    return page
end

CreateMenu()

while true do
    KLib.Update()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
