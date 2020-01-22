defmodule AOCRunnerTest do
  use ExUnit.Case
  alias AOC.{Runner, Parser}

  test "first maze fill" do
    s = """
    ######
    #..###
    #.#..#
    #.O.##
    ######
    """

    assert(Runner.part_2(Parser.parse_2(s)) == 4)
  end
end
