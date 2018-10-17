dofile("KLib.lua")

KLib.GUI.CreateWindow(0, 0, 100, 100, "Test Window", KLib.Color.Black, KLib.Color.White)
KLib.GUI.CreateText(2, 2, "Test Text")
KLib.GUI.CreateImage(2, 10, 16, 16, "SMA4/Mushroom.png")

while true do
    KLib.GUI.Update()
    
    emu.frameadvance()
end
