Message =
{
    FadeTime = 60,
    
    Text = "",
    Timer = 0,
    Color = 0,
    
    X = 0,
    Y = 213
}

function NewMessage(text, time, color)
    Message.Text = text
    Message.Timer = time
    Message.Color = color
end

function UpdateMessage()
    local function ModAlpha(color)
        return bit.band(color, 0x00FFFFFF) + bit.lshift((bit.rshift(color, 24) / Message.FadeTime) * (Message.FadeTime - math.abs(Message.Timer)), 24)
    end
    
    if Message.Timer > -Message.FadeTime then
        local outlineColor = Color.Outline
        local backgroundColor = Color.Background
        local messageColor = Message.Color
        
        if Message.Timer <= 0 then
            outlineColor = ModAlpha(Color.Outline)
            backgroundColor = ModAlpha(Color.Background)
            messageColor = ModAlpha(Message.Color)
        end
        
        gui.drawBox(Message.X, Message.Y, Message.X + 4 + (string.len(Message.Text) * 4), Message.Y + 10, outlineColor, backgroundColor)
        gui.pixelText(Message.X + 2, Message.Y + 2, Message.Text, messageColor, 0)
        
        Message.Timer = Message.Timer - 1
    end
end
