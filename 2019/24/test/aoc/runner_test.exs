defmodule AOCRunnerTest do
  use ExUnit.Case
  alias AOC.{Runner, Parser, Evolution}

  test "first sample works for part 2" do
    input = """
    ....#
    #..#.
    #..##
    ..#..
    #....
    """

    parsed = Parser.parse(input)
    assert(Runner.part_2(parsed, 10) == 99)
  end
end
