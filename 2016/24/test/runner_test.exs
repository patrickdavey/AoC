defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Parser

  test "it can pull in the map correctly" do
    input = "###########
#0.1.....2#
#.#######.#
#4.......3#
###########"
    shortest_path = AOCDay.Runner.part_1(input)
    assert shortest_path == 14
  end
end
