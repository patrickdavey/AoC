# test/aoc/runner_test.exs
defmodule AOCRunnerTest do
  use ExUnit.Case
  alias AOC.Parser
  alias AOC.Runner

  test "sample data works for part 1" do
    assert(Runner.part_1(Parser.parse(sample_1)) == 6)
    assert(Runner.part_1(Parser.parse(sample_2)) == 159)
    assert(Runner.part_1(Parser.parse(sample_3)) == 135)
  end

  test "sample data works for part 2" do
    assert(Runner.part_2(Parser.parse(sample_1)) == 30)
    assert(Runner.part_2(Parser.parse(sample_2)) == 610)
    assert(Runner.part_2(Parser.parse(sample_3)) == 410)
  end

  def sample_1 do
    """
    R8,U5,L5,D3
    U7,R6,D4,L4
    """
  end

  def sample_2 do
    """
    R75,D30,R83,U83,L12,D49,R71,U7,L72
    U62,R66,U55,R34,D71,R55,D58,R83
    """
  end

  def sample_3 do
    """
    R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
    U98,R91,D20,R16,D67,R40,U7,R15,U6,R7
    """
  end
end
