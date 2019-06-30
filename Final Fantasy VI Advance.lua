dofile("KLib/KLib.lua")

Address =
{
    Gil = 0x001860,
    Steps = 0x001866,
    Time = 0x00021B,
    
    MenuIndex = 0x020C34,
    
    Character =
    {
        Base = 0x001600,
        Size = 0x25,
        Max = 16,
        
        Offset =
        {
            ID = 0x00,
            Sprite = 0x01,
            Name = 0x02,
            Level = 0x08,
            CurrentHP = 0x09,
            MaxHP = 0x0B,
            CurrentMP = 0x0D,
            MaxMP = 0x0F,
            Experience = 0x11,
            Status = 0x14,
            Commands = 0x16,
            Strength = 0x1A,
            Speed = 0x1B,
            Stamina = 0x1C,
            Magic = 0x1D,
            Esper = 0x1E,
            RightHand = 0x1F,
            LeftHand = 0x20,
            Head = 0x21,
            Body = 0x22,
            Relic1 = 0x23,
            Relic2 = 0x24
        }
    },
    
    PartyBlock = 0x001850,
    
    Items =
    {
        Base = 0x039010,
        Quantity = 0x039130,
        Key = 0x001EBA,
        Magicite = 0x039000
    },
}

Characters =
{
    [0x00] = "Terra",
    [0x01] = "Locke",
    [0x02] = "Cyan",
    [0x03] = "Shadow",
    [0x04] = "Edgar",
    [0x05] = "Sabin",
    [0x06] = "Celes",
    [0x07] = "Strago",
    [0x08] = "Relm",
    [0x09] = "Setzer",
    [0x0A] = "Mog",
    [0x0B] = "Gau",
    [0x0C] = "Gogo",
    [0x0D] = "Umaro",
    [0x0E] = "Guest 1",
    [0x0F] = "Guest 2"
}

Items =
{
    [0x00] = "Dagger",
    [0x01] = "Mythril Knife",
    [0x02] = "Main Gauche",
    [0x03] = "Air Knife",
    [0x04] = "Thief's Knife",
    [0x05] = "Assassin's Dagger",
    [0x06] = "Man-Eater",
    [0x07] = "Swordbreaker",
    [0x08] = "Gladius",
    [0x09] = "Valiant Knife",
    [0x0A] = "Mythril Sword",
    [0x0B] = "Great Sword",
    [0x0C] = "Rune Blade",
    [0x0D] = "Flametongue",
    [0x0E] = "Icebrand",
    [0x0F] = "Thunder Blade",
    [0x10] = "Bastard Sword",
    [0x11] = "Stoneblade",
    [0x12] = "Blood Sword",
    [0x13] = "Enhancer",
    [0x14] = "Crystal Sword",
    [0x15] = "Falchion",
    [0x16] = "Soul Sabre",
    [0x17] = "Organyx",
    [0x18] = "Excalibur",
    [0x19] = "Zantetsuken",
    [0x1A] = "Lightbringer",
    [0x1B] = "Ragnarok",
    [0x1C] = "Ultima Weapon",
    [0x1D] = "Mythril Spear",
    [0x1E] = "Trident",
    [0x1F] = "Heavy Lance",
    [0x20] = "Partisan",
    [0x21] = "Holy Lance",
    [0x22] = "Golden Spear",
    [0x23] = "Radiant Lance",
    [0x24] = "Impartisan",
    [0x25] = "Kunai",
    [0x26] = "Kodachi",
    [0x27] = "Sakura",
    [0x28] = "Sasuke",
    [0x29] = "Ichigeki",
    [0x2A] = "Kagenui",
    [0x2B] = "Ashura",
    [0x2C] = "Kotetsu",
    [0x2D] = "Kiku-ichimonji",
    [0x2E] = "Kazekiri",
    [0x2F] = "Murasame",
    [0x30] = "Masamune",
    [0x31] = "Murakumo",
    [0x32] = "Nutsunokami",
    [0x33] = "Healing Rod",
    [0x34] = "Mythril Rod",
    [0x35] = "Flame Rod",
    [0x36] = "Ice Rod",
    [0x37] = "Thunder Rod",
    [0x38] = "Poison Rod",
    [0x39] = "Holy Rod",
    [0x3A] = "Gravity Rod",
    [0x3B] = "Punisher",
    [0x3C] = "Magus Rod",
    [0x3D] = "Chocobo Brush",
    [0x3E] = "Da Vinci Brush",
    [0x3F] = "Magical Brush",
    [0x40] = "Rainbow Brush",
    [0x41] = "Shuriken",
    [0x42] = "Fuma Shuriken",
    [0x43] = "Pinwheel",
    [0x44] = "Chain Flail",
    [0x45] = "Moonring Blade",
    [0x46] = "Morning Star",
    [0x47] = "Boomerang",
    [0x48] = "Rising Sun",
    [0x49] = "Hawkeye",
    [0x4A] = "Bone Club",
    [0x4B] = "Sniper",
    [0x4C] = "Wing Edge",
    [0x4D] = "Cards",
    [0x4E] = "Darts",
    [0x4F] = "Death Tarot",
    [0x50] = "Viper Darts",
    [0x51] = "Dice",
    [0x52] = "Fixed Dice",
    [0x53] = "Metal Knuckles",
    [0x54] = "Mythril Claws",
    [0x55] = "Kaiser Knuckles",
    [0x56] = "Venom Claws",
    [0x57] = "Burning Fist",
    [0x58] = "Dragon Claws",
    [0x59] = "Tigerfang",
    [0x5A] = "Buckler",
    [0x5B] = "Heavy Shield",
    [0x5C] = "Mythril Shield",
    [0x5D] = "Golden Shield",
    [0x5E] = "Aegis Shield",
    [0x5F] = "Diamond Shield",
    [0x60] = "Flame Shield",
    [0x61] = "Ice Shield",
    [0x62] = "Thunder Shield",
    [0x63] = "Crystal Shield",
    [0x64] = "Genji Shield",
    [0x65] = "Tortoise Shield",
    [0x66] = "Cursed Shield",
    [0x67] = "Paladin's Shield",
    [0x68] = "Force Shield",
    [0x69] = "Leather Cap",
    [0x6A] = "Hairband",
    [0x6B] = "Plumed Hat",
    [0x6C] = "Beret",
    [0x6D] = "Magus Hat",
    [0x6E] = "Bandana",
    [0x6F] = "Iron Helm",
    [0x70] = "Hypno Crown",
    [0x71] = "Priest's Miter",
    [0x72] = "Green Beret",
    [0x73] = "Twist Headband",
    [0x74] = "Mythril Helm",
    [0x75] = "Tiara",
    [0x76] = "Golden Helm",
    [0x77] = "Tiger Mask",
    [0x78] = "Red Cap",
    [0x79] = "Mystery Veil",
    [0x7A] = "Circlet",
    [0x7B] = "Royal Crown",
    [0x7C] = "Diamond Helm",
    [0x7D] = "Black Cowl",
    [0x7E] = "Crystal Helm",
    [0x7F] = "Oath Veil",
    [0x80] = "Cat-Ear Hood",
    [0x81] = "Genji Helm",
    [0x82] = "Thornlet",
    [0x83] = "Saucer",
    [0x84] = "Leather Armor",
    [0x85] = "Cotton Robe",
    [0x86] = "Kenpo Gi",
    [0x87] = "Iron Armor",
    [0x88] = "Silk Robe",
    [0x89] = "Mythril Vest",
    [0x8A] = "Ninja Gear",
    [0x8B] = "White Dress",
    [0x8C] = "Mythril Mail",
    [0x8D] = "Gaia Gear",
    [0x8E] = "Mirage Vest",
    [0x8F] = "Golden Armor",
    [0x90] = "Power Sash",
    [0x91] = "Luminous Robe",
    [0x92] = "Diamond Vest",
    [0x93] = "Red Jacket",
    [0x94] = "Force Armor",
    [0x95] = "Diamond Armor",
    [0x96] = "Black Garb",
    [0x97] = "Magus Robe",
    [0x98] = "Crystal Mail",
    [0x99] = "Regal Gown",
    [0x9A] = "Genji Armor",
    [0x9B] = "Reed Cloak",
    [0x9C] = "Minerva Bustier",
    [0x9D] = "Tabby Suit",
    [0x9E] = "Chocobo Suit",
    [0x9F] = "Moogle Suit",
    [0xA0] = "Nutkin Suit",
    [0xA1] = "Behemoth Suit",
    [0xA2] = "Snow Scarf",
    [0xA3] = "Noiseblaster",
    [0xA4] = "Bioblaster",
    [0xA5] = "Flash",
    [0xA6] = "Chainsaw",
    [0xA7] = "Debilitator",
    [0xA8] = "Drill",
    [0xA9] = "Air Anchor",
    [0xAA] = "Auto Crossbow",
    [0xAB] = "Flame Scroll",
    [0xAC] = "Water Scroll",
    [0xAD] = "Lightning Scroll",
    [0xAE] = "Invisibility Scroll",
    [0xAF] = "Shadow Scroll",
    [0xB0] = "Silver Spectacles",
    [0xB1] = "Star Pendant",
    [0xB2] = "Peace Ring",
    [0xB3] = "Amulet",
    [0xB4] = "White Cape",
    [0xB5] = "Jeweled Ring",
    [0xB6] = "Fairy Ring",
    [0xB7] = "Barrier Ring",
    [0xB8] = "Mythril Glove",
    [0xB9] = "Protect Ring",
    [0xBA] = "Hermes Sandals",
    [0xBB] = "Reflect Ring",
    [0xBC] = "Angel Wings",
    [0xBD] = "Angel Ring",
    [0xBE] = "Knight's Code",
    [0xBF] = "Dragoon Boots",
    [0xC0] = "Zephyr Cloak",
    [0xC1] = "Princess Ring",
    [0xC2] = "Cursed Ring",
    [0xC3] = "Earring",
    [0xC4] = "Gigas Glove",
    [0xC5] = "Blizzard Orb",
    [0xC6] = "Berserker Ring",
    [0xC7] = "Thief's Bracer",
    [0xC8] = "Guard Bracelet",
    [0xC9] = "Hero's Ring",
    [0xCA] = "Ribbon",
    [0xCB] = "Muscle Belt",
    [0xCC] = "Crystal Orb",
    [0xCD] = "Gold Hairpin",
    [0xCE] = "Celestriad",
    [0xCF] = "Brigand's Glove",
    [0xD0] = "Gauntlet",
    [0xD1] = "Genji Glove",
    [0xD2] = "Hyper Wrist",
    [0xD3] = "Master's Scroll",
    [0xD4] = "Prayer Beads",
    [0xD5] = "Black Belt",
    [0xD6] = "Heiji's Jitte",
    [0xD7] = "Fake Mustache",
    [0xD8] = "Soul of Thamasa",
    [0xD9] = "Dragon Horn",
    [0xDA] = "Merit Award",
    [0xDB] = "Memento Ring",
    [0xDC] = "Safety Bit",
    [0xDD] = "Lich Ring",
    [0xDE] = "Molulu's Charm",
    [0xDF] = "Ward Bangle",
    [0xE0] = "Miracle Shoes",
    [0xE1] = "Alarm Earring",
    [0xE2] = "Gale Hairpin",
    [0xE3] = "Sniper Eye",
    [0xE4] = "Growth Egg",
    [0xE5] = "Tintinnabulum",
    [0xE6] = "Sprint Shoes",
    [0xE7] = "Rename Card",
    [0xE8] = "Potion",
    [0xE9] = "Hi-Potion",
    [0xEA] = "X-Potion",
    [0xEB] = "Ether",
    [0xEC] = "High Ether",
    [0xED] = "X-Ether",
    [0xEE] = "Elixer",
    [0xEF] = "Megalixer",
    [0xF0] = "Phoenix Down",
    [0xF1] = "Holy Water",
    [0xF2] = "Antidote",
    [0xF3] = "Eye Drops",
    [0xF4] = "Gold Needle",
    [0xF5] = "Remedy",
    [0xF6] = "Sleeping Bag",
    [0xF7] = "Tent",
    [0xF8] = "Green Cherry",
    [0xF9] = "Magicite Shard",
    [0xFA] = "Super Ball",
    [0xFB] = "Echo Screen",
    [0xFC] = "Smoke Bomb",
    [0xFD] = "Teleport Stone",
    [0xFE] = "Dried Meat",
    [0xFF] = "Nothing"
}

KeyItems =
{
    {
        "Cider",
        "Old Clock Key",
        "Fish",
        "Fish",
        "Fish",
        "Fish",
        "Lump of Metal",
        "Lola's Letter",
        "Coral",
        "Books",
        "Emperor's Letter",
        "Rust-Rid",
        "Autograph",
        "Manicure",
        "Opera Record",
        "Magnifying Glass"
    },
    
    {
        "Rare Stone",
        "Odd Picture",
        "Ordinary Picture",
        "Pendant",
        "Stone Tablet",
        "Master's Crown"
    }
}

Magicite =
{
    {
        "Ramuh",
        "Ifrit",
        "Shiva",
        "Siren",
        "Midgardsormr",
        "Catoblepas",
        "Maduin",
        "Bismarck",
        "Cait Sith",
        "Quetzalli",
        "Valigarmanda",
        "Odin",
        "Raiden",
        "Bahamut",
        "Alexander",
        "Crusader"
    },
    
    {
        "Ragnarok",
        "Kirin",
        "Zona Seeker",
        "Carbuncle",
        "Phantom",
        "Seraph",
        "Golem",
        "Unicorn",
        "Fenrir",
        "Lakshmi",
        "Phoenix",
        "Leviathan",
        "Cactuar",
        "Diabolos",
        "Gilgamesh"
    }
}

Espers =
{
    [0x00] = "Ramuh",
    [0x01] = "Ifrit",
    [0x02] = "Shiva",
    [0x03] = "Siren",
    [0x04] = "Midgardsormr",
    [0x05] = "Catoblepas",
    [0x06] = "Maduin",
    [0x07] = "Bismarck",
    [0x08] = "Cait Sith",
    [0x09] = "Quetzalli",
    [0x0A] = "Valigarmanda",
    [0x0B] = "Odin",
    [0x0C] = "Raiden",
    [0x0D] = "Bahamut",
    [0x0E] = "Alexander",
    [0x0F] = "Crusader",
    [0x10] = "Ragnarok",
    [0x11] = "Kirin",
    [0x12] = "Zona Seeker",
    [0x13] = "Carbuncle",
    [0x14] = "Phantom",
    [0x15] = "Seraph",
    [0x16] = "Golem",
    [0x17] = "Unicorn",
    [0x18] = "Fenrir",
    [0x19] = "Lakshmi",
    [0x1A] = "Phoenix",
    [0x1B] = "Leviathan",
    [0x1C] = "Cactuar",
    [0x1D] = "Diabolos",
    [0x1E] = "Gilgamesh"
}

Commands =
{
    [0x00] = "Attack",
    [0x01] = "Items",
    [0x02] = "Magic",
    [0x03] = "Trance",
    [0x04] = "Revert",
    [0x05] = "Steal",
    [0x06] = "Mug",
    [0x07] = "Bushido",
    [0x08] = "Throw",
    [0x09] = "Tools",
    [0x0A] = "Blitz",
    [0x0B] = "Runic",
    [0x0C] = "Lore",
    [0x0D] = "Sketch",
    [0x0E] = "Control",
    [0x0F] = "Slots",
    [0x10] = "Rage",
    [0x11] = "(No Command)",
    [0x12] = "Mimic",
    [0x13] = "Dance",
    [0x14] = "Row",
    [0x15] = "Defend",
    [0x16] = "Jump",
    [0x17] = "Dualcast",
    [0x18] = "Gil Toss",
    [0x19] = "Summon",
    [0x1A] = "Pray",
    [0x1B] = "Shock",
    [0x1C] = "Possess",
    [0x1D] = "Magitek"
}

memory.usememorydomain("Combined WRAM")

KLib.Monitor.Variable(nil, 0x0011DF, "byte")
KLib.Monitor.Variable(nil, 0x001E87, "byte")
KLib.Monitor.Variable(nil, 0x001F6E, "byte")

function CreateMenu()
    KLib.Menu.Color(KLib.Color.White, KLib.Color.Make(32, 32, 128, 192))
    
    KLib.Menu.Page("Final Fantasy VI Advance\r")
    
    KLib.Menu.SubPage("Characters", CreateCharacterPage)
    KLib.Menu.SubPage("Items", CreateItemsPage)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Misc/Debugging", KLib.Color.Pink, true)
    KLib.Menu.Field("Time (Hours)", Address.Time, "byte", 0, 99)
    KLib.Menu.Field("Time (Minutes)", Address.Time + 1, "byte", 0, 59)
    KLib.Menu.Field("Time (Seconds)", Address.Time + 2, "byte", 0, 59)
    KLib.Menu.Field("Time (Centiseconds)", Address.Time + 3, "byte", 0, 59)
    KLib.Menu.Field("Steps", Address.Steps, "u16_le", 0, 9999999)
    KLib.Menu.Field("Main Menu Index", Address.MenuIndex, "byte")
end

function CreateCharacterPage()
    local barOffset = 112
    local barWidth = 120
    
    KLib.Menu.Offset(nil, Address.Character.Max, Address.Character.Size)
    
    KLib.Menu.Text("Basic", KLib.Color.Green, true)
    KLib.Menu.Enum("ID", Address.Character.Base + Address.Character.Offset.ID, "byte", Characters)
    KLib.Menu.Field("Level", Address.Character.Base + Address.Character.Offset.Level, "byte", 1, 99, barOffset, barWidth, KLib.Color.White)
    KLib.Menu.Field("Current HP", Address.Character.Base + Address.Character.Offset.CurrentHP, "s16_le", 0, 9999, barOffset, barWidth, KLib.Color.Green)
    KLib.Menu.Field("Max HP", Address.Character.Base + Address.Character.Offset.MaxHP, "s16_le", 0, 9999, barOffset, barWidth, KLib.Color.Green)
    KLib.Menu.Field("Current MP", Address.Character.Base + Address.Character.Offset.CurrentMP, "s16_le", 0, 999, barOffset, barWidth, KLib.Color.Cyan)
    KLib.Menu.Field("Max MP", Address.Character.Base + Address.Character.Offset.MaxMP, "s16_le", 0, 999, barOffset, barWidth, KLib.Color.Cyan)
    KLib.Menu.Field("Experience", Address.Character.Base + Address.Character.Offset.Experience, "u24_le", 0, 9999999)
    KLib.Menu.Bitfield("Status", Address.Character.Base + Address.Character.Offset.Status, "s16_le", {})
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Commands", KLib.Color.Orange, true)
    for i = 1, 4 do
        KLib.Menu.Enum("Command " .. i, Address.Character.Base + Address.Character.Offset.Commands + (i - 1), "byte", Commands)
    end
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Stats", KLib.Color.Green, true)
    KLib.Menu.Field("Strength", Address.Character.Base + Address.Character.Offset.Strength, "byte", 0, 255, barOffset, barWidth, KLib.Color.Orange)
    KLib.Menu.Field("Speed", Address.Character.Base + Address.Character.Offset.Speed, "byte", 0, 255, barOffset, barWidth, KLib.Color.Yellow)
    KLib.Menu.Field("Stamina", Address.Character.Base + Address.Character.Offset.Stamina, "byte", 0, 255, barOffset, barWidth, KLib.Color.Green)
    KLib.Menu.Field("Magic", Address.Character.Base + Address.Character.Offset.Magic, "byte", 0, 255, barOffset, barWidth, KLib.Color.Cyan)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Equipment", KLib.Color.Cyan, true)
    KLib.Menu.Enum("Esper", Address.Character.Base + Address.Character.Offset.Esper, "byte", Espers)
    KLib.Menu.Field("Right Hand", Address.Character.Base + Address.Character.Offset.RightHand, "byte")
    KLib.Menu.Field("Left Hand", Address.Character.Base + Address.Character.Offset.LeftHand, "byte")
    KLib.Menu.Field("Head", Address.Character.Base + Address.Character.Offset.Head, "byte")
    KLib.Menu.Field("Body", Address.Character.Base + Address.Character.Offset.Body, "byte")
    KLib.Menu.Field("Relic 1", Address.Character.Base + Address.Character.Offset.Relic1, "byte")
    KLib.Menu.Field("Relic 2", Address.Character.Base + Address.Character.Offset.Relic2, "byte")
end

function CreateItemsPage()
    local max = 36
    
    KLib.Menu.Field("Gil", Address.Gil, "u24_le", 0, 9999999)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Items", KLib.Color.Cyan, true)
    KLib.Menu.SubPage("Items", function()
            KLib.Menu.Offset(nil, 8, 36)
            KLib.Menu.EnumGroup(36, "Item", Address.Items.Base, "byte", Items)
        end)
    KLib.Menu.SubPage("Quantities", function()
            KLib.Menu.Offset(nil, 8, 36)
            KLib.Menu.FieldGroup(36, "Quantity", Address.Items.Quantity, "byte")
        end)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Key Items", KLib.Color.Yellow, true)
    KLib.Menu.BitfieldGroup(2, "Key Items", Address.Items.Key, "s16_le", KeyItems)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Magicite", KLib.Color.Pink, true)
    KLib.Menu.BitfieldGroup(2, "Magicite", Address.Items.Magicite, "s16_le", Magicite)
end

CreateMenu()

while true do
    KLib.Update()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
