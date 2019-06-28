dofile("KLib/KLib.lua")

Address =
{
    Mario =
    {
        Lives = 0x2A6A,
        Coins = 0x2C58
    },
    
    Luigi =
    {
        Lives = 0x2A6C,
        Coins = 0x2C83
    },
    
    Timer =
    {
        Level = 0x3D0E,
        Hide = 0x3D06,
        Star = 0x3F65,
        POW = 0x3CF8
    },
    
    Items = 0x2C2E,
}

Items =
{
    [0] = "Nothing",
    
    "Mushroom",
    "Fire Flower",
    "Leaf",
    "Frog",
    "Bear",
    "Hammer Bro",
    "Cloud",
    "P Wing",
    "Star",
    "Anchor",
    "Hammer",
    "Warp Flute",
    "Music Box",
    "Feather",
    "Boomerang"
}

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
    KLib.Menu.Field("Level (3rd)", Address.Timer.Level - 1, "byte", 0, 9)
    KLib.Menu.Field("Level (Sub)", Address.Timer.Level, "byte", 0, 40)
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
