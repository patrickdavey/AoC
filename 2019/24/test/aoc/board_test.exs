defmodule AOCBoardTest do
  use ExUnit.Case
  alias AOC.{Parser,Board}

  test "first sample works" do
    input = """
    ....#
    #..#.
    #..##
    ..#..
    #....
    """

    parsed = Parser.parse(input)
    assert(Board.as_string(parsed) |> String.trim == input |> String.trim)
  end
end
