defmodule AOCRParserTest do
  use ExUnit.Case
  alias AOC.{Parser}

  test "first sample works" do
    input = """
    ....#
    #..#.
    #..##
    ..#..
    #....
    """

    parsed = Parser.parse(input)
    assert(Map.get(parsed, {0,0,0}) == :empty)
    assert(Map.get(parsed, {0,1,0}) == :bug)
    assert(Map.get(parsed, {0,2,0}) == :bug)
    assert(Map.get(parsed, {2,3,0}) == :bug)
  end
end
