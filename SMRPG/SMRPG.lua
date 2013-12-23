-- TODO: Commit into EmuLuaScripts Github repository

-- Addresses
Address =
{
	-- Inventory / Items
	Items = 0x7FF882,
	Equipment = 0x7FF864,
	SpecialItems = 0x7FF8A0,
	FP = 0x7FF8B1,
	Coins = 0x7FF8AF,
	FrogCoins = 0x7FF8B3,
	
	-- Characters
	Characters = 0x7FF800,

	-- World
	X = 0x702000,
	Y = 0x702002,
	Z = 0x702004,
	CurrentLocation = 0x7E09E5,
	Music = 0x7E1D00,
	SoundEffect = 0x7E1D01,
	Invincible = 0x403076,
	
	-- Battle
	Enemies = 0x7EFC00,
	Spell = 0x7E0539,
	JumpCounter = 0x7EE010,
	MysteryEggCounter = 0x7EE012,
	LambsLureCounter = 0x7EE013,
	LuckyJewelCounter = 0x7EE014,
	TotalXP = 0x7EFA02,
	TotalCoins = 0x7EFA04,
	BattleEvent = 0x7EFA1D,
};

-- Menu vars
Open = true
Page = 1
Index = 1
SubIndex = 0

-- Item/Character editing utility functions
function EditItem(id, item)
	memory.writebyte(Address.Items + id, item)
end

function EditEquipment(id, item)
	memory.writebyte(Address.Equipment + id, item)
end

function EditSpecialItem(id, item)
	memory.writebyte(Address.SpecialItems + id, item)
end

function EditChar(slot, offset, value)
	if offset == 0x1 or offset == 0x3 or offset == 0xA then -- HP, Max HP and Experience are 2 bytes
		memory.writeword(Address.Characters + (slot * 0x14) + offset, memory.readword(Address.Characters + (slot * 0x14) + offset) + value)
	else
		memory.writebyte(Address.Characters + (slot * 0x14) + offset, memory.readbyte(Address.Characters + (slot * 0x14) + offset) + value)
	end
end

-- Menu utility functions
function GetOnOff(value)
	if value == 1 then return "On" 	end
	if value == 0 then return "Off" end
end

-- Drawing utility functions
function DrawBar(x, y, width, height, color)
	-- Prevent bar overflow
	if width > 100 then width = 100 end
	
	for y2 = 1, height do
		for x2 = 1, width do
			gui.pixel(x + x2, y + y2, color)
		end
	end
end

-- Menus
Menu =
{
	-- Main Menu
	[1] =
	{
		-- Box
		Width = 120,
		Height = 70,
		
		-- Menu
		{ Text = "Inventory", X = 32, Y = 16 },
		{ Text = "Character", X = 32, Y = 24 },
		{ Text = "World", X = 32, Y = 32 },
		{ Text = "Battle", X = 32, Y = 40 },
		{ Text = "System", X = 32, Y = 48 },
	 -- { Text = "Sidequests", X = 32, Y = 56 },
	 -- { Text = "Story Events/Flags", X = 32, Y = 64 },
	 -- { Text = "World Map Locations", X = 32, Y = 72 },
	 -- { Text = "Battle Script Vars", X = 32, Y = 80 },
	 -- ...
	};

	-- Items Menu
	[2] =
	{
		-- Box
		Width = 200,
		Height = 223,
		
		-- Items
		{ X = 32, Y = 32 },
		{ X = 32, Y = 38 },
		{ X = 32, Y = 44 },
		{ X = 32, Y = 50 },
		{ X = 32, Y = 56 },
		{ X = 32, Y = 62 },
		{ X = 32, Y = 68 },
		{ X = 32, Y = 74 },
		{ X = 32, Y = 80 },
		{ X = 32, Y = 86 },
		{ X = 32, Y = 92 },
		{ X = 32, Y = 98 },
		{ X = 32, Y = 104 },
		{ X = 32, Y = 110 },
		{ X = 32, Y = 116 },
		{ X = 32, Y = 122 },
		{ X = 32, Y = 128 },
		{ X = 32, Y = 134 },
		{ X = 32, Y = 140 },
		{ X = 32, Y = 146 },
		{ X = 32, Y = 152 },
		{ X = 32, Y = 158 },
		{ X = 32, Y = 164 },
		{ X = 32, Y = 170 },
		{ X = 32, Y = 176 },
		{ X = 32, Y = 182 },
		{ X = 32, Y = 188 },
		{ X = 32, Y = 194 },
		{ X = 32, Y = 200 },
		{ X = 32, Y = 206 },
		
		-- Header
		{ Header = true, Text = "Inventory", X = 8, Y = 16 },
		
		-- Input
		Input = function()
			-- Left/Right
			if KeyPressed('left') then
				if SubIndex == 0 then -- Item
					EditItem(Index - 1, memory.readbyte(Address.Items + Index - 1) - 1)
				end
				if SubIndex == 1 then -- Equipment
					EditEquipment(Index - 1, memory.readbyte(Address.Equipment + Index - 1) - 1)
				end
				if SubIndex == 2 then -- Special Items
					EditSpecialItem(Index - 1, memory.readbyte(Address.SpecialItems + Index - 1) - 1)
				end
				if SubIndex == 3 then -- Misc
					if Index == 1 then memory.writebyte(Address.FP, memory.readbyte(Address.FP) - 1) 		 	   end
					if Index == 2 then memory.writebyte(Address.FP + 1, memory.readbyte(Address.FP + 1) - 1) 	   end
					if Index == 3 then memory.writeword(Address.Coins, memory.readword(Address.Coins) - 1) 	 	   end
					if Index == 4 then memory.writebyte(Address.FrogCoins, memory.readbyte(Address.FrogCoins) - 1) end
				end
			end
			if KeyPressed('right') then
				if SubIndex == 0 then -- Item
					EditItem(Index - 1, memory.readbyte(Address.Items + Index - 1) + 1)
				end
				if SubIndex == 1 then -- Equipment
					EditEquipment(Index - 1, memory.readbyte(Address.Equipment + Index - 1) + 1)
				end
				if SubIndex == 2 then -- Special Items
					EditSpecialItem(Index - 1, memory.readbyte(Address.SpecialItems + Index - 1) + 1)
				end
				if SubIndex == 3 then -- Misc
					if Index == 1 then memory.writebyte(Address.FP, memory.readbyte(Address.FP) + 1) 			   end
					if Index == 2 then memory.writebyte(Address.FP + 1, memory.readbyte(Address.FP + 1) + 1) 	   end
					if Index == 3 then memory.writeword(Address.Coins, memory.readword(Address.Coins) + 1) 		   end
					if Index == 4 then memory.writebyte(Address.FrogCoins, memory.readbyte(Address.FrogCoins) + 1) end
				end
			end
			
			-- L/R
			if KeyPressed('L') then
				if SubIndex > 0 then
					SubIndex = SubIndex - 1
				end
			end
			if KeyPressed('R') then
				if SubIndex < 3 then
					SubIndex = SubIndex + 1
				end
			end
		end,
		
		-- Update
		Update = function()
			if SubIndex == 0 then -- Items
				for i = 1, 30 do
					local value = memory.readbyte(Address.Items + (i - 1))
					Menu[2][i].Text = string.format("Item %d: %d (%s)", i, value, ItemNames[value])
				end
			end
			if SubIndex == 1 then -- Equipment
				for i = 1, 30 do
					local value = memory.readbyte(Address.Equipment + (i - 1))
					Menu[2][i].Text = string.format("Equip %d: %d (%s)", i, value, ItemNames[value])
				end
			end
			if SubIndex == 2 then -- Special Items
				for i = 1, 15 do
					local value = memory.readbyte(Address.SpecialItems + (i - 1))
					Menu[2][i].Text = string.format("Special Item %d: %d (%s)", i, value, ItemNames[value])
				end
				-- Hide the rest
				for i = 16, 30 do
					Menu[2][i].Text = ""
				end
			end
			if SubIndex == 3 then -- Other
				local fp = memory.readbyte(Address.FP)
				local fpmax = memory.readbyte(Address.FP + 0x1)
				local coins = memory.readword(Address.Coins)
				local frogcoins = memory.readbyte(Address.FrogCoins)
				Menu[2][1].Text = "Flower Points: " .. fp .. "/" .. fpmax
				Menu[2][2].Text = "Max Flower Points: " .. fpmax
				Menu[2][3].Text = "Coins: " .. coins
				Menu[2][4].Text = "Frog Coins: " .. frogcoins
				-- Hide the rest
				for i = 5, 30 do
					Menu[2][i].Text = nil
				end
			end
			
			-- Header
			if SubIndex == 0 then Menu[2][31].Text = "Inventory - Items (1/4)"         end
			if SubIndex == 1 then Menu[2][31].Text = "Inventory - Equipment (2/4)"     end
			if SubIndex == 2 then Menu[2][31].Text = "Inventory - Special Items (3/4)" end
			if SubIndex == 3 then Menu[2][31].Text = "Inventory - Misc (4/4)" 		   end
			
			-- Prevent index overflow on specific sub-pages
			if SubIndex == 2 and Index > 15 then Index = 15 end
			if SubIndex == 3 and Index > 4  then Index = 4  end
		end
	},

	-- Character Menu
	[3] =
	{
		-- Box
		Width = 230,
		Height = 170,

		-- Stats
		{ X = 32, Y = 32 }, 	-- Level
		{ X = 32, Y = 48 }, 	-- Current HP
		{ X = 32, Y = 56 },		-- Max HP
		{ X = 32, Y = 72 },		-- Speed
		{ X = 32, Y = 80 }, 	-- Attack
		{ X = 32, Y = 88 }, 	-- Defense
		{ X = 32, Y = 96 },		-- Magic Attack
		{ X = 32, Y = 104 },	-- Magic Defense
		{ X = 32, Y = 120 },	-- Experience
		{ X = 32, Y = 136 }, 	-- Weapon
		{ X = 32, Y = 144 }, 	-- Armor
		{ X = 32, Y = 152 },	-- Accessory

		-- Header
		{ Header = true, Text = "Character", X = 8, Y = 16 },
		
		-- Input
		Input = function()
			-- Left/Right
			if KeyPressed('left') then
				if Index == 1  then EditChar(SubIndex, 0x0, -1) end
				if Index == 2  then EditChar(SubIndex, 0x1, -1) end
				if Index == 3  then EditChar(SubIndex, 0x3, -1) end
				if Index == 4  then EditChar(SubIndex, 0x5, -1) end
				if Index == 5  then EditChar(SubIndex, 0x6, -1) end
				if Index == 6  then EditChar(SubIndex, 0x7, -1) end
				if Index == 7  then EditChar(SubIndex, 0x8, -1) end
				if Index == 8  then EditChar(SubIndex, 0x9, -1) end
				if Index == 9  then EditChar(SubIndex, 0xA, -1) end
				if Index == 10 then EditChar(SubIndex, 0xB, -1) end
				if Index == 11 then EditChar(SubIndex, 0xC, -1) end
				if Index == 12 then EditChar(SubIndex, 0xD, -1) end
			end
			if KeyPressed('right') then
				if Index == 1  then EditChar(SubIndex, 0x0, 1) end
				if Index == 2  then EditChar(SubIndex, 0x1, 1) end
				if Index == 3  then EditChar(SubIndex, 0x3, 1) end
				if Index == 4  then EditChar(SubIndex, 0x5, 1) end
				if Index == 5  then EditChar(SubIndex, 0x6, 1) end
				if Index == 6  then EditChar(SubIndex, 0x7, 1) end
				if Index == 7  then EditChar(SubIndex, 0x8, 1) end
				if Index == 8  then EditChar(SubIndex, 0x9, 1) end
				if Index == 9  then EditChar(SubIndex, 0xA, 1) end
				if Index == 10 then EditChar(SubIndex, 0xB, 1) end
				if Index == 11 then EditChar(SubIndex, 0xC, 1) end
				if Index == 12 then EditChar(SubIndex, 0xD, 1) end
			end

			-- L/R
			if KeyPressed('L') then
				if SubIndex > 0 then
					SubIndex = SubIndex - 1
				end
			end
			if KeyPressed('R') then
				if SubIndex < 4 then
					SubIndex = SubIndex + 1
				end
			end
		end,

		-- Update
		Update = function()
			local level = memory.readbyte(Address.Characters + (SubIndex * 0x14) + 0x0)
			local hp = memory.readword(Address.Characters + (SubIndex * 0x14) + 0x1)
			local hpmax = memory.readword(Address.Characters + (SubIndex * 0x14) + 0x3)
			local speed = memory.readbyte(Address.Characters + (SubIndex * 0x14) + 0x5)
			local attack = memory.readbyte(Address.Characters + (SubIndex * 0x14) + 0x6)
			local defense = memory.readbyte(Address.Characters + (SubIndex * 0x14) + 0x7)
			local magicattack = memory.readbyte(Address.Characters + (SubIndex * 0x14) + 0x8)
			local magicdefense = memory.readbyte(Address.Characters + (SubIndex * 0x14) + 0x9)
			local experience = memory.readword(Address.Characters + (SubIndex * 0x14) + 0xA)
			local weapon = memory.readbyte(Address.Characters + (SubIndex * 0x14) + 0xC)
			local armor = memory.readbyte(Address.Characters + (SubIndex * 0x14) + 0xD)
			local accessory = memory.readbyte(Address.Characters + (SubIndex * 0x14) + 0xE)
			
			Menu[3][1].Text = "Level: " .. level
			Menu[3][2].Text = "HP: " .. hp .. "/" .. hpmax
			Menu[3][3].Text = "Max HP: " .. hpmax
			Menu[3][4].Text = "Speed: " .. speed
			Menu[3][5].Text = "Attack: " .. attack
			Menu[3][6].Text = "Defense: " .. defense
			Menu[3][7].Text = "Magic Attack: " .. magicattack
			Menu[3][8].Text = "Magic Defense: " .. magicdefense
			Menu[3][9].Text = "Experience: " .. experience
			Menu[3][10].Text = "Weapon: " .. weapon .. " (" .. ItemNames[weapon] .. ")"
			Menu[3][11].Text = "Armor: " .. armor .. " (" .. ItemNames[armor] .. ")"
			Menu[3][12].Text = "Accessory: " .. accessory .. " (" .. ItemNames[accessory] .. ")"
			
			-- Header
			if SubIndex == 0 then Menu[3][13].Text = "Character - Mario (1/5)"  end
			if SubIndex == 1 then Menu[3][13].Text = "Character - Peach (2/5)"  end
			if SubIndex == 2 then Menu[3][13].Text = "Character - Bowser (3/5)" end
			if SubIndex == 3 then Menu[3][13].Text = "Character - Geno (4/5)"   end
			if SubIndex == 4 then Menu[3][13].Text = "Character - Mallow (5/5)" end
			
			-- Bars
			local healthpct = (memory.readword(Address.Characters + (SubIndex * 0x14) + 0x1) / memory.readword(Address.Characters + (SubIndex * 0x14) + 0x3)) * 100
			local speedpct = (memory.readbyte(Address.Characters + (SubIndex * 0x14) + 0x5) / 255) * 100
			local attackpct = (memory.readbyte(Address.Characters + (SubIndex * 0x14) + 0x6) / 255) * 100
			local defensepct = (memory.readbyte(Address.Characters + (SubIndex * 0x14) + 0x7) / 255) * 100
			local magicattackpct = (memory.readbyte(Address.Characters + (SubIndex * 0x14) + 0x8) / 255) * 100
			local magicdefensepct = (memory.readbyte(Address.Characters + (SubIndex * 0x14) + 0x9) / 255) * 100
			local experiencepct = (memory.readword(Address.Characters + (SubIndex * 0x14) + 0xA) / 9999) * 100
			DrawBar(112, 48, healthpct, 5, "green")
			DrawBar(112, 72, speedpct, 5, "yellow")
			DrawBar(112, 80, attackpct, 5, "red")
			DrawBar(112, 88, defensepct, 5, "blue")
			DrawBar(112, 96, magicattackpct, 5, "purple")
			DrawBar(112, 104, magicdefensepct, 5, "cyan")
			DrawBar(112, 120, experiencepct, 5, "white")
		end,
	};
	
	-- World Menu
	[4] =
	{
		-- Box
		Width = 250,
		Height = 140,

		-- Coordinates
		{ X = 32, Y = 24 },
		{ X = 32, Y = 32 },
		{ X = 32, Y = 40 },

		-- Player Modifiers
		{ X = 32, Y = 72 },

		-- World Vars
		{ X = 128, Y = 24 },
		{ Skip = true, X = 128, Y = 32 },
		{ Skip = true, X = 128, Y = 40 },

		-- Header
		{ Header = true, Text = "World Coordinates", X = 8, Y = 16 },
		{ Header = true, Text = "Player Modifiers", X = 8, Y = 64 },
		{ Header = true, Text = "World Vars", X = 128, Y = 16 },
		
		-- Input
		Input = function()
			-- Left/Right
			if KeyPressed('left') then
				if Index == 1 then memory.writeword(Address.X, memory.readword(Address.X) - 8) 							   end
				if Index == 2 then memory.writeword(Address.Y, memory.readword(Address.Y) - 8) 							   end
				if Index == 3 then memory.writeword(Address.Z, memory.readword(Address.Z) - 8) 							   end
				if Index == 4 then memory.writeword(Address.Invincible, 0) 					   							   end
				if Index == 5 then memory.writeword(Address.CurrentLocation, memory.readbyte(Address.CurrentLocation) - 1) end
			end
			if KeyPressed('right') then
				if Index == 1 then memory.writeword(Address.X, memory.readword(Address.X) + 8) 							   end
				if Index == 2 then memory.writeword(Address.Y, memory.readword(Address.Y) + 8) 							   end
				if Index == 3 then memory.writeword(Address.Z, memory.readword(Address.Z) + 8) 							   end
				if Index == 4 then memory.writeword(Address.Invincible, 1) 												   end
				if Index == 5 then memory.writeword(Address.CurrentLocation, memory.readbyte(Address.CurrentLocation) + 1) end
			end
		end,
		
		-- Update
		Update = function()
			local x = memory.readword(Address.X)
			local y = memory.readword(Address.Y)
			local z = memory.readword(Address.Z)
			local map = memory.readbyte(Address.CurrentLocation)
			local music = memory.readbyte(Address.Music)
			local soundeffect = memory.readbyte(Address.SoundEffect)
			local invincible = memory.readbyte(Address.Invincible)
			
			Menu[4][1].Text = "X: " .. x
			Menu[4][2].Text = "Y: " .. y
			Menu[4][3].Text = "Z: " .. z
			Menu[4][4].Text = "Invincible: " .. GetOnOff(invincible)
			Menu[4][5].Text = "Map Location: " .. map
			Menu[4][6].Text = "Music: " .. music
			Menu[4][7].Text = "Sound Effect: " .. soundeffect
		end
	},
	
	--  Battle Menu
	[5] =
	{
		-- Box
		Width = 250,
		Height = 160,
		
		-- Battle Vars
		{ X = 32, Y = 24 },
		{ X = 32, Y = 32 },
		{ X = 32, Y = 40 },
		{ X = 32, Y = 48 },

		-- Enemy
		{ X = 136, Y = 24 },
		{ X = 136, Y = 40 },
		{ X = 136, Y = 48 },
		{ X = 136, Y = 64 },
		{ X = 136, Y = 72 },
		{ X = 136, Y = 80 },
		{ X = 136, Y = 88 },
		{ X = 136, Y = 96 },
		{ X = 136, Y = 112 },
		{ X = 136, Y = 120 },
		{ X = 136, Y = 136 },
		{ X = 136, Y = 144 },
		
		-- Item Counters
		{ Skip = true, X = 32, Y = 72 },
		{ Skip = true, X = 32, Y = 80 },
		{ Skip = true, X = 32, Y = 88 },
		{ Skip = true, X = 32, Y = 96 },
		
		-- Headers
		{ Header = true, Text = "Battle Vars", X = 8, Y = 16 },
		{ Header = true, Text = "Enemy", X = 128, Y = 16 },
		{ Header = true, Text = "Item Counters", X = 8, Y = 64 },
		
		-- Input
		Input = function()
			-- Left/Right
			if KeyPressed('left') then
				if Index == 1  then memory.writebyte(Address.Spell, memory.readbyte(Address.Spell) - 1) 														end
				if Index == 2  then memory.writebyte(Address.TotalXP, memory.readbyte(Address.TotalXP) - 1) 													end
				if Index == 3  then memory.writebyte(Address.TotalCoins, memory.readbyte(Address.TotalCoins) - 1)												end
				if Index == 4  then memory.writebyte(Address.BattleEvent, memory.readbyte(Address.BattleEvent) - 1)												end
				if Index == 5  then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x1, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1) - 1)	end
				if Index == 6  then memory.writeword(Address.Enemies + (SubIndex * 128) + 0x11, memory.readword(Address.Enemies + (SubIndex * 128) + 0x11) - 1) end
				if Index == 7  then memory.writeword(Address.Enemies + (SubIndex * 128) + 0x13, memory.readword(Address.Enemies + (SubIndex * 128) + 0x13) - 1) end
				if Index == 8  then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x15, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x15) - 1) end
				if Index == 9  then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x16, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x16) - 1) end
				if Index == 10 then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x17, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x17) - 1) end
				if Index == 11 then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x18, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x18) - 1) end
				if Index == 12 then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x19, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x19) - 1) end
				if Index == 13 then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x1A, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1A) - 1) end
				if Index == 14 then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x1B, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1B) - 1) end
				if Index == 15 then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x1C, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1C) - 1) end
				if Index == 16 then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x1D, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1D) - 1) end
			end
			if KeyPressed('right') then
				if Index == 1  then memory.writebyte(Address.Spell, memory.readbyte(Address.Spell) + 1) 														end
				if Index == 2  then memory.writebyte(Address.TotalXP, memory.readbyte(Address.TotalXP) + 1) 													end
				if Index == 3  then memory.writebyte(Address.TotalCoins, memory.readbyte(Address.TotalCoins) + 1) 												end
				if Index == 4  then memory.writebyte(Address.BattleEvent, memory.readbyte(Address.BattleEvent) + 1) 											end
				if Index == 5  then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x1, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1) + 1) 	end
				if Index == 6  then memory.writeword(Address.Enemies + (SubIndex * 128) + 0x11, memory.readword(Address.Enemies + (SubIndex * 128) + 0x11) + 1) end
				if Index == 7  then memory.writeword(Address.Enemies + (SubIndex * 128) + 0x13, memory.readword(Address.Enemies + (SubIndex * 128) + 0x13) + 1) end
				if Index == 8  then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x15, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x15) + 1) end
				if Index == 9  then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x16, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x16) + 1) end
				if Index == 10 then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x17, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x17) + 1) end
				if Index == 11 then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x18, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x18) + 1) end
				if Index == 12 then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x19, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x19) + 1) end
				if Index == 13 then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x1A, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1A) + 1) end
				if Index == 14 then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x1B, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1B) + 1) end
				if Index == 15 then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x1C, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1C) + 1) end
				if Index == 16 then memory.writebyte(Address.Enemies + (SubIndex * 128) + 0x1D, memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1D) + 1) end
			end

			-- L/R
			if KeyPressed('L') then
				if SubIndex > 0 then
					SubIndex = SubIndex - 1
				end
			end
			if KeyPressed('R') then
				if SubIndex < 7 then
					SubIndex = SubIndex + 1
				end
			end
		end,
		
		-- Update
		Update = function()
			local spell = memory.readbyte(Address.Spell)
			local xp = memory.readbyte(Address.TotalXP)
			local coins = memory.readbyte(Address.TotalCoins)
			local event = memory.readbyte(Address.BattleEvent)
			local monster = memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1)
			local hp = memory.readword(Address.Enemies + (SubIndex * 128) + 0x11)
			local hpmax = memory.readword(Address.Enemies + (SubIndex * 128) + 0x13)
			local speed = memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x15)
			local attack = memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x16)
			local defense = memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x17)
			local magicattack = memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x18)
			local magicdefense = memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x19)
			local evade = memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1A)
			local magicevade = memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1B)
			local fp = memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1C)
			local flags = memory.readbyte(Address.Enemies + (SubIndex * 128) + 0x1D)
			local superjumps = memory.readbyte(Address.JumpCounter)
			local mysteryegg = memory.readbyte(Address.MysteryEggCounter)
			local lambslure = memory.readbyte(Address.LambsLureCounter)
			local luckyjewel = memory.readbyte(Address.LuckyJewelCounter)
			
			-- Battle Vars
			Menu[5][1].Text = "Special: " .. spell
			Menu[5][2].Text = "Total XP: " .. xp
			Menu[5][3].Text = "Total Coins: " .. coins
			Menu[5][4].Text = "Battle Event: " .. event

			-- Enemy
			Menu[5][5].Text = "Monster: " .. monster .. " (" .. EnemyNames[monster] .. ")"
			Menu[5][6].Text = "HP: " .. hp .. "/" .. hpmax
			Menu[5][7].Text = "Max HP: " .. hpmax
			Menu[5][8].Text = "Speed: " .. speed
			Menu[5][9].Text = "Attack: " .. attack
			Menu[5][10].Text = "Defense: " .. defense
			Menu[5][11].Text = "Magic Attack: " .. magicattack
			Menu[5][12].Text = "Magic Defense: " .. magicdefense
			Menu[5][13].Text = "Evade Chance: " .. evade .. "%"
			Menu[5][14].Text = "Magic Evade Chance: " .. magicevade .. "%"
			Menu[5][15].Text = "FP: " .. fp
			Menu[5][16].Text = "Flags: " .. flags
			Menu[5][22].Text = "Enemy " .. SubIndex + 1 .. "/" .. 8
			
			-- Item Counters
			Menu[5][17].Text = "Super Jump: " .. superjumps
			Menu[5][18].Text = "Mystery Egg: " .. mysteryegg
			Menu[5][19].Text = "Lamb's Lure: " .. lambslure
			Menu[5][20].Text = "Lucky Jewel: " .. luckyjewel
		end
	};
	
	-- System Menu
	[6] =
	{
		-- Box
		Width = 250,
		Height = 125,
		
		-- CPU Registers
		{ X = 32, Y = 32 },
		{ X = 32, Y = 40 },
		{ X = 32, Y = 48 },
		{ X = 32, Y = 56 },
		{ X = 32, Y = 64 },
		{ X = 32, Y = 72 },
		{ X = 32, Y = 80 },
		{ X = 32, Y = 88 },
		{ X = 32, Y = 96 },
		{ X = 32, Y = 104 },
		{ X = 32, Y = 112 },
		
		-- SA-1 Registers
		{ X = 152, Y = 32 },
		{ X = 152, Y = 40 },
		{ X = 152, Y = 48 },
		{ X = 152, Y = 56 },
		{ X = 152, Y = 64 },
		{ X = 152, Y = 72 },
		{ X = 152, Y = 80 },
		{ X = 152, Y = 88 },
		{ X = 152, Y = 96 },
		{ X = 152, Y = 104 },
		{ X = 152, Y = 112 },
		
		-- Headers
		{ Header = true, Text = "Registers", X = 8, Y = 16 },
		{ Header = true, Text = "CPU", X = 8, Y = 24 },
		{ Header = true, Text = "SA-1", X = 128, Y = 24 },
		
		-- Update
		Update = function()
			-- CPU Registers
			local cpu_db = memory.getregister("db")
			local cpu_p = memory.getregister("p")
			local cpu_e = memory.getregister("e")
			local cpu_a = memory.getregister("a")
			local cpu_d = memory.getregister("d")
			local cpu_s = memory.getregister("s")
			local cpu_x = memory.getregister("x")
			local cpu_y = memory.getregister("y")
			local cpu_pb = memory.getregister("pb")
			local cpu_pc = memory.getregister("pc")
			local cpu_pbpc = memory.getregister("pbpc")
			Menu[6][1].Text = "db\t" .. cpu_db
			Menu[6][2].Text = "p\t" .. cpu_p
			Menu[6][3].Text = "e\t" .. cpu_e
			Menu[6][4].Text = "a\t" .. cpu_a
			Menu[6][5].Text = "d\t" .. cpu_d
			Menu[6][6].Text = "s\t" .. cpu_s
			Menu[6][7].Text = "x\t" .. cpu_x
			Menu[6][8].Text = "y\t" .. cpu_y
			Menu[6][9].Text = "pb\t" .. cpu_pb
			Menu[6][10].Text = "pc\t" .. cpu_pc
			Menu[6][11].Text = "pbpc\t" .. cpu_pbpc
			
			-- SA-1 Registers
			local sa1_db = memory.getregister("sa1.db")
			local sa1_p = memory.getregister("sa1.p")
			local sa1_e = memory.getregister("sa1.e")
			local sa1_a = memory.getregister("sa1.a")
			local sa1_d = memory.getregister("sa1.d")
			local sa1_s = memory.getregister("sa1.s")
			local sa1_x = memory.getregister("sa1.x")
			local sa1_y = memory.getregister("sa1.y")
			local sa1_pb = memory.getregister("sa1.pb")
			local sa1_pc = memory.getregister("sa1.pc")
			local sa1_pbpc = memory.getregister("sa1.pbpc")
			Menu[6][12].Text = "db\t" .. sa1_db
			Menu[6][13].Text = "p\t" .. sa1_p
			Menu[6][14].Text = "e\t" .. sa1_e
			Menu[6][15].Text = "a\t" .. sa1_a
			Menu[6][16].Text = "d\t" .. sa1_d
			Menu[6][17].Text = "s\t" .. sa1_s
			Menu[6][18].Text = "x\t" .. sa1_x
			Menu[6][19].Text = "y\t" .. sa1_y
			Menu[6][20].Text = "pb\t" .. sa1_pb
			Menu[6][21].Text = "pc\t" .. sa1_pc
			Menu[6][22].Text = "dbpc\t" .. sa1_pbpc
		end
	};
};

-- Data Tables
function LoadDataTable(filename)
	local data = {}

	for line in io.lines(filename) do
		local id = tonumber(string.sub(line, 1, line:find("=") - 1))
		data[id] = string.sub(line, line:find("=") + 2)
	end
	
	-- Blank out non-existant ID's
	for i = 1, 255 do
		if data[i] == nil then
			data[i] = "???"
		end
	end
	
	return data
end

ItemNames = LoadDataTable("SMRPGItems.dat")
EnemyNames = LoadDataTable("SMRPGEnemies.dat")
-- TODO: Spell names?

-- Input
Input = {}
OldInput = {}
InputTimer = 0
RepeatDelay = 60

function PreInput()
	Input = joypad.get(2)
end

function PostInput()
	OldInput = Input
end

function KeyPressed(key)
	if not Open and Key == 'X' then return end
	
	-- Handle key repeat delay
	if Input[key] then
		InputTimer = InputTimer + 1
	elseif not Input[key] and OldInput[key] then
		InputTimer = 0
	end
	
	if InputTimer >= RepeatDelay then
		return Input[key]
	else
		return Input[key] and not OldInput[key]
	end
end

function CheckInput()
	-- Up - Cursor Up
	if KeyPressed('up') and Index > 1 then
		Index = Index - 1
	end
	
	-- Down - Cursor Down
	if KeyPressed('down') and Index < #Menu[Page] then
		Index = Index + 1
	end
	
	-- X - Toggle Menu
	if KeyPressed('X') then
		if Open then
			Open = false
		else
			Open = true
		end
	end
	
	-- B - Back
	if KeyPressed('B') then
		Page = 1
		Index = 1
		SubIndex = 0
	end
	
	-- A - Select/Action
	if KeyPressed('A') then
		if Page == 1 then -- Main Menu
			Page = Index + 1
			Index = 1
			SubIndex = 0
		end
	end
	
	-- Iterate through menu Input() functions
	for key, value in pairs(Menu[Page]) do
		if key == "Input" then
			if type(value) == "function" then
				Menu[Page]:Input()
			end
		end
	end

	-- Cursor Handling for Headers and Skipped elements
	if Menu[Page][Index] ~= nil then
		for key, value in pairs(Menu[Page][Index]) do
			if key == "Header" or key == "Skip" then
				if (value) then
					Index = Index - 1
				end
			end
		end
	end
end

function Draw()
	if not Open then return end
	
	-- Box
	gui.box(0, 0, Menu[Page].Width, Menu[Page].Height, 0x4F00004F, 0x7F0000AF)

	-- Menu Items
	for item = 1, #Menu[Page] do
		-- Cursor
		if item == Index then
			gui.text(Menu[Page][item].X - 24, Menu[Page][item].Y, "--->")
		end
		
		-- Text
		if Menu[Page][item].Text ~= nil then
			gui.text(Menu[Page][item].X, Menu[Page][item].Y, Menu[Page][item].Text)
		end
	end
end
gui.register(Draw)

-- Update
function Update()
	if not Open then return end
	
	-- Iterate through menu Update() functions
	for key, value in pairs(Menu[Page]) do
		if key == "Update" then
			if type(value) == "function" then
				Menu[Page]:Update()
			end
		end
	end
end

-- Init messages
InitMessage = "SMRPG Lua System Activated!"
snes9x.message(InitMessage)
print(InitMessage)

-- Main Loop
while true do
	-- Update menu and vars
	Update()

	-- Pre Input
	PreInput()

	-- Check Input
	CheckInput()
	
	-- Advance a frame
	emu.frameadvance()
	
	-- Post Input
	PostInput()
end
