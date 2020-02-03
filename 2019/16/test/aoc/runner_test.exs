defmodule AOCRunnerTest do
  use ExUnit.Case
  alias AOC.{Runner, Parser}

  test "first sample runs correctly" do
    assert(Runner.part_1(Parser.parse("12345678"), 1) == 48226158)
    assert(Runner.part_1(Parser.parse("12345678"), 2) == 34040438)
    assert(Runner.part_1(Parser.parse("12345678"), 3) == 03415518)
    assert(Runner.part_1(Parser.parse("12345678"), 4) == 01029498)
  end
end
