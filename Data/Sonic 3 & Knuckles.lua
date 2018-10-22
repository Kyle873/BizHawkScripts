Address =
{
    Object =
    {
        Base = 0xB000,
        End = 0xCFCB,
        Size = 0x4A,
        
        Offset =
        {
            ArtBlock = 0x0A,
            X = 0x10,
            SubX = 0x12,
            Y = 0x14,
            SubY = 0x16,
            SecondaryStatusFlags = 0x2B,
        }
    },
    
    RingStatusTable =
    {
        Base = 0xE700,
        End = 0xEAFF,
        Size = 0x02
    },

    Lives = 0xFE12,
    Continues = 0xFE18,
    Rings = 0xFE20,
    Score = 0xFE26,
    
    Time =
    {
        Minutes = 0xFE23,
        Seconds = 0xFE24,
        Centiseconds = 0xFE25
    }
}

SecondaryStatusFlags =
{
    ShieldActive = 0,
    FireShield = 4,
    LightningShield = 5,
    BubbleShield = 6
}
