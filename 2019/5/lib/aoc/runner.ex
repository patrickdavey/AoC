defmodule AOC.Runner do
  alias AOC.{IntcodeAgent}

  def part_1(program \\ structured_data()) do
    supervisor_pid = self()
    computer = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    send(computer, {:set_initial, computer, program})
    send(computer, {:input, 1})
    send(computer, :run)

    wait_loop(0, computer)
  end

  def part_2(program \\ structured_data()) do
    supervisor_pid = self()
    computer = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    send(computer, {:set_initial, computer, program})
    send(computer, {:input, 5})
    send(computer, :run)

    wait_loop(0, computer)
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp wait_loop(value, amp) do
    receive do
      {:terminating, ^amp} ->
        value
      {:input, value, ^amp} ->
        wait_loop(value, amp)
    end
  end
end
