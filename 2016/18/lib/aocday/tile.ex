defmodule AOCDay.Tile do
  def tile_at(0, previous_tiles) do
    left_tile = "."
    centre_tile = Enum.at(previous_tiles, 0)
    right_tile = Enum.at(previous_tiles, 1)
    tile_for(left_tile, centre_tile, right_tile)
  end

  def tile_at(position, previous_tiles) do
    left_tile = Enum.at(previous_tiles, position - 1)
    centre_tile = Enum.at(previous_tiles, position)
    right_tile = Enum.at(previous_tiles, position + 1, ".")
    tile_for(left_tile, centre_tile, right_tile)
  end

  defp tile_for("^", "^", "."), do: "^"
  defp tile_for(".", "^", "^"), do: "^"
  defp tile_for("^", ".", "."), do: "^"
  defp tile_for(".", ".", "^"), do: "^"
  defp tile_for(_, _, _), do: "."
end
