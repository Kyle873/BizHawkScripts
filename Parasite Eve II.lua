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

Items =
{
	[0x00] = "Nothing",
	[0x01] = "Recovery 1",
	[0x02] = "Recovery 2",
	[0x03] = "Recovery 3",
	[0x04] = "Stim",
	[0x05] = "Cola",
	[0x06] = "MP Boost 1",
	[0x07] = "MP Boost 2",
	[0x08] = "Penicillin",
	[0x09] = "SMG Clip Holder",
	[0x0A] = "Rifle Clip Holder",
	[0x0B] = "Lipstick",
	[0x0C] = "Snail Magazine",
	[0x0D] = "Belt Pouch",
	[0x0E] = "MD Player",
	[0x0F] = "PE Energy",
	[0x36] = "Skull Crystal",
	[0x37] = "Medicine Wheel",
	[0x38] = "Holy Water",
	[0x39] = "Ofuda",
	[0x3A] = "Flare",
	[0x3B] = "Pepper Spray",
	[0x3C] = "Protein Capsule",
	[0x3D] = "Ringer's Solution",
	[0x3E] = "Eau De Toilette",
	[0x3F] = "Hunter's Goggles",
	[0x40] = "GPS",
	[0x41] = "Combat Light",
	[0x42] = "Hammer",
	[0x43] = "Pyke",
	[0x44] = "Javelin",
	[0x45] = "M203",
	[0x46] = "M9",
	[0x60] = "Leather Jacket",
	[0x61] = "Tactical Armor",
	[0x62] = "Combat Armor",
	[0x63] = "Assault Armor",
	[0x64] = "PASGT Vest",
	[0x65] = "Tactical Vest",
	[0x66] = "EOD Suit",
	[0x67] = "Turtle Vest",
	[0x68] = "Chicken Plate",
	[0x69] = "NBC Suit",
	[0x6A] = "Psysuit",
	[0x6B] = "Aya Special",
	[0x6C] = "Shoulder Holster",
	[0x6D] = "Monk Robe",
	[0x80] = "P08 (S. Magazine)",
	[0x81] = "M93R",
	[0x82] = "M950",
	[0x83] = "P08",
	[0x84] = "P229",
	[0x88] = "Mongoose",
	[0x8A] = "Grenade Pistol",
	[0x8B] = "MM1",
	[0x8C] = "PA3",
	[0x8D] = "SP12",
	[0x8E] = "AS12",
	[0x8F] = "M4A1 Rifle",
	[0x90] = "M249",
	[0x92] = "Tonfa Baton",
	[0x93] = "M4A1 (+1)",
	[0x94] = "M4A1 (+2)",
	[0x95] = "Hypervelocity",
	[0x96] = "Gunblade",
	[0x97] = "M4A1 Hammer",
	[0x98] = "M4A1 Bayonet",
	[0x99] = "M4A1 Grenade",
	[0x9A] = "M4A1 Grenade",
	[0x9B] = "M4A1 Pyke",
	[0x9C] = "M4A1 Javelin",
	[0x9D] = "MP5A5",
	[0x9E] = "MP5A5 (+1)",
	[0x9F] = "MP5A5 (+2)",
	[0xA0] = "9mm P.B",
	[0xA1] = "9mm Hydra",
	[0xA2] = "9mm Spartan",
	[0xA6] = "44 Magnum Rounds",
	[0xA7] = "44 Maeda SP",
	[0xA8] = "44 Poison",
	[0xA9] = "Grenade",
	[0xAA] = "Airburst",
	[0xAB] = "Riot",
	[0xAC] = "Buckshot",
	[0xAD] = "Firefly",
	[0xAE] = "R. Slug",
	[0xAF] = "5.56 Rifle",
	[0xB0] = "Paralizer",
	[0xC1] = "Cafeteria Key",
	[0xC2] = "Metallic Implant",
	[0xC3] = "Red Key",
	[0xC4] = "Blue Key",
	[0xC5] = "Black Card",
	[0xC6] = "MIST Badge",
	[0xC7] = "Scientific Journal",
	[0xC8] = "Clipboard",
	[0xC9] = "MIST Search Warrant",
	[0xCA] = "NMC Photo",
	[0xCB] = "Manual",
	[0xCC] = "Dryfield Map",
	[0xCF] = "Motel Key No.6",
	[0xD0] = "Saloom Key",
	[0xD1] = "Monkey Wrench",
	[0xD2] = "Lobby Key",
	[0xD3] = "Bronco Masterkey",
	[0xD4] = "Wire Rope",
	[0xD5] = "Factory Key",
	[0xD6] = "Truck Key",
	[0xD7] = "Jerry Can",
	[0xD8] = "Petrol",
	[0xD9] = "Ice Bag",
	[0xDA] = "Bag of Water",
	[0xDB] = "Bottlecap Magnet",
	[0xDE] = "SUV Key",
	[0xDF] = "Oak Board",
	[0xE0] = "Jumper Plug",
	[0xE1] = "Bowmans Card",
	[0xE2] = "Yoshida's Card",
	[0xE3] = "Electric Car Key",
	[0xE4] = "Teddy Bear",
	[0xE5] = "Pierce's Memo",
	[0xE7] = "Computer Magazine (Aeris - Sept. Issue)",
	[0xE8] = "Mr. Douglas's Letter",
	[0xEC] = "Jumper Plug",
	[0xED] = "Micro Device",
	[0xEF] = "Pierce Rescue Bonus",
	[0xF0] = "Soldier Rescue Bonus"
}

Prices =
{
	-- Gear
	[0x01] = 100,   -- Recovery 1
	[0x02] = 180,   -- Recovery 2
	[0x03] = 350,   -- Recovery 3
	[0x04] = 80,    -- Stim
	[0x05] = 120,   -- Cola
	[0x06] = 320,   -- MP Boost 1
	[0x07] = 580,   -- MP Boost 2
	[0x08] = 80,    -- Penicillin
	[0x09] = 3980,  -- SMG Clip Holder
	[0x0A] = 1800,  -- Rifle Clip Holder
	[0x0B] = 5000,  -- Lipstick
	[0x0C] = 1000,  -- Snail Magazine
	[0x0D] = 10000, -- Belt Pouch
	[0x0E] = 1000,  -- MD Player
	[0x36] = 5000,  -- Skull Crystal
	[0x37] = 27800, -- Medicine Wheel
	[0x38] = 5000,  -- Holy Water
	[0x39] = 5000,  -- Ofuda
	[0x3A] = 150,   -- Flare
	[0x3B] = 100,   -- Pepper Spray
	[0x3C] = 10000, -- Protein Capsule
	[0x3D] = 200,   -- Ringer's Solution
	[0x3E] = 190,   -- Eau De Toilette
	[0x3F] = 1000,  -- Hunter's Goggles
	[0x40] = 1000,  -- GPS
	[0x41] = 60,    -- Combat Light
	[0x42] = 3720,  -- Hammer
	[0x43] = 5180,  -- Pyke
	[0x44] = 7500,  -- Javelin
	[0x45] = 2130,  -- M203
	[0x46] = 980,   -- M9
	[0x60] = 1000,  -- Leather Jacket
	[0x61] = 12800, -- Tactical Armor
	[0x62] = 3250,  -- Combat Armor
	[0x63] = 1000,  -- Assault Armor
	[0x64] = 2980,  -- PASGT Vest
	[0x65] = 2120,  -- Tactical Vest
	[0x66] = 4580,  -- EOD Suit
	[0x67] = 1680,  -- Turtle Vest
	[0x68] = 1000,  -- Chicken Plate
	[0x69] = 3980,  -- NBC Suit
	[0x6A] = 4580,  -- Psysuit
	[0x6B] = 8000,  -- Aya Special
	[0x6C] = 2580,  -- Shoulder Holster
	[0x6D] = 3000,  -- Monk Robe
	[0x81] = 2000,  -- M93R
	[0x82] = 5750,  -- M950
	[0x83] = 680,   -- P08
	[0x84] = 1880,  -- P229
	[0x88] = 2850,  -- Mongoose
	[0x8A] = 1680,  -- Grenade Pistol
	[0x8B] = 23500, -- MM1
	[0x8C] = 1000,  -- PA3
	[0x8D] = 3980,  -- SP12
	[0x8E] = 12500, -- AS12
	[0x8F] = 2450,  -- M4A1 Rifle
	[0x90] = 15800, -- M249
	[0x92] = 1000,  -- Tonfa Baton
	[0x95] = 20000, -- Hypervelocity
	[0x96] = 10000, -- Gunblade
	[0x9D] = 6980, -- MP5A5
	
	-- Ammo
	[0xA0] = { 30,  50 }, -- 9mm P.B
	[0xA1] = { 50,  50 }, -- 9mm Hydra
	[0xA2] = { 80,  50 }, -- 9mm Spartan
	[0xA6] = { 100, 50 }, -- 44 Magnum Rounds
	[0xA7] = { 800, 25 }, -- 44 Maeda SP
	[0xA9] = { 280, 4  }, -- Grenade
	[0xAA] = { 450, 4  }, -- Airburst
	[0xAB] = { 80,  4  }, -- Riot
	[0xAC] = { 60,  10 }, -- Buckshot
	[0xAD] = { 90,  10 }, -- Firefly
	[0xAE] = { 120, 10 }, -- R. Slug
	[0xAF] = { 100, 80 }  -- 5.56 Rifle
}

AmmoMax =
{
	[0xA0] = 500, -- 9mm P.B.
	[0xA1] = 500, -- 9mm Hydra
	[0xA2] = 500, -- 9mm Spartan
	[0xA6] = 500, -- 44 Magnum Rounds
	[0xA7] = 500, -- 44 Maeda SP
	[0xA9] = 100, -- Grenade
	[0xAA] = 100, -- Airburst
	[0xAB] = 100, -- Riot
	[0xAC] = 200, -- Buckshot
	[0xAD] = 200, -- Firefly
	[0xAE] = 200, -- R. Slug
	[0xAF] = 800  -- 5.56 Rifle
}

MaxParasiteEnergy = 3 * 4
MaxItemSlots = 128
MaxItemSize = 4

GeneratorEnabled = true
GeneratorTimer = 0
GeneratorTimerMax = 60 * 60 * 5
GeneratorEXPBase = 10
GeneratorBPBase = 100

KLib.Menu.Keys.Toggle = { "+@X1 LeftShoulder", "@X1 LeftTrigger" }
KLib.Message.Color(KLib.Color.White, KLib.Color.Transparent)

function CreateMenu()
    KLib.Menu.Color(KLib.Color.White, KLib.Color.Make(0, 0, 0, 192))
    
    KLib.Menu.Page("Parasite Eve 2\r")
	
	KLib.Menu.Field("HP", Address.HP, "byte")
	KLib.Menu.Field("Max HP", Address.MaxHP, "byte")
	KLib.Menu.Field("MP", Address.MP, "byte")
	KLib.Menu.Field("Max MP", Address.MaxMP, "byte")
	KLib.Menu.Field("EXP", Address.EXP, "byte")
	KLib.Menu.Field("BP", Address.BP, "s32_le")
	KLib.Menu.Field("Kyle's HP", Address.KyleHP, "byte")
	
	KLib.Menu.Separator()
	KLib.Menu.SubPage("Items", CreateItemsPage)
	KLib.Menu.SubPage("Shop", CreateShopPage, UpdateShopPage)
end

function CreateItemsPage()
    KLib.Menu.Offset(nil, MaxItemSlots, MaxItemSize)
	
	KLib.Menu.Enum("ID", Address.Items, "byte", Items)
	KLib.Menu.Field("Attachment Slot", Address.Items + 1, "byte")
	KLib.Menu.Field("Quantity", Address.Items + 2, "s16_le")
end

function CreateShopPage()
	local function BuyItem(id)
		local BP = KLib.Memory.ReadShort(Address.BP)
		local price = 0
		local amount = 1
		
		if type(Prices[id]) == "table" then
			price = Prices[id][1]
			amount = Prices[id][2]
		else
			price = Prices[id]
		end
		
		if BP >= price then
			if id >= 0xA0 and id <= 0xA0 + 0x10 and FindItem(id) ~= nil then
				local slot = FindItem(id)
				
				if slot ~= nil then
					local address = Address.Items + (slot * MaxItemSize)
					local current = KLib.Memory.ReadShort(address + 2)
					
					if current < AmmoMax[id] then
						if current + amount > AmmoMax[id] then
							KLib.Memory.WriteShort(address + 2, AmmoMax[id])
						else
							KLib.Memory.WriteShort(address + 2, current + amount)
						end
						
						KLib.Memory.WriteShort(Address.BP, BP - price)
						
						KLib.Message.Add("Purchased " .. Items[id])
					else
						KLib.Message.Add(Items[id] .. " is full!")
					end
				else
					KLib.Message.Add("No empty inventory slots!")
				end
			else
				local slot = GetFreeItemSlot()
				
				if slot ~= nil then
					local address = Address.Items + (slot * MaxItemSize)
					
					KLib.Memory.WriteByte(address, id)
					KLib.Memory.WriteByte(address + 1, 0)
					KLib.Memory.WriteShort(address + 2, amount)
					
					KLib.Memory.WriteShort(Address.BP, BP - price)
					
					KLib.Message.Add("Purchased " .. Items[id])
				else
					KLib.Message.Add("No empty inventory slots!")
				end
			end
		else
			KLib.Message.Add("Not enough BP!")
		end
	end
	
	for i = 1, 255 do
		if Prices[i] ~= nil then
			local text = nil
			
			if type(Prices[i]) == "table" then
				text = KLib.Menu.Text(Items[i] .. " x".. Prices[i][2] .. " - " .. Prices[i][1] .. " BP")
			else
				text = KLib.Menu.Text(Items[i] .. " - " .. Prices[i] .. " BP")
			end
			
			text.onUse = function() BuyItem(i) end
		end
	end
end

function UpdateShopPage(page)
    page.header = "Shop - " .. KLib.Memory.ReadShort(Address.BP) .. " BP"
end

function Mods()
	local function Generator()
		local level = 0
		local EXP = KLib.Memory.ReadShort(Address.EXP)
		local BP = KLib.Memory.ReadShort(Address.BP)
		
		for i = 0, MaxParasiteEnergy - 1 do
			level = level + KLib.Memory.ReadByte(Address.ParasiteEnergy + i)
		end
		
		if GeneratorTimer >= GeneratorTimerMax then
			KLib.Memory.WriteShort(Address.EXP, EXP + (GeneratorEXPBase * level))
			KLib.Memory.WriteShort(Address.BP, BP + (GeneratorBPBase * level))
			
			KLib.Message.Add("+" .. GeneratorEXPBase * level .. " EXP / +" .. GeneratorBPBase * level .. " BP")
			
			GeneratorTimer = 0
		else
			GeneratorTimer = GeneratorTimer + 1
		end
		
		gui.drawRectangle(0, client.bufferheight() - 1, (GeneratorTimer / GeneratorTimerMax) * client.bufferwidth(), 2, KLib.Color.White)
	end
	
	-- Max Range Targets
    -- KLib.Memory.WriteByte(Address.RangeTargets, 255)
	
    -- Max Item Slots
    KLib.Memory.WriteByte(Address.ItemSlots, MaxItemSlots)
	
	if GeneratorEnabled then
		Generator()
	end
end

function GetFreeItemSlot()
	for i = 0, MaxItemSlots - 1 do
		if KLib.Memory.ReadByte(Address.Items + (i * MaxItemSize)) == 0 then
			return i
		end
	end
	
	return nil
end

function FindItem(id)
	for i = 0, MaxItemSlots - 1 do
		if id == KLib.Memory.ReadByte(Address.Items + (i * MaxItemSize)) then
			return i
		end
	end
	
	return nil
end

CreateMenu()

while true do
    KLib.Update()

    Mods()

    emu.frameadvance()

    KLib.PostUpdate()
end
