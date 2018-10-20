KLib = {}

-- Utility
dofile("KLib/Math.lua")
dofile("KLib/String.lua")
dofile("KLib/Table.lua")
dofile("KLib/Color.lua")

-- Memory/Cheats
dofile("KLib/Memory.lua")
dofile("KLib/Cheat.lua")

-- Input/UI
dofile("KLib/Input.lua")
dofile("KLib/Menu.lua")
dofile("KLib/GUI.lua")
dofile("KLib/Message.lua")
dofile("KLib/Monitor.lua")

gui.defaultPixelFont("fceux")

function KLib.Update()
    KLib.Input.Update()
    KLib.Menu.Update()
    KLib.Menu.Input()
    KLib.Menu.Freeze()
    KLib.GUI.Update()
    KLib.GUI.Input()
    KLib.Cheat.Update()
    KLib.Message.Update()
    KLib.Monitor.Update()
end

function KLib.PostUpdate()
    KLib.Input.PostUpdate()
end
