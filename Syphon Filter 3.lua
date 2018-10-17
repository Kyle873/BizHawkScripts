Address =
{
    CurrentLevel = 0x12E2C4,
    
    HealthBase =
    {
        -- Main Game
        0x1BB602, -- Hotel Fukushima
        0x1B40A6, -- Costa Rican Plantation
        0x1B2C56, -- C-5 Galaxy Transport
        0x1B446A, -- Pugari Gold Mine (TODO: wrong?)
        0x1AAB9E, -- Pugari Complex
        0x1B007E, -- Kabul. Afghanistan
        0x1BD3CA, -- S.S. Lorelei
        0x1B2F92, -- Aztec Ruins
        0x1B4036, -- Waterfront (TODO: wrong?)
        0x1A3CE2, -- Docks Final Assault
        0x1A8F1E, -- Convoy (TODO: wrong?)
        0x1AABC2, -- The Beast
        0x1A5B12, -- Australian Outback
        0x1AF106, -- St. George Australia
        0x1B39B2, -- Paradise Ridge
        0x1B7D2A, -- Militia Compound
        0x1B15E6, -- Underground Bunker (TODO: wrong?)
        0x1AE436, -- Senate Building
        0x1B56DA, -- DC Subway
        
        -- TODO: Mini-Games
    },
    
    Weapons = 0x12D7D8,
    Ammo = 0x12D7E4,
    Danger = 0x0000,

    Cheats = 0x1223F4,
    MinigameTime = 0x5E016
}

Input =
{
    Current = {},
    Previous = {}
}

Cheat =
{
    Health = 1,
    CurrentHealth = 0,
    PreviousHealth = 0,
    HealthTimer = 0
}

function UpdateCheats()
    local weapons = { 0, 0, 0, 0, 0 }
    
    local ammo =
    {
        { 90,  15  }, -- 9mm
        { 90,  15  }, -- Silenced 9mm
        { 60,  10  }, -- .45
        { 48,  8   }, -- Falcon
        { 198, 33  }, -- G-18
        { 180, 30  }, -- HK-5
        { 180, 30  }, -- Silenced HK-5
        { 180, 30  }, -- PK-102
        { 180, 30  }, -- M-16
        { 396, 66  }, -- BIZ-2
        { 300, 50  }, -- H-11
        { 180, 30  }, -- AU300
        { 192, 32  }, -- MARS
        { 120, 20  }, -- SPYDER
        { 120, 20  }, -- K3G4
        { 0,   25  }, -- Shotgun
        { 0,   12  }, -- UAS-12
        { 18,  6   }, -- MIL15
        { 0,   10  }, -- MAKS
        { 30,  10  }, -- Sniper Rifle
        { 30,  10  }, -- Silenced Sniper Rifle
        { 30,  10  }, -- Nightvision Rifle
        { 0,   0   }, -- 
        { 0,   15  }, -- M-79
        { 0,   0   }, -- 
        { 0,   0   }, -- 
        { 0,   0   }, -- 
        { 0,   15  }, -- Crossbow
        { 0,   0   }, -- 
        { 0,   0   }, -- 
        { 0,   10  }, -- Grenade
        { 0,   10  }, -- Gas Grenade
        { 0,   5   }, -- C4 Explosives
        { 0,   5   }, -- Transponder
        { 0,   0   }, -- 
        { 0,   5   }, -- Modem
    }

    if Input.Current.Select then
        if Input.Current.L1 then
            if Input.Current.Cross and not Input.Previous.Cross then
                weapons[1] = bit.set(weapons[1], 1) -- 9mm
                weapons[1] = bit.set(weapons[1], 2) -- Silenced 9mm
                weapons[1] = bit.set(weapons[1], 3) -- .45
                weapons[1] = bit.set(weapons[1], 4) -- Falcon
                weapons[1] = bit.set(weapons[1], 5) -- G-18
                weapons[1] = bit.set(weapons[1], 6) -- HK-5
                weapons[1] = bit.set(weapons[1], 7) -- Silenced HK-5
                weapons[2] = bit.set(weapons[2], 0) -- PK-102
                weapons[2] = bit.set(weapons[2], 1) -- M-16
                weapons[2] = bit.set(weapons[2], 2) -- BIZ-2
                weapons[2] = bit.set(weapons[2], 3) -- H-11
                weapons[2] = bit.set(weapons[2], 4) -- AU300
                weapons[2] = bit.set(weapons[2], 5) -- MARS
                weapons[2] = bit.set(weapons[2], 6) -- SPYDER
                weapons[2] = bit.set(weapons[2], 7) -- K3G4
                
                memory.writebyte(Address.Weapons, weapons[1])
                memory.writebyte(Address.Weapons + 1, weapons[2])
                memory.writebyte(Address.Weapons + 2, weapons[3])
                memory.writebyte(Address.Weapons + 3, weapons[4])
                memory.writebyte(Address.Weapons + 4, weapons[5])
                
                gui.addmessage("Weapon Set 1")
            elseif Input.Current.Square and not Input.Previous.Square then
                weapons[3] = bit.set(weapons[3], 0) -- Shotgun
                weapons[3] = bit.set(weapons[3], 1) -- UAS-12
                weapons[3] = bit.set(weapons[3], 2) -- MIL15
                weapons[3] = bit.set(weapons[3], 3) -- MAKS
                weapons[3] = bit.set(weapons[3], 4) -- Sniper Rifle
                weapons[3] = bit.set(weapons[3], 5) -- Silenced Sniper Rifle
                weapons[3] = bit.set(weapons[3], 6) -- Nightvision Rifle
                weapons[3] = bit.set(weapons[3], 7) -- Air Taser
                weapons[4] = bit.set(weapons[4], 0) -- M-79
                weapons[4] = bit.set(weapons[4], 4) -- Crossbow
                weapons[4] = bit.set(weapons[4], 5) -- Hand Taser
                weapons[4] = bit.set(weapons[4], 6) -- Knife
                weapons[4] = bit.set(weapons[4], 7) -- Grenade
                weapons[5] = bit.set(weapons[5], 0) -- Gas Grenade
                
                memory.writebyte(Address.Weapons, weapons[1])
                memory.writebyte(Address.Weapons + 1, weapons[2])
                memory.writebyte(Address.Weapons + 2, weapons[3])
                memory.writebyte(Address.Weapons + 3, weapons[4])
                memory.writebyte(Address.Weapons + 4, weapons[5])
                
                gui.addmessage("Weapon Set 2")
            elseif Input.Current.Triangle and not Input.Previous.Triangle then
                weapons[5] = bit.set(weapons[5], 1) -- C4 Explosives
                weapons[5] = bit.set(weapons[5], 2) -- Transponder
                weapons[5] = bit.set(weapons[5], 3) -- Camera
                weapons[5] = bit.set(weapons[5], 4) -- Modem
                weapons[5] = bit.set(weapons[5], 6) -- Mine Detector
                
                memory.writebyte(Address.Weapons, weapons[1])
                memory.writebyte(Address.Weapons + 1, weapons[2])
                memory.writebyte(Address.Weapons + 2, weapons[3])
                memory.writebyte(Address.Weapons + 3, weapons[4])
                memory.writebyte(Address.Weapons + 4, weapons[5])
                
                gui.addmessage("Gadget Set")
            elseif Input.Current.Circle and not Input.Previous.Circle then
                for i = 1, #ammo do
                    memory.write_s16_le(Address.Ammo + ((i - 1) * 4), ammo[i][1])
                    memory.write_s16_le(Address.Ammo + ((i - 1) * 4) + 2, ammo[i][2])
                end
                
                gui.addmessage("Maximum Ammo")
            end
        elseif Input.Current.Square and not Input.Previous.Square then
            if Input.Current.Cross then
                Cheat.Health = Cheat.Health - 1
            else
                Cheat.Health = Cheat.Health + 1
            end
            
            if Cheat.Health < 1 then
                Cheat.Health = 3
            elseif Cheat.Health > 3 then
                Cheat.Health = 1
            end
            
            if Cheat.Health == 1 then
                gui.addmessage("Invincibility/Regeneration OFF")
            elseif Cheat.Health == 2 then
                gui.addmessage("Invincibility ON")
            elseif Cheat.Health == 3 then
                gui.addmessage("Regeneration ON")
            end
        end
    end
    
    if Cheat.Health == 2 then
        local level = memory.readbyte(Address.CurrentLevel)
        local address = Address.HealthBase[level + 1]
        
        memory.write_u16_le(address, 600)
        memory.write_u16_le(address + 2, 150)
    elseif Cheat.Health == 3 then
        local level = memory.readbyte(Address.CurrentLevel)
        local address = Address.HealthBase[level + 1]
        local health = memory.read_u16_le(address)
        
        Cheat.CurrentHealth = health
        
        if Cheat.CurrentHealth < Cheat.PreviousHealth then
            Cheat.HealthTimer = 600
        elseif Cheat.HealthTimer > 0 then
            Cheat.HealthTimer = Cheat.HealthTimer - 1
        end
        
        if Cheat.HealthTimer <= 0 and health < 600 and emu.framecount() % 5 == 0 then
            memory.write_u16_le(address, health + 1)
        end
        
        Cheat.PreviousHealth = Cheat.CurrentHealth
    end
    
    memory.write_s16_be(Address.Cheats, 0xFFFF)
    -- memory.write_s16_be(Address.MinigameTime, 0x2400)
end

gui.defaultPixelFont("fceux")

while true do
    Input.Current = joypad.get(1)
    
    UpdateCheats()
    
    emu.frameadvance()
    
    Input.Previous = Input.Current
end