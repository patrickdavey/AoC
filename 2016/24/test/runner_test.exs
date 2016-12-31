defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Parser

  test "it can pull in the map correctly" do
    input = "###########
#0.1.....2#
#.#######.#
#4.......3#
###########"
    map = Parser.parse(input)
    assert map.dimensions == { 11, 5 }
  end
end
