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

Items =
{
	[0x00] = "Nothing",
	[0x01] = "Knife",
	[0x02] = "Handgun",
	[0x03] = "Handgun",
	[0x04] = "Shotgun",
	[0x05] = "Magnum",
	[0x06] = "Grenade Launcher",
	[0x07] = "Grenade Launcher",
	[0x08] = "Grenade Launcher",
	[0x09] = "Grenade Launcher",
	[0x0A] = "Rocket Launcher",
	[0x0B] = "Gatling Gun",
	[0x0C] = "Mine Thrower",
	[0x0D] = "Eagle 6.0",
	[0x0E] = "Assault Rifle",
	[0x0F] = "Assault Rifle",
	[0x10] = "Western Custom",
	[0x11] = "Sigpro E.",
	[0x12] = "M 92F E.",
	[0x13] = "Benelli M35 E.",
	[0x14] = "Mine Thrower E.",
	[0x15] = "Hand Gun Bullets",
	[0x16] = "Magnum Bullets",
	[0x17] = "Shotgun Shells",
	[0x18] = "Grenade Rounds",
	[0x19] = "Flame Rounds",
	[0x1A] = "Acid Rounds",
	[0x1B] = "Freeze Rounds",
	[0x1C] = "Mine Thrower Rounds",
	[0x1D] = "Assault Rifle Bullets",
	[0x1E] = "Hand Gun Bullets E.",
	[0x1F] = "Shotgun Shells E",
	[0x20] = "First Aid Spray",
	[0x21] = "Green Herb",
	[0x22] = "Blue Herb",
	[0x23] = "Red Herb",
	[0x24] = "2 Green Herb Mixture",
	[0x25] = "2 Green Herb Mixture",
	[0x26] = "Blue Green Herb Mix",
	[0x27] = "Red Green Herb Mix",
	[0x28] = "3 Green Herb Mix",
	[0x29] = "2 Green 1 Blue Herb Mix",
	[0x2A] = "1 Green 1 Red 1 Blue Mix",
	[0x2B] = "Crank",
	[0x2C] = "*Botu",
	[0x2D] = "*Botu",
	[0x2E] = "*Botu",
	[0x2F] = "Jill's STARS Card",
	[0x30] = "*Botu",
	[0x31] = "Battery",
	[0x32] = "Fire Hose",
	[0x33] = "Power Cord",
	[0x34] = "Fuse",
	[0x35] = "*Botu",
	[0x36] = "Oil Additive",
	[0x37] = "Card Case",
	[0x38] = "Brad's STARS Card",
	[0x39] = "Machine Oil",
	[0x3A] = "Mixed Oil",
	[0x3B] = "*Botu",
	[0x3C] = "Wrench",
	[0x3D] = "Iron Pipe",
	[0x3E] = "*Botu",
	[0x3F] = "Fire Hose",
	[0x40] = "Tape Recorder",
	[0x41] = "Lighter Oil",
	[0x42] = "Lighter",
	[0x43] = "Lighter",
	[0x44] = "Green Gem",
	[0x45] = "Blue Gem",
	[0x46] = "Amber Ball",
	[0x47] = "Obsidian Ball",
	[0x48] = "Crystal Ball",
	[0x49] = "*Botu",
	[0x4A] = "*Botu",
	[0x4B] = "*Botu",
	[0x4C] = "Gold Gear",
	[0x4D] = "Silver Gear",
	[0x4E] = "Chronos Gear",
	[0x4F] = "Bronze Book",
	[0x50] = "Bronze Compass",
	[0x51] = "Vaccine Medium",
	[0x52] = "Vaccine Base",
	[0x53] = "*Botu",
	[0x54] = "*Botu",
	[0x55] = "Vaccine",
	[0x56] = "*Botu",
	[0x57] = "*Botu",
	[0x58] = "Medium Base",
	[0x59] = "Eagle Parts A",
	[0x5A] = "Eagle Parts B",
	[0x5B] = "M37 Parts A",
	[0x5C] = "M37 Parts B",
	[0x5D] = "*Botu",
	[0x5E] = "Chronos Chain",
	[0x5F] = "Rusted Hex Crank",
	[0x60] = "Card Key",
	[0x61] = "Gun Powder A",
	[0x62] = "Gun Powder B",
	[0x63] = "Gun Powder C",
	[0x64] = "Gun Powder AA",
	[0x65] = "Gun Powder BB",
	[0x66] = "Gun Powder AC",
	[0x67] = "Gun Powder BC",
	[0x68] = "Gun Powder CC",
	[0x69] = "Gun Powder AAA",
	[0x6A] = "Gun Powder AAB",
	[0x6B] = "Gun Powder BBA",
	[0x6C] = "Gun Powder BBB",
	[0x6D] = "Gun Powder CCC",
	[0x6E] = "Infinite Bullets Kit",
	[0x6F] = "Water Sample",
	[0x70] = "System Disk",
	[0x71] = "*Dummy Key",
	[0x72] = "Lockpick",
	[0x73] = "Warehouse Key",
	[0x74] = "Sickroom Key",
	[0x75] = "Emblem Key",
	[0x76] = "*Botu (A Set Of Keys)",
	[0x77] = "Clock Tower Key",
	[0x78] = "Clock Tower Key 2",
	[0x79] = "Chronos Key",
	[0x7A] = "*Botu",
	[0x7B] = "Park Key",
	[0x7C] = "Park Key 2",
	[0x7D] = "Park Key 3",
	[0x7E] = "Facility Key",
	[0x7F] = "Facility Key 2",
	[0x82] = "Reloading Tool"
}

ItemFlags =
{
	"Unknown",
	"Unknown",
	"Unknown",
	"Unknown",
	"Unknown",
	"Unknown",
	"Unknown",
	"Unknown"
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

MaxItemSize = 4
MaxInventory = 10
MaxStorage = 64

HealthPrev = 0
HealthTimer = 0
HealthTimerBase = 60 * 15
HealthTimerMax = HealthTimerBase
HealthTimerMult = 0

ItemGenEnabled = true
ItemGenReady = false
ItemGenTimer = 0
ItemGenTimerMax = 60 * 60 * 2

function CreateMenu()
    KLib.Menu.Color(KLib.Color.White, KLib.Color.Make(0, 0, 0, 192))
    
    KLib.Menu.Page("Resident Evil 3\r")
    
	KLib.Menu.SubPage("Inventory", CreateInventoryPage)
	KLib.Menu.SubPage("Storage", CreateStoragePage)
end

function CreateInventoryPage()
    KLib.Menu.Offset(nil, MaxInventory, MaxItemSize)
	
    KLib.Menu.Enum("ID", Address.Items, "byte", Items)
    KLib.Menu.Field("Quantity", Address.Items + 1, "byte")
    KLib.Menu.Bitfield("Flags", Address.Items + 2, "byte", ItemFlags)
    KLib.Menu.Field("Fraction", Address.Items + 3, "byte")
end

function CreateStoragePage()
    KLib.Menu.Offset(nil, MaxStorage, MaxItemSize)
	
    KLib.Menu.Enum("ID", Address.Storage, "byte", Items)
    KLib.Menu.Field("Quantity", Address.Storage + 1, "byte")
    KLib.Menu.Bitfield("Flags", Address.Storage + 2, "byte", ItemFlags)
    KLib.Menu.Field("Fraction", Address.Storage + 3, "byte")
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
	
	local function ItemGen()
		if ItemGenTimer >= ItemGenTimerMax then
			ItemGenReady = true
		elseif not MenuOpen() then
			ItemGenTimer = ItemGenTimer + 1
		end
		
		if ItemGenReady and MenuOpen() then
			local slot = GetFreeStorageSlot()
			local item, amount = GetBonusItem()
			
			if slot ~= nil then
				KLib.Memory.WriteByte(Address.Storage + (slot * MaxItemSize), item)
				KLib.Memory.WriteByte(Address.Storage + (slot * MaxItemSize) + 1, amount)
				KLib.Memory.WriteByte(Address.Storage + (slot * MaxItemSize) + 2, 0)
				KLib.Memory.WriteByte(Address.Storage + (slot * MaxItemSize) + 3, 0)
				
				ItemGenTimer = 0
				ItemGenReady = false
                
				KLib.Message.Add("Synthesized " .. Items[item] .. " (Slot " .. slot + 1 .. ")")
			else
                KLib.Message.Add("Storage is full!")
			end
		end
		
		gui.drawRectangle(8, client.bufferheight() - 1, (ItemGenTimer / ItemGenTimerMax) * (client.bufferwidth() - 16), 2, ItemGenReady and KLib.Color.Rainbow(64 * 10) or KLib.Color.White)
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

	HealthRegen()
	
	if ItemGenEnabled then
		ItemGen()
	end
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

function GetFreeStorageSlot()
	for i = 0, MaxInventory - 1 do
		if KLib.Memory.ReadByte(Address.Storage + (i * MaxItemSize)) == 0 then
			return i
		end
	end
	
	return nil
end

function GetBonusItem()
	local items =
	{
		33, 97, 98
	}
	
	local item = items[math.random(1, #items)]
	local amount = 1
	
	return item, amount
end

CreateMenu()

while true do
    KLib.Update()

    Draw()
    Mods()

    emu.frameadvance()

    KLib.PostUpdate()
end
