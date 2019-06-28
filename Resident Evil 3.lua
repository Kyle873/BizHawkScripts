dofile("KLib/KLib.lua")

Address =
{
    Menu = 0xDCC14,
    MenuIndex = 0xE01DC,
    StorageIndex = 0xE01DF,

    Health = 0xCCC90,
    Condition = 0xCCC97,
    Time = 0xD1F28,
    Saves = 0xD1F40,

    Items = 0xD2134,
    EquipIndex = 0xD225C,
    EquipType = 0xD225D,
    MaxSlots = 0xD225E,
    Storage = 0xD215C,
    Maps = 0xD2127,
    Files = 0xD212C,
    MixSkill = 0xD2260,

    FireTimer = 0xCCC8C,

    StartFlags = 0xD1F32,
    
    EnemyState = 0x23EAA
}

WeaponAmmoTypes =
{
    [1] = 0,   -- Knife
    [2] = 21,  -- Merc's Handgun
    [3] = 21,  -- Hand Gun
    [4] = 23,  -- Shotgun
    [5] = 22,  -- Magnum
    [6] = 24,  -- Grenade Launcher (Normal)
    [7] = 25,  -- Grenade Launcher (Flame)
    [8] = 26,  -- Grenade Launcher (Acid)
    [9] = 27,  -- Grenade Launcher (Freeze)
    [10] = 0,  -- Rocket Launcher
    [11] = 0,  -- Gatling Gun
    [12] = 28, -- Mine Thrower
    [13] = 21, -- EAGLE 6.0
    [14] = 29, -- Assault Rifle (Manual)
    [15] = 29, -- Assault Rifle (Auto)
    [16] = 23, -- Western Custom
    [17] = 30, -- SIGPRO E
    [18] = 30, -- M92F E
    [19] = 31, -- Benelli M3S E
    [20] = 28, -- Mine Thrower E
}

Debug = false
EnemyFrozen = false
ItemCopy = {}

HealthPrev = 0
HealthTimer = 0
HealthTimerBase = 60 * 15
HealthTimerMax = HealthTimerBase
HealthTimerMult = 1

function Input()
    if not MenuOpen() then
        if KLib.Input.Joypad["P1 L1"] then
            -- Save
            if KLib.Input.ButtonPressed("P1 Triangle") then
                KLib.Memory.WriteShort(0xD1D18, 0x13CC)
                KLib.Memory.WriteShort(0xD1D1A, 0x8005)
            end

            -- Storage
            if KLib.Input.ButtonPressed("P1 Square") then
                KLib.Memory.WriteShort(0xD1F2C, 0x0200)
                KLib.Memory.WriteShort(0xE01C4, 0x0002)
            end

            -- Freeze/Unfreeze Enemies
            if KLib.Input.ButtonPressed("P1 Cross") then
                EnemyFrozen = not EnemyFrozen

                if EnemyFrozen then
                    KLib.Memory.WriteShort(Address.EnemyState, 0x2400)
                else
                    KLib.Memory.WriteShort(Address.EnemyState, 0x0040)
                end
            end
        end

        -- Rapid Fire
        if KLib.Input.Joypad["P1 R1"] and KLib.Input.Joypad["P1 R2"] then
            KLib.Memory.WriteByte(Address.FireTimer, 0x1E02)
        end
    end

    -- Item Box Editor
    if MenuOpen() then
        local index = KLib.Memory.ReadByte(Address.StorageIndex)
        local address = Address.Storage + (index * 4)
        local item = KLib.Memory.ReadByte(address)
        local quantity = KLib.Memory.ReadByte(address + 1)
        local flags = KLib.Memory.ReadByte(address + 2)
        local fraction = KLib.Memory.ReadByte(address + 3)

        if Debug then
            gui.drawText(6, 0, index .. " | " .. string.format("%0X", address) .. " | " .. item .. " | " .. quantity .. " | " .. flags .. " | " .. fraction)
        end

        if KLib.Input.Joypad["P1 Square"] then
            if KLib.Input.ButtonPressed("P1 Left") then
                KLib.Memory.WriteByte(address, item - 1)
            end

            if KLib.Input.ButtonPressed("P1 Right") then
                KLib.Memory.WriteByte(address, item + 1)
            end

            if KLib.Input.ButtonPressed("P1 L2") then
                KLib.Memory.WriteByte(address + 1, quantity - 1)
            end

            if KLib.Input.ButtonPressed("P1 R2") then
                KLib.Memory.WriteByte(address + 1, quantity + 1)
            end

            if KLib.Input.ButtonPressed("P1 Select") then
                KLib.Memory.WriteInt(address, 0)
            end
        end

        if KLib.Input.Joypad["P1 Circle"] then
            if KLib.Input.ButtonPressed("P1 Left") then
                KLib.Memory.WriteByte(address + 2, flags - 1)
            end

            if KLib.Input.ButtonPressed("P1 Right") then
                KLib.Memory.WriteByte(address + 2, flags + 1)
            end

            if KLib.Input.ButtonPressed("P1 L2") then
                ItemCopy = { item, quantity, flags, fraction }
            end

            if KLib.Input.ButtonPressed("P1 R2") then
                for i = 0, 3 do
                    KLib.Memory.WriteByte(address + i, ItemCopy[i + 1])
                end
            end

            if KLib.Input.ButtonPressed("P1 Select") then
                KLib.Memory.WriteByte(address, math.random(97, 98))
                KLib.Memory.WriteByte(address + 1, 1)
                KLib.Memory.WriteByte(address + 2, 0)
                KLib.Memory.WriteByte(address + 3, 0)
            end
        end
    end
end

function Draw()
    local health = KLib.Memory.ReadByte(Address.Health)
    local condition = KLib.Memory.ReadByte(Address.Condition)
    local equipIndex = KLib.Memory.ReadByte(Address.EquipIndex)
    local ammo = KLib.Memory.ReadByte(Address.Items + (equipIndex * 4) + 1)
    local flags = KLib.Memory.ReadByte(Address.Items + (equipIndex * 4) + 2)
    local fraction = KLib.Memory.ReadByte(Address.Items + (equipIndex * 4) + 3)
    local currentAmmo, currentAmmoStorage = CalculateAmmo()
    local ammoString = ammo .. "/" .. currentAmmo
    local ammoStorageString = currentAmmoStorage
    local items, storage = EnumerateItems()
    local itemMax = KLib.Memory.ReadByte(Address.MaxSlots)
    local herbs = 0
    local gunpowders = 0
    local ink = 0
    local healthColor = KLib.Color.White
    local ammoColor = KLib.Color.White
    local itemColor = KLib.Color.White

    for _, item in ipairs(items) do
        if IsHerb(item[0]) then
            herbs = herbs + item[1]
        end

        if IsGunpowder(item[0]) then
            gunpowders = gunpowders + item[1]
        end

        if item[0] == 129 then
            ink = ink + item[1]
        end
    end

    for _, item in ipairs(storage) do
        if IsHerb(item[0]) then
            herbs = herbs + item[1]
        end

        if IsGunpowder(item[0]) then
            gunpowders = gunpowders + item[1]
        end

        if item[0] == 129 then
            ink = ink + item[1]
        end
    end

    if condition % 4 ~= 0 then
        healthColor = KLib.Color.Pulse(KLib.Color.Make(224, 128, 224), 64, 8)
    else
        if health <= 20 then
            healthColor = KLib.Color.Pulse(KLib.Color.Make(224, 0, 0), 31, 8)
        elseif health <= 40 then
            healthColor = KLib.Color.Pulse(KLib.Color.Make(224, 128, 0), 31, 16)
        elseif health <= 100 then
            healthColor = KLib.Color.Pulse(KLib.Color.Make(224, 224, 0), 31, 32)
        else
            healthColor = KLib.Color.Green
        end
    end

    if flags % 16 >= 1 and flags % 16 <= 3 then
        ammoColor = KLib.Color.Green
    elseif flags % 16 >= 5 and flags % 16 <= 7 then
        ammoColor = KLib.Color.Red
    elseif flags % 16 >= 9 and flags % 16 <= 11 then
        ammoColor = KLib.Color.Yellow
    elseif flags % 16 >= 13 and flags % 16 <= 15 then
        ammoColor = KLib.Color.Cyan
    end

    if flags % 4 == 0 or flags % 4 == 3 then
        ammoString = ""
        ammoStorageString = ""
    elseif flags % 4 == 2 then
        local decimal = 0

        if fraction == 192 then
            decimal = 66
        elseif fraction == 128 then
            decimal = 33
        end

        ammoString = ammo .. "." .. decimal .. "%/" .. currentAmmo .. "%"
        ammoStorageString = currentAmmoStorage .. "%"
    end

    if #items >= itemMax then
        itemColor = KLib.Color.Red
    end

    if not IsDead() then
        if health >= 200 then
            gui.drawPie(8, client.bufferheight() - 13, 9, 9, 270, 360, KLib.Color.Transparent, KLib.Color.Green)
        else
            gui.drawPie(8, client.bufferheight() - 13, 9, 9, 270, (HealthTimer / HealthTimerMax) * 360, KLib.Color.Transparent, healthColor)
        end

        gui.drawText(18, client.bufferheight() - 16, health / 2 .. "%", healthColor, KLib.Color.Transparent)

        if equipIndex ~= 255 then
            gui.drawText(64, client.bufferheight() - 16, ammoString, ammoColor, KLib.Color.Transparent, nil, nil, nil, "left")
            gui.drawText(client.bufferwidth() - 93, client.bufferheight() - 16, ammoStorageString, ammoColor, KLib.Color.Transparent, nil, nil, nil, "right")
        end

        gui.drawText(client.bufferwidth() - 77, client.bufferheight() - 16, herbs, KLib.Color.Green, KLib.Color.Transparent, nil, nil, nil, "right")
        gui.drawText(client.bufferwidth() - 61, client.bufferheight() - 16, gunpowders, KLib.Color.Yellow, KLib.Color.Transparent, nil, nil, nil, "right")
        gui.drawText(client.bufferwidth() - 45, client.bufferheight() - 16, ink, KLib.Color.Cyan, KLib.Color.Transparent, nil, nil, nil, "right")
        gui.drawText(client.bufferwidth() - 6, client.bufferheight() - 16, #items .. "/" .. itemMax, itemColor, KLib.Color.Transparent, nil, nil, nil, "right")
    end
end

function Mods()
    local function HealthRegen()
        local health = KLib.Memory.ReadByte(Address.Health)
        local regen = false

        HealthTimerMax = HealthTimerBase * HealthTimerMult

        if Debug then
            gui.drawText(6, 12, health .. " | " .. HealthPrev .. " | " .. HealthTimer .. "/" .. HealthTimerMax .. " | " .. HealthTimerMult .. "x")
        end

        if health < HealthPrev then
            HealthTimer = 0
        elseif health > HealthPrev then
            HealthTimerMult = 0.1
        end

        if not MenuOpen() and IsFine() and not IsDead() and health < 200 then
            HealthTimer = HealthTimer + 1
        end

        if HealthTimer > HealthTimerMax then
            if health < 200 then
                KLib.Memory.WriteByte(Address.Health, health + 1)
                regen = true
            end

            if HealthTimerMult <= 0.9 then
                HealthTimerMult = HealthTimerMult + 0.1
            end

            HealthTimer = 0
        end

        if regen then
            HealthPrev = health + 1
        else
            HealthPrev = health
        end
    end

    -- Secret Mode
    -- KLib.Memory.WriteShort(Address.StartFlags, 0xFFE0)

    -- 00:00:00 Time and 0 Saves
    KLib.Memory.WriteInt(Address.Time, 0)
    KLib.Memory.WriteShort(Address.Saves, 0)

    -- 10 Bag Slots
    KLib.Memory.WriteByte(Address.MaxSlots, 10)

    -- Maximum Ammo Crafting Skill
    KLib.Memory.WriteShort(Address.MixSkill, 500)
    KLib.Memory.WriteShort(Address.MixSkill + 2, 500)
    KLib.Memory.WriteShort(Address.MixSkill + 6, 500)
    KLib.Memory.WriteShort(Address.MixSkill + 8, 500)
    KLib.Memory.WriteShort(Address.MixSkill + 10, 500)
    KLib.Memory.WriteShort(Address.MixSkill + 12, 500)

    HealthRegen()
end

function MenuOpen()
    return KLib.Memory.ReadByte(Address.Menu) > 0
end

function IsFine()
    return KLib.Memory.ReadByte(Address.Condition) % 4 == 0
end

function IsDead()
    return KLib.Memory.ReadByte(Address.Health + 1) == 255
end

function IsHerb(id)
    return id >= 32 and id <= 42
end

function IsGunpowder(id)
    return id >= 97 and id <= 109
end

function EnumerateItems()
    local items = {}
    local storage = {}

    for i = 0, KLib.Memory.ReadByte(Address.MaxSlots) - 1 do
        local item = KLib.Memory.ReadRange(Address.Items + (i * 4), 4)

        if item[0] > 0 then
            table.insert(items, item)
        end
    end

    for i = 0, 63 do
        local item = KLib.Memory.ReadRange(Address.Storage + (i * 4), 4)

        if item[0] > 0 then
            table.insert(storage, item)
        end
    end

    return items, storage
end

function CalculateAmmo()
    local equipped = KLib.Memory.ReadByte(Address.Items + (KLib.Memory.ReadByte(Address.EquipIndex) * 4))
    local items, storage = EnumerateItems()
    local total = 0
    local totalStorage = 0

    for _, item in ipairs(items) do
        for weapon, ammo in pairs(WeaponAmmoTypes) do
            if equipped == weapon and item[0] == ammo then
                total = total + item[1]
            end
        end
    end

    for _, item in ipairs(storage) do
        for weapon, ammo in pairs(WeaponAmmoTypes) do
            if equipped == weapon and item[0] == ammo then
                totalStorage = totalStorage + item[1]
            end
        end
    end

    return total, totalStorage
end

while true do
    KLib.Update()

    Input()
    Draw()
    Mods()

    emu.frameadvance()

    KLib.PostUpdate()
end
