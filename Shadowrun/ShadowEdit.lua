dofile("ShadowEdit/Address.lua")
dofile("ShadowEdit/Color.lua")

dofile("ShadowEdit/Races.lua")
dofile("ShadowEdit/Archetypes.lua")
dofile("ShadowEdit/Stances.lua")
dofile("ShadowEdit/Cyberware.lua")
dofile("ShadowEdit/Weapons.lua")
dofile("ShadowEdit/WeaponFlags.lua")
dofile("ShadowEdit/Spells.lua")
dofile("ShadowEdit/Armors.lua")
dofile("ShadowEdit/Items.lua")
dofile("ShadowEdit/Attachments.lua")
dofile("ShadowEdit/Cyberdecks.lua")
dofile("ShadowEdit/Datafiles.lua")
dofile("ShadowEdit/Johnsons.lua")
dofile("ShadowEdit/RunTypes.lua")
dofile("ShadowEdit/MatrixRunTypes.lua")
dofile("ShadowEdit/Areas.lua")
dofile("ShadowEdit/Buildings.lua")
dofile("ShadowEdit/Clients.lua")
dofile("ShadowEdit/Systems.lua")
dofile("ShadowEdit/GroupItems.lua")
dofile("ShadowEdit/Passcodes.lua")

dofile("ShadowEdit/DataType.lua")
dofile("ShadowEdit/Utils.lua")
dofile("ShadowEdit/Memory.lua")
dofile("ShadowEdit/Input.lua")

dofile("ShadowEdit/Message.lua")
dofile("ShadowEdit/GUI.lua")
dofile("ShadowEdit/Menu.lua")

MenuInit()

while true do
    Input.Current = joypad.get(2)
    
    CheckInput()
    
    UpdateFrozen()
    UpdateAddresses()
    UpdateValues()
    UpdateMenuEvents()
    
    gens.frameadvance()
    
    Input.Previous = Input.Current
end
