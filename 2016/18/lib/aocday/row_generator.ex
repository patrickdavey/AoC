defmodule AOCDay.RowGenerator do
  alias AOCDay.Tile

  def next_row(previous_row) do
    t = previous_row
    |> Enum.with_index
    |> Enum.map(fn({_ele, index}) -> Tile.tile_at(index, previous_row) end)
  end
end
