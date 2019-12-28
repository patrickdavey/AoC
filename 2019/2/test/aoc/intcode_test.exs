defmodule AOCIncodeTest do
  use ExUnit.Case
  alias AOC.Intcode
  alias AOC.Parser

  test "initial states work" do
    assert(Intcode.execute(Parser.parse("1,0,0,0,99")) == Parser.parse("2,0,0,0,99"))
    assert(Intcode.execute(Parser.parse("2,3,0,3,99")) == Parser.parse("2,3,0,6,99"))
    assert(Intcode.execute(Parser.parse("2,4,4,5,99,0")) == Parser.parse("2,4,4,5,99,9801"))
  end

  # test "full runs" do
  #   assert(Intcode.final([1,1,1,4,99,5,6,0,99]) == 30)
  #   assert(Intcode.final([1,9,10,3,2,3,11,0,99,30,40,50]) == 3500)
  # end
end
