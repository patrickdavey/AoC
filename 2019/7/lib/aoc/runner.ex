defmodule AOC.Runner do
  alias AOC.{IntcodeAgent}

  def part_1(program \\ structured_data()) do
    AOC.CombinePermute.permute(Enum.to_list((0..4)))
    |> Enum.map(&(calculate_run(program, &1)))
    |> Enum.max
  end

  def part_2(program \\ structured_data()) do
    AOC.CombinePermute.permute(Enum.to_list((5..9)))
    |> Enum.map(&(calculate_run(program, &1)))
    |> Enum.max
  end

  defp structured_data do
    AOC.Parser.parse
  end

  def calculate_run(program, [a, b, c, d, e]) do
    supervisor_pid = self()
    amp_a = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    amp_b = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    amp_c = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    amp_d = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    amp_e = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    send(amp_a, {:set_initial, amp_b, program})
    send(amp_b, {:set_initial, amp_c, program})
    send(amp_c, {:set_initial, amp_d, program})
    send(amp_d, {:set_initial, amp_e, program})
    send(amp_e, {:set_initial, amp_a, program})
    send(amp_a, {:input, a})
    send(amp_a, {:input, 0})
    send(amp_b, {:input, b})
    send(amp_c, {:input, c})
    send(amp_d, {:input, d})
    send(amp_e, {:input, e})

    send(amp_a, :run)
    send(amp_b, :run)
    send(amp_c, :run)
    send(amp_d, :run)
    send(amp_e, :run)

    wait_loop(0, amp_e)
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
