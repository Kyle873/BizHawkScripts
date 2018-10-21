dofile("KLib/KLib.lua")

Address =
{
    Lives = 0x627E,
    
    Stars = 0x6ACE,
    RedCoins = 0x6AD6,
    Flowers = 0x6A9A,
    EndLevel = 0x6B05,
    
    Items = 0x628A,
    
    Form = 0x6DB2
}

memory.usememorydomain("IWRAM")

KLib.Menu.Color(KLib.Color.White, KLib.Color.Make(0, 0, 0, 192))
KLib.Menu.Page("Yoshi's Island\r", 180, 120)
KLib.Menu.Field("Lives", Address.Lives, "s16_le", 0, 999)
KLib.Menu.Separator()
KLib.Menu.Text("Level Completion", KLib.Color.Yellow, true)
KLib.Menu.Field("Stars", Address.Stars, "s16_le", 0, 300)
KLib.Menu.Field("Red Coins", Address.RedCoins, "byte", 0, 20)
KLib.Menu.Field("Flowers", Address.Flowers, "byte", 0, 5)
KLib.Menu.Text("End Level").onUse = function(self)
    KLib.Memory.WriteByte(Address.EndLevel, 0x23)
end
KLib.Menu.Separator()
KLib.Menu.Text("Items", KLib.Color.Green, true)
for i = 1, 27 do
    KLib.Menu.Enum("Item " .. i, Address.Items + (i - 1), "byte",
        {
            [0] = "Nothing",
            
            "Star +10",
            "Star +20",
            "POW Block",
            "Egg",
            "Magnifying Glass",
            "Cloud",
            "Seed Watermelon",
            "Ice Watermelon",
            "Fire Watermelon"
        })
end

KLib.Monitor.Variable("Form", Address.Form, "byte")

while true do
    KLib.Update()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
