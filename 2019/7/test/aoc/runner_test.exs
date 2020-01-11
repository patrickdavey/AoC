defmodule AOCRunnerTest do
  use ExUnit.Case
  alias AOC.{Runner, Parser, Input}

  test "sample code works" do
    Input.start_link([])
    assert(Runner.calculate_run(Parser.parse("3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0"), [4, 3, 2, 1, 0]) == 43210)

    Input.start_link([])
    assert(Runner.calculate_run(Parser.parse("3,23,3,24,1002,24,10,24,1002,23,-1,23,101,5,23,23,1,24,23,23,4,23,99,0,0"), [0, 1, 2, 3, 4]) == 54321)

    Input.start_link([])
    assert(Runner.calculate_run(Parser.parse("3,31,3,32,1002,32,10,32,1001,31,-2,31,1007,31,0,33,1002,33,7,33,1,33,31,31,1,32,31,31,4,31,99,0,0,0"), [1,0,4,3,2]) == 65210)
  end

  test "sample best works" do
    Input.start_link([])
    assert(Runner.part_1(Parser.parse("3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0")) == 43210)
  end

  # test "sample feedback works for single run" do
  #   assert(Runner.calculate_feedback_run(Parser.parse("3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5"), [9,8,7,6,5]) == 139629729)
  # end

  test "sample feedback works" do
    assert(Runner.part_2(Parser.parse("3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5")) == 139629729)
  end
end


