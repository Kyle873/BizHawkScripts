Message =
{
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
    if Message.Timer > 0 then
        gui.drawBox(Message.X, Message.Y, Message.X + 4 + (string.len(Message.Text) * 4), Message.Y + 10, Color.Outline, Color.Background)
        gui.pixelText(Message.X + 2, Message.Y + 2, Message.Text, Message.Color, 0)
        
        Message.Timer = Message.Timer - 1
    end
end
