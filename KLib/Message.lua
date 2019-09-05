KLib.Message =
{
    ForeColor = KLib.Color.White,
    BackColor = KLib.Color.Black,
    
    FontSize = 12,
    FontFamily = nil,
    FontStyle = nil,
    
    FadeTime = 60,
    
    Messages = {},
    OverlayMessage = nil
}

function KLib.Message.Color(foreColor, backColor)
    KLib.Message.ForeColor = foreColor or KLib.Message.ForeColor
    KLib.Message.BackColor = backColor or KLib.Message.BackColor
end

function KLib.Message.Font(size, family, style)
    KLib.Message.FontSize = size or KLib.Message.FontSize
    KLib.Message.FontFamily = family or KLib.Message.FontFamily
    KLib.Message.FontStyle = style or KLib.Message.FontStyle
end

function KLib.Message.Add(text, foreColor, backColor, time)
    local message = {}
    
    message.text = text
    message.foreColor = foreColor or KLib.Message.ForeColor
    message.backColor = backColor or KLib.Message.BackColor
    message.timeMax = time or 300
    message.time = message.timeMax
    message.expired = false
    
    table.insert(KLib.Message.Messages, message)
end

function KLib.Message.Overlay(text, foreColor, backColor, time)
    local message = {}
    
    message.text = text
    message.foreColor = foreColor or KLib.Message.ForeColor
    message.backColor = backColor or KLib.Message.BackColor
    message.timeMax = time or 300
    message.time = message.timeMax
    message.expired = false
    
    KLib.Message.OverlayMessage = message
end

function KLib.Message.Update()
    local function ModAlpha(color, time)
        return bit.band(color, 0x00FFFFFF) + bit.lshift((bit.rshift(color, 24) / KLib.Message.FadeTime) * (KLib.Message.FadeTime - math.abs(time)), 24)
    end
    
    local y = client.bufferheight() - KLib.Message.FontSize - 2
    
    for i = #KLib.Message.Messages, 1, -1 do
        local message = KLib.Message.Messages[i]
        
        if message.time >= -KLib.Message.FadeTime then
            gui.drawText(0, y, message.text, (message.time < 0 and ModAlpha(message.foreColor, message.time) or message.foreColor), (message.time < 0 and ModAlpha(message.backColor, message.time) or message.backColor), KLib.Message.FontSize, KLib.Message.FontFamily, KLib.Message.FontStyle)
        else
            message.expired = true
        end
        
        y = y - KLib.Message.FontSize
        
        message.time = message.time - 1
    end
    
    for i = 1, #KLib.Message.Messages do
        local message = KLib.Message.Messages[i]
        
        if message ~= nil and message.expired then
            table.remove(KLib.Message.Messages, i)
        end
    end
    
    if KLib.Message.OverlayMessage ~= nil then
        local message = KLib.Message.OverlayMessage
        
        if message.time >= -KLib.Message.FadeTime then
            gui.drawText(0, 0, message.text, (message.time < 0 and ModAlpha(message.foreColor, message.time) or message.foreColor), (message.time < 0 and ModAlpha(message.backColor, message.time) or message.backColor), KLib.Message.FontSize, KLib.Message.FontFamily, KLib.Message.FontStyle)
        else
            message.expired = true
        end
    
        message.time = message.time - 1
        
        if KLib.Message.OverlayMessage.expired then
            KLib.Message.OverlayMessage = nil
        end
    end
end
