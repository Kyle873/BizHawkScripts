dofile("KLib/KLib.lua")

Address =
{
	Items = 0x7FF882,
	Equipment = 0x7FF864,
	SpecialItems = 0x7FFA80,
	
	Coins = 0x7FF8AF,
    FP = 0x7FF8B1,
    MaxFP = 0x7FF8B2,
	FrogCoins = 0x7FF8B3,
    	
	Character = 
    {
        Base = 0x7FF800,
        Size = 0x14,
        Max = 5,
        
        Offset =
        {
            Level = 0x00,
            CurrentHP = 0x01,
            MaxHP = 0x03,
            Speed = 0x05,
            Attack = 0x06,
            Defense = 0x07,
            MagicAttack = 0x08,
            MagicDefense = 0x09,
            Experience = 0x0A,
            Weapon = 0x0C,
            Armor = 0x0D,
            Accessory = 0x0E,
            Spells = 0x10
        }
    },
	
	Enemy = 
    {
        Base = 0x7EFC00,
        Size = 0x80,
        Max = 8,
        
        Offset =
        {
            Type = 0x01,
            CurrentHP = 0x11,
            MaxHP = 0x13,
            Speed = 0x15,
            Attack = 0x16,
            Defense = 0x17,
            MagicAttack = 0x18,
            MagicDefense = 0x19,
            FP = 0x1A,
            Evade = 0x1B,
            MagicEvade = 0x1C,
            Flags = 0x1D,
            FlowerBonus = 0x2D
        }
    },
    
    Battle =
    {
        Formation = 0x7E0048,
        TotalXP = 0x7EFA02,
        TotalCoins = 0x7EFA04,
        Flags = 0x7EFA1F,
        
        Event = 0x7EFA1D,
        EventVars = 0x7EE000
    },
        
    Counters =
    {
        Jump = 0x7FF8C0,
        MysteryEgg = 0x7EE012,
        LambsLure = 0x7EE012,
        LuckyJewel = 0x7EE014
    },
}

Characters =
{
    "Mario",
    "Toadstool",
    "Bowser",
    "Geno",
    "Mallow"
}

Items =
{
    [0x05] = "Hammer",
    [0x06] = "Froggie Stick",
    [0x07] = "Nok Nok Shell",
    [0x08] = "Punch Glove",
    [0x09] = "Finger Shot",
    [0x0A] = "Cymbals",
    [0x0B] = "Chomp",
    [0x0C] = "Masher",
    [0x0D] = "Chomp Shell",
    [0x0E] = "Super Hammer",
    [0x0F] = "Hand Gun",
    [0x10] = "Whomp Glove",
    [0x11] = "Slap Glove",
    [0x12] = "Troopa Shell",
    [0x13] = "Parasol",
    [0x14] = "Hurly Glove",
    [0x15] = "Double Punch",
    [0x16] = "Ribbit Stick",
    [0x17] = "Spiked Link",
    [0x18] = "Mega Glove",
    [0x19] = "War Fan",
    [0x1A] = "Hand Cannon",
    [0x1B] = "Sticky Glove",
    [0x1C] = "Ultra Hammer",
    [0x1D] = "Super Slap",
    [0x1E] = "Drill Claw",
    [0x1F] = "Star Gun",
    [0x20] = "Sonic Cymbal",
    [0x21] = "Lazy Shell",
    [0x22] = "Frying Pan",
    [0x25] = "Shirt",
    [0x26] = "Pants",
    [0x27] = "Thick Shirt",
    [0x28] = "Thick Pants",
    [0x29] = "Mega Shirt",
    [0x2A] = "Mega Pants",
    [0x2B] = "Work Pants",
    [0x2C] = "Mega Cape",
    [0x2D] = "Happy Shirt",
    [0x2E] = "Happy Pants",
    [0x2F] = "Happy Cape",
    [0x30] = "Happy Shell",
    [0x31] = "Polka Dress",
    [0x32] = "Sailor Shirt",
    [0x33] = "Sailor Pants",
    [0x34] = "Sailor Cape",
    [0x35] = "Nautical Dress",
    [0x36] = "Courage Shell",
    [0x37] = "Fuzzy Shirt",
    [0x38] = "Fuzzy Pants",
    [0x39] = "Fuzzy Cape",
    [0x3A] = "Fuzzy Dress",
    [0x3B] = "Fire Shirt",
    [0x3C] = "Fire Pants",
    [0x3D] = "Fire Cape",
    [0x3E] = "Fire Shell",
    [0x3F] = "Fire Dress",
    [0x40] = "Hero Shirt",
    [0x41] = "Prince Pants",
    [0x42] = "Star Cape",
    [0x43] = "Heal Shell",
    [0x44] = "Royal Dress",
    [0x45] = "Super Shirt",
    [0x46] = "Lazy Shell",
    [0x4A] = "Zoom Shoes",
    [0x4B] = "Safety Badge",
    [0x4C] = "Jump Shoes",
    [0x4D] = "Safety Ring",
    [0x4E] = "Amulet",
    [0x4F] = "Scrooge Ring",
    [0x50] = "Exp Booster",
    [0x51] = "Attack Scarf",
    [0x52] = "Rare Scarf",
    [0x53] = "B'Tub Ring",
    [0x54] = "Antidote Pin",
    [0x55] = "Wake Up Pin",
    [0x56] = "Fearless Pin",
    [0x57] = "Trueform Pin",
    [0x58] = "Coin Trick",
    [0x59] = "Ghost Medal",
    [0x5A] = "Jinx Belt",
    [0x5B] = "Feather",
    [0x5C] = "Troopa Pin",
    [0x5D] = "Signal Ring",
    [0x5E] = "Quartz Charm",
    [0x60] = "Mushroom",
    [0x61] = "Mid Mushroom",
    [0x62] = "Max Mushroom",
    [0x63] = "Honey Syrup",
    [0x64] = "Maple Syrup",
    [0x65] = "Royal Syrup",
    [0x66] = "Pick Me Up",
    [0x67] = "Able Juice",
    [0x68] = "Bracer",
    [0x69] = "Energizer",
    [0x6A] = "Yoshi-Ade",
    [0x6B] = "Red Essence",
    [0x6C] = "KeroKero Cola",
    [0x6D] = "Yoshi Cookie",
    [0x6E] = "Pure Water",
    [0x6F] = "Sleepy Bomb",
    [0x70] = "Bad Mushroom",
    [0x71] = "Fire Bomb",
    [0x72] = "Ice Bomb",
    [0x73] = "Flower Tab",
    [0x74] = "Flower Jar",
    [0x75] = "Flower Box",
    [0x76] = "Yoshi Candy",
    [0x77] = "Froggie Drink",
    [0x78] = "Muku Cookie",
    [0x79] = "Elixer",
    [0x7A] = "Megaelixer",
    [0x7B] = "See Ya",
    [0x7C] = "Temple Key",
    [0x7D] = "Goodie Bag",
    [0x7E] = "Earlier Times",
    [0x7F] = "Freshen Up",
    [0x80] = "Rare Frog Coin",
    [0x81] = "Wallet",
    [0x82] = "Cricket Pie",
    [0x83] = "Rock Candy",
    [0x84] = "Castle Key 1",
    [0x86] = "Castle Key 2",
    [0x87] = "Bambino Bomb",
    [0x88] = "Sheep Attack",
    [0x89] = "Carbo Cookie",
    [0x8A] = "Shiny Stone",
    [0x8C] = "Room Key",
    [0x8D] = "Elder Key",
    [0x8E] = "Shed Key",
    [0x8F] = "Lamb's Lure",
    [0x90] = "Fright Bomb",
    [0x91] = "Mystery Egg",
    [0x92] = "Beetle Box",
    [0x93] = "Beetle Box",
    [0x94] = "Luck Jewel",
    [0x96] = "Soprano Card",
    [0x97] = "Alto Card",
    [0x98] = "Tenor Card",
    [0x99] = "Cystalline",
    [0x9A] = "Power Blast",
    [0x9B] = "Wilted Shroom",
    [0x9C] = "Rotten Mush",
    [0x9D] = "Moldy Mush",
    [0x9E] = "Seed",
    [0x9F] = "Fertilizer",
    [0xA0] = "Waste Basket",
    [0xA1] = "Big Boo Flag",
    [0xA2] = "Dry Bones Flag",
    [0xA3] = "Greaper Flag",
    [0xA4] = "Secret Game",
    [0xA6] = "Cricket Jam",
    [0xAC] = "Fireworks",
    [0xAE] = "Bright Card",
    [0xAF] = "Mushroom",
    [0xB0] = "Star Egg",
    [0xFF] = "Nothing"
}

BattleFlags =
{
    "Lucky"
}

memory.usememorydomain("System Bus")

function CreateMenu()
    KLib.Menu.Color(KLib.Color.Make(224, 224, 255), KLib.Color.Make(64, 0, 0, 192), KLib.Color.Make(255, 0, 0))
    
    KLib.Menu.Page("Super Mario RPG\r")
    
    KLib.Menu.Text("Party", KLib.Color.Green, true)
    KLib.Menu.SubPage("Characters", CreateCharacterPage)
    KLib.Menu.SubPage("Items", CreateItemsPage)
    KLib.Menu.SubPage("Equipment", CreateEquipmentPage)
    KLib.Menu.SubPage("Special Items", CreateSpecialItemsPage)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Battle", KLib.Color.Orange, true)
    KLib.Menu.SubPage("Enemies", CreateEnemiesPage)
    KLib.Menu.SubPage("Variables", CreateBattleVariablesPage)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("World", KLib.Color.Cyan, true)
    KLib.Menu.SubPage("Counters", CreateCountersPage)
end

function CreateCharacterPage(data)
    local barOffset = 120
    local barWidth = 128
    local page = KLib.Menu.Page("Characters")
    
    KLib.Menu.Offset(Characters, #Characters, Address.Character.Size)
    
    KLib.Menu.Text("Basic", KLib.Color.Green, true)
    KLib.Menu.Field("Level", Address.Character.Base + Address.Character.Offset.Level, "byte", 1, 30, barOffset, barWidth, KLib.Color.White)
    KLib.Menu.Field("Current HP", Address.Character.Base + Address.Character.Offset.CurrentHP, "s16_le", 0, 999, barOffset, barWidth, KLib.Color.Red)
    KLib.Menu.Field("Max HP", Address.Character.Base + Address.Character.Offset.MaxHP, "s16_le", 0, 999, barOffset, barWidth, KLib.Color.Red)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Stats", KLib.Color.Green, true)
    KLib.Menu.Field("Speed", Address.Character.Base + Address.Character.Offset.Speed, "byte", 0, 255, barOffset, barWidth, KLib.Color.Yellow)
    KLib.Menu.Field("Attack", Address.Character.Base + Address.Character.Offset.Attack, "byte", 0, 255, barOffset, barWidth, KLib.Color.Orange)
    KLib.Menu.Field("Defense", Address.Character.Base + Address.Character.Offset.Defense, "byte", 0, 255, barOffset, barWidth, KLib.Color.Green)
    KLib.Menu.Field("Magic Attack", Address.Character.Base + Address.Character.Offset.MagicAttack, "byte", 0, 255, barOffset, barWidth, KLib.Color.Cyan)
    KLib.Menu.Field("Magic Defense", Address.Character.Base + Address.Character.Offset.MagicDefense, "byte", 0, 255, barOffset, barWidth, KLib.Color.Pink)
    KLib.Menu.Field("Experience", Address.Character.Base + Address.Character.Offset.Experience, "s16_le", 0, 9999, barOffset, barWidth, KLib.Color.White)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Equipment", KLib.Color.Green, true)
    KLib.Menu.Enum("Weapon", Address.Character.Base + Address.Character.Offset.Weapon, "byte", Items)
    KLib.Menu.Enum("Armor", Address.Character.Base + Address.Character.Offset.Armor, "byte", Items)
    KLib.Menu.Enum("Accessory", Address.Character.Base + Address.Character.Offset.Accessory, "byte", Items)
    
    return page
end

function CreateItemsPage(data)
    local barOffset = 140
    local barWidth = 108
    local page = KLib.Menu.Page("Items")
    
    KLib.Menu.Field("Coins", Address.Coins, "s16_le", 0, 999, barOffset, barWidth, KLib.Color.Yellow)
    KLib.Menu.Field("Frog Coins", Address.FrogCoins, "byte", 0, 255, barOffset, barWidth, KLib.Color.Green)
    KLib.Menu.Field("Flower Points", Address.FP, "byte", 0, 99, barOffset, barWidth, KLib.Color.Orange)
    KLib.Menu.Field("Max Flower Points", Address.FP + 1, "byte", 0, 99, barOffset, barWidth, KLib.Color.Orange)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Items", KLib.Color.Cyan, true)
    KLib.Menu.EnumGroup(30, "Item", Address.Items, "byte", Items)
    
    return page
end

function CreateEquipmentPage(data)
    local page = KLib.Menu.Page("Equipment")
    
    KLib.Menu.EnumGroup(30, "Item", Address.Equipment, "byte", Items)
    
    return page
end

function CreateSpecialItemsPage(data)
    local page = KLib.Menu.Page("Special Items")
    
    KLib.Menu.EnumGroup(14, "Item", Address.SpecialItems, "byte", Items)
    
    return page
end

function CreateEnemiesPage()
    local barOffset = 120
    local barWidth = 128
    local page = KLib.Menu.Page("Battle")
    
    KLib.Menu.Offset(nil, Address.Enemy.Max, Address.Enemy.Size)
    
    KLib.Menu.Text("Basic", KLib.Color.Orange, true)
    KLib.Menu.Enum("Type", Address.Enemy.Base + Address.Enemy.Offset.Type, "byte", {})
    KLib.Menu.Field("Current HP", Address.Enemy.Base + Address.Enemy.Offset.CurrentHP, "s16_le", 0, 9999)
    KLib.Menu.Field("Max HP", Address.Enemy.Base + Address.Enemy.Offset.MaxHP, "s16_le", 0, 9999)
    KLib.Menu.Field("Flower Points", Address.Enemy.Base + Address.Enemy.Offset.FP, "byte")
    KLib.Menu.Enum("Flower Bonus", Address.Enemy.Base + Address.Enemy.Offset.FlowerBonus, "byte", {})
    KLib.Menu.Bitfield("Flags", Address.Enemy.Base + Address.Enemy.Offset.Flags, "byte", {})
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Stats", KLib.Color.Orange, true)
    KLib.Menu.Field("Speed", Address.Enemy.Base + Address.Enemy.Offset.Speed, "byte", 0, 255, barOffset, barWidth, KLib.Color.Yellow)
    KLib.Menu.Field("Attack", Address.Enemy.Base + Address.Enemy.Offset.Attack, "byte", 0, 255, barOffset, barWidth, KLib.Color.Orange)
    KLib.Menu.Field("Defense", Address.Enemy.Base + Address.Enemy.Offset.Defense, "byte", 0, 255, barOffset, barWidth, KLib.Color.Green)
    KLib.Menu.Field("Magic Attack", Address.Enemy.Base + Address.Enemy.Offset.MagicAttack, "byte", 0, 255, barOffset, barWidth, KLib.Color.Cyan)
    KLib.Menu.Field("Magic Defense", Address.Enemy.Base + Address.Enemy.Offset.MagicDefense, "byte", 0, 255, barOffset, barWidth, KLib.Color.Pink)
    KLib.Menu.Field("Evade %", Address.Enemy.Base + Address.Enemy.Offset.Evade, "byte", 0, 100, barOffset, barWidth, KLib.Color.Blue)
    KLib.Menu.Field("Magic Evade %", Address.Enemy.Base + Address.Enemy.Offset.MagicEvade, "byte", 0, 100, barOffset, barWidth, KLib.Color.Purple)
    
    return page
end

function CreateBattleVariablesPage()
    local page = KLib.Menu.Page("Battle Variables")
    
    KLib.Menu.Field("Formation", Address.Battle.Formation, "s16_le")
    KLib.Menu.Field("Total XP", Address.Battle.TotalXP, "s16_le")
    KLib.Menu.Field("Total Coins", Address.Battle.TotalCoins, "s16_le")
    KLib.Menu.Bitfield("Flags", Address.Battle.Flags, "byte", BattleFlags)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Battle Event", KLib.Color.Yellow, true)
    KLib.Menu.Field("Event", Address.Battle.Event, "byte")
    KLib.Menu.FieldGroup(10, "Variable", Address.Battle.EventVars, "byte")
        
    return page
end

function CreateCountersPage()
    local page = KLib.Menu.Page("Counters")
    
    KLib.Menu.Field("Super Jumps", Address.Counters.Jump, "byte")
    KLib.Menu.Field("Mystery Egg", Address.Counters.MysteryEgg, "byte")
    KLib.Menu.Field("Lamb's Lure", Address.Counters.LambsLure, "byte")
    KLib.Menu.Field("Lucky Jewel", Address.Counters.LuckyJewel, "byte")
    
    return page
end

CreateMenu()

while true do
    KLib.Update()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
