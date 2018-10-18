dofile("KLib.lua")

KLib.GUI.Window(100, 128, "Test Window")
KLib.GUI.Color(KLib.Color.Red, KLib.Color.Transparent)
KLib.GUI.PixelText("Pixel Text 1")
KLib.GUI.Color(KLib.Color.Green, KLib.Color.Transparent)
KLib.GUI.PixelText("Pixel Text 2")
KLib.GUI.Color(KLib.Color.Blue, KLib.Color.Transparent)
KLib.GUI.Text("Normal Text 1")
KLib.GUI.Text("Normal Text 2").onUpdate = function(control)
    control.color = KLib.Color.Pulse(0xFF00CF00, 32, 8)
end
KLib.GUI.Text("Normal Text 3").onUpdate = function(control)
    control.color = KLib.Color.Rainbow(16)
end
KLib.GUI.Image("Test.png", 8, 8)
KLib.GUI.Image("Test.png", 16, 16)
KLib.GUI.Image("Test.png", 32, 32)

while true do
    KLib.GUI.Update()
    
    emu.frameadvance()
end
