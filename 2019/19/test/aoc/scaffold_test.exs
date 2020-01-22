defmodule AOCScaffoldTest do
  use ExUnit.Case
  alias AOC.{CameraParser, Scaffold}

  test "first sample test" do
    s = """
..#..........
..#..........
#######...###
#.#...#...#.#
#############
..#...#...#..
..#####...^..
    """
    parsed = s |> String.to_charlist |> CameraParser.parse
    assert(Scaffold.sum_crossings(parsed) == 76)
  end
end
