defmodule AOCDay.TileTest do
  use ExUnit.Case
  alias AOCDay.Tile

  test "correctly finds next tiles for positions" do
    previous_tiles = String.graphemes("..^^.")
    assert Tile.tile_at(0, previous_tiles) == "."
    assert Tile.tile_at(1, previous_tiles) == "^"
    assert Tile.tile_at(2, previous_tiles) == "^"
    assert Tile.tile_at(3, previous_tiles) == "^"
    assert Tile.tile_at(4, previous_tiles) == "^"
  end

end
