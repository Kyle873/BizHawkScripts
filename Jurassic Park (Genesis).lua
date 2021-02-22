dofile("KLib/KLib.lua")

Address =
{
    Lives = 0x0053,
    Health = 0x0055,
    Weapons = 0x003B
}

memory.usememorydomain("68K RAM")

function CreateMenu()
    KLib.Menu.Color(KLib.Color.White, KLib.Color.Make(0, 0, 0, 192))
    
    KLib.Menu.Page("Jurassic Park\r")
    
    KLib.Menu.Field("Lives", Address.Lives, "byte", 1, 3)
    KLib.Menu.Field("Health", Address.Health, "byte", 0, 32)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Weapons", KLib.Color.Red, true)
    KLib.Menu.Field("Blue Darts", Address.Weapons, "byte", 0, 99)
    KLib.Menu.Field("Red Darts", Address.Weapons + 1, "byte", 0, 99)
    KLib.Menu.Field("Stun Gun", Address.Weapons + 2, "byte", 0, 99)
    KLib.Menu.Field("Gas Grenades", Address.Weapons + 3, "byte", 0, 99)
    KLib.Menu.Field("Flash Grenades", Address.Weapons + 4, "byte", 0, 99)
    KLib.Menu.Field("Rockets", Address.Weapons + 5, "byte", 0, 99)
    KLib.Menu.Field("Incindiary Grenades", Address.Weapons + 6, "byte", 0, 99)
end

CreateMenu()

while true do
    KLib.Update()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
