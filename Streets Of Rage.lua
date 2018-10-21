dofile("KLib/KLib.lua")

Address =
{
    Health = 0xB832,
    Continues = 0xFF1B,
    Lives = 0xFF20,
    Special = 0xFF21,
    Timer = 0xFB59,
}

memory.usememorydomain("68K RAM")

KLib.Cheat.Basic("Infinite Health", { "+#P1 X", "#P1 Up" }, Address.Health, 80, "byte", true)
KLib.Cheat.Basic("Infinite Lives", { "+#P1 X", "#P1 Down" }, Address.Lives, nil, "byte", true)
KLib.Cheat.Basic("Infinite Special", { "+#P1 X", "#P1 Left" }, Address.Special, nil, "byte", true)
KLib.Cheat.Basic("Infinite Time", { "+#P1 X", "#P1 Right" }, Address.Timer, 90, "byte", true)

while true do
    KLib.Update()
    
	emu.frameadvance()
    
    KLib.PostUpdate()
end
