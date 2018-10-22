KLib.Cheat =
{
    Cheats = {}
}

function KLib.Cheat.Toggle(self)
    self.enabled = not self.enabled
    
    if self.enabled and self.onEnabled ~= nil then
        self.onEnabled()
    elseif self.onDisabled ~= nil then
        self.onDisabled()
    end
    
    if self.message then
        KLib.Message.Add(self.name .. " " .. KLib.String.OnOff(self.enabled))
    end
end

function KLib.Cheat.Cheat(type)
    local cheat = {}
    
    cheat.type = type
    cheat.enabled = false
    cheat.data = {}
    cheat.toggle = KLib.Cheat.Toggle

    table.insert(KLib.Cheat.Cheats, cheat)
    
    return cheat
end

function KLib.Cheat.Basic(name, key, address, value, size, message)
    local cheat = KLib.Cheat.Cheat("basic")
    
    cheat.type = "basic"
    cheat.name = name
    cheat.key = key
    cheat.address = address
    cheat.value = value
    cheat.size = size
    cheat.message = message or false
    cheat.enabled = false
    cheat.initialValue = KLib.Memory.GetReader(size)(address)
    cheat.toggle = KLib.Cheat.Toggle
    
    return cheat
end

function KLib.Cheat.Advanced(name, key, message, onUpdate, onEnabled, onDisabled)
    local cheat = KLib.Cheat.Cheat("advanced")
    
    cheat.type = "advanced"
    cheat.name = name
    cheat.key = key
    cheat.message = message
    cheat.onUpdate = onUpdate
    cheat.onEnabled = onEnabled or nil
    cheat.onDisabled = onDisabled or nil
    
    return cheat
end

function KLib.Cheat.Update()
    for _, cheat in pairs(KLib.Cheat.Cheats) do
        if KLib.Input.Parse(cheat.key) then
            cheat:toggle()
        end
        
        if cheat.enabled then
            if cheat.type == "basic" then
                KLib.Memory.GetWriter(cheat.size)(cheat.address, (cheat.value == nil and cheat.initialValue or cheat.value))
            elseif cheat.type == "advanced" then
                cheat.onUpdate()
            end
        end
    end
end
