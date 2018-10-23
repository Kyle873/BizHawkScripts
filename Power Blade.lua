dofile("KLib/KLib.lua")
dofile("Data/Power Blade.lua")

memory.usememorydomain("RAM")

function CreateMenu()
    KLib.Menu.Color(KLib.Color.White, KLib.Color.Make(0, 0, 0, 192))
    
    KLib.Menu.Page("Power Blade\r")
    
    KLib.Menu.Field("Health", Address.Health, "byte", 0, 16)
    KLib.Menu.Field("Armor", Address.Armor, "byte", 0, 3)
    KLib.Menu.Field("Lives", Address.Lives, "byte", 0, 9)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Items", KLib.Color.Green, true)
    KLib.Menu.Field("Grenades", Address.Items.Grenades, "byte", 0, 9)
    KLib.Menu.Field("Cheeseburgers", Address.Items.Cheeseburgers, "byte", 0, 9)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Weapon", KLib.Color.Orange, true)
    KLib.Menu.Field("Current Power", Address.Weapon.CurrentPower, "byte", 0, 16)
    KLib.Menu.Field("Max Power", Address.Weapon.MaxPower, "byte", 0, 16)
    KLib.Menu.Enum("Type", Address.Weapon.Type, "byte", WeaponTypes)
    KLib.Menu.Field("Range", Address.Weapon.Range, "byte", 0, 3)
    KLib.Menu.Field("Amount", Address.Weapon.Amount, "byte", 0, 3)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Misc", KLib.Color.Yellow, true)
    KLib.Menu.Field("$Time (1st)", Address.Time, "byte")
    KLib.Menu.Field("$Time (2nd)", Address.Time + 1, "byte")
    KLib.Menu.Field("Palette", Address.Palette, "byte")
end

CreateMenu()

while true do
    KLib.Update()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
