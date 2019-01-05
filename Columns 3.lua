dofile("KLib/KLib.lua")
dofile("Data/Columns 3.lua")

memory.usememorydomain("68K RAM")

Board = {}

for y = 0, 13 - 1 do
    Board[y] = {}

    for x = 0, 6 - 1 do
        Board[y][x] = Address.Board + 0x01 + (x * 0x02) + (y * 0x10)
    end
end

BoardEdit =
{
    Active = false,
    Width = 6,
    Height = 13,
    TileSize = 16,
    X = 0,
    Y = 0,
    Tile = 0
}

function BoardEdit.Update()
    local x = 14 + (BoardEdit.X * BoardEdit.TileSize)
    local y = 6 + (BoardEdit.Y * BoardEdit.TileSize)

    gui.drawRectangle(x + 2, y + 2, BoardEdit.TileSize - 1, BoardEdit.TileSize - 1, KLib.Color.Pulse(KLib.Color.Make(224, 224, 224), 31, 8))
end

function BoardEdit.Input()
    if KLib.Input.ButtonPressed("P1 Up") then
        BoardEdit.Y = BoardEdit.Y - 1

        if BoardEdit.Y < 0 then
            BoardEdit.Y = BoardEdit.Height - 1
        end
    end

    if KLib.Input.ButtonPressed("P1 Down") then
        BoardEdit.Y = BoardEdit.Y + 1

        if BoardEdit.Y >= BoardEdit.Height then
            BoardEdit.Y = 0
        end
    end

    if KLib.Input.ButtonPressed("P1 Left") then
        BoardEdit.X = BoardEdit.X - 1

        if BoardEdit.X < 0 then
            BoardEdit.X = BoardEdit.Width - 1
        end
    end

    if KLib.Input.ButtonPressed("P1 Right") then
        BoardEdit.X = BoardEdit.X + 1

        if BoardEdit.X >= BoardEdit.Width then
            BoardEdit.X = 0
        end
    end
end

while true do
    if BoardEdit.Active then
        BoardEdit.Update()
    end

    KLib.Update()

    if KLib.Input.ButtonPressed("P1 X") then
        BoardEdit.Active = not BoardEdit.Active
    end

    if BoardEdit.Active then
        BoardEdit.Input()
    end

    emu.frameadvance()

    KLib.PostUpdate()
end
