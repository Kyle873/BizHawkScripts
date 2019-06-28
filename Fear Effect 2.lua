dofile("KLib/KLib.lua")

Address =
{
    Position = 0x1D7F72,
    Fear = 0x1D7F9C,

    Cheats = 0x7B4F8
}

function Draw()
    local fear = KLib.Memory.ReadByte(Address.Fear)
    local x = KLib.Memory.ReadInt(Address.Position)
    local y = KLib.Memory.ReadInt(Address.Position + 4)
    local z = KLib.Memory.ReadInt(Address.Position + 8)
    local r = KLib.Memory.ReadInt(Address.Position + 12)

    gui.drawText(16, 0, KLib.Math.Round(fear / 127 * 100, 1) .. "%", KLib.Color.White, KLib.Color.Transparent)
    gui.drawText(client.bufferwidth() - 16, 0, string.format("%05d", x) .. " | " .. string.format("%05d", y) .. " | " .. string.format("%05d", z) .. " | " .. string.format("%04d", r), KLib.Color.White, KLib.Color.Transparent, nil, nil, nil, "right")
end

function Mods()
    --[[ Cheats

         0x0001 - Infinite Ammo
         0x0002 - No Fear
         0x0100 - All Weapons
    --]]

    KLib.Memory.WriteShort(Address.Cheats, 0x0103)
end

while true do
    KLib.Update()

    Draw()
    Mods()

    emu.frameadvance()

    KLib.PostUpdate()
end
