defmodule AOCDay.Line do
  def final(start, moves) do
    keypad = Application.get_env(AOCDay, :keypad)
    Enum.reduce(moves, start, fn(move, current) -> keypad.next(current, move) end)
  end
end
