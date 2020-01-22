defmodule AOCParserTest do
  use ExUnit.Case
  alias AOC.{Parser, Reaction}

  test "initial config works" do
    parsed = Parser.parse(
      """
        10 ORE => 10 A
        1 ORE => 1 B
        7 A, 1 B => 1 C
        7 A, 1 C => 1 D
        7 A, 1 D => 1 E
        7 A, 1 E => 1 FUEL
      """)
    assert(Map.fetch!(parsed, "A") == %Reaction{quantity: 10, dependencies: [{"ORE", 10}]})
  end
end
