MenuPage =
{
    Main = 1,
    
    PlayerBasic = 2,
    PlayerInventory = 3,
    PlayerStats = 4,
    Spellbooks = 5,
    
    CyberdeckStats = 6,
    CyberdeckPrograms = 7,
    CyberdeckDataFiles = 8,
    Cyberspace = 9,
    
    GroupItems = 10,
    Notebook = 11,
    CurrentRun = 12
}

Menu = 
{
    Open = false,
    Index = 2,
    Page = MenuPage.Main,
    
    Runner = 0,
    RunnerOffset = 0x100,
    SpellPage = 0,
    SpellOffset = 0x22,
    SpellCharNames =
    {
        "Ricky",
        "Trent",
        "Walking Bear",
        "Freya",
        "Joshua"
    },
    
    [MenuPage.Main] =
    {
        Header = "\rShadowEdit v0.11.1",
        
        DefaultIndex = 2,
        
        {
            Text = "Player", Skip = true, Color = Color.Green
        },
        {
            Text = "Basic", Page = MenuPage.PlayerBasic
        },
        {
            Text = "Inventory", Page = MenuPage.PlayerInventory
        },
        {
            Text = "Attributes/Skills", Page = MenuPage.PlayerStats
        },
        {
            Text = "Spellbooks", Page = MenuPage.Spellbooks
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Cyberspace", Skip = true, Color = Color.Cyan
        },
        {
            Text = "Cyberdeck Stats", Page = MenuPage.CyberdeckStats
        },
        {
            Text = "Cyberdeck Programs", Page = MenuPage.CyberdeckPrograms
        },
        {
            Text = "Data Files", Page = MenuPage.CyberdeckDataFiles
        },
        {
            Text = "System", Page = MenuPage.Cyberspace
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "World", Skip = true, Color = Color.Yellow
        },
        {
            Text = "Group Items", Page = MenuPage.GroupItems
        },
        {
            Text = "Notebook", Page = MenuPage.Notebook
        },
        {
            Text = "Current Run", Page = MenuPage.CurrentRun
        },
        
        Input = function()
            if Menu.Open and KeyPressed(Input.UseKey) then
                Menu.Page = Menu[MenuPage.Main][Menu.Index].Page
                Menu.Index = Menu[Menu.Page].DefaultIndex or 1
            end
        end,
    },
    
    [MenuPage.PlayerBasic] =
    {
        Header = "Player - Basic",
        
        PerChar = true,
        DefaultIndex = 2,
        
        {
            Text = "Base", Skip = true, Color = Color.Green
        },
        {
            Text = "Race",
            Address = Address.Player.Race,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Races
        },
        {
            Text = "Archetype",
            Address = Address.Player.Archetype,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Archetypes
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
            Text = "Offensive", Skip = true, Color = Color.Red
        },
        {
            Text = "Ammo",
            Address = Address.Player.Ammo,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 255,
            
            Bar =
            {
                Color = Color.White
            }
        },
        {
            Text = "Clips",
            Address = Address.Player.Clips,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 20,
            
            Bar =
            {
                Color = Color.Orange
            }
        },
        {
            Text = "Stance",
            Address = Address.Player.Stance,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Stances
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Health", Skip = true, Color = Color.Green
        },
        {
            Text = "Physical Health",
            Address = Address.Player.Health.Physical,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 10,
            
            Bar =
            {
                Color = Color.Red
            }
        },
        {
            Text = "Mental Health",
            Address = Address.Player.Health.Mental,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 10,
            
            Bar =
            {
                Color = Color.Green
            }
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Cyberware", Skip = true, Color = Color.Cyan
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
        
        Update = function()
            local ammo = FindMenuEntry(MenuPage.PlayerBasic, "Ammo")
            local weapon = ReadValue(Address.Player.Equipped.Weapon, DataType.Byte) + 1
            
            if weapon > #ItemValues then
                ammo.Max = 255
            else
                ammo.Max = ItemValues[weapon]
            end
        end
    },
    
    [MenuPage.PlayerInventory] =
    {
        Header = "Player - Inventory",
        
        PerChar = true,
        DefaultIndex = 2,
        
        {
            Text = "Equipped", Skip = true, Color = Color.Red
        },
        {
            Text = "Weapon",
            Address = Address.Player.Equipped.Weapon,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Weapons
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
            Enum = Armors
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Inventory", Skip = true, Color = Color.Green
        },
        {
            Text = "Slot 1",
            Address = Address.Player.Inventory.Items,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items
        },
        {
            Text = "Slot 2",
            Address = Address.Player.Inventory.Items + 1,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items
        },
        {
            Text = "Slot 3",
            Address = Address.Player.Inventory.Items + 2,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items
        },
        {
            Text = "Slot 4",
            Address = Address.Player.Inventory.Items + 3,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items
        },
        {
            Text = "Slot 5",
            Address = Address.Player.Inventory.Items + 4,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items
        },
        {
            Text = "Slot 6",
            Address = Address.Player.Inventory.Items + 5,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items
        },
        {
            Text = "Slot 7",
            Address = Address.Player.Inventory.Items + 6,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items
        },
        {
            Text = "Slot 8",
            Address = Address.Player.Inventory.Items + 7,
            PerChar = true,
            Type = DataType.Byte,
            Enum = Items
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Quantity/Flags", Skip = true, Color = Color.Green
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
            local weapon = FindMenuEntry(MenuPage.PlayerInventory, "Weapon")
            
            if IsSpell() then
                weapon.Enum = Spells
                weapon.Max = #Spells - 1
            else
                weapon.Enum = Weapons
                weapon.Max = #Weapons - 1
            end
        end
    },
    
    [MenuPage.PlayerStats] =
    {
        Header = "Player - Attributes/Skills",
        
        PerChar = true,
        DefaultIndex = 2,
        
        {
            Text = "Attributes", Skip = true, Color = Color.Orange
        },
        {
            Text = "Body",
            Address = Address.Player.Stats.Body,
            PerChar = true,
            Type = DataType.Byte,
            Min = 1,
            Max = 8,
            
            Bar =
            {
                Color = Color.Green
            }
        },
        {
            Text = "Quickness",
            Address = Address.Player.Stats.Quickness,
            PerChar = true,
            Type = DataType.Byte,
            Min = 1,
            Max = 8,
            
            Bar =
            {
                Color = Color.Orange
            }
        },
        {
            Text = "Strength",
            Address = Address.Player.Stats.Strength,
            PerChar = true,
            Type = DataType.Byte,
            Min = 1,
            Max = 8,
            
            Bar =
            {
                Color = Color.Red
            }
        },
        {
            Text = "Charisma",
            Address = Address.Player.Stats.Charisma,
            PerChar = true,
            Type = DataType.Byte,
            Min = 1,
            Max = 8,
            
            Bar =
            {
                Color = Color.Yellow
            }
        },
        {
            Text = "Intelligence",
            Address = Address.Player.Stats.Intelligence,
            PerChar = true,
            Type = DataType.Byte,
            Min = 1,
            Max = 8,
            
            Bar =
            {
                Color = Color.Cyan
            }
        },
        {
            Text = "Willpower",
            Address = Address.Player.Stats.Willpower,
            PerChar = true,
            Type = DataType.Byte,
            Min = 1,
            Max = 8,
            
            Bar =
            {
                Color = Color.Blue
            }
        },
        {
            Text = "Magic",
            Address = Address.Player.Stats.Magic,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8,
            
            Bar =
            {
                Color = Color.Pink
            }
        },
        {
            Text = "Essence",
            Address = Address.Player.Stats.Essence,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 6,
            
            Bar =
            {
                Color = Color.Pink
            }
        },
        {
            Text = "Essence Factor",
            Address = Address.Player.Stats.Essence2,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 9,
            
            Bar =
            {
                Color = Color.Pink
            }
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Skills", Skip = true, Color = Color.Blue
        },
        {
            Text = "Sorcery",
            Address = Address.Player.Skills.Sorcery,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.Pink
            }
        },
        {
            Text = "Firearms",
            Address = Address.Player.Skills.Firearms,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.Orange
            }
        },
        {
            Text = "  Pistols",
            Address = Address.Player.Skills.Pistols,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 13,
            
            Bar =
            {
                Color = Color.Orange
            }
        },
        {
            Text = "  SMGs",
            Address = Address.Player.Skills.SMGs,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 13,
            
            Bar =
            {
                Color = Color.Orange
            }
        },
        {
            Text = "  Shotguns",
            Address = Address.Player.Skills.Shotguns,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 13,
            
            Bar =
            {
                Color = Color.Orange
            }
        },
        {
            Text = "Melee",
            Address = Address.Player.Skills.Melee,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.Red
            }
        },
        {
            Text = "Throwing",
            Address = Address.Player.Skills.Throwing,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.Red
            }
        },
        {
            Text = "Computer",
            Address = Address.Player.Skills.Computer,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.White
            }
        },
        {
            Text = "BioTech",
            Address = Address.Player.Skills.BioTech,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.White
            }
        },
        {
            Text = "Electronics",
            Address = Address.Player.Skills.Electronics,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.White
            }
        },
        {
            Text = "Reputation",
            Address = Address.Player.Skills.Reputation,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.Yellow
            }
        },
        {
            Text = "Negotiation",
            Address = Address.Player.Skills.Negotiation,
            PerChar = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.Yellow
            }
        },
    },
    
    [MenuPage.Spellbooks] =
    {
        Header = "Spellbooks",
        
        Spellbook = true,
        DefaultIndex = 2,
        
        {
            Text = "Type", Skip = true, Color = Color.Pink
        },
        {
            Text = "Slot 1",
            Address = Address.Player.Spellbook + 1,
            Spellbook = true,
            Type = DataType.Byte,
            Values = Spells
        },
        {
            Text = "Slot 2",
            Address = Address.Player.Spellbook + 3,
            Spellbook = true,
            Type = DataType.Byte,
            Values = Spells
        },
        {
            Text = "Slot 3",
            Address = Address.Player.Spellbook + 5,
            Spellbook = true,
            Type = DataType.Byte,
            Values = Spells
        },
        {
            Text = "Slot 4",
            Address = Address.Player.Spellbook + 7,
            Spellbook = true,
            Type = DataType.Byte,
            Values = Spells
        },
        {
            Text = "Slot 5",
            Address = Address.Player.Spellbook + 9,
            Spellbook = true,
            Type = DataType.Byte,
            Values = Spells
        },
        {
            Text = "Slot 6",
            Address = Address.Player.Spellbook + 11,
            Spellbook = true,
            Type = DataType.Byte,
            Values = Spells
        },
        {
            Text = "Slot 7",
            Address = Address.Player.Spellbook + 13,
            Spellbook = true,
            Type = DataType.Byte,
            Values = Spells
        },
        {
            Text = "Slot 8",
            Address = Address.Player.Spellbook + 15,
            Spellbook = true,
            Type = DataType.Byte,
            Values = Spells
        },
        {
            Text = "Slot 9",
            Address = Address.Player.Spellbook + 17,
            Spellbook = true,
            Type = DataType.Byte,
            Values = Spells
        },
        {
            Text = "Slot 10",
            Address = Address.Player.Spellbook + 19,
            Spellbook = true,
            Type = DataType.Byte,
            Values = Spells
        },
        {
            Text = "Slot 11",
            Address = Address.Player.Spellbook + 21,
            Spellbook = true,
            Type = DataType.Byte,
            Values = Spells
        },
        {
            Text = "Slot 12",
            Address = Address.Player.Spellbook + 23,
            Spellbook = true,
            Type = DataType.Byte,
            Values = Spells
        },
        {
            Text = "Slot 13",
            Address = Address.Player.Spellbook + 25,
            Spellbook = true,
            Type = DataType.Byte,
            Values = Spells
        },
        {
            Text = "Slot 14",
            Address = Address.Player.Spellbook + 27,
            Spellbook = true,
            Type = DataType.Byte,
            Values = Spells
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Level", Skip = true, Color = Color.Pink
        },
        {
            Text = "Slot 1",
            Address = Address.Player.Spellbook + 2,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 2",
            Address = Address.Player.Spellbook + 4,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 3",
            Address = Address.Player.Spellbook + 6,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 4",
            Address = Address.Player.Spellbook + 8,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 5",
            Address = Address.Player.Spellbook + 10,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 6",
            Address = Address.Player.Spellbook + 12,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 7",
            Address = Address.Player.Spellbook + 14,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 8",
            Address = Address.Player.Spellbook + 16,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 9",
            Address = Address.Player.Spellbook + 18,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 10",
            Address = Address.Player.Spellbook + 20,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 11",
            Address = Address.Player.Spellbook + 22,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 12",
            Address = Address.Player.Spellbook + 24,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 13",
            Address = Address.Player.Spellbook + 26,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 14",
            Address = Address.Player.Spellbook + 28,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Misc", Skip = true, Color = Color.Pink
        },
        {
            Text = "Total",
            Address = Address.Player.Spellbook,
            Spellbook = true,
            Type = DataType.Byte,
            Min = 0,
            Max = 13
        }
    },
    
    [MenuPage.CyberdeckStats] =
    {
        Header = "Cyberdeck - Stats",
        
        DefaultIndex = 2,
        
        {
            Text = "Base", Skip = true, Color = Color.Cyan
        },
        {
            Text = "Available",
            Address = Address.Cyberdeck.HaveDeck,
            Type = DataType.Byte,
            Enum = { "No", "Yes" }
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
            Max = 12,
            
            Bar =
            {
                Color = Color.White
            }
        },
        {
            Text = "Hardening Rating",
            Address = Address.Cyberdeck.Stats.Hardening,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.White
            }
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Memory/Storage", Skip = true, Color = Color.Cyan
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
            Text = "Stats", Skip = true, Color = Color.Cyan
        },
        {
            Text = "Body",
            Address = Address.Cyberdeck.Stats.Body,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.Red
            }
        },
        {
            Text = "Evasion",
            Address = Address.Cyberdeck.Stats.Evasion,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.Yellow
            }
        },
        {
            Text = "Masking",
            Address = Address.Cyberdeck.Stats.Masking,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.Green
            }
        },
        {
            Text = "Sensor",
            Address = Address.Cyberdeck.Stats.Sensor,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.Blue
            }
        },
        {
            Text = "Response",
            Address = Address.Cyberdeck.Stats.Response,
            Type = DataType.Byte,
            Min = 0,
            Max = 12,
            
            Bar =
            {
                Color = Color.Orange
            }
        },
    },
    
    [MenuPage.CyberdeckPrograms] =
    {
        Header = "Cyberdeck - Programs",
        
        DefaultIndex = 2,
        
        {
            Text = "Combat", Skip = true, Color = Color.Red
        },
        {
            Text = "Attack",
            Address = Address.Cyberdeck.Programs.Attack,
            Type = DataType.Byte,
            Min = 0,
            Max = 8,
            
            Bar =
            {
                Color = Color.Red
            }
        },
        {
            Text = "Slow",
            Address = Address.Cyberdeck.Programs.Slow,
            Type = DataType.Byte,
            Min = 0,
            Max = 8,
            
            Bar =
            {
                Color = Color.Red
            }
        },
        {
            Text = "Degrade",
            Address = Address.Cyberdeck.Programs.Degrade,
            Type = DataType.Byte,
            Min = 0,
            Max = 8,
            
            Bar =
            {
                Color = Color.Red
            }
        },
        {
            Text = "Rebound",
            Address = Address.Cyberdeck.Programs.Rebound,
            Type = DataType.Byte,
            Min = 0,
            Max = 8,
            
            Bar =
            {
                Color = Color.Red
            }
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Defense", Skip = true, Color = Color.Green
        },
        {
            Text = "Medic",
            Address = Address.Cyberdeck.Programs.Medic,
            Type = DataType.Byte,
            Min = 0,
            Max = 8,
            
            Bar =
            {
                Color = Color.Green
            }
        },
        {
            Text = "Shield",
            Address = Address.Cyberdeck.Programs.Shield,
            Type = DataType.Byte,
            Min = 0,
            Max = 8,
            
            Bar =
            {
                Color = Color.Green
            }
        },
        {
            Text = "Smoke",
            Address = Address.Cyberdeck.Programs.Smoke,
            Type = DataType.Byte,
            Min = 0,
            Max = 8,
            
            Bar =
            {
                Color = Color.Green
            }
        },
        {
            Text = "Mirrors",
            Address = Address.Cyberdeck.Programs.Mirrors,
            Type = DataType.Byte,
            Min = 0,
            Max = 8,
            
            Bar =
            {
                Color = Color.Green
            }
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Mask/Sense", Skip = true, Color = Color.Blue
        },
        {
            Text = "Sleaze",
            Address = Address.Cyberdeck.Programs.Sleaze,
            Type = DataType.Byte,
            Min = 0,
            Max = 8,
            
            Bar =
            {
                Color = Color.Blue
            }
        },
        {
            Text = "Deception",
            Address = Address.Cyberdeck.Programs.Deception,
            Type = DataType.Byte,
            Min = 0,
            Max = 8,
            
            Bar =
            {
                Color = Color.Blue
            }
        },
        {
            Text = "Relocation",
            Address = Address.Cyberdeck.Programs.Relocation,
            Type = DataType.Byte,
            Min = 0,
            Max = 8,
            
            Bar =
            {
                Color = Color.Blue
            }
        },
        {
            Text = "Analyze",
            Address = Address.Cyberdeck.Programs.Analyze,
            Type = DataType.Byte,
            Min = 0,
            Max = 8,
            
            Bar =
            {
                Color = Color.Blue
            }
        },
    },
    
    [MenuPage.CyberdeckDataFiles] =
    {
        Header = "Cyberdeck - Data Files",
        
        DefaultIndex = 2,
        
        {
            Text = "File Types", Skip = true, Color = Color.Cyan
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
            Text = "File Sizes", Skip = true, Color = Color.Cyan
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
            Text = "File Values", Skip = true, Color = Color.Cyan
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
    
    [MenuPage.Cyberspace] =
    {
        Header = "Cyberspace",
        
        DefaultIndex = 2,
        
        {
            Text = "ICE", Skip = true, Color = 0xFFFF0000
        },
        {
            Text = "ICE Health",
            Address = Address.Cyberspace.ICEHealth,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        
        -- TEST STUFF
        Input = function()
            if KeyPressed(Input.UseKey) then
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
    
    [MenuPage.GroupItems] =
    {
        Header = "Global - Group Items",
        
        DefaultIndex = 2,
        
        {
            Text = "Money", Skip = true, Color = Color.Yellow
        },
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
            Text = "Group Items", Skip = true, Color = Color.Yellow
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
    
    [MenuPage.Notebook] =
    {
        Header = "Global - Notebook",
        
        DefaultIndex = 2,
        
        {
            Text = "Passcodes", Skip = true, Color = Color.Cyan
        },
        {
            Text = "Set 1",
            Address = Address.Global.Notebook.Passcodes,
            Type = DataType.Byte,
            BitField = Passcodes[1],
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 2",
            Address = Address.Global.Notebook.Passcodes + 1,
            Type = DataType.Byte,
            BitField = Passcodes[2],
            Min = 0,
            Max = 255
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Known Johnsons", Skip = true, Color = Color.Yellow
        },
        {
            Text = "Set 1",
            Address = Address.Global.Notebook.KnownJohnsons,
            Type = DataType.Byte,
            BitField = KnownJohnsons,
            Min = 0,
            Max = 255
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Shadowrunners", Skip = true, Color = Color.Green
        },
        {
            Text = "Set 1",
            Address = Address.Global.Notebook.Shadowrunners,
            Type = DataType.Byte,
            BitField = Shadowrunners[1],
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 2",
            Address = Address.Global.Notebook.Shadowrunners + 1,
            Type = DataType.Byte,
            BitField = Shadowrunners[2],
            Min = 0,
            Max = 255
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Contacts", Skip = true, Color = Color.Yellow
        },
        {
            Text = "Set 1",
            Address = Address.Global.Notebook.Contacts,
            Type = DataType.Byte,
            BitField = Contacts[1],
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 2",
            Address = Address.Global.Notebook.Contacts + 1,
            Type = DataType.Byte,
            BitField = Contacts[2],
            Min = 0,
            Max = 255
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Tips & Tricks", Skip = true, Color = Color.Blue
        },
        {
            Text = "Set 1",
            Address = Address.Global.Notebook.Clues,
            Type = DataType.Byte,
            -- BitField = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 2",
            Address = Address.Global.Notebook.Clues + 1,
            Type = DataType.Byte,
            -- BitField = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 3",
            Address = Address.Global.Notebook.Clues + 2,
            Type = DataType.Byte,
            -- BitField = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 4",
            Address = Address.Global.Notebook.Clues + 3,
            Type = DataType.Byte,
            -- BitField = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 5",
            Address = Address.Global.Notebook.Clues + 4,
            Type = DataType.Byte,
            -- BitField = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 6",
            Address = Address.Global.Notebook.Clues + 5,
            Type = DataType.Byte,
            -- BitField = Clues,
            Min = 0,
            Max = 255
        }
    },
    
    [MenuPage.CurrentRun] =
    {
        Header = "Current Run",
        
        DefaultIndex = 2,
        
        {
            Text = "Basic", Skip = true, Color = Color.Yellow
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
            BitField = RunFlags,
            Min = 0,
            Max = 255
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Parameters", Skip = true, Color = Color.Yellow
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
            Type = DataType.Byte
        },
        
        Update = function()
            local runType = ReadValue(Address.CurrentRun.RunType, DataType.Byte)
            local params = { 8, 9, 10, 11, 12 }
            
            local menu = Menu[MenuPage.CurrentRun]
            local area = ReadValue(Address.CurrentRun.Area1, DataType.Byte) + 1
            local area2 = ReadValue(Address.CurrentRun.Area2, DataType.Byte) + 1
            local index = 1
            
            if runType >= RunType.GhoulBounty and runType < RunType.MatrixRun then
                if runType == RunType.GhoulBounty then
                    menu[params[index]].Text = "Area"
                elseif runType ~= RunType.Bodyguard and runType ~= RunType.Courier then
                    menu[params[index]].Text = "Destination Area"
                else
                    menu[params[index]].Text = "Source Area"
                end
                
                menu[params[index]].Skip = false
                menu[params[index]].Address = Address.CurrentRun.Area1
                menu[params[index]].Enum = Areas
                index = index + 1
                
                if runType >= RunType.Bodyguard and runType < RunType.MatrixRun then
                    if runType ~= RunType.Bodyguard and runType ~= RunType.Courier then
                        menu[params[index]].Text = "Destination Building"
                    else
                        menu[params[index]].Text = "Source Building"
                    end
                    
                    menu[params[index]].Skip = false
                    menu[params[index]].Address = Address.CurrentRun.Building1
                    menu[params[index]].Enum = Buildings[area]
                    index = index + 1
                end
                
                if runType == RunType.Bodyguard or runType == RunType.Courier then
                    menu[params[index]].Text = "Destination Area"
                    menu[params[index]].Skip = false
                    menu[params[index]].Address = Address.CurrentRun.Area2
                    menu[params[index]].Enum = Areas
                    index = index + 1
                    
                    menu[params[index]].Text = "Destination Building"
                    menu[params[index]].Skip = false
                    menu[params[index]].Address = Address.CurrentRun.Building2
                    menu[params[index]].Enum = Buildings[area2]
                    index = index + 1
                end
                
                if runType == RunType.Bodyguard or runType == RunType.Extraction then
                    menu[params[index]].Text = "Client"
                    menu[params[index]].Skip = false
                    menu[params[index]].Address = Address.CurrentRun.Client
                    menu[params[index]].Values = Clients
                    index = index + 1
                end
            elseif runType == RunType.MatrixRun then
                menu[params[index]].Text = "Matrix Run Type"
                menu[params[index]].Skip = false
                menu[params[index]].Address = Address.CurrentRun.Matrix.Type
                menu[params[index]].Enum = MatrixRunTypes
                index = index + 1
                
                menu[params[index]].Text = "System"
                menu[params[index]].Skip = false
                menu[params[index]].Address = Address.CurrentRun.Matrix.System
                menu[params[index]].Enum = Systems
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
                        if value < 0 or value > #entry.Enum - 1 then
                            WriteValue(entry.Address, entry.Type, 0)
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
        end
    }
}

function MenuInit()
    for i = 1, #Menu do
        Menu[i].Max = 0
        
        for j = 1, #Menu[i] do
            Menu[i].Max = Menu[i].Max + 1
            
            if (Menu[i][j].PerChar ~= nil and Menu[i][j].PerChar) or (Menu[i][j].Spellbook ~= nil and Menu[i][j].Spellbook) then
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
            elseif Menu[i][j].Spellbook ~= nil and Menu[i][j].Spellbook then
                Menu[i][j].Address = Menu[i][j].BaseAddress + (Menu.SpellPage * Menu.SpellOffset)
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

function FindMenuEntry(page, text)
    for i, v in ipairs(Menu[page]) do
        if v.Text ~= nil and bizstring.contains(v.Text, text) then
            return Menu[page][i]
        end
    end
    
    return nil
end
