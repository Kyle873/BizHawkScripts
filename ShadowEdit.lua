-- ================================================== --
--                                                    --
-- DATA                                               --
--                                                    --
-- ================================================== --

RaceEnum =
{
    "Human",
    "Elf",
    "Dwarf",
    "Orc",
    "Troll",
    "Mage"
}

ArchetypeEnum =
{
    "Mage",
    "Shaman",
    "Samurai",
    "Decker"
}

StanceEnum =
{
    "Full Defense",
    "Medium Defense",
    "Neutral",
    "Medium Offense",
    "Full Offense"
}

CyberwareFlags =
{
    {
        { Name = "Muscle Replacement (4)", Value = 1 },
        { Name = "Dermal Plating (1)", Value = 2 },
        { Name = "Dermal Plating (2)", Value = 4 },
        { Name = "Dermal Plating (3)", Value = 8 },
        { Name = "Wired Reflexes (1)", Value = 16 },
        { Name = "Wired Reflexes (2)", Value = 32 },
        { Name = "Wired Reflexes (3)", Value = 64 }
    },
    
    {
        { Name = "Datajack", Value = 1 },
        { Name = "CyberEyes", Value = 2 },
        { Name = "Hand Razors", Value = 4 },
        { Name = "Spurs", Value = 8 },
        { Name = "Smartlink", Value = 16 },
        { Name = "Muscle Replacement (1)", Value = 32 },
        { Name = "Muscle Replacement (2)", Value = 64 },
        { Name = "Muscle Replacement (3)", Value = 128 }
    }
}

WeaponEnum =
{
    "Melee",
    "Streetline Special",
    "Model 101T LP",
    "American L36 LP",
    "Security 500 LP",
    "Warhawk HP",
    "Max-Power HP",
    "Predator HP",
    "AK-97 SMG",
    "HK227-S SMG",
    "Mach 22 SMG",
    "Allegiance Shotgun",
    "Roomsweeper Shotgun",
    "Frag Grenade",
    "Scatter Grenade",
    "Concussion Grenade",
    "Medkit",
    "Stim Patch",
    "Trauma Patch",
    "Fetish",
    "Maglock Passkey",
    "Electronic Kit",
}

WeaponFlags =
{
    { Name = "Weapon", Value = 0 },
    { Name = "Other", Value = 2 },
    { Name = "Melee", Value = 127 },
    { Name = "Spell", Value = 255 }
}

SpellEnum =
{
    "Empty",
    "Flame Dart",
    "Flame Bolt",
    "Hellblast",
    "Invisibility",
    "Sleep",
    "Stink",
    "Super Barrier",
    "Mana Zap",
    "Mana Blast",
    "Mana Storm",
    "Rockskin",
    "Heal Wounds",
    "Confusion",
    "Barrier"
}

SpellValues =
{
    { Name = "Flame Dart", Value = 0 },
    { Name = "Flame Bolt", Value = 1 },
    { Name = "Hellblast", Value = 2 },
    { Name = "Invisibility", Value = 3 },
    { Name = "Sleep", Value = 4 },
    { Name = "Stink", Value = 5 },
    { Name = "Super Barrier", Value = 6 },
    { Name = "Mana Zap", Value = 7 },
    { Name = "Mana Blast", Value = 8 },
    { Name = "Mana Storm", Value = 9 },
    { Name = "Rockskin", Value = 10 },
    { Name = "Heal Wounds", Value = 11 },
    { Name = "Confusion", Value = 12 },
    { Name = "Barrier", Value = 13 },
    { Name = "Empty", Value = 255 }
}

ArmorEnum =
{
    "None",
    "Armor Vest",
    "Armor Clothing",
    "Armor Jacket",
    "Vest With Plates",
    "Lined Duster",
    "Light Combat Armor",
    "Heavy Combat Armor"
}

ItemEnum =
{
    "Nothing",
    "Streetline Special",
    "Model 101T LP",
    "American L36 LP",
    "Security 500 LP",
    "Warhawk HP",
    "Max-Power HP",
    "Predator HP",
    "AK-97 SMG",
    "HK227-S SMG",
    "Mach 22 SMG",
    "Allegiance Shotgun",
    "Roomsweeper Shotgun",
    "Frag Grenade",
    "Scatter Grenade",
    "Concussion Grenade",
    "Medkit",
    "Stim Patch",
    "Trauma Patch",
    "Fetish",
    "Maglock Passkey",
    "Electronic Kit",
    "Smart Goggles",
    "Enchanted Dagger",
    "Power Focus",
    "Flame Dart SF",
    "Flame Bolt SF",
    "Hellblast SF",
    "Invisibility SF",
    "Sleep SF",
    "Stink SF",
    "Super Barrier SF",
    "Mana Zap SF",
    "Mana Blast SF",
    "Mana Storm SF",
    "Rockskin SF",
    "Heal Wounds SF",
    "Confusion SF",
    "Barrier SF",
    "Protection Talisman",
    "Combat Sense Spell Lock",
    "Rat Totem",
    "Gator Totem",
    "Bear Totem",
    "Armor Vest",
    "Armor Clothing",
    "Armor Jacket",
    "Vest With Plates",
    "Lined Duster",
    "Light Combat Armor",
    "Heavy Combat Armor"
}

ItemMax =
{
    0,  -- Nothing/Melee
    6,  -- Streetline Special
    12, -- Model 101T LP
    11, -- American L36 LP
    25, -- Security 500 LP
    6,  -- Warhawk HP
    10, -- Max-Power HP
    15, -- Predator HP
    30, -- AK-97 SMG
    28, -- HK227-S SMG
    24, -- Mach 22 SMG
    5,  -- Allegiance Shotgun
    8,  -- Roomsweeper Shotgun
    6,  -- Frag Grenade
    6,  -- Scatter Grenade
    6,  -- Concussion Grenade
    6,  -- Medkit
    6,  -- Stim Patch
    6,  -- Trauama Patch
    10, -- Fetish
    5,  -- MagLock Passkey
    0,  -- Electronic Kit
    0,  -- Smart Goggles
    0,  -- Enchanted Dagger
    4,  -- Power Focus
    4,  -- Spell Foci (14)
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,  -- Protection Talisman
    4,  -- Combat Sense Spell Lock
    0,  -- Rat Totem
    0,  -- Gator Totem
    0,  -- Bear Totem
    0,  -- Armor (7)
    0,
    0,
    0,
    0,
    0,
    0
}

AttachmentFlags =
{
    { Name = "SmartLink", Value = 1 },
    { Name = "Silencer", Value = 2 },
    { Name = "Sound Suppressor", Value = 4 },
    { Name = "Laser Sight", Value = 8 },
    { Name = "Gas Vent II", Value = 16 },
    { Name = "Gas Vent III", Value = 32 }
}

GroupItemsFlags =
{
    {
        { Name = "Map Overlay", Value = 1 },
        { Name = "Package for Current Run", Value = 2 },
        { Name = "Security Pass", Value = 4 },
        { Name = "Weapon Permit", Value = 8 },
        { Name = "Eye-Fiver Ear Cuff", Value = 16 },
        { Name = "Halloweener Patch", Value = 32 },
        { Name = "Ork Armband", Value = 64 },
    },
    
    {
        { Name = "Prototype Cyber-Heart", Value = 1 },
        { Name = "Indian Lands Visa", Value = 2 },
        { Name = "Feathered Scale", Value = 4 },
        { Name = "Hell Hound Pelt", Value = 8 },
        { Name = "Gargoyle Horn", Value = 16 },
        { Name = "Gift for Lady Gillian", Value = 32 },
        { Name = "Gift for Red Buffalo Woman", Value = 64 },
        { Name = "Landmark Map", Value = 128 },
    }
}

CyberdeckValues =
{
    { Name = "Cyber Shack PCD-500", Value = 0 },
    { Name = "Fuchi Cyber-5", Value = 1 },
    { Name = "Sega CTY-360", Value = 2 },
    { Name = "Fuchi Cyber-7", Value = 3 },
    { Name = "Fairlight Excalibur", Value = 4 },
    { Name = "Allegiance Alpha", Value = 5 },
    { Name = "None", Value = 255 }
}

DatafileValues =
{
    { Name = "Back-up Files", Value = 0 },
    { Name = "Archived Files", Value = 1 },
    { Name = "Canceled Accounts", Value = 2 },
    { Name = "History Data", Value = 3 },
    { Name = "Canceled Passwords", Value = 4 },
    { Name = "System Usage Report", Value = 5 },
    { Name = "System Activity", Value = 6 },
    { Name = "Access Request Log", Value = 7 },
    { Name = "E-mail Data", Value = 8 },
    { Name = "Routing Requests", Value = 9 },
    { Name = "Bank Acct. Numbers", Value = 10 },
    { Name = "Corporate Profile", Value = 11 },
    { Name = "Personnel Dossiers", Value = 12 },
    { Name = "Employee Scheduling", Value = 13 },
    { Name = "Client Information", Value = 14 },
    { Name = "Project Records", Value = 15 },
    { Name = "Open Project Data", Value = 16 },
    { Name = "Project Expense Report", Value = 17 },
    { Name = "Project Requisition", Value = 18 },
    { Name = "Project Utilities", Value = 19 },
    { Name = "Security Records", Value = 20 },
    { Name = "Contact Dossiers", Value = 21 },
    { Name = "Surveillance Data", Value = 22 },
    { Name = "Equipment Permits", Value = 23 },
    { Name = "Lone Star Reports", Value = 24 },
    { Name = "Archived Files", Value = 25 },
    { Name = "Project Folders", Value = 26 },
    { Name = "Closed Projects", Value = 27 },
    { Name = "Project Expense Report", Value = 28 },
    { Name = "Failed Prototypes", Value = 29 },
    { Name = "Competitor Profiles", Value = 30 },
    { Name = "Competitor Products", Value = 31 },
    { Name = "Competitor Marketing", Value = 32 },
    { Name = "Competitor Security", Value = 33 },
    { Name = "Competitor Budgets", Value = 34 },
    { Name = "Sales Information", Value = 35 },
    { Name = "Public Relations", Value = 36 },
    { Name = "Customer Files", Value = 37 },
    { Name = "Advertising Info", Value = 38 },
    { Name = "Marketing Report", Value = 39 },
    { Name = "Entertainment Data", Value = 40 },
    { Name = "Educational Data", Value = 41 },
    { Name = "BTL Data", Value = 42 },
    { Name = "Experimental Data", Value = 43 },
    { Name = "Toxic Data", Value = 44 },
    { Name = "Bank Acct. Numbers", Value = 45 },
    { Name = "Corporate Account", Value = 46 },
    { Name = "Local Accounts", Value = 47 },
    { Name = "Security Expenses", Value = 48 },
    { Name = "Capital Expidenture", Value = 49 },
    { Name = "Long Range Goals", Value = 50 },
    { Name = "Shadowrun Information", Value = 51 },
    { Name = "Strike Team Orders", Value = 52 },
    { Name = "Blackmail Information", Value = 53 },
    { Name = "Prototype Blueprint", Value = 54 },
    { Name = "Domestic Law", Value = 55 },
    { Name = "International Law", Value = 56 },
    { Name = "Tribal Law", Value = 57 },
    { Name = "Pending Lawsuits", Value = 58 },
    { Name = "Contact Dossiers", Value = 59 },
    { Name = "Current Inmates", Value = 60 },
    { Name = "Previous Inmates", Value = 61 },
    { Name = "Psychiatric Reports", Value = 62 },
    { Name = "Parole Files", Value = 63 },
    { Name = "Contact Dossiers", Value = 64 },
    { Name = "Open Case Files", Value = 65 },
    { Name = "Closed Case Files", Value = 66 },
    { Name = "Equipment Permits", Value = 67 },
    { Name = "Outstanding Warrants", Value = 68 },
    { Name = "Unsolved Cases", Value = 69 },
    { Name = "None", Value = 255 }
}

CyberspaceAlertLevelValues =
{
    { Name = "Passive", Value = 0 },
    { Name = "Active", Value = 1 },
    { Name = "None", Value = 255 }
}

CyberspaceNodeColorEnum =
{
    "White",
    "Blue",
    "Green",
    "Orange",
    "Red"
}

CyberspaceICETypeEnum =
{
    "Access",
    "Barrier",
    "Killer",
    "Blaster",
    "BlackIce",
    "Trace & Dump",
    "Trace & Burn",
    "Access / Trace & Dump",
    "Access / Trace & Burn",
    "Barrier / Trace & Dump",
    "Barrier / Trace & Burn",
    "Access / Killer",
    "Access / Blaster",
    "Access / BlackIce",
    "Barrier / Killer",
    "Barrier / Blaster",
    "Barrier / BlackIce",
    "Access / Tar Paper",
    "Access / Tar Pit",
    "Barrier / Tar Paper",
    "Barrier / Tar Pit",
    "Killer / Tar Paper",
    "Killer / Tar Pit",
    "Blaster / Tar Paper",
    "Blaster / Tar Pit",
    "BlackIce / Tar Paper",
    "BlackIce / Tar Pit",
    "Access / Access",
    "Barrier / Barrier",
    "Killer / Killer",
    "Blaster / Blaster",
    "Tar Paper / Tar Paper",
    "Access / Access"
}

PasscodesFlags =
{
    {
        { Name = "Renraku", Value = 1 },
        { Name = "Fuchi", Value = 2 },
        { Name = "Lone Star", Value = 4 },
        { Name = "Ito's Passcode", Value = 8 }
    },
    
    {
        { Name = "Run Passcode", Value = 1 },
        { Name = "Aztechnology", Value = 2 },
        { Name = "Club Penumbra", Value = 4 },
        { Name = "Seattle General Hospital", Value = 8 },
        { Name = "Ares", Value = 16 },
        { Name = "Gates Undersound", Value = 32 },
        { Name = "Hollywood Correctional Facility", Value = 64 },
        { Name = "Mitsuhama", Value = 128 }
    }
}

JohnsonFlags =
{
    { Name = "Mr. Gunderson", Value = 1 },
    { Name = "Julius Strouther", Value = 2 },
    { Name = "Mortimer Reed", Value = 4 },
    { Name = "Vigore and Jarl", Value = 8 },
    { Name = "Caleb Brightmore", Value = 16 }
}

JohnsonValues =
{
    { Name = "Mr. Gunderson", Value = 0 },
    { Name = "Julius Strouther", Value = 1 },
    { Name = "Mortimer Reed", Value = 2 },
    { Name = "Vigore and Jarl", Value = 3 },
    { Name = "Caleb Brightmore", Value = 4 },
    { Name = "None", Value = 255 }
}

ShadowrunnersFlags =
{
    {
        { Name = "Rianna Heartbane", Value = 1 },
        { Name = "Stark", Value = 2 },
    },
    
    {
        { Name = "Ricky", Value = 1 },
        { Name = "Winston Mars", Value = 2 },
        { Name = "Trent Delisario", Value = 4 },
        { Name = "Petr Uvehr", Value = 8 },
        { Name = "Walking Bear", Value = 16 },
        { Name = "Phantom", Value = 32 },
        { Name = "Ilene Two Fists", Value = 64 },
        { Name = "Freya Goldenhair", Value = 128 }
    }
}

ContactsFlags =
{
    {
        { Name = "Agira Tetsumi", Value = 1 },
        { Name = "Henry J. Culver", Value = 2 },
        { Name = "Max", Value = 4 },
        { Name = "Sgt. Chillicut", Value = 8 },
        { Name = "Prof. Jefferson", Value = 16 }
    },
    
    {
        { Name = "Capt Quinton Jaymes", Value = 1 },
        { Name = "Alesandro Hobbs", Value = 2 },
        { Name = "Sharkey", Value = 4 },
        { Name = "Kipp David", Value = 8 },
        { Name = "Wilma Temmenhoff", Value = 16 },
        { Name = "Sgt. Macklemann", Value = 32 },
        { Name = "Gregory Wilns", Value = 64 },
        { Name = "Mr. Faradouchi", Value = 128 }
    }
}

RunType =
{
    GhoulBounty = 0,
    Bodyguard = 1,
    Courier = 2,
    Enforcement = 3,
    Acquisition = 4,
    Extraction = 5,
    MatrixRun = 6,
    None = 255
}

RunTypeValues =
{
    { Name = "Ghoul Bounty", Value = 0 },
    { Name = "Bodyguard", Value = 1 },
    { Name = "Courier", Value = 2 },
    { Name = "Enforcement", Value = 3 },
    { Name = "Acquisition", Value = 4 },
    { Name = "Extraction", Value = 5 },
    { Name = "Matrix Run", Value = 6 },
    { Name = "None", Value = 255 }
}

EnforcementRunTypeEnum =
{
    "Defacing and damaging buildings",
    "Feeding Renraku a lot of information",
    "Terrorizing locals",
    "Payments are late"
}

MatrixRunTypeEnum =
{
    "Get a high security data file",
    "Get a list of their security contacts",
    "Get a copy of their archived files",
    "Get into confidential files and get a copy of their Strike Team orders",
    "Get proof of this activity",
    "Get a copy of the code",
    "Delete that information in their confidential files",
    "Get a copy of their personnel record from their management data store",
    "Get the name of the band and their agent from their marketing data store",
    "Get a finance file on security expidentures",
    "Crash the CPU as a distraction",
    "Get a list of current inmates, probably for Hollywood runs only",
    "Get a copy of their project logs",
    "Get a copy of their outdated history data",
    "Get a copy of the data collected",
    "Get information on this",
    "Delete the case file",
    "Get into the financial data store and upload a doctored file",
    "Upload the bogus file into their management data store",
    "Upload the file",
    "Crash the CPU"
}

RunFlags =
{
    { Name = "Matrix Run Complete", Value = 80 }
}

AreaEnum =
{
    "Downtown Seattle",
    "Puyallup Barrens",
    "Redmond Barrens",
    "Penumbra District",
    "Council Island",
    "Renraku Arcology",
    "AmerIndian Lands"
}

BuildingEnum =
{
    {
        "Seattle Gen. Hospital",
        "Icarus Descending",
        "Matchsticks",
        "Gates Undersound",
        "Mitsuhama Computer Technologies",
        "Fuchi's local office",
        "Space Needle",
        "Roscoe the Fixer",
        "???"
    },
    
    {
        "The Wanderer",
        "Tarislar City Inn",
        "Ares' Corporate Offices",
        "Riannon's",
        "Underground 93",
        "Crime Mall",
        "Dr. Bob's Quickstitch",
        "Tarislar Garden Apartment Complex",
        "???",
        "Ork Gang"
    },
    
    {
        "Hollywood Correctional Facilities",
        "Little Chiba",
        "Stoker's Coffin Motel",
        "Shiawase Nuke Plant",
        "Jump House",
        "Jackal's Lantern",
        "Boris' Greenhouse",
        "Rat's Nest",
        "???",
        "Halloweeners",
        "???",
        "Ares Weapon Emporium"
    },
    
    {
        "Club Penumbra",
        "Wylie's Gala Inn",
        "Fuchi Industrial Electronics",
        "Mitsuhama's local office",
        "Eye Fivers",
        "Big Rhino",
        "Lone Star Security"
    },
    
    {
        "Council Island Inn",
        "Friendship Restaurant",
        "Passport Lodge",
        "Medicine Lodge Hollow",
        "Council Island Hospital",
        "Ork Embassy"
    },
    
    {
        "???",
        "Frag Grenade",
        "Wire-Masters",
        "Merlin's Lore",
        "Microtronics",
        "Weapons World",
        "Renraku Offices"
    },
    
    {
        "???"
    }
}

ClientValues =
{
    { Name = "Mike Nana", Value = 0 },
    { Name = "John Worley", Value = 1 },
    { Name = "Ellis Goodson", Value = 2 },
    { Name = "John Van Anthony", Value = 3 },
    { Name = "Dok Whitson", Value = 4 },
    { Name = "Jase Weese", Value = 5 },
    { Name = "Heinrich Micheals", Value = 6 },
    { Name = "Billy Gibson", Value = 7 },
    { Name = "Nero Manser", Value = 8 },
    { Name = "Alan Turing", Value = 9 },
    { Name = "Chris Stout", Value = 10 },
    { Name = "Jorge Kish", Value = 11 },
    { Name = "None", Value = 255 }
}

SystemEnum =
{
    "Aztechnology",
    "Club Penumbra",
    "Seattle Gen. Hospital",
    "Ares",
    "Gates Undersound",
    "Hollywood (Correctional Facilities)",
    "Mitsuhama",
    "Renraku",
    "Fuchi",
    "Lone Star",
    "Ito's Passcode (Ito's System)",
    "A local office",
    "A corporate branch office",
    "A small R&D firm",
    "A new local company",
    "A local retail business",
    "A local corporate office",
    "A local shipping warehouse",
    "A legal firm",
    "A local stuffer shack",
    "A local SimSense company",
    "A local coffin hotel",
    "The Mayor's office",
    "A SimSense corporation",
    "UCAS Federal Government"
}

-- ================================================== --
--                                                    --
-- COLORS                                             --
--                                                    --
-- ================================================== --

Color =
{
    Text            = 0xFFFFFFFF,
    Highlight       = 0xFF00E000,
    Frozen          = 0xFFE0E000,
    HighlightFrozen = 0xFF00E0E0,
    Header          = 0xFF00FF00,
    Background      = 0xAF004F00,
    Outline         = 0xAF00FF00,
    
    Transparent     = 0x00000000,
    Black           = 0xFF000000,
    Red             = 0xFFFF0000,
    Orange          = 0xFFFF7F00,
    Yellow          = 0xFFFFFF00,
    Green           = 0xFF00FF00,
    Blue            = 0xFF007FFF,
    Cyan            = 0xFF00FFFF,
    Purple          = 0xFFFF00FF,
    Pink            = 0xFFFF7FFF,
    White           = 0xFFFFFFFF
}

-- ================================================== --
--                                                    --
-- ADDRESSES                                          --
--                                                    --
-- ================================================== --

Address =
{
    Player =
    {
        Name = 0x0158,
        
        Race = 0x019A,
        Archetype = 0x019B,
        Stance = 0x014D,
        
        Ammo = 0x014E,
        Clips = 0x014F,
        Karma = 0x018D,
        
        Health =
        {
            Physical = 0x014C,
            Mental = 0x019C
        },
        
        Cyberware = 0x0190,
        
        Equipped =
        {
            Weapon = 0x0157,
            Armor = 0x0176,
            Flag = 0x0156
        },
        
        Inventory =
        {
            Items = 0x0166,
            Values = 0x016E
        },
        
        Attributes =
        {
            Body = 0x0177,
            Quickness = 0x0178,
            Strength = 0x0179,
            Charisma = 0x017A,
            Intelligence = 0x017B,
            Willpower = 0x017C,
            Essence = 0x017E,
            Magic = 0x017F,
            Essence2 = 0x018E
        },
        
        Skills =
        {
            Sorcery = 0x0180,
            Firearms = 0x0181,
            Pistols = 0x0182,
            SMGs = 0x0183,
            Shotguns = 0x0184,
            Melee = 0x0185,
            Throwing = 0x0186,
            Computer = 0x0187,
            BioTech = 0x0188,
            Electronics = 0x018A,
            Reputation = 0x018B,
            Negotiation = 0x018C
        },
        
        Spellbook = 0xF9FB,
        
        Group =
        {
            Nuyen = 0xFBFE,
            Items = 0xFC24,
        },
        
        Position =
        {
            X = 0x0100,
            Y = 0x0104
        },
        
        CriminalRecord = 0xFBFA
    },
    
    Cyberdeck =
    {
        HaveDeck = 0x018F,
        Brand = 0xFBCB,
        
        Programs =
        {
            Attack = 0xFBCC,
            Slow = 0xFBCD,
            Degrade = 0xFBCE,
            Rebound = 0xFBCF,
            
            Medic = 0xFBD0,
            Shield = 0xFBD1,
            Smoke = 0xFBD2,
            Mirrors = 0xFBD3,
            
            Sleaze = 0xFBD4,
            Deception = 0xFBD5,
            Relocation = 0xFBD6,
            Analyze = 0xFBD7
        },
        
        Stats =
        {
            MPCP = 0xFBBE,
            Hardening = 0xFBBF,
            Memory = 0xFBC0,
            Storage = 0xFBC2,
            LoadIOSpeed = 0xFBC4,
            Response = 0xFBC5,
            Body = 0xFBC6,
            Evasion = 0xFBC7,
            Masking = 0xFBC8,
            Sensor = 0xFBC9
        },
        
        Datafiles =
        {
            [1] = 0xFBE9,
            [2] = 0xFBE6,
            [3] = 0xFBE3,
            [4] = 0xFBE0,
            [5] = 0xFBDD
        }
    },
    
    Cyberspace =
    {
        AlertLevel = 0xF0A0,
        
        NodeColor = 0x0119,
        NodeLevel = 0x011A,
        ICEIntegrity = 0x0123,
        ICESpeed = 0x0124,
        ICELevel1 = 0x0125,
        ICELevel2 = 0x0126,
        ICEType = 0x0127
    },
        
    Notebook =
    {
        Passcodes = 0xFC28,
        KnownJohnsons = 0xFC27,
        Shadowrunners = 0xFC2A,
        Contacts = 0xFC2E,
        Clues = 0xFC30,
    },
        
    Ped =
    {
        X = 0x0400,
        Y = 0x0404,
        Health = 0x044C,
        Name = 0x0458
    },
    
    CurrentRun =
    {
        Johnson = 0xFBEC,
        RunType = 0xFBED,
        Payment = 0xFBF4,
        Karma = 0xFBF3,
        Flags = 0xFC1C,
        Counter = 0xFBF1,
        
        Area1 = 0xFBEE,
        Building1 = 0xFBEF,
        Area2 = 0xFBF1,
        Building2 = 0xFBF2,
        Other = 0xFBF0,
        
        Matrix =
        {
            Type = 0xFBEE,
            System = 0xFBEF
        }
    },
    
    Misc =
    {
        RunnerTotal = 0xFC06,
        DebugMenu = 0xF101
    }
}

-- ================================================== --
--                                                    --
-- STRUCTURES                                         --
--                                                    --
-- ================================================== --

Structure =
{
    Runner =
    {
        NameAddress = Address.Player.Name,
        Offset = 0x100,
        Max = 3,
        
        Get = function()
            return Menu.Runner
        end,
        
        Set = function(value)
            Menu.Runner = value
        end,
        
        HeaderText = function(self)
            local function ReadName()
                local name = ""
                
                for i = 0, 12 do
                    local char = ReadValue((self.NameAddress + (self.Get() * self.Offset)) + i, DataType.Byte)
                    
                    if char > 0x20 then
                        name = name .. string.char(char)
                    end
                end
                
                return bizstring.trim(name) or ""
            end
            
            if string.len(ReadName()) > 0 then
                return " [" .. ReadName() .. "] (" .. self.Get() + 1 .. "/" .. self.Max .. ")"
            else
                return " [<Empty>] (" .. self.Get() + 1 .. "/" .. self.Max .. ")"
            end
        end
    },
    
    Spellbook =
    {
        Offset = 0x22,
        Max = 5,
        
        Get = function()
            return Menu.SpellPage
        end,
        
        Set = function(value)
            Menu.SpellPage = value
        end,
        
        HeaderText = function(self)
            local Names =
            {
                "Ricky",
                "Trent",
                "Walking Bear",
                "Freya",
                "Joshua"
            }
            
            return " [" .. Names[self.Get() + 1] .. "] (" .. self.Get() + 1 .. "/" .. self.Max .. ")"
        end
    },
    
    CyberspaceNode =
    {
        Offset = 0x50,
        Max = 5,
        
        Get = function()
            return Menu.CyberspacePage
        end,
        
        Set = function(value)
            Menu.CyberspacePage = value
        end,
        
        HeaderText = function(self)
            return " (" .. self.Get() + 1 .. "/" .. self.Max .. ")"
        end
    },
    
    Ped =
    {
        NameAddress = Address.Ped.Name,
        Offset = 0x100,
        Max = 19,
        
        Get = function()
            return Menu.PedPage
        end,
        
        Set = function(value)
            Menu.PedPage = value
        end,
        
        HeaderText = function(self)
            local function ReadName()
                local name = ""
                
                for i = 0, 12 do
                    local char = ReadValue((self.NameAddress + (self.Get() * self.Offset)) + i, DataType.Byte)
                    
                    if i == 0 then
                        char = char - 0x20
                    end
                    
                    if char > 0x20 then
                        name = name .. string.char(char)
                    end
                end
                
                return string.trim(name)
            end
            
            if string.len(ReadName()) > 0 then
                return " [" .. ReadName() .. "] (" .. self.Get() + 1 .. "/" .. self.Max .. ")"
            else
                return " [<Empty>] (" .. self.Get() + 1 .. "/" .. self.Max .. ")"
            end
        end
    }
}

-- ================================================== --
--                                                    --
-- UTILITY                                            --
--                                                    --
-- ================================================== --

function ColorPulse(color, mult, time, offset)
    time = time or 256
    offset = offset or 0
    
    local mod = math.sin(emu.framecount() / time + offset) * mult
    local a = bit.rshift(bit.band(color, 0xFF000000), 24)
    local r = bit.rshift(bit.band(color, 0x00FF0000), 16) + mod
    local g = bit.rshift(bit.band(color, 0x0000FF00), 8) + mod
    local b = bit.band(color, 0x000000FF) + mod
    
    if r < 0 then r = 0 elseif r > 255 then r = 255 end
    if g < 0 then g = 0 elseif g > 255 then g = 255 end
    if b < 0 then b = 0 elseif b > 255 then b = 255 end
    
    return bit.lshift(a, 24) + bit.lshift(r, 16) + bit.lshift(g, 8) + b
end

function ColorRainbow()
    local r = math.sin(emu.framecount() / 64) * 127 + 128
    local g = math.sin((emu.framecount() / 64) + 2) * 127 + 128
    local b = math.sin((emu.framecount() / 64) + 4) * 127 + 128
    
    return bit.lshift(255, 24) + bit.lshift(r, 16) + bit.lshift(g, 8) + b
end

function IsSpell()
    if ReadValue(Address.Player.Equipped.Flag + (Menu.Runner * Structure.Runner.Offset), DataType.Byte) == 0xFF then
        return true
    else
        return false
    end
end

function GetDatafilesValue()
    local total = 0
    
    for i = 1, 5 do
        local address = Address.Cyberdeck.Datafiles[i]
        local size = ReadValue(address + 1, DataType.Byte)
        local value = ReadValue(address + 2, DataType.Byte)
        local amount = 0
        
        if value ~= 0xFF then
            amount = size * 5
            amount = amount * value
            
            total = total + amount
        end
    end
    
    return total
end

function SellDatafiles()
    local nuyen = ReadValue(Address.Player.Group.Nuyen, DataType.Long)
    local total = GetDatafilesValue()
    
    for i = 1, 5 do
        local address = Address.Cyberdeck.Datafiles[i]
        
        if value ~= 0xFF then
            WriteValue(address, DataType.Byte, 0xFF)
            WriteValue(address + 1, DataType.Byte, 0)
            WriteValue(address + 2, DataType.Byte, 0)
        end
    end
    
    WriteValue(Address.Player.Group.Nuyen, DataType.Long, nuyen + total)
    
    NewMessage("Datafiles Cashed: " .. total .. " Nuyen Earned (" .. nuyen + total .. " Total)", 300, Color.Yellow)
end

function AddCHERNOBYLPasscode()
    local flags = ReadValue(Address.Notebook.Clues + 8, DataType.Byte)
    
    flags = bit.set(flags, 2) -- ------B--
    flags = bit.set(flags, 3) -- ----N---L
    flags = bit.set(flags, 4) -- C----O---
    flags = bit.set(flags, 5) -- -H-R-----
    flags = bit.set(flags, 6) -- --E----Y-
    
    flags = bit.clear(flags, 7) -- Completed
    
    WriteValue(Address.Notebook.Clues + 8, DataType.Byte, flags)
    
    NewMessage("CHERNOBYL passcode has been added", 300, Color.Cyan)
end

-- TODO
function GenerateRun()
    local function BuildingValid(a1, a2, b1, b2)
        if (a1 == a2 and b1 == b2) or BuildingEnum[a1][b1] == "???" or BuildingEnum[a2][b2] == "???" then
            return false
        end
        
        return true
    end
    
    local function CalculatePayment(type, negotiation, difficulty)
        local payment = 0
        local karma = 0
        
        if type == RunType.GhoulBounty then
            payment = 40 + math.floor(math.random(0, negotiation / 2) * 5)
            karma = 2
        elseif type == RunType.Bodyguard then
            payment = 200 + math.floor(math.random(0, negotiation / 2) * 5)
            karma = 2
        elseif type == RunType.Courier then
            payment = 180 + math.floor(math.random(0, negotiation / 2) * 5)
            karma = 2
        elseif type == RunType.Enforcement then
            payment = 300 + math.floor(math.random(0, negotiation / 2) * 5)
            karma = 2
        elseif type == RunType.Acquisition then
        elseif type == RunType.Extraction then
        elseif type == RunType.MatrixRun then
        end
        
        if type >= RunType.Bodyguard and type < RunType.MatrixRun and not bit.check(ReadValue(Address.Player.Group.Items, DataType.Byte), 6) then
            payment = payment + 50
        end
        
        return payment, karma
    end
    
    local difficulties =
    {
        "Basic",
        "Moderate",
        "Expert"
    }
    
    local charisma = ReadValue(Address.Player.Attributes.Charisma, DataType.Byte)
    local negotiation = ReadValue(Address.Player.Skills.Negotiation, DataType.Byte)
    local johnson = math.random(1, #JohnsonValues - 1)
    local difficulty = math.random(1, #difficulties)
    local type = math.random(0, 3) -- #RunType - 1
    local payment = 0
    local karma = 0
    local area1 = 1
    local area2 = 1
    local building1 = 1
    local building2 = 1
    local other = 255
    local message = "New Shadowrun!\n \n"
    
    message = message .. "Johnson: " .. JohnsonValues[johnson].Name .. "\n \n"
    message = message .. "Type: " .. tostring(RunTypeValues[type + 1].Name) .. "\n"
    
    if type == RunType.GhoulBounty then
        repeat
            area1 = math.random(1, #AreaEnum - 1)
        until area1 ~= #AreaEnum - 2
        
        message = message .. "Area: " .. AreaEnum[area1] .. "\n"
    elseif type == RunType.Bodyguard or type == RunType.Courier then
        repeat
            area1 = math.random(1, #AreaEnum - 1)
            area2 = math.random(1, #AreaEnum - 1)
            building1 = math.random(1, #BuildingEnum[area1])
            building2 = math.random(1, #BuildingEnum[area2])
        until BuildingValid(area1, area2, building1, building2)
        
        if type == RunType.Bodyguard then
            other = math.random(1, #ClientValues - 1)
        end
        
        message = message .. "Pickup Area: " .. AreaEnum[area1] .. "\n"
        message = message .. "Pickup Building: " .. BuildingEnum[area1][building1] .. "\n"
        message = message .. "Destination Area: " .. AreaEnum[area2] .. "\n"
        message = message .. "Destination Building: " .. BuildingEnum[area2][building2] .. "\n"
        if type == RunType.Bodyguard then
            message = message .. "Client: " .. ClientValues[other].Name .. "\n"
        end
    elseif type == RunType.Enforcement then
        local targets =
        {
            { Area = 3, Building = 10 }, -- Halloweeners
            { Area = 4, Building = 5 },  -- Eye-Fivers
            { Area = 2, Building = 10 }   -- Ork Gang
        }
        
        local target = math.random(1, #targets)
        
        area1 = targets[target].Area
        building1 = targets[target].Building
        other = math.random(1, #EnforcementRunTypeEnum)
        
        message = message .. "Destination Area: " .. AreaEnum[area1] .. "\n"
        message = message .. "Destination Building: " .. BuildingEnum[area1][building1] .. "\n"
        message = message .. "Reason: " .. EnforcementRunTypeEnum[other] .. "\n"
    elseif type == RunType.Acquisition or type == RunType.Extraction then
    elseif type == RunType.MatrixRun then
    end
    
    payment, karma = CalculatePayment(type, negotiation, difficulty)
    
    message = message .. " \nPayment: " .. tostring(payment) .. " Nuyen\n"
    message = message .. "Karma: " .. tostring(karma) .. "\n"
    
    WriteValue(Address.CurrentRun.Johnson, DataType.Byte, johnson - 1)
    WriteValue(Address.CurrentRun.RunType, DataType.Byte, type)
    WriteValue(Address.CurrentRun.Payment, DataType.Word, payment)
    WriteValue(Address.CurrentRun.Karma, DataType.Byte, karma)
    WriteValue(Address.CurrentRun.Flags, DataType.Byte, 0)
    WriteValue(Address.CurrentRun.Counter, DataType.Byte, 0)
    WriteValue(Address.CurrentRun.Area1, DataType.Byte, area1 - 1)
    WriteValue(Address.CurrentRun.Area2, DataType.Byte, area2 - 1)
    WriteValue(Address.CurrentRun.Building1, DataType.Byte, building1 - 1)
    WriteValue(Address.CurrentRun.Building2, DataType.Byte, building2 - 1)
    WriteValue(Address.CurrentRun.Other, DataType.Byte, other - 1)
    
    -- NewMessage(message, 300, Color.Green, Color.Black, Message.Type.Large)
end

-- ================================================== --
--                                                    --
-- MEMORY                                             --
--                                                    --
-- ================================================== --

DataType =
{
    Byte = 1,
    Word = 2,
    Long = 3
}

function ReadValue(address, type)
    if type == DataType.Byte then
        return memory.readbyte(address)
    elseif type == DataType.Word then
        return memory.read_s16_be(address)
    elseif type == DataType.Long then
        return memory.read_s32_be(address)
    end
end

function WriteValue(address, type, value)
    if type == DataType.Byte then
        memory.writebyte(address, value)
    elseif type == DataType.Word then
        memory.write_s16_be(address, value)
    elseif type == DataType.Long then
        memory.write_s32_be(address, value)
    end
end

function WriteValueRelative(address, type, amount, min, max)
    local value = nil
    
    min = min or nil
    max = max or nil
    
    if type == DataType.Byte then
        value = memory.readbyte(address)
    elseif type == DataType.Word then
        value = memory.read_s16_be(address)
    elseif type == DataType.Long then
        value = memory.read_s32_be(address)
    end
    
    value = value + amount
    
    if min ~= nil and max ~= nil then
        if value < min then
            value = max
        end
        if value > max then
            value = min
        end
    end
    
    if type == DataType.Byte then
        memory.writebyte(address, value)
    elseif type == DataType.Word then
        memory.write_s16_be(address, value)
    elseif type == DataType.Long then
        memory.write_s32_be(address, value)
    end
end

-- ================================================== --
--                                                    --
-- INPUT                                              --
--                                                    --
-- ================================================== --

Input =
{
    Current = {},
    Previous = {},
    Clear =
    {
        Up = false,
        Down = false,
        Left = false,
        Right = false,
        A = false,
        B = false,
        C = false,
        Start = false,
        X = false,
        Y = false,
        Z = false,
        Mode = false
    },
    
    DisableJoypad = true,
    Typing = false,
    Text = "",
    
    Timer = 0,
    RepeatDelay = 60,
    
    MenuKey = "F",
    UpKey = "UpArrow",
    DownKey = "DownArrow",
    LeftKey = "LeftArrow",
    RightKey = "RightArrow",
    UseKey = "A",
    BackKey = "R",
    SwitchPageKey = "D",
    FreezeKey = "Q",
    ZeroKey = "W",
    MaxKey = "E",
    TypeKey = "S"
}

function KeyPressed(key)
	if Input.Current[key] then
        if Message.KeyCancel and Message.Timer > 0 then
            Message.Timer = 0
        end
		
        Input.Timer = Input.Timer + 1
	elseif Input.Current[key] == nil and Input.Previous[key] then
		Input.Timer = 0
	end
	
	if Input.Timer >= Input.RepeatDelay then
		return Input.Current[key]
	else
		return Input.Current[key] and Input.Previous[key] == nil
	end
end

function UpdateInput()
    Input.Current = input.get()
    
    if KeyPressed(Input.MenuKey) then
        Menu.Open = not Menu.Open
    end
    
    if Menu.Open then
        local entry = Menu[Menu.Page][Menu.Index]
        
        if Input.DisableJoypad then
            joypad.set(Input.Clear, 1)
        end
        
        if KeyPressed(Input.TypeKey) then
            local entry = Menu[Menu.Page][Menu.Index]
            
            if entry.Address ~= nil then
                Input.Typing = not Input.Typing
            end
        end
        
        if Input.Typing then
            UpdateTyping(entry)
        else
            if KeyPressed(Input.BackKey) and Menu.Page ~= MenuPage.Main then
                Menu.IndexMemory[Menu.Page] = Menu.Index
                Menu.Page = MenuPage.Main
                Menu.Index = Menu.IndexMemory[Menu.Page]
            end
            
            if KeyPressed(Input.SwitchPageKey) then
                local menu = Menu[Menu.Page]
                
                if menu.Structure ~= nil then
                    local value = menu.Structure.Get()
                    
                    if Input.Current.Shift then
                        if value - 1 < 0 then
                            menu.Structure.Set(menu.Structure.Max - 1)
                        else
                            menu.Structure.Set(value - 1)
                        end
                    else
                        if value + 1 >= menu.Structure.Max then
                            menu.Structure.Set(0)
                        else
                            menu.Structure.Set(value + 1)
                        end
                    end
                end
            end
            
            if KeyPressed(Input.FreezeKey) then
                entry.Frozen = not entry.Frozen
                entry.FrozenValue = ReadValue(entry.Address, entry.Type)
            end
            
            if KeyPressed(Input.ZeroKey) then
                local entry = Menu[Menu.Page][Menu.Index]
                
                if entry.Values ~= nil then
                    WriteValue(entry.Address, entry.Type, entry.Values[1].Value)
                elseif entry.Flags ~= nil or entry.Enum ~= nil then
                    WriteValue(entry.Address, entry.Type, 0)
                else
                    WriteValue(entry.Address, entry.Type, entry.Min)
                end
            end
            
            if KeyPressed(Input.MaxKey) then
                local entry = Menu[Menu.Page][Menu.Index]
                
                if entry.Values ~= nil then
                    WriteValue(entry.Address, entry.Type, entry.Values[#entry.Values].Value)
                elseif entry.Flags ~= nil then
                    local value = 0
                    
                    for i, v in pairs(entry.Flags) do
                        value = bit.bor(value, v.Value)
                    end
                    
                    WriteValue(entry.Address, entry.Type, value)
                elseif entry.Enum ~= nil then
                    WriteValue(entry.Address, entry.Type, #entry.Enum - 1)
                else
                    WriteValue(entry.Address, entry.Type, entry.Max)
                end
            end
            
            if KeyPressed(Input.UpKey) then
                Menu.Index = Menu.Index - 1
                
                while Menu[Menu.Page][Menu.Index] ~= nil and Menu[Menu.Page][Menu.Index].Skip == true do
                    Menu.Index = Menu.Index - 1
                end
                
                if Menu.Index < 1 then
                    Menu.Index = Menu[Menu.Page].Max
                    
                    while Menu[Menu.Page][Menu.Index] ~= nil and Menu[Menu.Page][Menu.Index].Skip == true do
                        Menu.Index = Menu.Index - 1
                    end
                end
            end
            if KeyPressed(Input.DownKey) then
                Menu.Index = Menu.Index + 1
                
                while Menu[Menu.Page][Menu.Index] ~= nil and Menu[Menu.Page][Menu.Index].Skip == true do
                    Menu.Index = Menu.Index + 1
                end
                
                if Menu.Index > Menu[Menu.Page].Max then
                    Menu.Index = Menu[Menu.Page].DefaultIndex or 1
                    
                    while Menu[Menu.Page][Menu.Index] ~= nil and Menu[Menu.Page][Menu.Index].Skip == true do
                        Menu.Index = Menu.Index + 1
                    end
                end
            end
            
            if entry.Address ~= nil then
                if entry.Values ~= nil then
                    if KeyPressed(Input.LeftKey) then
                        entry.Index = entry.Index - 1
                        
                        if entry.Index < 1 then
                            entry.Index = #entry.Values
                        end
                        
                        WriteValue(entry.Address, entry.Type, entry.Values[entry.Index].Value)
                    end
                    if KeyPressed(Input.RightKey) then
                        entry.Index = entry.Index + 1
                        
                        if entry.Index > #entry.Values then
                            entry.Index = 1
                        end
                        
                        WriteValue(entry.Address, entry.Type, entry.Values[entry.Index].Value)
                    end
                elseif entry.Enum ~= nil then
                    if KeyPressed(Input.LeftKey) then
                        WriteValueRelative(entry.Address, entry.Type, -1, 0, #entry.Enum - 1)
                    end
                    if KeyPressed(Input.RightKey) then
                        WriteValueRelative(entry.Address, entry.Type, 1, 0, #entry.Enum - 1)
                    end
                else
                    if KeyPressed(Input.LeftKey) then
                        WriteValueRelative(entry.Address, entry.Type, -1, entry.Min, entry.Max)
                    end
                    if KeyPressed(Input.RightKey) then
                        WriteValueRelative(entry.Address, entry.Type, 1, entry.Min, entry.Max)
                    end
                end
            end
        end
    end
end

function UpdateTyping(entry)
    if string.len(Input.Text) < 10 then
        if KeyPressed("D0") or KeyPressed("NumberPad0") then
            Input.Text = Input.Text .. "0"
        end
        if KeyPressed("D1") or KeyPressed("NumberPad1") then
            Input.Text = Input.Text .. "1"
        end
        if KeyPressed("D2") or KeyPressed("NumberPad2") then
            Input.Text = Input.Text .. "2"
        end
        if KeyPressed("D3") or KeyPressed("NumberPad3") then
            Input.Text = Input.Text .. "3"
        end
        if KeyPressed("D4") or KeyPressed("NumberPad4") then
            Input.Text = Input.Text .. "4"
        end
        if KeyPressed("D5") or KeyPressed("NumberPad5") then
            Input.Text = Input.Text .. "5"
        end
        if KeyPressed("D6") or KeyPressed("NumberPad6") then
            Input.Text = Input.Text .. "6"
        end
        if KeyPressed("D7") or KeyPressed("NumberPad7") then
            Input.Text = Input.Text .. "7"
        end
        if KeyPressed("D8") or KeyPressed("NumberPad8") then
            Input.Text = Input.Text .. "8"
        end
        if KeyPressed("D9") or KeyPressed("NumberPad9") then
            Input.Text = Input.Text .. "9"
        end
    end
    
    if KeyPressed("Backspace") and string.len(Input.Text) > 0 then
        Input.Text = bizstring.remove(Input.Text, #Input.Text - 1, 1)
    end
    
    if (KeyPressed("NumberPadEnter") or KeyPressed("Return")) and string.len(Input.Text) > 0 then
        local value = tonumber(Input.Text)
        
        if entry.Values ~= nil then
            local found = false
            
            for i, v in ipairs(entry.Values) do
                if value == v.Value then
                    found = true
                    break
                end
            end
            
            if found then
                WriteValue(entry.Address, entry.Type, value)
            else
                NewMessage("The value " .. value .. " is outside the range of known values!", 300, Color.Red, Color.Black)
            end
        elseif entry.Enum ~= nil then
            if value < 0 then
                value = 0
            elseif value > #entry.Enum then
                value = #entry.Enum
            end
            
            WriteValue(entry.Address, entry.Type, value)
        else
            if value < entry.Min then
                value = entry.Min
            elseif value > entry.Max then
                value = entry.Max
            end
            
            WriteValue(entry.Address, entry.Type, value)
        end
        
        Input.Typing = false
        Input.Text = ""
    end
end

-- ================================================== --
--                                                    --
-- GUI                                                --
--                                                    --
-- ================================================== --

GUI =
{
    MaxEntries = 23,
        
    FancyBars = false -- CPU intensive!
}

function UpdateGUI()
    if Menu.Open then
        local entries = 0
        local headerText = Menu[Menu.Page].Header
        local start = 1
        local y = 1
        
        for i = 1, #Menu[Menu.Page] do
            if type(Menu[Menu.Page][i]) == "table" then
                entries = entries + 1
            end
        end
        
        if entries > GUI.MaxEntries + 1 and Menu.Index > GUI.MaxEntries / 2 + 1 then
            local stop = (Menu[Menu.Page].Max + 1) - (GUI.MaxEntries + 1)
            
            start = math.ceil(math.abs(Menu.Index - (GUI.MaxEntries / 2 + 1)))
            
            if start > stop then
                start = stop
            end
        end
        
        if entries > GUI.MaxEntries then
            gui.drawBox(0, 0, 319, 223, Color.Outline, ColorPulse(Color.Background, 16))
        else
            gui.drawBox(0, 0, 319, 30 + entries * 8, Color.Outline, ColorPulse(Color.Background, 16))
        end
        
        if Menu[Menu.Page].Structure ~= nil then
            headerText = headerText .. Menu[Menu.Page].Structure:HeaderText()
        end
        
        if bizstring.contains(Menu[Menu.Page].Header, "\r") then
            gui.pixelText(8, 8, headerText, ColorRainbow(), 0)
        else
            gui.pixelText(8, 8, headerText, Color.Header, 0)
        end
        
        for i = start, start + GUI.MaxEntries do
            if i > Menu[Menu.Page].Max then
                break
            end
            
            local entry = Menu[Menu.Page][i]
            local color = entry.Color or Color.Text
            local value = 0
            
            if i == Menu.Index and entry.Frozen then
                color = ColorPulse(Color.HighlightFrozen, 31, 8)
            elseif i == Menu.Index then
                color = ColorPulse(Color.Highlight, 31, 8)
            elseif entry.Frozen then
                color = ColorPulse(Color.Frozen, 31, 8, 16)
            end
            
            if entry.Address ~= nil then
                value = ReadValue(entry.Address, entry.Type)
            end
            
            if entry.Bar ~= nil then
                local bar = entry.Bar
                local offset = 8 + (bar.Offset or 128)
                local width = bar.Width or 172
                local progress = (width / entry.Max) * value
                local color = bit.band(entry.Bar.Color, 0x00FFFFFF) + bit.lshift(192, 24)
                
                if progress > width then
                    progress = width
                end
                
                if not (Input.Typing and i == Menu.Index) then
                    gui.drawRectangle(offset, 16 + (y * 8), width, 7, color, Color.Transparent)
                    
                    if GUI.FancyBars then
                        for j = 1, progress - 1 do
                            gui.drawLine(offset + j, 17 + (y * 8), offset + j, 17 + (i * 8) + 5, ColorPulse(color, 63, 32, j / 4))
                        end
                    else
                        gui.drawRectangle(offset + 1, 17 + (y * 8), progress - 2, 5, color, color)
                    end
                end
            end
            
            if entry.Text ~= nil then
                if entry.Address ~= nil then
                    local text = entry.Text .. ": "
                    
                    if Input.Typing and i == Menu.Index then
                        local offset = 8 + ((string.len(text) + string.len(Input.Text)) * 6)
                        local color = ColorPulse(0xFFAFAFAF, 32, 8, 16)
                        
                        text = text .. Input.Text
                        
                        gui.drawRectangle(offset, 16 + (y * 8), 4, 8, color, color)
                    else
                        text = text .. value
                        
                        if entry.Enum ~= nil and entry.Enum[value + 1] ~= nil then
                            text = text .. " (" .. entry.Enum[value + 1] .. ")"
                        elseif entry.Flags ~= nil then
                            for j = 1, #entry.Flags do
                                if value > 0 and value == bit.band(value, entry.Flags[j].Value) then
                                    text = text .. " (" .. entry.Flags[j].Name .. ")"
                                end
                            end
                        elseif entry.Values ~= nil then
                            text = text .. " (" .. entry.Values[entry.Index].Name .. ")"
                        end
                    end
                    
                    gui.pixelText(8, 16 + (y * 8), text, color, 0)
                else
                    gui.pixelText(8, 16 + (y * 8), entry.Text, color, 0)
                end
            end
            
            y = y + 1
        end
    end
end

-- ================================================== --
--                                                    --
-- HUD                                                --
--                                                    --
-- ================================================== --

Message =
{
    Type =
    {
        Small = 1,
        Large = 2
    },
    
    FadeTime = 60,
    KeyCancel = false,
    
    Text = "",
    Timer = 0,
    Color = 0,
    BackgroundColor = 0,
    
    X = 0,
    Y = 0
}

function Help()
    local help =
    {
        "Welcome to ShadowEdit!",
        " ",
        "Menu Keys",
        "  " .. Input.MenuKey .. ": Open/close menu",
        "  " .. Input.UpKey .. "/" .. Input.DownKey .. ": Move cursor",
        "  " .. Input.LeftKey .. "/" .. Input.RightKey .. ": Adjust values",
        "  " .. Input.UseKey .. ": Enter sub-menu/activate menu option",
        "  " .. Input.BackKey .. ": Return to main menu",
        "  " .. Input.SwitchPageKey .. ": Switch sub-page",
        "  " .. Input.FreezeKey .. ": Freeze selected option",
        "  " .. Input.ZeroKey .. ": Sets the currently selected value to it's",
        "  minimum",
        "  " .. Input.MaxKey .. ": Sets the currently selected value to it's",
        "  maximum",
        "  " .. Input.TypeKey .. ": Type in a specific value",
        " ",
        "Typing",
        "- Press Enter to finalize and apply a value",
        "- All input values will be checked before applying",
    }
    
    local message = ""
    
    for i, v in ipairs(help) do
        message = message .. v .. "\n"
    end
    
    message = bizstring.remove(message, #message - 1, 1)
    
    NewMessage(message, 1000, Color.White, Color.Black, Message.Type.Large, true)
end

function NewMessage(text, time, color, backgroundColor, type, keyCancel)
    Message.Text = text
    Message.Timer = time or 300
    Message.Color = color or Color.White
    Message.BackgroundColor = backgroundColor or Color.Background
    Message.KeyCancel = keyCancel or false
    
    type = type or Message.Type.Small
    
    if type == Message.Type.Small then
        Message.X = 0
        Message.Y = 211
    elseif type == Message.Type.Large then
        Message.X = 0
        Message.Y = 0
    end
end

function UpdateMessage()
    local function ModAlpha(color)
        return bit.band(color, 0x00FFFFFF) + bit.lshift((bit.rshift(color, 24) / Message.FadeTime) * (Message.FadeTime - math.abs(Message.Timer)), 24)
    end
    
    if Message.Timer > -Message.FadeTime then
        local width = 0
        local height = 2
        local messages = bizstring.split(Message.Text, "\n")
        local outlineColor = Color.Outline
        local backgroundColor = Message.BackgroundColor
        local messageColor = Message.Color
        
        for i, v in ipairs(messages) do
            if string.len(v) > width then
                width = string.len(v)
            end
            
            height = height + 10
        end
        
        height = height - (#messages - 1)
        
        if Message.Timer <= 0 then
            outlineColor = ModAlpha(Color.Outline)
            backgroundColor = ModAlpha(Message.BackgroundColor)
            messageColor = ModAlpha(Message.Color)
        end
        
        gui.drawRectangle(Message.X, Message.Y, 4 + width * 6, height, outlineColor, backgroundColor)
        gui.pixelText(Message.X + 2, Message.Y + 2, Message.Text, messageColor, 0)
        
        Message.Timer = Message.Timer - 1
    end
end

function UpdateHUD()
    local function DrawGhoulBounty()
        local total = 20
        local transition = math.floor(0xFF / total)
        local runType = ReadValue(Address.CurrentRun.RunType, DataType.Byte)
        local count = ReadValue(Address.CurrentRun.Counter, DataType.Byte)
        local color = Color.White
        
        if count >= total then
            color = ColorPulse(Color.Green, 64, 8)
        else
            local byte = 0xFF - (count * transition)
            
            color = Color.Green
            color = color + bit.lshift(byte, 16)
            color = color + byte
        end
        
        if runType == RunType.GhoulBounty then
            gui.pixelText(274, 4, count .. " / 20", color, Color.Transparent)
        end
    end
    
    local function DrawDatafileValue()
        local value = GetDatafilesValue()
        
        if value > 0 then
            gui.pixelText(274, 212, value, ColorPulse(Color.Yellow, 32, 32))
        end
    end
    
    DrawGhoulBounty()
    DrawDatafileValue()
end

-- ================================================== --
--                                                    --
-- MENU                                               --
--                                                    --
-- ================================================== --

MenuPage =
{
    Main = 1,
    
    PlayerBasic = 2,
    PlayerInventory = 3,
    PlayerStats = 4,
    Spellbooks = 5,
    Group = 6,
    
    CyberdeckStats = 7,
    CyberdeckPrograms = 8,
    CyberdeckDataFiles = 9,
    Cyberspace = 10,
    CyberspaceNode = 11,
    
    PlayerActor = 12,
    PedActor = 13,
    Notebook = 14,
    CurrentRun = 15
}

Menu = 
{
    Open = false,
    Index = 2,
    IndexMemory = {},
    Page = MenuPage.Main,
    
    Runner = 0,
    SpellPage = 0,
    CyberspacePage = 0,
    PedPage = 0,
    
    [MenuPage.Main] =
    {
        Header = "\rShadowEdit v0.12.0",
        
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
            Text = "Group", Page = MenuPage.Group
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
            Text = "Nodes", Page = MenuPage.CyberspaceNode
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "World", Skip = true, Color = Color.Yellow
        },
        {
            Text = "Player", Page = MenuPage.PlayerActor
        },
        {
            Text = "Peds", Page = MenuPage.PedActor
        },
        {
            Text = "Notebook", Page = MenuPage.Notebook
        },
        {
            Text = "Current Run", Page = MenuPage.CurrentRun
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Misc", Skip = true, Color = Color.Blue
        },
        {
            Text = "Debug Menu",
            Address = Address.Misc.DebugMenu,
            Type = DataType.Byte,
            Values =
            {
                { Name = "Disabled", Value = 0 },
                { Name = "Enabled", Value = 255 }
            },
        },
        {
            Text = "Buy Karma (1000 Nuyen)",
            
            Use = function() -- TODO: Let you pick or determine who gets it
                local nuyen = ReadValue(Address.Player.Group.Nuyen, DataType.Long)
                local karma = ReadValue(Address.Player.Karma, DataType.Byte)
                
                if nuyen >= 1000 and karma < 255 then
                    nuyen = nuyen - 1000
                    karma = karma + 1
                    
                    WriteValue(Address.Player.Group.Nuyen, DataType.Long, nuyen)
                    WriteValue(Address.Player.Karma, DataType.Byte, karma)
                    
                    NewMessage("+1 Karma (" .. nuyen .. " Nuyen Remaining)", 300, Color.Green)
                elseif karma == 255 then
                    NewMessage("Your Karma is already at the maximum!", 300, Color.Red)
                else
                    NewMessage("Not enough nuyen!", 300, Color.Red)
                end
            end
        },
        
        Input = function()
            if KeyPressed(Input.UseKey) then
                if Menu[MenuPage.Main][Menu.Index].Page ~= nil then
                    Menu.IndexMemory[Menu.Page] = Menu.Index
                    Menu.Page = Menu[MenuPage.Main][Menu.Index].Page
                    
                    if Menu.IndexMemory[Menu.Page] ~= nil then
                        Menu.Index = Menu.IndexMemory[Menu.Page]
                    else
                        Menu.Index = Menu[Menu.Page].DefaultIndex or 1
                    end
                end
            end
        end,
    },
    
    [MenuPage.PlayerBasic] =
    {
        Header = "Player - Basic",
        
        Structure = Structure.Runner,
        DefaultIndex = 2,
        
        {
            Text = "Base", Skip = true, Color = Color.Green
        },
        {
            Text = "Race",
            Address = Address.Player.Race,
            Type = DataType.Byte,
            Enum = RaceEnum
        },
        {
            Text = "Archetype",
            Address = Address.Player.Archetype,
            Type = DataType.Byte,
            Enum = ArchetypeEnum
        },
        {
            Text = "Karma",
            Address = Address.Player.Karma,
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
            Type = DataType.Byte,
            Enum = StanceEnum
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
            Type = DataType.Byte,
            Flags = CyberwareFlags[1],
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 2",
            Address = Address.Player.Cyberware + 1,
            Type = DataType.Byte,
            Flags = CyberwareFlags[2],
            Min = 0,
            Max = 255
        },
        
        Update = function()
            local ammo = FindMenuEntry(MenuPage.PlayerBasic, "Ammo")
            local weapon = ReadValue(Address.Player.Equipped.Weapon, DataType.Byte) + 1
            
            if weapon > #ItemMax then
                ammo.Max = 255
            else
                ammo.Max = ItemMax[weapon]
            end
        end
    },
    
    [MenuPage.PlayerInventory] =
    {
        Header = "Player - Inventory",
        
        Structure = Structure.Runner,
        DefaultIndex = 2,
        
        {
            Text = "Equipped", Skip = true, Color = Color.Red
        },
        {
            Text = "Weapon",
            Address = Address.Player.Equipped.Weapon,
            Type = DataType.Byte,
            Enum = WeaponEnum
        },
        {
            Text = "Weapon Flag",
            Address = Address.Player.Equipped.Flag,
            Type = DataType.Byte,
            Values = WeaponFlags,
            Index = 1
        },
        {
            Text = "Armor",
            Address = Address.Player.Equipped.Armor,
            Type = DataType.Byte,
            Enum = ArmorEnum
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
            Type = DataType.Byte,
            Enum = ItemEnum

        },
        {
            Text = "Slot 2",
            Address = Address.Player.Inventory.Items + 1,
            Type = DataType.Byte,
            Enum = ItemEnum

        },
        {
            Text = "Slot 3",
            Address = Address.Player.Inventory.Items + 2,
            Type = DataType.Byte,
            Enum = ItemEnum

        },
        {
            Text = "Slot 4",
            Address = Address.Player.Inventory.Items + 3,
            Type = DataType.Byte,
            Enum = ItemEnum

        },
        {
            Text = "Slot 5",
            Address = Address.Player.Inventory.Items + 4,
            Type = DataType.Byte,
            Enum = ItemEnum

        },
        {
            Text = "Slot 6",
            Address = Address.Player.Inventory.Items + 5,
            Type = DataType.Byte,
            Enum = ItemEnum

        },
        {
            Text = "Slot 7",
            Address = Address.Player.Inventory.Items + 6,
            Type = DataType.Byte,
            Enum = ItemEnum

        },
        {
            Text = "Slot 8",
            Address = Address.Player.Inventory.Items + 7,
            Type = DataType.Byte,
            Enum = ItemEnum

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
            Type = DataType.Byte,
            Flags = AttachmentFlags,
            Min = 0,
            Max = 255
        },
        {
            Text = "Value 2",
            Address = Address.Player.Inventory.Values + 1,
            Type = DataType.Byte,
            Flags = AttachmentFlags,
            Min = 0,
            Max = 255
        },
        {
            Text = "Value 3",
            Address = Address.Player.Inventory.Values + 2,
            Type = DataType.Byte,
            Flags = AttachmentFlags,
            Min = 0,
            Max = 255
        },
        {
            Text = "Value 4",
            Address = Address.Player.Inventory.Values + 3,
            Type = DataType.Byte,
            Flags = AttachmentFlags,
            Min = 0,
            Max = 255
        },
        {
            Text = "Value 5",
            Address = Address.Player.Inventory.Values + 4,
            Type = DataType.Byte,
            Flags = AttachmentFlags,
            Min = 0,
            Max = 255
        },
        {
            Text = "Value 6",
            Address = Address.Player.Inventory.Values + 5,
            Type = DataType.Byte,
            Flags = AttachmentFlags,
            Min = 0,
            Max = 255
        },
        {
            Text = "Value 7",
            Address = Address.Player.Inventory.Values + 6,
            Type = DataType.Byte,
            Flags = AttachmentFlags,
            Min = 0,
            Max = 255
        },
        {
            Text = "Value 8",
            Address = Address.Player.Inventory.Values + 7,
            Type = DataType.Byte,
            Flags = AttachmentFlags,
            Min = 0,
            Max = 255
        },
        
        Update = function()
            local weapon = FindMenuEntry(MenuPage.PlayerInventory, "Weapon")
            
            if IsSpell() then
                weapon.Enum = SpellEnum
                weapon.Max = #SpellEnum - 1
            else
                weapon.Enum = WeaponEnum
                weapon.Max = #WeaponEnum - 1
            end
        end
    },
    
    [MenuPage.PlayerStats] =
    {
        Header = "Player - Attributes/Skills",
        
        Structure = Structure.Runner,
        DefaultIndex = 2,
        
        {
            Text = "Attributes", Skip = true, Color = Color.Orange
        },
        {
            Text = "Body",
            Address = Address.Player.Attributes.Body,
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
            Address = Address.Player.Attributes.Quickness,
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
            Address = Address.Player.Attributes.Strength,
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
            Address = Address.Player.Attributes.Charisma,
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
            Address = Address.Player.Attributes.Intelligence,
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
            Address = Address.Player.Attributes.Willpower,
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
            Address = Address.Player.Attributes.Magic,
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
            Address = Address.Player.Attributes.Essence,
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
            Address = Address.Player.Attributes.Essence2,
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
        
        Structure = Structure.Spellbook,
        DefaultIndex = 2,
        
        {
            Text = "Type", Skip = true, Color = Color.Pink
        },
        {
            Text = "Slot 1",
            Address = Address.Player.Spellbook + 1,
            Type = DataType.Byte,
            Values = SpellValues
        },
        {
            Text = "Slot 2",
            Address = Address.Player.Spellbook + 3,
            Type = DataType.Byte,
            Values = SpellValues
        },
        {
            Text = "Slot 3",
            Address = Address.Player.Spellbook + 5,
            Type = DataType.Byte,
            Values = SpellValues
        },
        {
            Text = "Slot 4",
            Address = Address.Player.Spellbook + 7,
            Type = DataType.Byte,
            Values = SpellValues
        },
        {
            Text = "Slot 5",
            Address = Address.Player.Spellbook + 9,
            Type = DataType.Byte,
            Values = SpellValues
        },
        {
            Text = "Slot 6",
            Address = Address.Player.Spellbook + 11,
            Type = DataType.Byte,
            Values = SpellValues
        },
        {
            Text = "Slot 7",
            Address = Address.Player.Spellbook + 13,
            Type = DataType.Byte,
            Values = SpellValues
        },
        {
            Text = "Slot 8",
            Address = Address.Player.Spellbook + 15,
            Type = DataType.Byte,
            Values = SpellValues
        },
        {
            Text = "Slot 9",
            Address = Address.Player.Spellbook + 17,
            Type = DataType.Byte,
            Values = SpellValues
        },
        {
            Text = "Slot 10",
            Address = Address.Player.Spellbook + 19,
            Type = DataType.Byte,
            Values = SpellValues
        },
        {
            Text = "Slot 11",
            Address = Address.Player.Spellbook + 21,
            Type = DataType.Byte,
            Values = SpellValues
        },
        {
            Text = "Slot 12",
            Address = Address.Player.Spellbook + 23,
            Type = DataType.Byte,
            Values = SpellValues
        },
        {
            Text = "Slot 13",
            Address = Address.Player.Spellbook + 25,
            Type = DataType.Byte,
            Values = SpellValues
        },
        {
            Text = "Slot 14",
            Address = Address.Player.Spellbook + 27,
            Type = DataType.Byte,
            Values = SpellValues
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
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 2",
            Address = Address.Player.Spellbook + 4,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 3",
            Address = Address.Player.Spellbook + 6,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 4",
            Address = Address.Player.Spellbook + 8,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 5",
            Address = Address.Player.Spellbook + 10,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 6",
            Address = Address.Player.Spellbook + 12,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 7",
            Address = Address.Player.Spellbook + 14,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 8",
            Address = Address.Player.Spellbook + 16,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 9",
            Address = Address.Player.Spellbook + 18,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 10",
            Address = Address.Player.Spellbook + 20,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 11",
            Address = Address.Player.Spellbook + 22,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 12",
            Address = Address.Player.Spellbook + 24,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 13",
            Address = Address.Player.Spellbook + 26,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        },
        {
            Text = "Slot 14",
            Address = Address.Player.Spellbook + 28,
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
            Type = DataType.Byte,
            Min = 0,
            Max = 13
        }
    },
    
    [MenuPage.Group] =
    {
        Header = "Group",
        
        DefaultIndex = 2,
        
        {
            Text = "Money", Skip = true, Color = Color.Green
        },
        {
            Text = "Nuyen",
            Address = Address.Player.Group.Nuyen,
            Type = DataType.Long,
            Min = 0,
            Max = 1000000000
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Group Items", Skip = true, Color = Color.Green
        },
        {
            Text = "Set 1",
            Address = Address.Player.Group.Items,
            Type = DataType.Byte,
            Flags = GroupItemsFlags[1],
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 2",
            Address = Address.Player.Group.Items + 1,
            Type = DataType.Byte,
            Flags = GroupItemsFlags[2],
            Min = 0,
            Max = 255
        },
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
            Values = CyberdeckValues,
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
            Max = 5,
            
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
            Max = 3,
            
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
            Values = DatafileValues
        },
        {
            Text = "Slot 2",
            Address = Address.Cyberdeck.Datafiles[2],
            Type = DataType.Byte,
            Values = DatafileValues
        },
        {
            Text = "Slot 3",
            Address = Address.Cyberdeck.Datafiles[3],
            Type = DataType.Byte,
            Values = DatafileValues
        },
        {
            Text = "Slot 4",
            Address = Address.Cyberdeck.Datafiles[4],
            Type = DataType.Byte,
            Values = DatafileValues
        },
        {
            Text = "Slot 5",
            Address = Address.Cyberdeck.Datafiles[5],
            Type = DataType.Byte,
            Values = DatafileValues
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
        Header = "Cyberspace - System",
        
        DefaultIndex = 2,
        
        {
            Text = "Global", Skip = true, Color = Color.Cyan
        },
        {
            Text = "Alert Level",
            Address = Address.Cyberspace.AlertLevel,
            Type = DataType.Byte,
            Values = CyberspaceAlertLevelValues
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Functions", Skip = true, Color = Color.Blue
        },
        {
            Text = "Sell Data Files",
            Use = function()
                SellDatafiles()
            end
        },
        {
            Text = "Add CHERNOBYL Passcode",
            Use = function()
                AddCHERNOBYLPasscode()
            end
        }
    },
    
    [MenuPage.CyberspaceNode] =
    {
        Header = "Cyberspace - Node",
        
        Structure = Structure.CyberspaceNode,
        DefaultIndex = 2,
        
        {
            Text = "Color",
            Address = Address.Cyberspace.NodeColor,
            Type = DataType.Byte,
            Enum = CyberspaceNodeColorEnum
        },
        {
            Text = "Level",
            Address = Address.Cyberspace.NodeLevel,
            Type = DataType.Byte,
            Min = 1,
            Max = 8
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "ICE", Skip = true, Color = Color.Red
        },
        {
            Text = "Integrity",
            Address = Address.Cyberspace.ICEIntegrity,
            Type = DataType.Byte,
            Min = 0,
            Max = 10
        },
        {
            Text = "Speed",
            Address = Address.Cyberspace.ICESpeed,
            Type = DataType.Byte,
            Min = 0,
            Max = 18
        },
        {
            Text = "Level 1",
            Address = Address.Cyberspace.ICELevel1,
            Type = DataType.Byte,
            Min = 1,
            Max = 8
        },
        {
            Text = "Level 2",
            Address = Address.Cyberspace.ICELevel2,
            Type = DataType.Byte,
            Min = 1,
            Max = 8
        },
        {
            Text = "Type",
            Address = Address.Cyberspace.ICELevel1,
            Type = DataType.Byte,
            Enum = CyberspaceICETypeEnum
        }
    },
    
    [MenuPage.PlayerActor] =
    {
        Header = "World - Player",
        
        DefaultIndex = 2,
        
        {
            Text = "Position", Skip = true, Color = Color.Yellow
        },
        {
            Text = "X",
            Address = Address.Player.Position.X,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "Y",
            Address = Address.Player.Position.Y,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "", Skip = true
        },
        {
            Text = "Other", Skip = true, Color = Color.Yellow
        },
        {
            Text = "Criminal Record",
            Address = Address.Player.CriminalRecord,
            Type = DataType.Byte,
            Min = 0,
            Max = 8
        }
    },
    
    [MenuPage.PedActor] =
    {
        Header = "World - Peds",
        
        Structure = Structure.Ped,
        
        {
            Text = "Health",
            Address = Address.Ped.Health,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "X",
            Address = Address.Ped.X,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "Y",
            Address = Address.Ped.Y,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
    },
    
    [MenuPage.Notebook] =
    {
        Header = "Notebook",
        
        DefaultIndex = 2,
        
        {
            Text = "Passcodes", Skip = true, Color = Color.Cyan
        },
        {
            Text = "Set 1",
            Address = Address.Notebook.Passcodes,
            Type = DataType.Byte,
            Flags = PasscodesFlags[1],
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 2",
            Address = Address.Notebook.Passcodes + 1,
            Type = DataType.Byte,
            Flags = PasscodesFlags[2],
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
            Address = Address.Notebook.KnownJohnsons,
            Type = DataType.Byte,
            Flags = JohnsonFlags,
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
            Address = Address.Notebook.Shadowrunners,
            Type = DataType.Byte,
            Flags = ShadowrunnersFlags[1],
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 2",
            Address = Address.Notebook.Shadowrunners + 1,
            Type = DataType.Byte,
            Flags = ShadowrunnersFlags[2],
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
            Address = Address.Notebook.Contacts,
            Type = DataType.Byte,
            Flags = ContactsFlags[1],
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 2",
            Address = Address.Notebook.Contacts + 1,
            Type = DataType.Byte,
            Flags = ContactsFlags[2],
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
            Address = Address.Notebook.Clues,
            Type = DataType.Byte,
            -- Flags = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 2",
            Address = Address.Notebook.Clues + 1,
            Type = DataType.Byte,
            -- Flags = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 3",
            Address = Address.Notebook.Clues + 2,
            Type = DataType.Byte,
            -- Flags = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 4",
            Address = Address.Notebook.Clues + 3,
            Type = DataType.Byte,
            -- Flags = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 5",
            Address = Address.Notebook.Clues + 4,
            Type = DataType.Byte,
            -- Flags = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 6",
            Address = Address.Notebook.Clues + 5,
            Type = DataType.Byte,
            -- Flags = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 7",
            Address = Address.Notebook.Clues + 6,
            Type = DataType.Byte,
            -- Flags = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 8",
            Address = Address.Notebook.Clues + 7,
            Type = DataType.Byte,
            -- Flags = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 9",
            Address = Address.Notebook.Clues + 8,
            Type = DataType.Byte,
            -- Flags = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 10",
            Address = Address.Notebook.Clues + 9,
            Type = DataType.Byte,
            -- Flags = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 11",
            Address = Address.Notebook.Clues + 10,
            Type = DataType.Byte,
            -- Flags = Clues,
            Min = 0,
            Max = 255
        },
        {
            Text = "Set 12",
            Address = Address.Notebook.Clues + 11,
            Type = DataType.Byte,
            -- Flags = Clues,
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
            Values = JohnsonValues,
            Index = 1
        },
        {
            Text = "Type",
            Address = Address.CurrentRun.RunType,
            Type = DataType.Byte,
            Values = RunTypeValues,
            Index = 1
        },
        {
            Text = "Payment",
            Address = Address.CurrentRun.Payment,
            Type = DataType.Word,
            Min = 0,
            Max = 65535
        },
        {
            Text = "Karma",
            Address = Address.CurrentRun.Karma,
            Type = DataType.Byte,
            Min = 0,
            Max = 255
        },
        {
            Text = "Flags",
            Address = Address.CurrentRun.Flags,
            Type = DataType.Byte,
            Flags = RunFlags,
            Min = 0,
            Max = 255
        },
        {
            Text = "Counter",
            Address = Address.CurrentRun.Counter,
            Type = DataType.Byte,
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
        
        Input = function()
            if KeyPressed(Input.UseKey) then
                GenerateRun()
            end
        end,
        
        Update = function()
            local runType = ReadValue(Address.CurrentRun.RunType, DataType.Byte)
            local _, params = FindMenuEntry(MenuPage.CurrentRun, "Parameters")
            local menu = Menu[MenuPage.CurrentRun]
            local area = ReadValue(Address.CurrentRun.Area1, DataType.Byte) + 1
            local area2 = ReadValue(Address.CurrentRun.Area2, DataType.Byte) + 1
            local baseIndex = params + 1
            local index = baseIndex
            
            if runType >= RunType.GhoulBounty and runType < RunType.MatrixRun then
                if runType == RunType.GhoulBounty then
                    menu[index].Text = "Area"
                elseif runType ~= RunType.Bodyguard and runType ~= RunType.Courier then
                    menu[index].Text = "Destination Area"
                else
                    menu[index].Text = "Source Area"
                end
                
                menu[index].Skip = false
                menu[index].Address = Address.CurrentRun.Area1
                menu[index].Enum = AreaEnum
                index = index + 1
                
                if runType >= RunType.Bodyguard and runType < RunType.MatrixRun then
                    if runType ~= RunType.Bodyguard and runType ~= RunType.Courier then
                        menu[index].Text = "Destination Building"
                    else
                        menu[index].Text = "Source Building"
                    end
                    
                    menu[index].Skip = false
                    menu[index].Address = Address.CurrentRun.Building1
                    menu[index].Enum = BuildingEnum[area]
                    index = index + 1
                end
                
                if runType == RunType.Bodyguard or runType == RunType.Courier then
                    menu[index].Text = "Destination Area"
                    menu[index].Skip = false
                    menu[index].Address = Address.CurrentRun.Area2
                    menu[index].Enum = AreaEnum
                    index = index + 1
                    
                    menu[index].Text = "Destination Building"
                    menu[index].Skip = false
                    menu[index].Address = Address.CurrentRun.Building2
                    menu[index].Enum = BuildingEnum[area2]
                    index = index + 1
                end
                
                if runType == RunType.Bodyguard or runType == RunType.Extraction then
                    menu[index].Text = "Client"
                    menu[index].Skip = false
                    menu[index].Address = Address.CurrentRun.Other
                    menu[index].Values = ClientValues
                    index = index + 1
                elseif runType == RunType.Enforcement then
                    menu[index].Text = "Reason"
                    menu[index].Skip = false
                    menu[index].Address = Address.CurrentRun.Other
                    menu[index].Enum = EnforcementRunTypeEnum
                    index = index + 1
                end
            elseif runType == RunType.MatrixRun then
                menu[index].Text = "Matrix Run Type"
                menu[index].Skip = false
                menu[index].Address = Address.CurrentRun.Matrix.Type
                menu[index].Enum = MatrixRunTypeEnum
                index = index + 1
                
                menu[index].Text = "System"
                menu[index].Skip = false
                menu[index].Address = Address.CurrentRun.Matrix.System
                menu[index].Enum = SystemEnum
                index = index + 1
            end
            
            for i = index, baseIndex + 4 do
                local entry = menu[i]
                
                entry.Text = nil
                entry.Skip = true
                entry.Address = nil
                entry.Enum = nil
                entry.Values = nil
                entry.Min = nil
                entry.Max = nil
            end
            
            for i = baseIndex, baseIndex + 4 do
                local entry = menu[i]
                
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
            
            if Menu[i].Structure ~= nil then
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
        if Menu[i].Structure ~= nil then
            for j = 1, #Menu[i] do
                if (Menu[i][j]).BaseAddress ~= nil then
                    Menu[i][j].Address = Menu[i][j].BaseAddress + (Menu[i].Structure.Get() * Menu[i].Structure.Offset)
                end
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
    
    if KeyPressed(Input.UseKey) and Menu[Menu.Page][Menu.Index].Use ~= nil then
        Menu[Menu.Page][Menu.Index].Use()
    end
end

function FindMenuEntry(page, text)
    for i, v in ipairs(Menu[page]) do
        if v.Text ~= nil and bizstring.contains(v.Text, text) then
            return Menu[page][i], i
        end
    end
    
    return nil
end

-- ================================================== --
--                                                    --
-- SHADOWEDIT                                         --
--                                                    --
-- ================================================== --

memory.usememorydomain("68K RAM")
gui.defaultPixelFont("fceux")

Help()
MenuInit()

while true do
    UpdateInput()
    UpdateFrozen()
    
    if Menu.Open then
        UpdateAddresses()
        UpdateValues()
        UpdateMenuEvents()
        UpdateGUI()
    end
    
    UpdateMessage()
    UpdateHUD()
    
    emu.frameadvance()
    
    Input.Previous = Input.Current
end

-- ================================================== --
--                                                    --
-- RESEARCH                                           --
--                                                    --
-- ================================================== --

--[[

-------------------
-- Ped Structure --
-------------------

- Player starts at 0x0100
- Peds/enemies start at 0x0400, 0x0100 bytes each

Offsets
  0x00 - X
  0x04 - Y
  0x4C - Health
  0x58 - Name

------------------
-- Matrix Stuff --
------------------

- Some sort of structure (nodes/ICE related) starts at 0x1100, 0x50 bytes each?

Offsets
  0x19 - Node Color
  0x1A - Node Level (1-8)
  0x23 - ICE Integrity
  0x24 - ICE Speed (0-20)
  0x25 - ICE 1 Level
  0x26 - ICE 2 Level
  0x27 - ICE Type

--]]
