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

dofile("KLib/KLib.lua")

Address =
{
    Character =
    {
        Max = 3,
        Offset = 0x100,
        
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
            WeaponType = 0x0156,
            Armor = 0x0176
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
        }
    },
    
    CriminalRecord = 0xFBFA,
    Nuyen = 0xFBFE,
    GroupItems = 0xFC24,
    
    Spellbook =
    {
        Max = 5,
        Offset = 0x22,
        Address = 0xF9FB
    },
    
    Notebook =
    {
        Passcodes = 0xFC28,
        Johnsons = 0xFC26,
        Shadowrunners = 0xFC2A,
        Contacts = 0xFC2E,
        Clues = 0xFC30
    },
    
    Position =
    {
        X = 0x0100,
        Y = 0x0104
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
            [0] = 0xFBE9,
            [1] = 0xFBE6,
            [2] = 0xFBE3,
            [3] = 0xFBE0,
            [4] = 0xFBDD
        }
    },
    
    Cyberspace =
    {
        AlertLevel = 0xF0A0,
        
        Nodes =
        {
            Max = 5,
            Offset = 0x50,
            
            Color = 0x0119,
            Level = 0x011A,
            ICEIntegrity = 0x0123,
            ICESpeed = 0x0124,
            ICELevel1 = 0x0125,
            ICELevel2 = 0x0126,
            ICEType = 0x0127
        }
    },
        
    Peds =
    {
        Max = 19,
        Offset = 0x100,
        
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
    
    GameState = 0xD981,
    MatrixState = 0xDF8A,
    MenuIndex = 0xF0DC,
    RunnerIndex = 0xFC06,
    RunnerTotal = 0xDFC9,
    DebugMenu = 0xF101
}

Race =
{
    [0] = "Human",
    "Elf",
    "Dwarf",
    "Orc",
    "Troll",
    "Mage"
}

Archetype =
{
    [0] = "Mage",
    "Shaman",
    "Samurai",
    "Decker"
}

Stance =
{
    [0] = "Full Defense",
    "Medium Defense",
    "Neutral",
    "Medium Offense",
    "Full Offense"
}

Cyberware =
{
    "Datajack",
    "CyberEyes",
    "Hand Razors",
    "Spurs",
    "Smartlink",
    "Muscle Replacement (1)",
    "Muscle Replacement (2)",
    "Muscle Replacement (3)",
    "Muscle Replacement (4)",
    "Dermal Plating (1)",
    "Dermal Plating (2)",
    "Dermal Plating (3)",
    "Wired Reflexes (1)",
    "Wired Reflexes (2)",
    "Wired Reflexes (3)"
}

Weapon =
{
    [0] = "Melee",
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

WeaponType =
{
    [0] = "Weapon",
    [2] = "Other",
    [127] = "Melee",
    [255] = "Spell"
}

Spell =
{
    [0] = "Flame Dart",
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
    "Barrier",
    
    [255] = "Empty"
}

Armor =
{
    [0] = "None",
    "Armor Vest",
    "Armor Clothing",
    "Armor Jacket",
    "Vest With Plates",
    "Lined Duster",
    "Light Combat Armor",
    "Heavy Combat Armor"
}

Item =
{
    [0] = "Nothing",
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
    [0] = 0,  -- Nothing/Melee
    6,        -- Streetline Special
    12,       -- Model 101T LP
    11,       -- American L36 LP
    25,       -- Security 500 LP
    6,        -- Warhawk HP
    10,       -- Max-Power HP
    15,       -- Predator HP
    30,       -- AK-97 SMG
    28,       -- HK227-S SMG
    24,       -- Mach 22 SMG
    5,        -- Allegiance Shotgun
    8,        -- Roomsweeper Shotgun
    6,        -- Frag Grenade
    6,        -- Scatter Grenade
    6,        -- Concussion Grenade
    6,        -- Medkit
    6,        -- Stim Patch
    6,        -- Trauama Patch
    10,       -- Fetish
    5,        -- MagLock Passkey
    0,        -- Electronic Kit
    0,        -- Smart Goggles
    0,        -- Enchanted Dagger
    4,        -- Power Focus
    4,        -- Spell Foci (14)
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
    4,        -- Protection Talisman
    4,        -- Combat Sense Spell Lock
    0,        -- Rat Totem
    0,        -- Gator Totem
    0,        -- Bear Totem
    0,        -- Armor (7)
    0,
    0,
    0,
    0,
    0,
    0
}

Attachment =
{
    "SmartLink",
    "Silencer",
    "Sound Suppressor",
    "Laser Sight",
    "Gas Vent II",
    "Gas Vent III"
}

SpellbookNames =
{
    "Ricky",
    "Trent",
    "Walking Bear",
    "Freya",
    "Joshua"
}

GroupItems =
{
    "Prototype Cyber-Heart",
    "Indian Lands Visa",
    "Feathered Scale",
    "Hell Hound Pelt",
    "Gargoyle Horn",
    "Gift for Lady Gillian",
    "Gift for Red Buffalo Woman",
    "Landmark Map",
    "Map Overlay",
    "Package for Current Run",
    "Security Pass",
    "Weapon Permit",
    "Eye-Fiver Ear Cuff",
    "Halloweener Patch",
    "Ork Armband"
}

Cyberdeck =
{
    [0] = "Cyber Shack PCD-500",
    "Fuchi Cyber-5",
    "Sega CTY-360",
    "Fuchi Cyber-7",
    "Fairlight Excalibur",
    "Allegiance Alpha",
    
    [255] = "None"
}

Datafile =
{
    [0] = "Back-up Files",
    "Archived Files",
    "Canceled Accounts",
    "History Data",
    "Canceled Passwords",
    "System Usage Report",
    "System Activity",
    "Access Request Log",
    "E-mail Data",
    "Routing Requests",
    "Bank Acct. Numbers",
    "Corporate Profile",
    "Personnel Dossiers",
    "Employee Scheduling",
    "Client Information",
    "Project Records",
    "Open Project Data",
    "Project Expense Report",
    "Project Requisition",
    "Project Utilities",
    "Security Records",
    "Contact Dossiers",
    "Surveillance Data",
    "Equipment Permits",
    "Lone Star Reports",
    "Archived Files",
    "Project Folders",
    "Closed Projects",
    "Project Expense Report",
    "Failed Prototypes",
    "Competitor Profiles",
    "Competitor Products",
    "Competitor Marketing",
    "Competitor Security",
    "Competitor Budgets",
    "Sales Information",
    "Public Relations",
    "Customer Files",
    "Advertising Info",
    "Marketing Report",
    "Entertainment Data",
    "Educational Data",
    "BTL Data",
    "Experimental Data",
    "Toxic Data",
    "Bank Acct. Numbers",
    "Corporate Account",
    "Local Accounts",
    "Security Expenses",
    "Capital Expidenture",
    "Long Range Goals",
    "Shadowrun Information",
    "Strike Team Orders",
    "Blackmail Information",
    "Prototype Blueprint",
    "Domestic Law",
    "International Law",
    "Tribal Law",
    "Pending Lawsuits",
    "Contact Dossiers",
    "Current Inmates",
    "Previous Inmates",
    "Psychiatric Reports",
    "Parole Files",
    "Contact Dossiers",
    "Open Case Files",
    "Closed Case Files",
    "Equipment Permits",
    "Outstanding Warrants",
    "Unsolved Cases",
    
    [255] = "None"
}

CyberspaceAlertLevel =
{
    [0] = "Passive",
    "Active",
    
    [255] = "None"
}

CyberspaceNodeColor =
{
    [0] = "White",
    "Blue",
    "Green",
    "Orange",
    "Red"
}

CyberspaceICEType =
{
    [0] = "Access",
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

Passcodes =
{
    "Run Passcode",
    "Aztechnology",
    "Club Penumbra",
    "Seattle General Hospital",
    "Ares",
    "Gates Undersound",
    "Hollywood Correctional Facility",
    "Mitsuhama",
    "Renraku",
    "Fuchi",
    "Lone Star",
    "Ito's Passcode"
}

Johnson =
{
    [0] = "Mr. Gunderson",
    "Julius Strouther",
    "Mortimer Reed",
    "Vigore and Jarl",
    "Caleb Brightmore",
    
    [255] = "None"
}

KnownJohnsons =
{
    "Mr. Gunderson",
    "Julius Strouther",
    "Mortimer Reed",
    "Vigore and Jarl",
    "Caleb Brightmore"
}

Shadowrunners =
{
    "Ricky",
    "Winston Mars",
    "Trent Delisario",
    "Petr Uvehr",
    "Walking Bear",
    "Phantom",
    "Ilene Two Fists",
    "Freya Goldenhair",
    "Rianna Heartbane",
    "Stark"
}

Contacts =
{
    "Capt Quinton Jaymes",
    "Alesandro Hobbs",
    "Sharkey",
    "Kipp David",
    "Wilma Temmenhoff",
    "Sgt. Macklemann",
    "Gregory Wilns",
    "Mr. Faradouchi",
    "Agira Tetsumi",
    "Henry J. Culver",
    "Max",
    "Sgt. Chillicut",
    "Prof. Jefferson"
}

-- TODO: Map these bitfields. Gonna be tedious.
Clues =
{
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
    None = 255,
    
    [0] = "Ghoul Bounty",
    "Bodyguard",
    "Courier",
    "Enforcement",
    "Acquisition",
    "Extraction",
    "Matrix Run",
    
    [255] = "None"
}

EnforcementRunType =
{
    [0] = "Defacing and damaging buildings",
    "Feeding Renraku a lot of information",
    "Terrorizing locals",
    "Payments are late"
}

MatrixRunType =
{
    [0] = "Get a high security data file",
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
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Unknown",
    "Matrix Run Complete"
}

Area =
{
    [0] = "Downtown Seattle",
    "Puyallup Barrens",
    "Redmond Barrens",
    "Penumbra District",
    "Council Island",
    "Renraku Arcology",
    "AmerIndian Lands"
}

Building =
{
    [0] =
    {
        [0] = "Seattle Gen. Hospital",
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
        [0] = "The Wanderer",
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
        [0] = "Hollywood Correctional Facilities",
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
        [0] = "Club Penumbra",
        "Wylie's Gala Inn",
        "Fuchi Industrial Electronics",
        "Mitsuhama's local office",
        "Eye Fivers",
        "Big Rhino",
        "Lone Star Security"
    },
    
    {
        [0] = "Council Island Inn",
        "Friendship Restaurant",
        "Passport Lodge",
        "Medicine Lodge Hollow",
        "Council Island Hospital",
        "Ork Embassy"
    },
    
    {
        [0] = "???",
        "Frag Grenade",
        "Wire-Masters",
        "Merlin's Lore",
        "Microtronics",
        "Weapons World",
        "Renraku Offices"
    },
    
    {
        [0] = "???"
    }
}

Client =
{
    [0] = "Mike Nana",
    "John Worley",
    "Ellis Goodson",
    "John Van Anthony",
    "Dok Whitson",
    "Jase Weese",
    "Heinrich Micheals",
    "Billy Gibson",
    "Nero Manser",
    "Alan Turing",
    "Chris Stout",
    "Jorge Kish",
    
    [255] = "None"
}

System =
{
    [0] = "Aztechnology",
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

ShowNuyen = true
ShowStatusValues = true
ShowDatafileValue = true
ShowGhoulBountyCounter = true

MaxNameLength = 12
MaxSpellSlots = 14
MaxDataFiles = 5

BarOffset = 128
BarWidth = 184

CharacterNames = KLib.Table.Init2D(Address.Character.Max, "")
PedNames = KLib.Table.Init2D(Address.Peds.Max, "")

KarmaCost = 1000

memory.usememorydomain("68K RAM")

function CreateMenu()
    KLib.Menu.Color(KLib.Color.White, KLib.Color.Make(0, 64, 0, 192))
    KLib.Message.Color(KLib.Color.Yellow, KLib.Color.Make(0, 0, 0, 192))
    
    KLib.Menu.Page("Shadowrun\r")
    
    KLib.Menu.Text("Party", KLib.Color.Green, true)
    KLib.Menu.SubPage("Basic", CreateBasicPage)
    KLib.Menu.SubPage("Inventory", CreateInventoryPage)
    KLib.Menu.SubPage("Attributes/Skills", CreateAttributesSkillsPage)
    KLib.Menu.SubPage("Group Items", CreateGroupItemsPage)
    KLib.Menu.SubPage("Notebook", CreateNotebookPage)
    KLib.Menu.SubPage("Spellbooks", CreateSpellbooksPage)
    KLib.Menu.SubPage("Player", CreatePlayerPage)
    KLib.Menu.SubPage("Current Run", CreateCurrentRunPage, UpdateCurrentRunPage)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Cyberspace", KLib.Color.Cyan, true)
    KLib.Menu.SubPage("Deck Stats", CreateDeckStatsPage)
    KLib.Menu.SubPage("Deck Programs", CreateDeckProgramsPage)
    KLib.Menu.SubPage("Data Files", CreateDataFilesPage)
    KLib.Menu.SubPage("System", CreateSystemPage)
    KLib.Menu.SubPage("Nodes", CreateNodesPage)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("World", KLib.Color.Yellow, true)
    KLib.Menu.SubPage("Peds", CreatePedsPage)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Misc", KLib.Color.Blue, true)
    KLib.Menu.Enum("Debug Menu", Address.DebugMenu, "byte", { [0] = "Disabled", "Enabled" })
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Functions", KLib.Color.Blue, true)
    KLib.Menu.Text("Sell Data Files").onUse = SellDatafiles
    KLib.Menu.Text("Add CHERNOBYL Passcode").onUse = AddCHERNOBYLPasscode
    KLib.Menu.Text("Buy Karma (" .. KarmaCost .. " Nuyen)").onUse = BuyKarma
end

function CreateBasicPage()
    KLib.Menu.Offset(CharacterNames, Address.Character.Max, Address.Character.Offset)
    
    KLib.Menu.Enum("Race", Address.Character.Race, "byte", Race)
    KLib.Menu.Enum("Archetype", Address.Character.Archetype, "byte", Archetype)
    KLib.Menu.Field("Karma", Address.Character.Karma, "byte")
    KLib.Menu.Bitfield("Cyberware", Address.Character.Cyberware, "u16_be", Cyberware)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Offensive", KLib.Color.Red, true)
    KLib.Menu.Enum("Stance", Address.Character.Stance, "byte", Stance)
    KLib.Menu.Field("Clips", Address.Character.Clips, "byte", 0, 20, BarOffset, BarWidth, KLib.Color.Red)
    KLib.Menu.Field("Ammo", Address.Character.Ammo, "byte", 0, 255, BarOffset, BarWidth, KLib.Color.Red).onUpdate = function(self)
        local weapon = KLib.Memory.ReadByte(Address.Character.Equipped.Weapon + KLib.Menu.GetOffset(), "byte")
        
        if weapon == 0 or weapon > #Item then
            self.max = 255
            self.barVisible = false
        else
            self.max = ItemMax[weapon]
            self.barVisible = true
        end
    end
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Health", KLib.Color.Green, true)
    KLib.Menu.Field("Physical Health", Address.Character.Health.Physical, "byte", 0, 10, BarOffset, BarWidth, KLib.Color.Red)
    KLib.Menu.Field("Mental Health", Address.Character.Health.Mental, "byte", 0, 10, BarOffset, BarWidth, KLib.Color.Green)
end

function CreateInventoryPage()
    KLib.Menu.Offset(CharacterNames, Address.Character.Max, Address.Character.Offset)
    
    KLib.Menu.Text("Equipped", KLib.Color.Red, true)
    KLib.Menu.Enum("Weapon", Address.Character.Equipped.Weapon, "byte", Weapon).onUpdate = function(self)
        if KLib.Memory.ReadByte(Address.Character.Equipped.WeaponType + KLib.Menu.GetOffset(), "byte") == 255 then
            self.values = Spell
        else
            self.values = Weapon
        end
    end
    KLib.Menu.Enum("Weapon Type", Address.Character.Equipped.WeaponType, "byte", WeaponType)
    KLib.Menu.Enum("Armor", Address.Character.Equipped.Armor, "byte", Armor)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Inventory", KLib.Color.Green, true)
    KLib.Menu.EnumGroup(8, "Item", Address.Character.Inventory.Items, "byte", Item)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Quantity", KLib.Color.Green, true)
    KLib.Menu.FieldGroup(8, "Quantity", Address.Character.Inventory.Values, "byte")
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Weapon Attachments", KLib.Color.Green, true)
    KLib.Menu.BitfieldGroup(8, "Attachments", Address.Character.Inventory.Values, "byte", Attachment)
end

function CreateAttributesSkillsPage()
    KLib.Menu.Offset(CharacterNames, Address.Character.Max, Address.Character.Offset)
    
    KLib.Menu.Text("Attributes", KLib.Color.Orange, true)
    KLib.Menu.Field("Body", Address.Character.Attributes.Body, "byte", 1, 8, BarOffset, BarWidth, KLib.Color.Green)
    KLib.Menu.Field("Quickness", Address.Character.Attributes.Quickness, "byte", 1, 8, BarOffset, BarWidth, KLib.Color.Orange)
    KLib.Menu.Field("Strength", Address.Character.Attributes.Strength, "byte", 1, 8, BarOffset, BarWidth, KLib.Color.Red)
    KLib.Menu.Field("Charisma", Address.Character.Attributes.Charisma, "byte", 1, 8, BarOffset, BarWidth, KLib.Color.Yellow)
    KLib.Menu.Field("Intelligence", Address.Character.Attributes.Intelligence, "byte", 1, 8, BarOffset, BarWidth, KLib.Color.Cyan)
    KLib.Menu.Field("Willpower", Address.Character.Attributes.Willpower, "byte", 1, 8, BarOffset, BarWidth, KLib.Color.Blue)
    KLib.Menu.Field("Magic", Address.Character.Attributes.Magic, "byte", 1, 8, BarOffset, BarWidth, KLib.Color.Pink)
    KLib.Menu.Field("Essence", Address.Character.Attributes.Essence, "byte", 0, 6, BarOffset, BarWidth, KLib.Color.Pink)
    KLib.Menu.Field("Essence Factor", Address.Character.Attributes.Essence2, "byte", 0, 9)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Skills", KLib.Color.Blue, true)
    KLib.Menu.Field("Sorcery", Address.Character.Skills.Sorcery, "byte", 0, 9, BarOffset, BarWidth, KLib.Color.Pink)
    KLib.Menu.Field("Firearms", Address.Character.Skills.Firearms, "byte", 0, 9, BarOffset, BarWidth, KLib.Color.Orange)
    KLib.Menu.Field("  Pistols", Address.Character.Skills.Pistols, "byte", 0, 9, BarOffset, BarWidth, KLib.Color.Orange)
    KLib.Menu.Field("  SMGS", Address.Character.Skills.SMGs, "byte", 0, 9, BarOffset, BarWidth, KLib.Color.Orange)
    KLib.Menu.Field("  Shotguns", Address.Character.Skills.Shotguns, "byte", 0, 9, BarOffset, BarWidth, KLib.Color.Orange)
    KLib.Menu.Field("Melee", Address.Character.Skills.Melee, "byte", 0, 9, BarOffset, BarWidth, KLib.Color.Red)
    KLib.Menu.Field("Throwing", Address.Character.Skills.Throwing, "byte", 0, 9, BarOffset, BarWidth, KLib.Color.Red)
    KLib.Menu.Field("Computer", Address.Character.Skills.Computer, "byte", 0, 9, BarOffset, BarWidth, KLib.Color.White)
    KLib.Menu.Field("BioTech", Address.Character.Skills.BioTech, "byte", 0, 9, BarOffset, BarWidth, KLib.Color.White)
    KLib.Menu.Field("Electronics", Address.Character.Skills.Electronics, "byte", 0, 9, BarOffset, BarWidth, KLib.Color.White)
    KLib.Menu.Field("Reputation", Address.Character.Skills.Reputation, "byte", 0, 9, BarOffset, BarWidth, KLib.Color.Yellow)
    KLib.Menu.Field("Negotiation", Address.Character.Skills.Negotiation, "byte", 0, 9, BarOffset, BarWidth, KLib.Color.Yellow)
end

function CreateGroupItemsPage()
    KLib.Menu.Field("Nuyen", Address.Nuyen, "u32_be", 0, 1000000000)
    KLib.Menu.Bitfield("Group Items", Address.GroupItems, "u16_be", GroupItems)
end

function CreateNotebookPage()
    KLib.Menu.Bitfield("Passcodes", Address.Notebook.Passcodes, "u16_be", Passcodes)
    KLib.Menu.Bitfield("Johnsons", Address.Notebook.Johnsons, "u16_be", KnownJohnsons)
    KLib.Menu.Bitfield("Shadowrunners", Address.Notebook.Shadowrunners, "u16_be", Shadowrunners)
    KLib.Menu.Bitfield("Contacts", Address.Notebook.Contacts, "u16_be", Contacts)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Tips & Clues", KLib.Color.Blue, true)
end

function CreateSpellbooksPage()
    KLib.Menu.Offset(SpellbookNames, Address.Spellbook.Max, Address.Spellbook.Offset)
    
    KLib.Menu.Text("Type", KLib.Color.Pink, true)
    for i = 0, MaxSpellSlots - 1 do
        KLib.Menu.Enum("Slot " .. i + 1, Address.Spellbook.Address + (i * 2) + 1, "byte", Spell)
    end
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Level", KLib.Color.Pink, true)
    for i = 0, MaxSpellSlots - 1 do
        KLib.Menu.Field("Level " .. i + 1, Address.Spellbook.Address + (i * 2) + 2, "byte", 0, 8, BarOffset, BarWidth, KLib.Color.Pink)
    end
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Misc", KLib.Color.Pink, true)
    KLib.Menu.Field("Total", Address.Spellbook.Address, "byte", 0, 8)
end

function CreatePlayerPage()
    KLib.Menu.Text("Position", KLib.Color.Yellow, true)
    KLib.Menu.Field("X", Address.Position.X, "byte")
    KLib.Menu.Field("Y", Address.Position.Y, "byte")
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Other", KLib.Color.Yellow, true)
    KLib.Menu.Field("Criminal Record", Address.CriminalRecord, "byte", 0, 8)
end

function CreateCurrentRunPage()
    KLib.Menu.SubPage("Generate Run", CreateGenerateRunPage)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Basic", KLib.Color.Yellow, true)
    KLib.Menu.Enum("Johnson", Address.CurrentRun.Johnson, "byte", Johnson)
    KLib.Menu.Enum("Type", Address.CurrentRun.RunType, "byte", RunType)
    KLib.Menu.Field("Payment", Address.CurrentRun.Payment, "u16_be")
    KLib.Menu.Field("Karma", Address.CurrentRun.Karma, "byte")
    KLib.Menu.Bitfield("Flags", Address.CurrentRun.Flags, "byte", RunFlags)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Parameters", KLib.Color.Yellow, true)
    local params = KLib.Menu.EnumGroup(5, "Paramater", 0, "byte", {})
    for i = 1, #params do
        params[i].tag = "Paramater " .. i
    end
end

function CreateGenerateRunPage()
    KLib.Menu.Text("Ghoul Bounty").onUse = function()
        GenerateRun(RunType.GhoulBounty)
    end
    KLib.Menu.Text("Bodyguard").onUse = function()
        GenerateRun(RunType.Bodyguard)
    end
    KLib.Menu.Text("Courier").onUse = function()
        GenerateRun(RunType.Courier)
    end
    KLib.Menu.Text("Enforcement").onUse = function()
        GenerateRun(RunType.Enforcement, "Basic")
    end
    KLib.Menu.Text("Basic Acquisition").onUse = function()
        GenerateRun(RunType.Acquisition, "Basic")
    end
    KLib.Menu.Text("Moderate Acquisition").onUse = function()
        GenerateRun(RunType.Acquisition, "Moderate")
    end
    KLib.Menu.Text("Expert Acquisition").onUse = function()
        GenerateRun(RunType.Acquisition, "Expert")
    end
    KLib.Menu.Text("Basic Extraction").onUse = function()
        GenerateRun(RunType.Extraction, "Basic")
    end
    KLib.Menu.Text("Moderate Acquisition").onUse = function()
        GenerateRun(RunType.Extraction, "Moderate")
    end
    KLib.Menu.Text("Expert Acquisition").onUse = function()
        GenerateRun(RunType.Extraction, "Expert")
    end
    KLib.Menu.Text("Basic Matrix Run").onUse = function()
        GenerateRun(RunType.MatrixRun, "Basic")
    end
    KLib.Menu.Text("Moderate Matrix Run").onUse = function()
        GenerateRun(RunType.MatrixRun, "Moderate")
    end
    KLib.Menu.Text("Expert Matrix Run").onUse = function()
        GenerateRun(RunType.MatrixRun, "Expert")
    end
end

function UpdateCurrentRunPage(page)
    local params =
    {
        KLib.Menu.Find(page, "Paramater 1"),
        KLib.Menu.Find(page, "Paramater 2"),
        KLib.Menu.Find(page, "Paramater 3"),
        KLib.Menu.Find(page, "Paramater 4"),
        KLib.Menu.Find(page, "Paramater 5")
    }
    
    local type = KLib.Memory.ReadByte(Address.CurrentRun.RunType)
    local area = KLib.Memory.ReadByte(Address.CurrentRun.Area1)
    local area2 = KLib.Memory.ReadByte(Address.CurrentRun.Area2)
    local index = 1
    
    for i = 1, #params do
        params[i].type = "enum"
    end
    
    if type >= RunType.GhoulBounty and type < RunType.MatrixRun then
        if type == RunType.GhoulBounty then
            params[index].name = "Area"
        elseif type ~= RunType.Bodyguard and type ~= RunType.Courier then
            params[index].name = "Destination Area"
        else
            params[index].name = "Source Area"
        end
        
        params[index].address = Address.CurrentRun.Area1
        params[index].values = Area
        
        index = index + 1
        
        if type >= RunType.Bodyguard and type < RunType.MatrixRun then
            if type ~= RunType.Bodyguard and type ~= RunType.Courier then
                params[index].name = "Destination Building"
            else
                params[index].name = "Source Building"
            end
            
            params[index].address = Address.CurrentRun.Building1
            params[index].values = Building[area]
            
            index = index + 1
        end
        
        if type == RunType.GhoulBounty then
            params[index].type = "field"
            params[index].name = "Ghouls Killed"
            params[index].address = Address.CurrentRun.Counter
            
            index = index + 1
        end
        
        if type == RunType.Bodyguard or type == RunType.Courier then
            params[index].name = "Destination Area"
            params[index].address = Address.CurrentRun.Area2
            params[index].values = Area
            
            index = index + 1
            
            params[index].name = "Destination Building"
            params[index].address = Address.CurrentRun.Building2
            params[index].values = Building[area2]
            
            index = index + 1
        end
        
        if type == RunType.Bodyguard or type == RunType.Extraction then
            params[index].name = "Client"
            params[index].address = Address.CurrentRun.Other
            params[index].values = Client
            
            index = index + 1
        elseif type == RunType.Enforcement then
            params[index].name = "Reason"
            params[index].address = Address.CurrentRun.Other
            params[index].values = EnforcementRunType
            
            index = index + 1
        end
    elseif type == RunType.MatrixRun then
        params[index].name = "Matrix Run Type"
        params[index].address = Address.CurrentRun.Matrix.Type
        params[index].values = MatrixRunType
        
        index = index + 1
        
        params[index].name = "System"
        params[index].address = Address.CurrentRun.Matrix.System
        params[index].values = System
        
        index = index + 1
    end
    
    for i = index, #params do
        params[i].type = "empty"
    end
end

function CreateDeckStatsPage()
    KLib.Menu.Text("Base", KLib.Color.Cyan, true)
    KLib.Menu.Enum("Available", Address.Cyberdeck.HaveDeck, "byte", { [0] = "No", "Yes" })
    KLib.Menu.Enum("Brand", Address.Cyberdeck.Brand, "byte", Cyberdeck)
    KLib.Menu.Field("MPCP Rating", Address.Cyberdeck.Stats.MPCP, "byte", 0, 12, BarOffset, BarWidth, KLib.Color.White)
    KLib.Menu.Field("Hardening Rating", Address.Cyberdeck.Stats.Hardening, "byte", 0, 5, BarOffset, BarWidth, KLib.Color.White)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Memory/Storage", KLib.Color.Cyan, true)
    KLib.Menu.Field("Memory", Address.Cyberdeck.Stats.Memory, "u16_be", 0, 10000)
    KLib.Menu.Field("Storage", Address.Cyberdeck.Stats.Storage, "u16_be", 0, 10000)
    KLib.Menu.Field("Load I/O Speed", Address.Cyberdeck.Stats.Memory, "byte", 0, 250)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Stats", KLib.Color.Cyan, true)
    KLib.Menu.Field("Body", Address.Cyberdeck.Stats.Body, "byte", 0, 12, BarOffset, BarWidth, KLib.Color.Red)
    KLib.Menu.Field("Evasion", Address.Cyberdeck.Stats.Body, "byte", 0, 12, BarOffset, BarWidth, KLib.Color.Yellow)
    KLib.Menu.Field("Masking", Address.Cyberdeck.Stats.Body, "byte", 0, 12, BarOffset, BarWidth, KLib.Color.Green)
    KLib.Menu.Field("Sensor", Address.Cyberdeck.Stats.Body, "byte", 0, 12, BarOffset, BarWidth, KLib.Color.Blue)
    KLib.Menu.Field("Response", Address.Cyberdeck.Stats.Response, "byte", 0, 3, BarOffset, BarWidth, KLib.Color.Orange)
end

function CreateDeckProgramsPage()
    KLib.Menu.Text("Combat", KLib.Color.Red, true)
    KLib.Menu.Field("Attack", Address.Cyberdeck.Programs.Attack, "byte", 0, 8, BarOffset, BarWidth, KLib.Color.Red)
    KLib.Menu.Field("Slow", Address.Cyberdeck.Programs.Slow, "byte", 0, 8, BarOffset, BarWidth, KLib.Color.Red)
    KLib.Menu.Field("Degrade", Address.Cyberdeck.Programs.Degrade, "byte", 0, 8, BarOffset, BarWidth, KLib.Color.Red)
    KLib.Menu.Field("Rebound", Address.Cyberdeck.Programs.Rebound, "byte", 0, 8, BarOffset, BarWidth, KLib.Color.Red)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Defense", KLib.Color.Green, true)
    KLib.Menu.Field("Medic", Address.Cyberdeck.Programs.Medic, "byte", 0, 8, BarOffset, BarWidth, KLib.Color.Green)
    KLib.Menu.Field("Shield", Address.Cyberdeck.Programs.Shield, "byte", 0, 8, BarOffset, BarWidth, KLib.Color.Green)
    KLib.Menu.Field("Smoke", Address.Cyberdeck.Programs.Smoke, "byte", 0, 8, BarOffset, BarWidth, KLib.Color.Green)
    KLib.Menu.Field("Mirrors", Address.Cyberdeck.Programs.Mirrors, "byte", 0, 8, BarOffset, BarWidth, KLib.Color.Green)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Mask/Sense", KLib.Color.Blue, true)
    KLib.Menu.Field("Sleaze", Address.Cyberdeck.Programs.Sleaze, "byte", 0, 8, BarOffset, BarWidth, KLib.Color.Blue)
    KLib.Menu.Field("Deception", Address.Cyberdeck.Programs.Deception, "byte", 0, 8, BarOffset, BarWidth, KLib.Color.Blue)
    KLib.Menu.Field("Relocation", Address.Cyberdeck.Programs.Relocation, "byte", 0, 8, BarOffset, BarWidth, KLib.Color.Blue)
    KLib.Menu.Field("Analyze", Address.Cyberdeck.Programs.Analyze, "byte", 0, 8, BarOffset, BarWidth, KLib.Color.Blue)
end

function CreateDataFilesPage()
    KLib.Menu.Text("Types", KLib.Color.Cyan, true)
    for i = 0, MaxDataFiles - 1 do
        KLib.Menu.Enum("Slot " .. i + 1, Address.Cyberdeck.Datafiles[i], "byte", Datafile)
    end
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Sizes", KLib.Color.Cyan, true)
    for i = 0, MaxDataFiles - 1 do
        KLib.Menu.Field("Slot " .. i + 1, Address.Cyberdeck.Datafiles[i] + 1, "byte")
    end
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Values", KLib.Color.Cyan, true)
    for i = 0, MaxDataFiles - 1 do
        KLib.Menu.Field("Slot " .. i + 1, Address.Cyberdeck.Datafiles[i] + 2, "byte")
    end
end

function CreateSystemPage()
    KLib.Menu.Enum("Alert Level", Address.Cyberspace.AlertLevel, "byte", CyberspaceAlertLevel)
end

function CreateNodesPage()
    KLib.Menu.Offset(nil, Address.Cyberspace.Nodes.Max, Address.Cyberspace.Nodes.Offset)
    
    KLib.Menu.Enum("Color", Address.Cyberspace.Nodes.Color, "byte", CyberspaceNodeColor)
    KLib.Menu.Field("Level", Address.Cyberspace.Nodes.Level, "byte", 1, 8)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("ICE", KLib.Color.Red, true)
    KLib.Menu.Enum("Type", Address.Cyberspace.Nodes.ICEType, "byte", CyberspaceICEType)
    KLib.Menu.Field("Integrity", Address.Cyberspace.Nodes.ICEIntegrity, "byte", 0, 10)
    KLib.Menu.Field("Speed", Address.Cyberspace.Nodes.ICESpeed, "byte", 0, 18)
    KLib.Menu.Field("Level 1", Address.Cyberspace.Nodes.ICELevel1, "byte", 1, 8)
    KLib.Menu.Field("Level 2", Address.Cyberspace.Nodes.ICELevel2, "byte", 1, 8)
end

function CreatePedsPage()
    KLib.Menu.Offset(PedNames, Address.Peds.Max, Address.Peds.Offset)
    
    KLib.Menu.Field("Health", Address.Peds.Health, "byte")
    KLib.Menu.Field("X", Address.Peds.X, "byte")
    KLib.Menu.Field("Y", Address.Peds.Y, "byte")
end

function GetDatafilesValue()
    local total = 0
    local values = {}
    
    for i = 0, MaxDataFiles - 1 do
        local address = Address.Cyberdeck.Datafiles[i]
        local size = KLib.Memory.ReadByte(address + 1)
        local value = KLib.Memory.ReadByte(address + 2)
        local amount = 0
        
        if value ~= 255 then
            amount = size * 5
            amount = amount * value
            
            total = total + amount
        end
        
        table.insert(values, value)
    end
    
    return total, values
end

-- TODO: Improve output display by implementing a "large" message type.
function SellDatafiles()
    local nuyen = KLib.Memory.ReadIntBig(Address.Nuyen)
    local total = GetDatafilesValue()
    
    for i = 0, MaxDataFiles - 1 do
        local address = Address.Cyberdeck.Datafiles[i]
        
        if value ~= 255 then
            KLib.Memory.WriteByte(address, 255)
            KLib.Memory.WriteByte(address + 1, 0)
            KLib.Memory.WriteByte(address + 2, 0)
        end
    end
    
    KLib.Memory.WriteIntBig(Address.Nuyen, nuyen + total)
    
    KLib.Message.Add("+" .. total .. " (" .. nuyen + total .. ")")
end

function AddCHERNOBYLPasscode()
    local flags = KLib.Memory.ReadByte(Address.Notebook.Clues + 8)
    
    flags = bit.set(flags, 2) -- ------B--
    flags = bit.set(flags, 3) -- ----N---L
    flags = bit.set(flags, 4) -- C----O---
    flags = bit.set(flags, 5) -- -H-R-----
    flags = bit.set(flags, 6) -- --E----Y-
    
    flags = bit.clear(flags, 7) -- Completed
    
    KLib.Memory.WriteByte(Address.Notebook.Clues + 8, flags)
    
    KLib.Message.Add("CHERNOBYL passcode has been added", KLib.Color.Cyan)
end

function BuyKarma()
    local current = KLib.Memory.ReadByte(Address.RunnerIndex) - 1
    local nuyen = KLib.Memory.ReadIntBig(Address.Nuyen)
    local karma = KLib.Memory.ReadByte(Address.Character.Karma + (current * Address.Character.Offset))
    
    if nuyen >= KarmaCost and karma < 255 then
        nuyen = nuyen - KarmaCost
        karma = karma + 1
        
        KLib.Memory.WriteIntBig(Address.Nuyen, nuyen)
        KLib.Memory.WriteByte(Address.Character.Karma, karma)
        
        KLib.Message.Add("+1 Karma (" .. nuyen .. " Nuyen Remaining)")
    elseif karma == 255 then
        KLib.Message.Add("Your Karma is already at the maximum!", KLib.Color.Red)
    else
        KLib.Message.Add("Not enough nuyen!", KLib.Color.Red)
    end
end

function GenerateRun(type, difficulty, johnson)
    local function BuildingValid(a1, a2, b1, b2)
        if (a1 == a2 and b1 == b2) or Building[a1][b1] == "???" or Building[a2][b2] == "???" then
            return false
        end
        
        return true
    end
    
    local function CalculatePayment(type, negotiation, difficulty)
        local payment = math.floor(math.random(0, negotiation / 2) * 5)
        local karma = 0
        
        if type == RunType.GhoulBounty then
            payment = payment + 40
            karma = 1
        elseif type == RunType.Bodyguard then
            payment = payment + 200
            karma = 1
        elseif type == RunType.Courier then
            payment = payment + 180
            karma = 1
        elseif type == RunType.Enforcement then
            payment = payment + 200
            karma = 2
        elseif type == RunType.Acquisition or type == RunType.Extraction then
            if difficulty == "Basic" then
                payment = payment + 600
                karma = 2
            elseif difficulty == "Moderate" then
                payment = payment + 1000
                karma = 4
            elseif difficulty == "Expert" then
                payment = payment + 4000
                karma = 6
            end
        elseif type == RunType.MatrixRun then
            if difficulty == "Basic" then
                payment = payment + 400
                karma = 2
            elseif difficulty == "Moderate" then
                payment = payment + 2500
                karma = 3
            elseif difficulty == "Expert" then
                payment = payment + 6000
                karma = 5
            end
        end
        
        if type >= RunType.Bodyguard and type < RunType.MatrixRun and not bit.check(KLib.Memory.ReadByte(Address.GroupItems), 6) then
            payment = payment + 40
        end
        
        return payment, karma
    end
    
    local difficulties =
    {
        "Simple",
        "Moderate",
        "Expert"
    }
    
    type = type or math.random(0, 3) -- #RunType - 1
    difficulty = difficulty or math.random(1, #difficulties)
    johnson = johnson or math.random(0, #Johnson - 2)
    
    local charisma = KLib.Memory.ReadByte(Address.Character.Attributes.Charisma)
    local negotiation = KLib.Memory.ReadByte(Address.Character.Skills.Negotiation)
    local payment = 0
    local karma = 0
    local area1 = 0
    local area2 = 0
    local building1 = 0
    local building2 = 0
    local other = 255
    local message = "New Shadowrun!\n \n"
    
    message = message .. "Johnson: " .. Johnson[johnson] .. "\n \n"
    message = message .. "Type: " .. tostring(RunType[type]) .. "\n"
    
    if type == RunType.GhoulBounty then
        area1 = math.random(1, #Area - 2)
        
        message = message .. "Area: " .. Area[area1] .. "\n"
    elseif type == RunType.Bodyguard or type == RunType.Courier then
        repeat
            area1 = math.random(0, #Area - 2)
            area2 = math.random(0, #Area - 2)
            building1 = math.random(0, #Building[area1] - 1)
            building2 = math.random(0, #Building[area2] - 1)
        until BuildingValid(area1, area2, building1, building2)
        
        if type == RunType.Bodyguard then
            other = math.random(0, #Client - 1)
        end
        
        message = message .. "Pickup Area: " .. Area[area1] .. "\n"
        message = message .. "Pickup Building: " .. Building[area1][building1] .. "\n"
        message = message .. "Destination Area: " .. Area[area2] .. "\n"
        message = message .. "Destination Building: " .. Building[area2][building2] .. "\n"
        if type == RunType.Bodyguard then
            message = message .. "Client: " .. Client[other] .. "\n"
        end
    elseif type == RunType.Enforcement then
        local targets =
        {
            { 2, 9 }, -- Halloweeners
            { 3, 4 }, -- Eye-Fivers
            { 1, 9 }  -- Ork Gang
        }
        
        local target = math.random(1, #targets)
        
        area1 = targets[target][1]
        building1 = targets[target][2]
        other = math.random(0, #EnforcementRunType - 1)
        
        message = message .. "Destination Area: " .. Area[area1] .. "\n"
        message = message .. "Destination Building: " .. Building[area1][building1] .. "\n"
        message = message .. "Reason: " .. EnforcementRunType[other] .. "\n"
    elseif type == RunType.Acquisition or type == RunType.Extraction then
        local targets = {}
        
        if difficulty == "Basic" then
            table.insert(targets, { 0, 5 } ) -- Fuchi - Downtown Seattle
            table.insert(targets, { 3, 2 } ) -- Fuchi - Penumbra Distract
            table.insert(targets, { 0, 4 } ) -- Mitsuhama - Downtown Seattle
            table.insert(targets, { 3, 3 } ) -- Mitsuhama - Penumbra Distract
        elseif difficulty == "Moderate" then
            table.insert(targets, { 1, 2 } ) -- Ares
            table.insert(targets, { 3, 6 } ) -- Lone Star
        elseif difficulty == "Expert" then
            table.insert(targets, { 5, 6 } ) -- Renraku
        end
        
        local target = math.random(1, #targets)
        
        area1 = targets[target][1]
        building1 = targets[target][2]
        
        if type == RunType.Extraction then
            other = math.random(0, #Client - 1)
        end
        
        message = message .. "Destination Area: " .. Area[area1] .. "\n"
        message = message .. "Destination Building: " .. Building[area1][building1] .. "\n"
        if type == RunType.Acquisition then
            message = message .. "Client: " .. Client[other] .. "\n"
        end
    elseif type == RunType.MatrixRun then
        local targets = {}
        
        if difficulty == "Basic" then
            -- Unnamed Systems
            for i = 11, #System - 1 do
                table.insert(targets, i)
            end
        elseif difficulty == "Moderate" then
            table.insert(targets, 1) -- Club Penumbra
            table.insert(targets, 2) -- Seattle General Hospital
            
            -- Unnamed Systems
            for i = 11, #System - 1 do
                table.insert(targets, i)
            end
        elseif difficulty == "Expert" then
            -- Named Systems
            for i = 0, 9 do
                table.insert(targets, i)
            end                
        end
        
        area1 = math.random(0, #MatrixRunType - 1)
        building1 = targets[math.random(1, #targets)]
        
        message = message .. "Matrix Run Type: " .. MatrixRunType[area1] .. "\n"
        message = message .. "Target System: " .. System[building1] .. "\n"
    end
    
    payment, karma = CalculatePayment(type, negotiation, difficulty)
    
    message = message .. " \nPayment: " .. tostring(payment) .. " Nuyen\n"
    message = message .. "Karma: " .. tostring(karma) .. "\n"
    
    KLib.Memory.WriteByte(Address.CurrentRun.Johnson, johnson)
    KLib.Memory.WriteByte(Address.CurrentRun.RunType, type)
    KLib.Memory.WriteShortBig(Address.CurrentRun.Payment, payment)
    KLib.Memory.WriteByte(Address.CurrentRun.Karma, karma)
    KLib.Memory.WriteByte(Address.CurrentRun.Flags, 0)
    KLib.Memory.WriteByte(Address.CurrentRun.Counter, 0)
    KLib.Memory.WriteByte(Address.CurrentRun.Area1, area1)
    KLib.Memory.WriteByte(Address.CurrentRun.Area2, area2)
    KLib.Memory.WriteByte(Address.CurrentRun.Building1, building1)
    KLib.Memory.WriteByte(Address.CurrentRun.Building2, building2)
    KLib.Memory.WriteByte(Address.CurrentRun.Other, other)
    
    if type == RunType.MatrixRun then
        local passcodes = KLib.Memory.ReadByte(Address.Notebook.Passcodes + 1)
        
        passcodes = bit.set(passcodes, 0)
        
        KLib.Memory.WriteByte(Address.Notebook.Passcodes + 1, passcodes)
    end
    
    KLib.Message.Overlay(message)
end

function IsPaused()
    return KLib.Memory.ReadByte(Address.GameState) == 0 or KLib.Memory.ReadByte(Address.MatrixState) == 255
end

function UpdateNames()
    local function ReadText(address, len)
        local text = ""
        
        for i = 0, len - 1 do
            local char = KLib.Memory.ReadByte(address + i)
            
            if char > 0x20 then
                text = text .. string.char(char)
            end
        end
        
        return bizstring.trim(text) or ""
    end

    for i = 1, Address.Character.Max do
        local name = ReadText(Address.Character.Name + KLib.Menu.GetOffset(), MaxNameLength)
        
        if string.len(name) > 0 then
            CharacterNames[i] = name
        else
            CharacterNames[i] = "None"
        end
    end
    
    for i = 1, Address.Peds.Max do
        local name = ReadText(Address.Peds.Name + KLib.Menu.GetOffset(), MaxNameLength)
        
        if string.len(name) > 0 then
            PedNames[i] = name
        else
            PedNames[i] = "None"
        end
    end
end

function Mods()
    local function DrawNuyen()
        local nuyen = KLib.Memory.ReadIntBig(Address.Nuyen)
        
        if nuyen > 9999999 then
            nuyen = 9999999
        end
        
        gui.pixelText(274, 4, nuyen, KLib.Color.Make(255, 255, 127 + (math.sin(emu.framecount() / 12) * 127)), KLib.Color.Transparent)
    end

    local function DrawStatusValues()
        local total = KLib.Memory.ReadByte(Address.RunnerTotal)
        local offset = 64
        
        for i = 0, total - 1 do
            local physical = KLib.Memory.ReadByte(Address.Character.Health.Physical + (i * Address.Character.Offset))
            local mental = KLib.Memory.ReadByte(Address.Character.Health.Mental + (i * Address.Character.Offset))
            local karma = KLib.Memory.ReadByte(Address.Character.Karma + (i * Address.Character.Offset))
            local clips = KLib.Memory.ReadByte(Address.Character.Clips + (i * Address.Character.Offset))
            
            gui.drawRectangle(280, 23 + (i * offset), 32, 33, KLib.Color.Transparent, KLib.Color.Make(0, 0, 0, 128))
            gui.pixelText(280, 25 + (i * offset), physical, KLib.Color.Make(34, 204, 34), KLib.Color.Transparent)
            gui.pixelText(280, 35 + (i * offset), mental, KLib.Color.Make(204, 136, 204), KLib.Color.Transparent)
            gui.pixelText(280, 45 + (i * offset), karma, KLib.Color.Yellow, KLib.Color.Transparent)
            gui.pixelText(298, 45 + (i * offset), clips, KLib.Color.Orange, KLib.Color.Transparent)
        end
    end
    
    local function DrawDatafileValue()
        local value = GetDatafilesValue()
        
        if value > 0 then
            gui.pixelText(274, 212, value, KLib.Color.Pulse(KLib.Color.Yellow, 32, 32))
        end
    end
    
    local function DrawGhoulBounty()
        local total = 20
        local transition = math.floor(255 / total)
        local runType = KLib.Memory.ReadByte(Address.CurrentRun.RunType)
        local count = KLib.Memory.ReadByte(Address.CurrentRun.Counter)
        local color = KLib.Color.White
        
        if count >= total then
            color = KLib.Color.Pulse(KLib.Color.Green, 64, 8)
        else
            local byte = 255 - (count * transition)
            
            color = KLib.Color.Green
            color = color + bit.lshift(byte, 16)
            color = color + byte
        end
        
        if runType == RunType.GhoulBounty then
            gui.pixelText(4, 4, count .. " / " .. total, color, KLib.Color.Transparent)
        end
    end
    
    if KLib.Input.ButtonPressed("P1 Z") then
        SellDatafiles()
    end
    
    if KLib.Input.Parse("@NumberPad0") then
        ShowNuyen = not ShowNuyen
    end
    
    if KLib.Input.Parse("@NumberPad1") then
        ShowStatusValues = not ShowStatusValues
    end
    
    if KLib.Input.Parse("@NumberPad2") then
        ShowDatafileValue = not ShowDatafileValue
    end
    
    if KLib.Input.Parse("@NumberPad3") then
        ShowGhoulBountyCounter = not ShowGhoulBountyCounter
    end
    
    if not KLib.Menu.Open then
        if ShowNuyen then
            DrawNuyen()
        end
        
        if not IsPaused() and ShowStatusValues then
            DrawStatusValues()
        end
        
        if ShowDatafileValue then
            DrawDatafileValue()
        end
        
        if ShowGhoulBountyCounter then
            DrawGhoulBounty()
        end
    end
end

CreateMenu()

while true do
    KLib.Update()
    
    UpdateNames()
    
    Mods()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
