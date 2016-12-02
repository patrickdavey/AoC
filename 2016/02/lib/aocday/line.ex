defmodule AOCDay.Line do
  def final(start, moves) do
    Enum.reduce(moves, start, fn(move, current) -> AOCDay.Keypad.next(current, move) end)
  end
end
