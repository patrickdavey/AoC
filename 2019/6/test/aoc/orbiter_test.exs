defmodule AOCOrbiterTest do
  use ExUnit.Case
  alias AOC.{Parser, Orbiter}

  test "sample works" do
    result = Orbiter.calculate(structured_data)
    assert(Map.fetch!(result, "D") == {3, ["D", "C", "B", "COM"]})
  end

  def structured_data do
    Parser.parse("""
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
  end
end
