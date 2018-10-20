dofile("KLib.lua")

Address =
{
    Mario =
    {
        Lives = 0x2A6A,
        Coins = 0x2C58
    },
    
    Luigi =
    {
        Lives = 0x2A6C,
        Coins = 0x2C83
    },
    
    Timer =
    {
        Level = 0x3D0E,
        Hide = 0x3D06,
        Star = 0x3F65,
        POW = 0x3CF8
    },
    
    Invincibility = 0x3F64,
    Items = 0x2C2E,
    CardTurns = 0x4F08,
}

ItemNames =
{
    "Nothing",
    "Mushroom",
    "Fire Flower",
    "Leaf",
    "Frog",
    "Bear",
    "Hammer Bro",
    "Cloud",
    "P Wing",
    "Star",
    "Anchor",
    "Hammer",
    "Warp Flute",
    "Music Box",
    "Feather",
    "Boomerang"
}

while true do
    KLib.Update()
    
    emu.frameadvance()
    
    KLib.PostUpdate()
end
