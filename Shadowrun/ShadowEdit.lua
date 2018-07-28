dofile("Address.lua")
dofile("Color.lua")

dofile("Races.lua")
dofile("Archetypes.lua")
dofile("Stances.lua")
dofile("Cyberware.lua")
dofile("Weapons.lua")
dofile("WeaponFlags.lua")
dofile("Spells.lua")
dofile("Armors.lua")
dofile("Items.lua")
dofile("ItemValues.lua")
dofile("Attachments.lua")
dofile("Cyberdecks.lua")
dofile("Datafiles.lua")
dofile("GroupItems.lua")
dofile("Passcodes.lua")
dofile("Johnsons.lua")
dofile("Shadowrunners.lua")
dofile("Contacts.lua")
dofile("MatrixRunTypes.lua")
dofile("RunTypes.lua")
dofile("RunFlags.lua")
dofile("Areas.lua")
dofile("Buildings.lua")
dofile("Clients.lua")
dofile("Systems.lua")

dofile("DataType.lua")
dofile("Utils.lua")
dofile("Memory.lua")
dofile("Input.lua")

dofile("Message.lua")
dofile("GUI.lua")
dofile("Menu.lua")

memory.usememorydomain("68K RAM")
gui.defaultPixelFont("fceux")

-- Help()
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
    
    emu.frameadvance()
    
    Input.Previous = Input.Current
end
