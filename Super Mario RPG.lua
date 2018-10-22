dofile("KLib/KLib.lua")
dofile("Data/Super Mario RPG.lua")

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
    KLib.Menu.Field("Level", Address.Character.Base + Address.Character.Offset.Level, "byte", 0, 30, barOffset, barWidth, KLib.Color.White)
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
    KLib.Menu.Enum("Weapon", Address.Character.Base + Address.Character.Offset.Armor, "byte", Items)
    KLib.Menu.Enum("Weapon", Address.Character.Base + Address.Character.Offset.Accessory, "byte", Items)
    
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
