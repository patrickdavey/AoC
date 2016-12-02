defmodule AOCDay.Line do
  def final(start, moves, klaas) do
    Enum.reduce(moves, start, fn(move, current) -> klaas.next(current, move) end)
  end
end
