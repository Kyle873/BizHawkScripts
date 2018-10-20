KLib.Cheat =
{
    Cheats = {}
}

function KLib.Cheat.Add(name, message, onInput, onUpdate, onEnabled, onDisabled)
    local cheat = {}
    
    cheat.name = name
    cheat.message = message
    cheat.onInput = onInput
    cheat.onUpdate = onUpdate or nil
    cheat.onEnabled = onEnabled or nil
    cheat.onDisabled = onDisabled or nil
    cheat.enabled = false
    cheat.data = {}
    
    cheat.toggle = function(self)
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
    
    table.insert(KLib.Cheat.Cheats, cheat)
    
    return cheat
end

function KLib.Cheat.Update()
    for _, cheat in pairs(KLib.Cheat.Cheats) do
        if cheat.onInput() then
            cheat:toggle()
        end
        
        if cheat.enabled and cheat.onUpdate ~= nil then
            cheat.onUpdate()
        end
    end
end
