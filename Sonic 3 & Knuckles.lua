dofile("KLib/KLib.lua")
dofile("Data/Sonic 3 & Knuckles.lua")

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
