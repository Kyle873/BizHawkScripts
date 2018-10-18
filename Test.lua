dofile("KLib.lua")

KLib.GUI.Size = 10

KLib.GUI.Color()
local window = KLib.GUI.Window(120, 120, "Test Window")
KLib.GUI.Color(KLib.Color.Red)
KLib.GUI.PixelText("Pixel Text 1")
KLib.GUI.Color(KLib.Color.Green)
KLib.GUI.PixelText("Pixel Text 2")
KLib.GUI.Color(KLib.Color.Blue)
KLib.GUI.PixelText("Pixel Text 3")
KLib.GUI.Color(KLib.Color.White)
KLib.GUI.Separator(2, "draw_top")
KLib.GUI.Text("Normal Text 1")
KLib.GUI.Text("Normal Text 2").onUpdate = function(control)
    control.color = KLib.Color.Pulse(KLib.Color.Make(0, 224, 0), 32, 8)
end
KLib.GUI.Text("Normal Text 3").onUpdate = function(control)
    control.color = KLib.Color.Rainbow(16)
end
KLib.GUI.Separator(4)
KLib.GUI.Color(KLib.Color.Yellow)
KLib.GUI.Checkbox("Test Checkbox", true)
KLib.GUI.Separator(3)
KLib.GUI.Image("Test.png", 24, 24).onUpdate = function(control)
    control.width = 24 + math.abs(math.sin(emu.framecount() / 16)) * 4
    control.height = 24 + math.cos(emu.framecount() / 8 + 8) * 4
end

while true do
    KLib.Input.Update()
    KLib.GUI.Update()
    
    if KLib.Input.KeyPressed("F") then
        window.visible = not window.visible
    end
    
    emu.frameadvance()
    
    KLib.Input.PostUpdate()
end
