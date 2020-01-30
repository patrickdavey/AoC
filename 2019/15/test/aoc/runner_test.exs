defmodule AOCRunnerTest do
  use ExUnit.Case
  alias AOC.{IntcodeAgent, Parser}

  test "first sample works" do
    supervisor_pid = self()
    computer = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    send(computer, {:set_initial, self(), first_program()})
    send(computer, :run)

    assert(input_loop([], computer) == [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99])
  end

  test "second sample works" do
    supervisor_pid = self()
    computer = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    send(computer, {:set_initial, self(), second_program()})
    send(computer, :run)

    assert(input_loop([], computer) == [1219070632396864])
  end

  test "third sample works" do
    supervisor_pid = self()
    computer = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    send(computer, {:set_initial, self(), third_program()})
    send(computer, :run)

    assert(input_loop([], computer) == [1125899906842624])
  end

  defp first_program do
    Parser.parse("109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99")
  end

  defp second_program do
    Parser.parse("1102,34915192,34915192,7,4,7,99,0")
  end

  defp third_program do
    Parser.parse("104,1125899906842624,99")
  end

  defp input_loop(acc, amp) do
    receive do
      {:terminating, ^amp} ->
        IO.puts("terminating")
        acc
      {:input, value, ^amp} ->
        input_loop(acc ++ [value], amp)
    end
  end
end



#     Input.start_link([])
#   end

  # test "sample best works" do
  #   Input.start_link([])
  #   assert(Runner.part_1(Parser.parse("3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0")) == 43210)
  # end

  # test "sample feedback works" do
  #   assert(Runner.part_2(Parser.parse("3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5")) == 139629729)
  # end
# end


