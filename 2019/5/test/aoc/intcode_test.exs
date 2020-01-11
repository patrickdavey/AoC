defmodule AOCIncodeTest do
  use ExUnit.Case
  alias AOC.Intcode
  alias AOC.Parser
  alias AOC.Input

  test "initial states work" do
    Input.start_link(1)

    assert(Intcode.execute(Parser.parse("1,0,0,0,99")) == Parser.parse("2,0,0,0,99"))
    assert(Intcode.execute(Parser.parse("2,3,0,3,99")) == Parser.parse("2,3,0,6,99"))
    assert(Intcode.execute(Parser.parse("2,4,4,5,99,0")) == Parser.parse("2,4,4,5,99,9801"))
  end

  test "input output example works" do
    Input.start_link(1)
    program = Intcode.execute(Parser.parse("3,0,4,0,99"))
    assert(Map.fetch!(program, "output") == [1])
  end

  test "immediate sample works" do
    Input.start_link(1)
    assert(Intcode.execute(Parser.parse("1002,4,3,4,33")) == Parser.parse("1002,4,3,4,99"))
  end

  test "negative sample works" do
    Input.start_link(1)
    assert(Intcode.execute(Parser.parse("1101,100,-1,4,0")) == Parser.parse("1101,100,-1,4,99"))
  end

  test "input comparison works" do
    Input.start_link(1)
    program = Intcode.execute(Parser.parse("3,9,8,9,10,9,4,9,99,-1,8"))
    assert(Map.fetch!(program, "output") == [0])
  end

  test "input comparison 2 works" do
    Input.start_link(1)
    program = Intcode.execute(Parser.parse("3,9,7,9,10,9,4,9,99,-1,8"))
    assert(Map.fetch!(program, "output") == [1])
  end

  test "immediate comparison with 8 should be 0 if not 8" do
    Input.start_link(1)
    program = Intcode.execute(Parser.parse("3,3,1108,-1,8,3,4,3,99"))
    assert(Map.fetch!(program, "output") == [0])
  end

  test "immediate comparison with 8 should be 1 if 8" do
    Input.start_link(8)
    program = Intcode.execute(Parser.parse("3,3,1108,-1,8,3,4,3,99"))
    assert(Map.fetch!(program, "output") == [1])
  end

  test "immediate comparison with < 8 should be 1 if less than 8" do
    Input.start_link(1)
    program = Intcode.execute(Parser.parse("3,3,1107,-1,8,3,4,3,99"))
    assert(Map.fetch!(program, "output") == [1])
  end

  test "immediate comparison with < 8 should be 0 if equal to 8" do
    Input.start_link(8)
    program = Intcode.execute(Parser.parse("3,3,1107,-1,8,3,4,3,99"))
    assert(Map.fetch!(program, "output") == [0])
  end

  test "large sample test" do
    Input.start_link(0)
    program = Intcode.execute(Parser.parse("3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99"))
    assert(Map.fetch!(program, "output") == [999])
  end

  test "large sample test with 8 input" do
    Input.start_link(8)
    program = Intcode.execute(Parser.parse("3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99"))
    assert(Map.fetch!(program, "output") == [1000])
  end

  test "large sample test with > 8 input" do
    Input.start_link(9)
    program = Intcode.execute(Parser.parse("3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99"))
    assert(Map.fetch!(program, "output") == [1001])
  end
end
