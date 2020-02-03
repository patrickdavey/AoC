defmodule AOCRunnerTest do
  use ExUnit.Case
  alias AOC.{Runner, Parser}

  test "first sample runs correctly" do
    assert(Runner.part_1(1, Parser.parse("12345678")) == 48226158)
    assert(Runner.part_1(2, Parser.parse("12345678")) == 34040438)
    assert(Runner.part_1(3, Parser.parse("12345678")) == 03415518)
    assert(Runner.part_1(4, Parser.parse("12345678")) == 01029498)
  end
end
