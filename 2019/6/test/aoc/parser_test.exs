defmodule AOCParserTest do
  use ExUnit.Case
  alias AOC.Parser

  test "initial out of order config works" do
    parsed = Parser.parse("""
        C)D
        COM)B
        B)C
        D)E
        E)F
        B)G
        G)H
        D)I
        E)J
        J)K
        K)L
      """)
    assert(Map.fetch!(parsed, "C") == ["D"])
    assert(Map.fetch!(parsed, "D") == [ "I", "E" ])
  end
end
