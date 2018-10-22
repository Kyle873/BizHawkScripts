dofile("KLib/KLib.lua")
dofile("Data/Super Mario Advance 3.lua")

memory.usememorydomain("IWRAM")

KLib.Monitor.Variable("Form", Address.Form, "byte")

function CreateMenu()
    KLib.Menu.Color(KLib.Color.White, KLib.Color.Make(0, 0, 0, 192))
    
    KLib.Menu.Page("Yoshi's Island\r")
    
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
    KLib.Menu.EnumGroup(27, "Item", Address.Items, "byte", Items)
end

CreateMenu()

while true do
    KLib.Update()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
