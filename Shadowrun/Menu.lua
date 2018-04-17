MenuPage =
{
    Main = 1,
    
    PlayerBasic = 2,
    PlayerInventory = 3,
    PlayerStats = 4,
    
    CyberdeckStats = 5,
    CyberdeckPrograms = 6,
    CyberdeckDataFiles = 7,
    
    GlobalGroupItems = 8,
    GlobalGroupData = 9,
    
    CurrentRun = 10,
    Cyberspace = 11
}

Menu = 
{
    Open = false,
    Index = 2,
    Page = MenuPage.Main,
    
    Runner = 0,
    RunnerOffset = 0x100,
    
    [MenuPage.Main] =
    {
        Header = "ShadowEdit v0.9",
        
        Width = 80,
        Height = 164,
        DefaultIndex = 2,
        
        {
            Text = "Player", Skip = true, Color = 0xFF0000FF
        },
        {
            Text = "Basic", Page = MenuPage.PlayerBasic
        },
        {
            Text = "Inventory", Page = MenuPage.PlayerInventory
        },
        {
            Text = "Stats/Skills", Page = MenuPage.PlayerStats
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Cyberdeck", Skip = true, Color = 0x00FFFFFF
        },
        {
            Text = "Stats", Page = MenuPage.CyberdeckStats
        },
        {
            Text = "Programs", Page = MenuPage.CyberdeckPrograms
        },
        {
            Text = "Data Files", Page = MenuPage.CyberdeckDataFiles
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Global", Skip = true, Color = 0xFFFF00FF
        },
        {
            Text = "Group Items", Page = MenuPage.GlobalGroupItems
        },
        {
            Text = "Group Data", Page = MenuPage.GlobalGroupData
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Misc", Skip = true, Color = 0x00FF00FF
        },
        {
            Text = "Current Run", Page = MenuPage.CurrentRun
        },
        {
            Text = "Cyberspace", Page = MenuPage.Cyberspace
        },
        
        Input = function()
            if Menu.Open and KeyPressed("A") then
                Menu.Page = Menu[MenuPage.Main][Menu.Index].Page
                Menu.Index = Menu[Menu.Page].DefaultIndex or 1
            end
        end,
    },
    
    [MenuPage.PlayerBasic] =
    {
        Header = "Player - Basic",
        
        Width = 140,
        Height = 164,
        DefaultIndex = 2,
        
        {
            Text = "Base", Skip = true, Color = 0xFF0000FF
        },
        {
            Text = "Race",
            Address = Address.Player.Race,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Races,
            Min = 0,
            Max = #Races - 1
        },
        {
            Text = "Archetype",
            Address = Address.Player.Archetype,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Archetypes,
            Min = 0,
            Max = #Archetypes - 1
        },
        {
            Text = "Karma",
            Address = Address.Player.Karma,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Offensive", Skip = true, Color = 0xFFFF00FF
        },
        {
            Text = "Ammo",
            Address = Address.Player.Ammo,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "Clips",
            Address = Address.Player.Clips,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 20
        },
        {
            Text = "Stance",
            Address = Address.Player.Stance,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Stances,
            Min = 0,
            Max = #Stances - 1
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Health", Skip = true, Color = 0x00FF00FF
        },
        {
            Text = "Physical Health",
            Address = Address.Player.Health.Physical,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 10
        },
        {
            Text = "Mental Health",
            Address = Address.Player.Health.Mental,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 10
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Cyberware", Skip = true, Color = 0x00FFFFFF
        },
        {
            Text = "Set 1",
            Address = Address.Player.Cyberware,
            PerChar = true,
            Type = DataType.Byte,
            BitField = Cyberware[1],
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 2",
            Address = Address.Player.Cyberware + 1,
            PerChar = true,
            Type = DataType.Byte,
            BitField = Cyberware[2],
            Min = 0,
            Max = 255
        },
    },
    
    [MenuPage.PlayerInventory] =
    {
        Header = "Player - Inventory",
        
        Width = 160,
        Height = 220,
        DefaultIndex = 2,
        
        {
            Text = "Equipped", Skip = true, Color = 0xFF0000FF
        },
        {
            Text = "Weapon",
            Address = Address.Player.Equipped.Weapon,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Weapons,
            Min = 0,
            Max = #Weapons - 1
        },
        {
            Text = "Weapon Flag",
            Address = Address.Player.Equipped.Flag,
            PerChar = true,
            Type = DataType.Byte,
            Values = WeaponFlags,
            Index = 1
        },
        {
            Text = "Armor",
            Address = Address.Player.Equipped.Armor,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Armors,
            Min = 0,
            Max = #Armors - 1
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Inventory", Skip = true, Color = 0x00FF00FF
        },
        {
            Text = "Slot 1",
            Address = Address.Player.Inventory.Items,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items,
            Min = 0,
            Max = #Items - 1
        },
        {
            Text = "Slot 2",
            Address = Address.Player.Inventory.Items + 1,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items,
            Min = 0,
            Max = #Items - 1
        },
        {
            Text = "Slot 3",
            Address = Address.Player.Inventory.Items + 2,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items,
            Min = 0,
            Max = #Items - 1
        },
        {
            Text = "Slot 4",
            Address = Address.Player.Inventory.Items + 3,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items,
            Min = 0,
            Max = #Items - 1
        },
        {
            Text = "Slot 5",
            Address = Address.Player.Inventory.Items + 4,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items,
            Min = 0,
            Max = #Items - 1
        },
        {
            Text = "Slot 6",
            Address = Address.Player.Inventory.Items + 5,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items,
            Min = 0,
            Max = #Items - 1
        },
        {
            Text = "Slot 7",
            Address = Address.Player.Inventory.Items + 6,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items,
            Min = 0,
            Max = #Items - 1
        },
        {
            Text = "Slot 8",
            Address = Address.Player.Inventory.Items + 7,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items,
            Min = 0,
            Max = #Items - 1
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Quantity/Flags", Skip = true, Color = 0x00FFFFFF
        },
        {
            Text = "Value 1",
            Address = Address.Player.Inventory.Values,
            PerChar = true,
            Type = DataType.Byte,
            BitField = Attachments,
            Min = 0,
            Max = 255
        },
        {
            Text = "Value 2",
            Address = Address.Player.Inventory.Values + 1,
            PerChar = true,
            Type = DataType.Byte,
            BitField = Attachments,
            Min = 0,
            Max = 255
        },
        {
            Text = "Value 3",
            Address = Address.Player.Inventory.Values + 2,
            PerChar = true,
            Type = DataType.Byte,
            BitField = Attachments,
            Min = 0,
            Max = 255
        },
        {
            Text = "Value 4",
            Address = Address.Player.Inventory.Values + 3,
            PerChar = true,
            Type = DataType.Byte,
            BitField = Attachments,
            Min = 0,
            Max = 255
        },
        {
            Text = "Value 5",
            Address = Address.Player.Inventory.Values + 4,
            PerChar = true,
            Type = DataType.Byte,
            BitField = Attachments,
            Min = 0,
            Max = 255
        },
        {
            Text = "Value 6",
            Address = Address.Player.Inventory.Values + 5,
            PerChar = true,
            Type = DataType.Byte,
            BitField = Attachments,
            Min = 0,
            Max = 255
        },
        {
            Text = "Value 7",
            Address = Address.Player.Inventory.Values + 6,
            PerChar = true,
            Type = DataType.Byte,
            BitField = Attachments,
            Min = 0,
            Max = 255
        },
        {
            Text = "Value 8",
            Address = Address.Player.Inventory.Values + 7,
            PerChar = true,
            Type = DataType.Byte,
            BitField = Attachments,
            Min = 0,
            Max = 255
        },
        
        Update = function()
            local weapon = Menu[MenuPage.PlayerInventory][2]
            
            if IsSpell() then
                weapon.Enum = Spells
                weapon.Max = #Spells - 1
            else
                weapon.Enum = Weapons
                weapon.Max = #Weapons - 1
            end
        end,
    },
    
    [MenuPage.PlayerStats] =
    {
        Header = "Player - Stat/Skills",
        
        Width = 120,
        Height = 220,
        DefaultIndex = 2,
        
        {
            Text = "Attributes", Skip = true, Color = 0xFF7F00FF
        },
        {
            Text = "Body",
            Address = Address.Player.Stats.Body,
            PerChar = true,
            Type = DataType.Byte,
            Min = 1,
            Max = 8
        },
        {
            Text = "Quickness",
            Address = Address.Player.Stats.Quickness,
            PerChar = true,
            Type = DataType.Byte,
            Min = 1,
            Max = 8
        },
        {
            Text = "Strength",
            Address = Address.Player.Stats.Strength,
            PerChar = true,
            Type = DataType.Byte,
            Min = 1,
            Max = 8
        },
        {
            Text = "Charisma",
            Address = Address.Player.Stats.Charisma,
            PerChar = true,
            Type = DataType.Byte,
            Min = 1,
            Max = 8
        },
        {
            Text = "Intelligence",
            Address = Address.Player.Stats.Intelligence,
            PerChar = true,
            Type = DataType.Byte,
            Min = 1,
            Max = 8
        },
        {
            Text = "Willpower",
            Address = Address.Player.Stats.Willpower,
            PerChar = true,
            Type = DataType.Byte,
            Min = 1,
            Max = 8
        },
        {
            Text = "Magic",
            Address = Address.Player.Stats.Magic,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Essence",
            Address = Address.Player.Stats.Essence,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 6
        },
        {
            Text = "Essence Factor",
            Address = Address.Player.Stats.Essence2,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 9
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Skills", Skip = true, Color = 0x007FFFFF
        },
        {
            Text = "Sorcery",
            Address = Address.Player.Skills.Sorcery,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
        {
            Text = "Firearms",
            Address = Address.Player.Skills.Firearms,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
        {
            Text = "  Pistols",
            Address = Address.Player.Skills.Pistols,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 13
        },
        {
            Text = "  SMGs",
            Address = Address.Player.Skills.SMGs,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 13
        },
        {
            Text = "  Shotguns",
            Address = Address.Player.Skills.Shotguns,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 13
        },
        {
            Text = "Melee",
            Address = Address.Player.Skills.Melee,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
        {
            Text = "Throwing",
            Address = Address.Player.Skills.Throwing,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
        {
            Text = "Computer",
            Address = Address.Player.Skills.Computer,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
        {
            Text = "BioTech",
            Address = Address.Player.Skills.BioTech,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
        {
            Text = "Electronics",
            Address = Address.Player.Skills.Electronics,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
        {
            Text = "Reputation",
            Address = Address.Player.Skills.Reputation,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
        {
            Text = "Negotiation",
            Address = Address.Player.Skills.Negotiation,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
    },
    
    [MenuPage.CyberdeckStats] =
    {
        Header = "Cyberdeck - Stats",
        
        Width = 136,
        Height = 164,
        DefaultIndex = 2,
        
        {
            Text = "Base", Skip = true, Color = 0xFF0000FF
        },
        {
            Text = "Available",
            Address = Address.Cyberdeck.HaveDeck,
            Type = DataType.Byte,
            Enum = { "No", "Yes" },
            Min = 0,
            Max = 1
        },
        {
            Text = "Brand",
            Address = Address.Cyberdeck.Brand,
            Type = DataType.Byte,
            Values = Cyberdecks,
            Index = 1
        },
        {
            Text = "MPCP Rating",
            Address = Address.Cyberdeck.Stats.MPCP,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
        {
            Text = "Hardening Rating",
            Address = Address.Cyberdeck.Stats.Hardening,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Memory/Storage", Skip = true, Color = 0xFFFF00FF
        },
        {
            Text = "Memory",
            Address = Address.Cyberdeck.Stats.Memory,
            Type = DataType.Word,
            Min = 0,
            Max = 10000
        },
        {
            Text = "Storage",
            Address = Address.Cyberdeck.Stats.Storage,
            Type = DataType.Word,
            Min = 0,
            Max = 10000
        },
        {
            Text = "Load I/O Speed",
            Address = Address.Cyberdeck.Stats.LoadIOSpeed,
            Type = DataType.Byte,
            Min = 0,
            Max = 250
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Stats", Skip = true, Color = 0x00FF00FF
        },
        {
            Text = "Body",
            Address = Address.Cyberdeck.Stats.Body,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
        {
            Text = "Evasion",
            Address = Address.Cyberdeck.Stats.Evasion,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
        {
            Text = "Masking",
            Address = Address.Cyberdeck.Stats.Masking,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
        {
            Text = "Sensor",
            Address = Address.Cyberdeck.Stats.Sensor,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
        {
            Text = "Response",
            Address = Address.Cyberdeck.Stats.Response,
            Type = DataType.Byte,
            Min = 0,
            Max = 12
        },
    },
    
    [MenuPage.CyberdeckPrograms] =
    {
        Header = "Cyberdeck - Programs",
        
        Width = 100,
        Height = 162,
        DefaultIndex = 2,
        
        {
            Text = "Combat", Skip = true, Color = 0xFF0000FF
        },
        {
            Text = "Attack",
            Address = Address.Cyberdeck.Programs.Attack,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slow",
            Address = Address.Cyberdeck.Programs.Slow,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Degrade",
            Address = Address.Cyberdeck.Programs.Degrade,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Rebound",
            Address = Address.Cyberdeck.Programs.Rebound,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Defense", Skip = true, Color = 0x00FF00FF
        },
        {
            Text = "Medic",
            Address = Address.Cyberdeck.Programs.Medic,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Shield",
            Address = Address.Cyberdeck.Programs.Shield,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Smoke",
            Address = Address.Cyberdeck.Programs.Smoke,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Mirrors",
            Address = Address.Cyberdeck.Programs.Mirrors,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Mask/Sense", Skip = true, Color = 0x00FFFFFF
        },
        {
            Text = "Sleaze",
            Address = Address.Cyberdeck.Programs.Sleaze,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Deception",
            Address = Address.Cyberdeck.Programs.Deception,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Relocation",
            Address = Address.Cyberdeck.Programs.Relocation,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Analyze",
            Address = Address.Cyberdeck.Programs.Analyze,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
    },
    
    [MenuPage.CyberdeckDataFiles] =
    {
        Header = "Cyberdeck - Data Files",
        
        Width = 200,
        Height = 186,
        DefaultIndex = 2,
        
        {
            Text = "File Types", Skip = true, Color = 0x00FFFFFF
        },
        {
            Text = "Slot 1",
            Address = Address.Cyberdeck.Datafiles[1],
            Type = DataType.Byte,
            Values = Datafiles
        },
        {
            Text = "Slot 2",
            Address = Address.Cyberdeck.Datafiles[2],
            Type = DataType.Byte,
            Values = Datafiles
        },
        {
            Text = "Slot 3",
            Address = Address.Cyberdeck.Datafiles[3],
            Type = DataType.Byte,
            Values = Datafiles
        },
        {
            Text = "Slot 4",
            Address = Address.Cyberdeck.Datafiles[4],
            Type = DataType.Byte,
            Values = Datafiles
        },
        {
            Text = "Slot 5",
            Address = Address.Cyberdeck.Datafiles[5],
            Type = DataType.Byte,
            Values = Datafiles
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "File Sizes", Skip = true, Color = 0x00FF00FF
        },
        {
            Text = "Slot 1",
            Address = Address.Cyberdeck.Datafiles[1] + 1,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "Slot 2",
            Address = Address.Cyberdeck.Datafiles[2] + 1,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "Slot 3",
            Address = Address.Cyberdeck.Datafiles[3] + 1,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "Slot 4",
            Address = Address.Cyberdeck.Datafiles[4] + 1,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "Slot 5",
            Address = Address.Cyberdeck.Datafiles[5] + 1,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "File Values", Skip = true, Color = 0xFFFF00FF
        },
        {
            Text = "Slot 1",
            Address = Address.Cyberdeck.Datafiles[1] + 2,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "Slot 2",
            Address = Address.Cyberdeck.Datafiles[2] + 2,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "Slot 3",
            Address = Address.Cyberdeck.Datafiles[3] + 2,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "Slot 4",
            Address = Address.Cyberdeck.Datafiles[4] + 2,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "Slot 5",
            Address = Address.Cyberdeck.Datafiles[5] + 2,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
    },
    
    [MenuPage.GlobalGroupItems] =
    {
        Header = "Global - Group Items",
        
        Width = 160,
        Height = 68,
        
        {
            Text = "Nuyen",
            Address = Address.Global.Nuyen,
            Type = DataType.Long,
            Min = 0,
            Max = 1000000000
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Group Items", Skip = true, Color = 0xFF7F00FF
        },
        {
            Text = "Set 1",
            Address = Address.Global.GroupItems,
            Type = DataType.Byte,
            BitField = GroupItems[1],
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 2",
            Address = Address.Global.GroupItems + 1,
            Type = DataType.Byte,
            BitField = GroupItems[2],
            Min = 0,
            Max = 255
        },
    },
    
    [MenuPage.GlobalGroupData] =
    {
        Header = "Global - Group Data",
        
        Width = 160,
        Height = 84,
        DefaultIndex = 2,
        
        {
            Text = "Cyberdeck Passcodes", Skip = true, Color = 0xFFFF00FF
        },
        {
            Text = "Set 1",
            Address = Address.Global.Passcodes,
            Type = DataType.Byte,
            BitField = Passcodes[1],
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 2",
            Address = Address.Global.Passcodes + 1,
            Type = DataType.Byte,
            BitField = Passcodes[2],
            Min = 0,
            Max = 255
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Contacts", Skip = true, Color = 0x00FFFFFF
        },
        {
            Text = "Set 1",
            Address = Address.Global.Contacts,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 2",
            Address = Address.Global.Contacts + 1,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
    },
    
    [MenuPage.CurrentRun] =
    {
        Header = "Current Run",
        
        Width = 300,
        Height = 124,
        DefaultIndex = 2,
        
        {
            Text = "Basic", Skip = true, Color = 0xFF0000FF
        },
        {
            Text = "Johnson",
            Address = Address.CurrentRun.Johnson,
            Type = DataType.Byte,
            Values = Johnsons,
            Index = 1
        },
        {
            Text = "Type",
            Address = Address.CurrentRun.RunType,
            Type = DataType.Byte,
            Values = RunTypes,
            Index = 1
        },
        {
            Text = "Payment",
            Address = Address.CurrentRun.Payment,
            Type = DataType.Word,
            Min = 0,
            Max = 1000000000
        },
        {
            Text = "Flags",
            Address = Address.CurrentRun.Flags,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Parameters", Skip = true, Color = 0xFFFF00FF
        },
        {
            Type = DataType.Byte
        },
        {
            Type = DataType.Byte
        },
        {
            Type = DataType.Byte
        },
        {
            Type = DataType.Byte
        },
        {
            Type = DataType.Byte,
            Index = 1
        },
        
        Update = function()
            local runType = ReadValue(Address.CurrentRun.RunType, DataType.Byte)
            local params = { 8, 9, 10, 11, 12 }
            
            local menu = Menu[MenuPage.CurrentRun]
            local area = ReadValue(Address.CurrentRun.Area1, DataType.Byte) + 1
            local area2 = ReadValue(Address.CurrentRun.Area2, DataType.Byte) + 1
            local index = 1
            
            -- TODO: Don't use magic numbers here for the runType
            if runType >= 0 and runType <= 5 then
                if runType == 0 then
                    menu[params[index]].Text = "Area"
                elseif runType ~= 1 and runType ~= 2 then
                    menu[params[index]].Text = "Destination Area"
                else
                    menu[params[index]].Text = "Source Area"
                end
                menu[params[index]].Skip = false
                menu[params[index]].Address = Address.CurrentRun.Area1
                menu[params[index]].Enum = Areas
                menu[params[index]].Min = 0
                menu[params[index]].Max = #Areas - 1
                index = index + 1
                
                if runType > 0 and runType <= 5 then
                    if runType ~= 1 and runType ~= 2 then
                        menu[params[index]].Text = "Destination Building"
                    else
                        menu[params[index]].Text = "Source Building"
                    end
                    menu[params[index]].Skip = false
                    menu[params[index]].Address = Address.CurrentRun.Building1
                    menu[params[index]].Enum = Buildings[area]
                    menu[params[index]].Min = 0
                    menu[params[index]].Max = #Buildings[area] - 1
                    index = index + 1
                end
                
                if runType == 1 or runType == 2 then
                    menu[params[index]].Text = "Destination Area"
                    menu[params[index]].Skip = false
                    menu[params[index]].Address = Address.CurrentRun.Area2
                    menu[params[index]].Enum = Areas
                    menu[params[index]].Min = 0
                    menu[params[index]].Max = #Areas - 1
                    index = index + 1
                    
                    menu[params[index]].Text = "Destination Building"
                    menu[params[index]].Skip = false
                    menu[params[index]].Address = Address.CurrentRun.Building2
                    menu[params[index]].Enum = Buildings[area2]
                    menu[params[index]].Min = 0
                    menu[params[index]].Max = #Buildings[area2] - 1
                    index = index + 1
                end
                
                if runType == 1 or runType == 5 then
                    menu[params[index]].Text = "Client"
                    menu[params[index]].Skip = false
                    menu[params[index]].Address = Address.CurrentRun.Client
                    menu[params[index]].Values = Clients
                    index = index + 1
                end
            elseif runType == 6 then
                menu[params[index]].Text = "Matrix Run Type"
                menu[params[index]].Skip = false
                menu[params[index]].Address = Address.CurrentRun.Matrix.Type
                menu[params[index]].Enum = MatrixRunTypes
                menu[params[index]].Min = 0
                menu[params[index]].Max = #MatrixRunTypes - 1
                index = index + 1
                
                menu[params[index]].Text = "System"
                menu[params[index]].Skip = false
                menu[params[index]].Address = Address.CurrentRun.Matrix.System
                menu[params[index]].Enum = Systems
                menu[params[index]].Min = 0
                menu[params[index]].Max = #Systems - 1
                index = index + 1
            end
            
            for i = index, #params do
                local entry = menu[params[i]]
                
                entry.Text = nil
                entry.Skip = true
                entry.Address = nil
                entry.Enum = nil
                entry.Values = nil
                entry.Min = nil
                entry.Max = nil
            end
            
            for i = 1, #params do
                local entry = menu[params[i]]
                
                if entry.Address ~= nil then
                    local value = ReadValue(entry.Address, entry.Type)
                    
                    if entry.Enum ~= nil then
                        if value < entry.Min or value > entry.Max then
                            WriteValue(entry.Address, entry.Type, entry.Min)
                        end
                    elseif entry.Values ~= nil then
                        local found = false
                        
                        for j = 1, #entry.Values do
                            if value == entry.Values[j].Value then
                                entry.Index = j
                                found = true
                                break
                            end
                        end
                        
                        if not found then
                            entry.Index = 1
                            WriteValue(entry.Address, entry.Type, entry.Values[entry.Index].Value)
                        end
                    end
                end
            end
        end,
    },
    
    [MenuPage.Cyberspace] =
    {
        Header = "Cyberspace",
        
        Width = 100,
        Height = 100,
        DefaultIndex = 2,
        
        {
            Text = "ICE", Skip = true, Color = 0xFF0000FF
        },
        {
            Text = "ICE Health",
            Address = Address.Cyberspace.ICEHealth,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        
        Input = function()
            if KeyPressed("A") then
                for i = 0, 3 do
                    local var1 = ReadValue(Address.Cyberspace.ICEHealth + (i * 4), DataType.Byte)
                    local var2 = ReadValue(Address.Cyberspace.ICEHealth + (i * 4) + 1, DataType.Byte)
                    local var3 = ReadValue(Address.Cyberspace.ICEHealth + (i * 4) + 2, DataType.Byte)
                    local var4 = ReadValue(Address.Cyberspace.ICEHealth + (i * 4) + 3, DataType.Byte)
                    
                    print(var1 .. ", " .. var2 .. ", " .. var3 .. ", " .. var4)
                end
                
                print("--------------------")
            end
        end,
    },
}

function MenuInit()
    for i = 1, #Menu do
        Menu[i].Max = 0
        
        for j = 1, #Menu[i] do
            Menu[i].Max = Menu[i].Max + 1
            
            if Menu[i][j].PerChar ~= nil and Menu[i][j].PerChar then
                Menu[i][j].BaseAddress = Menu[i][j].Address
            end
            
            if Menu[i][j].Values ~= nil then
                local entry = Menu[i][j]
                
                for k = 1, #entry.Values do
                    if entry.Values[k].Value == ReadValue(entry.Address, entry.Type) then
                        entry.Index = k
                        break
                    end
                end
            end
        end
    end
end

function UpdateFrozen()
    for i = 1, #Menu do
        for j = 1, #Menu[i] do
            if Menu[i][j].Frozen then
                WriteValue(Menu[i][j].Address, Menu[i][j].Type, Menu[i][j].FrozenValue)
            end
        end
    end
end

function UpdateAddresses()
    for i = 1, #Menu do
        for j = 1, #Menu[i] do
            if Menu[i][j].PerChar ~= nil and Menu[i][j].PerChar then
                Menu[i][j].Address = Menu[i][j].BaseAddress + (Menu.Runner * Menu.RunnerOffset)
            end
        end
    end
end

function UpdateValues()
    for i = 1, #Menu do
        for j = 1, #Menu[i] do
            if Menu[i][j].Values ~= nil then
                local entry = Menu[i][j]
                
                for k = 1, #entry.Values do
                    if entry.Values[k].Value == ReadValue(entry.Address, entry.Type) then
                        entry.Index = k
                        break
                    end
                end
            end
        end
    end
end

function UpdateMenuEvents()
    if Menu[Menu.Page].Input ~= nil then
        Menu[Menu.Page].Input()
    end
    
    if Menu[Menu.Page].Update ~= nil then
        Menu[Menu.Page].Update()
    end
end
