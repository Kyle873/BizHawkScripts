dofile("KLib/KLib.lua")

KLib.Menu.Page("Test Menu", 120, 120)
KLib.Menu.Text("Text 1")
KLib.Menu.Text("Text 2")
KLib.Menu.Text("Text 3")
KLib.Menu.Field("Rings", 0xFE20, "s16_be", 0, 999)

while true do
    KLib.Update()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
