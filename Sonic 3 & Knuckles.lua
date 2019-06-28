dofile("KLib/KLib.lua")

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

memory.usememorydomain("68K RAM")

while true do
    KLib.Update()
    
    -- Fire Shield
    if KLib.Input.ButtonPressed("P1 X") then
        local flags = KLib.Memory.ReadByte(Address.Object.Base + Address.Object.Offset.SecondaryStatusFlags)
        
        flags = bit.set(flags, SecondaryStatusFlags.ShieldActive)
        flags = bit.set(flags, SecondaryStatusFlags.FireShield)
        flags = bit.clear(flags, SecondaryStatusFlags.LightningShield)
        flags = bit.clear(flags, SecondaryStatusFlags.BubbleShield)
        
        KLib.Memory.WriteByte(Address.Object.Base + Address.Object.Offset.SecondaryStatusFlags, flags)
    end
    
    -- Lightning Shield
    if KLib.Input.ButtonPressed("P1 Y") then
        local flags = KLib.Memory.ReadByte(Address.Object.Base + Address.Object.Offset.SecondaryStatusFlags)
        
        flags = bit.set(flags, SecondaryStatusFlags.ShieldActive)
        flags = bit.clear(flags, SecondaryStatusFlags.FireShield)
        flags = bit.set(flags, SecondaryStatusFlags.LightningShield)
        flags = bit.clear(flags, SecondaryStatusFlags.BubbleShield)
        
        KLib.Memory.WriteByte(Address.Object.Base + Address.Object.Offset.SecondaryStatusFlags, flags)
    end
    
    -- Bubble Shield
    if KLib.Input.ButtonPressed("P1 Z") then
        local flags = KLib.Memory.ReadByte(Address.Object.Base + Address.Object.Offset.SecondaryStatusFlags)
        
        flags = bit.set(flags, SecondaryStatusFlags.ShieldActive)
        flags = bit.clear(flags, SecondaryStatusFlags.FireShield)
        flags = bit.clear(flags, SecondaryStatusFlags.LightningShield)
        flags = bit.set(flags, SecondaryStatusFlags.BubbleShield)
        
        KLib.Memory.WriteByte(Address.Object.Base + Address.Object.Offset.SecondaryStatusFlags, flags)
    end
    
    -- Add Rings
    if KLib.Input.Joypad["P1 Mode"] then
        local rings = KLib.Memory.ReadShortBig(Address.Rings)
        
        if rings < 1000 then
            KLib.Memory.WriteShortBig(Address.Rings, rings + 1)
        end
    end

	emu.frameadvance()
    
    KLib.PostUpdate()
end
