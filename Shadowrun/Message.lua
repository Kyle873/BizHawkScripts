Message =
{
    Text = "",
    Timer = 0,
    Color = 0,
    
    X = 0,
    Y = 212
}

function NewMessage(text, time, color)
    Message.Text = text
    Message.Timer = time
    Message.Color = color
end

function UpdateMessage()
    if Message.Timer > 0 then
        gui.box(Message.X, Message.Y, Message.X + 2 + (string.len(Message.Text) * 4), Message.Y + 10, Color.Background, Color.Outline)
        gui.text(Message.X + 2, Message.Y + 2, Message.Text, Message.Color)
        
        Message.Timer = Message.Timer - 1
    end
end
