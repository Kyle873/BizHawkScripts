dofile("KLib/KLib.lua")

memory.usememorydomain("68K RAM")

KLib.Menu.Page("Test Menu", 300, 120)
KLib.Menu.Text("Text Item")
KLib.Menu.Separator()
KLib.Menu.Text("Test Header", KLib.Color.Red, true)
KLib.Menu.Field("Rings", 0xFE20, "s16_be", 0, 999, 68, 100, KLib.Color.Green)
KLib.Menu.Separator()
KLib.Menu.Bitfield("Secondary Status Flags", 0xB02B, "byte",
    {
        [1] = "Shield Active",
        [5] = "Fire Shield",
        [6] = "Lightning Shield",
        [7] = "Bubble Shield"
    })

while true do
    KLib.Update()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
