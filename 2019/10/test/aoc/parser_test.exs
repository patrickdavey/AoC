defmodule AOCRParserTest do
  use ExUnit.Case
  alias AOC.{Parser}

  test "first sample works" do
    input = """
    .#..#
    .....
    #####
    ....#
    ...##
    """

    parsed = Parser.parse(input)
    assert(Map.get(parsed, {0,0}) == :empty)
    assert(Map.get(parsed, {1,0}) == :asteroid)
    assert(Map.get(parsed, {3,4}) == :asteroid)
    assert(Map.get(parsed, {2,2}) == :asteroid)
  end
end
