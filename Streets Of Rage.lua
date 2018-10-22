dofile("KLib/KLib.lua")
dofile("Data/Streets of Rage.lua")

ROMHash = gameinfo.getromhash()

memory.usememorydomain("68K RAM")

KLib.Cheat.Basic("Infinite Health", { "+#P1 X", "#P1 Up" }, Address[ROMHash].Health, Max.Health[ROMHash], "byte", true)
KLib.Cheat.Basic("Infinite Lives", { "+#P1 X", "#P1 Down" }, Address[ROMHash].Lives, nil, "byte", true)
if ROMHash ~= ROMHashes.SOR2 then
    KLib.Cheat.Basic("Infinite Special", { "+#P1 X", "#P1 Left" }, Address[ROMHash].Special, nil, "byte", true)
end
if ROMHash ~= ROMHashes.SOR3 then
    KLib.Cheat.Basic("Infinite Time", { "+#P1 X", "#P1 Right" }, Address[ROMHash].Timer, nil, "byte", true)
end

while true do
    KLib.Update()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
