defmodule AOCIncodeTest do
  use ExUnit.Case
  alias AOC.Intcode
  alias AOC.Parser

  test "initial states work" do
    assert(Intcode.execute(Parser.parse("1,0,0,0,99")) == Parser.parse("2,0,0,0,99"))
    assert(Intcode.execute(Parser.parse("2,3,0,3,99")) == Parser.parse("2,3,0,6,99"))
    assert(Intcode.execute(Parser.parse("2,4,4,5,99,0")) == Parser.parse("2,4,4,5,99,9801"))
  end

  test "input output example works" do
    program = Intcode.execute(Parser.parse("3,0,4,0,99"))
    assert(Map.fetch!(program, "output") == [1])
  end

  test "immediate sample works" do
    assert(Intcode.execute(Parser.parse("1002,4,3,4,33")) == Parser.parse("1002,4,3,4,99"))
  end

  test "negative sample works" do
    assert(Intcode.execute(Parser.parse("1101,100,-1,4,0")) == Parser.parse("1101,100,-1,4,99"))
  end
end
