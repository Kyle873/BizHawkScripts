dofile("KLib/KLib.lua")

Address =
{
    HP = 0x1327A,
    MaxHP = 0x1327E,
    MP = 0x1327C,
    MaxMP = 0x13280,
    STR = 0x13282,
    CON = 0x13284,
    INT = 0x13286,
    LCK = 0x13288,
    EXP = 0x1328C,
    Abilities = 0x13392,
    RushGuardFlags = 0x13261,
    
    Items = 0x13294,
    Souls = 0x1331C,
    
    Gold = 0x13290,
    Time = 0x000AC
}

Items =
{
    "Potion",
    "High Potion",
    "Super Potion",
    "Meat Strip",
    "Tasty Meat",
    "Mind Up",
    "High Mind Up",
    "Mana Prism",
    "Anti-Venom",
    "Uncurse Potion",
    "Potato Pancake",
    "Beef Curry",
    "Ramen",
    "Cream Soda",
    "Cream Puff",
    "Milk",
    "Coffee",
    "Tea",
    "Pudding",
    "Strawberry",
    "Melon",
    "Grapes",
    "Persimmon",
    "Rotten Meat",
    "Spoiled Milk",
    "Skull Key",
    "Ancient Book",
    "Ancient Book 2",
    "Ancient Book 3",
    "Castle Map 1",
    "Castle Map 2",
    "Castle Map 3"
}

Equipment =
{
    Weapons =
    {
        "Knife",
        "Baselard",
        "Combat Knife",
        "Short Sword",
        "Bastard Sword",
        "Whip Sword",
        "Gladius",
        "Gram",
        "Milican's Sword",
        "Hrunting",
        "Mystletain",
        "Rahab's Sword",
        "Durandal",
        "Laevatain",
        "Burtgang",
        "Kaladbolg",
        "Vjaya",
        "Balmung",
        "Broadsword",
        "Scimitar",
        "Claymore",
        "Great Sword",
        "Joyeuse",
        "Dainslef",
        "Ascalon",
        "Claimh Solais",
        "Final Sword",
        "Bamboo Sword",
        "Katana",
        "Osafune",
        "Onikiri",
        "Kunitsua",
        "Yasutsuna",
        "Muramasa",
        "Hammer",
        "Warhammer",
        "Excalibur",
        "Tallhammer",
        "Battle Axe",
        "Death's Sickle",
        "Rapier",
        "Estoc",
        "Cutall",
        "Spear",
        "Trident",
        "Lance",
        "Partizan",
        "Gabolg",
        "Gungner",
        "Ronginus' Spear",
        "Cestus",
        "Kaiser Knuckle",
        "Mach Punch",
        "Whip Knuckle",
        "Poison Fist",
        "Handgun",
        "Silver Gun",
        "Positron Rifle",
        "Valmanway"
    },
    
    Armor =
    {
        "Casual Clothes",
        "Cloth Tunic",
        "Gym Clothes",
        "War Fatigues",
        "Ninja Suit",
        "Soldier Uniform",
        "Pitch Black Suit",
        "Olrox's Suit",
        "Dracula's Tunic",
        "Leather Plate",
        "Copper Plate",
        "Iron Plate",
        "Steel Plate",
        "Silver Plate",
        "Gold Plate",
        "Eversing",
        "Samurai Armor",
        "Silk Robe",
        "Elfin Robe",
        "Death's Robe",
        "Demon's Mail",
        "Armor of Fire",
        "Armor of Water",
        "Blocking Mail",
        "Army Jacket"
    },
    
    Accessories =
    {
        "Cape",
        "Crimson Cloak",
        "Black Cloak",
        "Pendant",
        "Heart Pendant",
        "Scarf",
        "Red Scarf",
        "Ancient Belt",
        "Black Belt",
        "Skull Necklace",
        "Flame Necklace",
        "Satan's Ring",
        "Tear Of Blood",
        "Lucky Charm",
        "Rare Ring",
        "Soul Eater Ring",
        "Rune Ring",
        "Sherman Ring",
        "Gold Ring",
        "Chaos Ring"
    }
}

-- TODO: This has some weird-ass bitfield/modulo magic going on. Figure it out.
Souls =
{
}

Abilities =
{
    "Grave Keeper",
    "Unknown",
    "Unknown",
    "Unknown",
    "Skeleton Blaze",
    "Unknown",
    "Unknown",
    "Unknown",
    "Malphas",
    "Unknown",
    "Unknown",
    "Unknown",
    "Kicker Skeleton",
    "Unknown",
    "Unknown",
    "Unknown",
    "Hippogryph",
    "Unknown",
    "Unknown",
    "Unknown",
    "Galamoth",
    "Unknown",
    "Unknown",
    "Unknown"
}

RushGuardFlags =
{
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown"
}

ItemOffset = 0

memory.usememorydomain("Combined WRAM")

function CreateMenu()
    KLib.Menu.Color(KLib.Color.White, KLib.Color.Make(0, 0, 0, 192), KLib.Color.White)
    
    KLib.Menu.Page("Castlevania Dawn of Sorrow\r")
    
    KLib.Menu.SubPage("Stats", CreateStatsPage)
    
    KLib.Menu.Separator()
    KLib.Menu.SubPage("Items", CreateItemPage, nil, Items)
    KLib.Menu.SubPage("Weapons", CreateItemPage, nil, Equipment.Weapons)
    KLib.Menu.SubPage("Armor", CreateItemPage, nil, Equipment.Armor)
    KLib.Menu.SubPage("Accessories", CreateItemPage, nil, Equipment.Accessories)
    -- KLib.Menu.SubPage("Souls", CreateSoulsPage)
    
    KLib.Menu.Separator()
    KLib.Menu.Field("Gold", Address.Gold, "s16_le", 0, 999999)
    KLib.Menu.Field("Time", Address.Time, "s32_le")
end

function CreateStatsPage()
    KLib.Menu.Field("HP", Address.HP, "s16_le", 0, 9999)
    KLib.Menu.Field("Max HP", Address.MaxHP, "s16_le", 0, 9999)
    KLib.Menu.Field("MP", Address.MP, "s16_le", 0, 9999)
    KLib.Menu.Field("Max MP", Address.MaxMP, "s16_le", 0, 9999)
    
    KLib.Menu.Separator()
    KLib.Menu.Field("STR", Address.STR, "s16_le", 0, 9999)
    KLib.Menu.Field("CON", Address.CON, "s16_le", 0, 9999)
    KLib.Menu.Field("INT", Address.INT, "s16_le", 0, 9999)
    KLib.Menu.Field("LCK", Address.LCK, "s16_le", 0, 9999)
    
    KLib.Menu.Separator()
    KLib.Menu.Field("EXP", Address.EXP, "s32_le", 0, 99999999)
    
    KLib.Menu.Separator()
    KLib.Menu.Bitfield("Abilities", Address.Abilities, "s32_le", Abilities)
    KLib.Menu.Bitfield("Rush/Guard Flags", Address.RushGuardFlags, "s16_le", RushGuardFlags)
end

function CreateItemPage(types)
    for i = 1, #types do
        KLib.Menu.Field(types[i], Address.Items + ItemOffset + (i - 1), "byte", 0, 99)
    end
    
    ItemOffset = ItemOffset + #types
end

function CreateSoulsPage()
end

CreateMenu()

while true do
    KLib.Update()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
