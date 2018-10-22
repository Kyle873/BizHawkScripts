dofile("KLib/KLib.lua")
dofile("Data/Super Mario Advance 4.lua")

memory.usememorydomain("IWRAM")

function CreateMenu()
    KLib.Menu.Color(KLib.Color.White, KLib.Color.Make(0, 64, 128, 192), KLib.Color.White)
    
    KLib.Menu.Page("Super Mario Bros 3\r")
    
    KLib.Menu.Field("Lives", Address.Mario.Lives, "s16_le", 0, 999)
    KLib.Menu.Field("Coins", Address.Mario.Coins, "byte", 0, 99)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Timers", KLib.Color.Yellow, true)
    KLib.Menu.Field("Level (1st)", Address.Timer.Level - 3, "byte", 0, 9)
    KLib.Menu.Field("Level (2nd)", Address.Timer.Level - 2, "byte", 0, 9)
    KLib.Menu.Field("Level (3rd)", Address.Timer.Level - 1, "byte", 0, 40)
    KLib.Menu.Field("Level (Sub)", Address.Timer.Level, "byte", 0, 99)
    KLib.Menu.Field("Hide", Address.Timer.Hide, "byte")
    KLib.Menu.Field("Star", Address.Timer.Star, "byte")
    KLib.Menu.Field("POW", Address.Timer.POW, "byte")
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Items", KLib.Color.Cyan, true)
    KLib.Menu.EnumGroup(38, "Item", Address.Items, "byte", Items)
end

CreateMenu()

while true do
    KLib.Update()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
