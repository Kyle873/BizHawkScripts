dofile("KLib/KLib.lua")

ROMHashes =
{
    SOR1 = "569CFEC15813294A8F0CF88CCCC8C151",
    SOR2 = "CB75D5A6919B61EFE917BEA5762C1CB7",
    SOR3 = "2D0B0C8F10EDF76131708E874E8D1EE4"
}

Address = 
{
    [ROMHashes.SOR1] =
    {
        Health = 0xB832,
        Lives = 0xFF20,
        Special = 0xFF21,
        Timer = 0xFB59
    },
    
    [ROMHashes.SOR2] =
    {
        Health = 0xEF81,
        Lives = 0xEF83,
        Timer = 0xFC3D
    },
    
    [ROMHashes.SOR3] =
    {
        Health = 0xDF6C,
        Lives = 0xDF8B,
        Special = 0xF617
    },
}

Max =
{
    Health =
    {
        [ROMHashes.SOR1] = 80,
        [ROMHashes.SOR2] = 104,
        [ROMHashes.SOR3] = 52
    }    
}

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
