Address =
{
    Player =
    {
        Name = 0xFF015A,            -- 0x25D3
        
        Race = 0xFF019A,            -- 0x2612
        Archetype = 0xFF019B,       -- 0x2613
        Stance = 0xFF014D,          -- 0x25C5
        
        Ammo = 0xFF014E,            -- 0x25C6
        Clips = 0xFF014F,           -- 0x25C7
        Karma = 0xFF018D,           -- 0x2605
        
        Health =
        {
            Physical = 0xFF014C,
            Mental = 0xFF019C
        },
        
        Cyberware = 0xFF0190,       -- 0x2608
        
        Equipped =
        {
            Weapon = 0xFF0157,      -- 0x25CF
            Armor = 0xFF0176,       -- 0x25EE
            Flag = 0xFF0156         -- 0x25CE
        },
        
        Inventory =
        {
            Items = 0xFF0166,       -- 0x25DE
            Values = 0xFF016E       -- 0x25E6
        },
        
        Stats =
        {
            Body = 0xFF0177,
            Quickness = 0xFF0178,
            Strength = 0xFF0179,
            Charisma = 0xFF017A,
            Intelligence = 0xFF017B,
            Willpower = 0xFF017C,
            Essence = 0xFF017E,
            Magic = 0xFF017F,
            Essence2 = 0xFF018E
        },
        
        Skills =
        {
            Sorcery = 0xFF0180,
            Firearms = 0xFF0181,
            Pistols = 0xFF0182,
            SMGs = 0xFF0183,
            Shotguns = 0xFF0184,
            Melee = 0xFF0185,
            Throwing = 0xFF0186,
            Computer = 0xFF0187,
            BioTech = 0xFF0188,
            Electronics = 0xFF0189,
            Reputation = 0xFF018A,
            Negotiation = 0xFF018B
        }
    },
    
    Cyberdeck =
    {
        HaveDeck = 0xFF018F,        -- 0x2607
        Brand = 0xFFFBCB,           -- 0x12043
        
        Programs =
        {
            Attack = 0xFFFBCC,      -- 0x12044
            Slow = 0xFFFBCD,
            Degrade = 0xFFFBCE,
            Rebound = 0xFFFBCF,
            
            Medic = 0xFFFBD0,
            Shield = 0xFFFBD1,
            Smoke = 0xFFFBD2,
            Mirrors = 0xFFFBD3,
            
            Sleaze = 0xFFFBD4,
            Deception = 0xFFFBD5,
            Relocation = 0xFFFBD6,
            Analyze = 0xFFFBD7
        },
        
        Stats =
        {
            MPCP = 0xFFFBBE,        -- 0x12036
            Hardening = 0xFFFBBF,
            Memory = 0xFFFBC0,
            Storage = 0xFFFBC2,
            LoadIOSpeed = 0xFFFBC4,
            Response = 0xFFFBC5,
            Body = 0xFFFBC6,
            Evasion = 0xFFFBC7,
            Masking = 0xFFFBC8,
            Sensor = 0xFFFBC9
        },
        
        Datafiles =
        {
            [1] = 0xFFFBE9,
            [2] = 0xFFFBE6,
            [3] = 0xFFFBE3,
            [4] = 0xFFFBE0,
            [5] = 0xFFFBDD          -- 0x12055
        }
    },
    
    Global =
    {
        Nuyen = 0xFFFBFE,           -- 0x12076
        
        GroupItems = 0xFFFC24,      -- 0x1209C
        
        Passcodes = 0xFFFC27,       -- 0x120A0
        Contacts = 0xFFFC2D,        -- 0x120A6
    },
    
    CurrentRun =
    {
        Johnson = 0xFFFBEC,         -- 0x12064
        RunType = 0xFFFBED,
        Payment = 0xFFFBF4,
        Flags = 0xFFFC1C,           -- 0x12094
        
        Area1 = 0xFFFBEE,           -- 0x12066
        Building1 = 0xFFFBEF,
        Area2 = 0xFFFBF1,
        Building2 = 0xFFFBF2,
        Client = 0xFFFBF0,
        
        Matrix =
        {
            Type = 0xFFFBEE,        -- 0x12066
            System = 0xFFFBEF
        }
    },
    
    Cyberspace =
    {
        ICEHealth = 0xFF1110
    },
    
    Misc =
    {
        RunnerTotal = 0xFFFC06      -- 0x1207E
    }
}
