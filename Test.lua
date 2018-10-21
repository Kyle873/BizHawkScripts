dofile("KLib/KLib.lua")

while true do
    KLib.Update()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
