dofile("KLib/KLib.lua")

Address =
{
    MainMenuIndex = 0x10E830,
    InventoryIndex = 0x10E864,
    ShopIndex = 0x186550,

    EXP = 0x73B90,
    BP = 0x73B94,
    HP = 0x73BA0,
    MaxHP = 0x73BA2,
    MP = 0x73BA4,
    MaxMP = 0x73BA6,

    Items = 0x72314,
    ItemSlots = 0x72725,
    KeyItems = 0x72714,
    ParasiteEnergy = 0x729B8,

    RangeTargets = 0x91AAF,

    KyleHP = 0x72830
}

Items = {}

function Input()
    local slots = KLib.Memory.ReadByte(Address.ItemSlots)
    local address = Address.Items + ((slots - 1) * 4)
    local item = KLib.Memory.ReadByte(address)
    local quantity = KLib.Memory.ReadShort(address + 2)

    if KLib.Input.Joypad["P1 Right"] then
        if KLib.Input.ButtonPressed("P1 L1") then
            KLib.Memory.WriteByte(address, item - 1)
        end

        if KLib.Input.ButtonPressed("P1 R1") then
            KLib.Memory.WriteByte(address, item + 1)
        end

        if KLib.Input.ButtonPressed("P1 L2") then
            KLib.Memory.WriteShort(address + 2, quantity - 1)
        end

        if KLib.Input.ButtonPressed("P1 R2") then
            KLib.Memory.WriteShort(address + 2, quantity + 1)
        end
    end

    if KLib.Input.Joypad["P1 L2"] then
        if KLib.Input.ButtonPressed("P1 Circle") then
            KLib.Memory.WriteByte(Address.HP, KLib.Memory.ReadByte(Address.MaxHP))
            KLib.Memory.WriteByte(Address.MP, KLib.Memory.ReadByte(Address.MaxMP))
        end
    end

    if KLib.Input.KeyPressed("Q") then
        Items = {}

        for i = 0, (slots - 1) * 4 do
            table.insert(Items, KLib.Memory.ReadByte(Address.Items + i))
        end
    end

    if KLib.Input.KeyPressed("W") then
        if #Items > 0 then
            for i = 0, (slots - 1) * 4 do
                KLib.Memory.WriteByte(Address.Items + i, Items[i + 1])
            end
        end
    end
end

function Mods()
    -- Max Item Slots
    KLib.Memory.WriteByte(Address.ItemSlots, 128)
end

while true do
    KLib.Update()

    Input()
    Mods()

    emu.frameadvance()

    KLib.PostUpdate()
end
