KLib.Message =
{
    ForeColor = KLib.Color.White,
    BackColor = KLib.Color.Black,
    Size = 12,
    Font = nil,
    Style = nil,
    
    FadeTime = 60,
    
    Messages = {}
}

function KLib.Message.Color(foreColor, backColor)
    KLib.Message.ForeColor = foreColor or KLib.Message.ForeColor
    KLib.Message.BackColor = backColor or KLib.Message.BackColor
end

function KLib.Message.Font(size, font, style)
    KLib.Message.Size = size or KLib.Message.Size
    KLib.Message.Font = font or KLib.Message.Font
    KLib.Message.Style = style or KLib.Message.Style
end

function KLib.Message.Add(text, time)
    local message = {}
    
    message.text = text
    message.timeMax = time or 300
    message.time = message.timeMax
    message.expired = false
    
    table.insert(KLib.Message.Messages, message)
end

function KLib.Message.Update()
    local function ModAlpha(color, time)
        return bit.band(color, 0x00FFFFFF) + bit.lshift((bit.rshift(color, 24) / KLib.Message.FadeTime) * (KLib.Message.FadeTime - math.abs(time)), 24)
    end
    
    local y = client.bufferheight() - KLib.Message.Size - 2
    
    for i = #KLib.Message.Messages, 1, -1 do
        local message = KLib.Message.Messages[i]
        
        if message.time >= -KLib.Message.FadeTime then
            if message.time >= 0 then
                gui.drawText(0, y, message.text, KLib.Message.ForeColor, KLib.Message.BackColor, KLib.Message.Size, KLib.Message.Font, KLib.Message.Style)
            else
                gui.drawText(0, y, message.text, ModAlpha(KLib.Message.ForeColor, message.time), ModAlpha(KLib.Message.BackColor, message.time), KLib.Message.Size, KLib.Message.Font, KLib.Message.Style)
            end
        else
            message.expired = true
        end
        
        y = y - KLib.Message.Size
        
        message.time = message.time - 1
    end
    
    for i = 1, #KLib.Message.Messages do
        local message = KLib.Message.Messages[i]
        
        if message ~= nil and message.expired then
            table.remove(KLib.Message.Messages, i)
        end
    end
end
