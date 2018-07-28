PreviousInput = {}

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
    },
    
    Flags =
    {
        SecondaryStatus =
        {
            ShieldActive = 0,
            FireShield = 4,
            LightningShield = 5,
            BubbleShield = 6,
        },
    },
}

RingStatusTable =
{
    Base = 0xE700,
    End = 0xEAFF,
    Size = 0x02
}

memory.usememorydomain("68K RAM")

function Update()
    Lives = memory.read_s8(0xFE12)
    Continues = memory.read_s8(0xFE18)
    Rings = memory.read_s8(0xFE20)
    Score = memory.read_s32_be(0xFE26) * 10
    
    Time = {}
    Time.Minutes = memory.read_s8(0xFE23)
    Time.Seconds = memory.read_s8(0xFE24)
    Time.Centiseconds = memory.read_s8(0xFE25)
end

function DrawDebugInfo()
    DebugX = 0
    DebugY = 0
    
    local function AddLine(text)
        gui.text(DebugX, DebugY, text)
        
        DebugY = DebugY + 12
    end
    
    AddLine("Lives: " .. Lives)
    AddLine("Continues: " .. Continues)
    AddLine("Rings: " .. Rings)
    AddLine("Score: " .. Score)
    
    if (Time.Seconds < 10) then
        AddLine("Time: " .. Time.Minutes .. ":0" .. Time.Seconds .. "." .. Time.Centiseconds)
    else
        AddLine("Time: " .. Time.Minutes .. ":" .. Time.Seconds .. "." .. Time.Centiseconds)
    end
end

function Input()
    local input = input.get()
    
    -- Fire Shield
    if input.Z and not PreviousInput.Z then
        local flags = memory.read_s8(Object.Base + Object.Offset.SecondaryStatusFlags)
        
        flags = bit.set(flags, Object.Flags.SecondaryStatus.ShieldActive)
        flags = bit.set(flags, Object.Flags.SecondaryStatus.FireShield)
        flags = bit.clear(flags, Object.Flags.SecondaryStatus.LightningShield)
        flags = bit.clear(flags, Object.Flags.SecondaryStatus.BubbleShield)
        
        memory.write_s8(Object.Base + Object.Offset.SecondaryStatusFlags, flags)
    end
    
    -- Lightning Shield
    if input.X and not PreviousInput.X then
        local flags = memory.read_s8(Object.Base + Object.Offset.SecondaryStatusFlags)
        
        flags = bit.set(flags, Object.Flags.SecondaryStatus.ShieldActive)
        flags = bit.clear(flags, Object.Flags.SecondaryStatus.FireShield)
        flags = bit.set(flags, Object.Flags.SecondaryStatus.LightningShield)
        flags = bit.clear(flags, Object.Flags.SecondaryStatus.BubbleShield)
        
        memory.write_s8(Object.Base + Object.Offset.SecondaryStatusFlags, flags)
    end
    
    -- Bubble Shield
    if input.C and not PreviousInput.C then
        local flags = memory.read_s8(Object.Base + Object.Offset.SecondaryStatusFlags)
        
        flags = bit.set(flags, Object.Flags.SecondaryStatus.ShieldActive)
        flags = bit.clear(flags, Object.Flags.SecondaryStatus.FireShield)
        flags = bit.clear(flags, Object.Flags.SecondaryStatus.LightningShield)
        flags = bit.set(flags, Object.Flags.SecondaryStatus.BubbleShield)
        
        memory.write_s8(Object.Base + Object.Offset.SecondaryStatusFlags, flags)
    end
    
    -- Collect Rings
    if input.B and not PreviousInput.B then
        CollectRings()
    end
    
    PreviousInput = input
end

function CollectRings()
    for addr = Object.Base, Object.End, Object.Size do
        if memory.read_u16_be(addr + Object.Offset.ArtBlock) == 0xA6BC then -- Ring
            print("Ring found at " .. addr)
        end
    end
end

while true do
    Update()
    DrawDebugInfo()
    Input()

	emu.frameadvance()
end
