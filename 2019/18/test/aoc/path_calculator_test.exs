defmodule PathCalculatorTest do
  use ExUnit.Case
  alias AOC.{PathCalculator, Parser}

  test "first sample runs correctly" do
    first = """
       #########
       #b.A.@.a#
       #########
    """
    {results, _board} = PathCalculator.find_all(Parser.parse(first))
    assert(Map.get(results, ["a", "us"]) == {2, []})
    assert(Map.get(results, ["a", "b"]) == {6, ["A"]})
  end

  test "last sample runs correctly" do
    sample = """
       #################
       #i.G..c...e..H.p#
       ########.########
       #j.A..b...f..D.o#
       ########@########
       #k.E..a...g..B.n#
       ########.########
       #l.F..d...h..C.m#
       #################
    """
    {results, _board} = PathCalculator.find_all(Parser.parse(sample))
    assert(Map.get(results, ["d", "o"]) == {13, ["D"]})
  end
end
