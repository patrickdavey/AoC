# test/aoc/runner_test.exs
defmodule AOCRunnerTest do
  use ExUnit.Case
  alias AOC.{Parser, Runner}

  test "sample works" do
    assert(Runner.part_1(structured_data) == 42)
  end

  test "sample part 2 works" do
    assert(Runner.part_2(part_2_data) == 4)
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

  def part_2_data do
    Parser.parse("""
      COM)B
      B)C
      C)D
      D)E
      E)F
      B)G
      G)H
      D)I
      E)J
      J)K
      K)L
      K)YOU
      I)SAN
    """)
  end
end
