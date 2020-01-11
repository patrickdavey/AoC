defmodule AOC.Runner do
  alias AOC.{IntcodeAgent, Input}

  def part_1(program \\ structured_data) do
    Input.start_link([])

    AOC.CombinePermute.permute(Enum.to_list((0..4)))
    |> Enum.map(&(calculate_run(program, &1)))
    |> Enum.max
  end

  def part_2(program \\ structured_data) do
    AOC.CombinePermute.permute(Enum.to_list((5..9)))
    |> Enum.map(&(part_2_run(program, &1)))

    Process.sleep(100000)
  end

  def part_2_run(program, [a, b, c, d, e]) do
    {:ok, amp_a} = IntcodeAgent.init
    {:ok, amp_b} = IntcodeAgent.init
    {:ok, amp_c} = IntcodeAgent.init
    {:ok, amp_d} = IntcodeAgent.init
    {:ok, amp_e} = IntcodeAgent.init

    IntcodeAgent.set_initial(amp_a, amp_b, program, [a, 0])
    IntcodeAgent.set_initial(amp_b, amp_c, program, [b])
    IntcodeAgent.set_initial(amp_c, amp_d, program, [c])
    IntcodeAgent.set_initial(amp_d, amp_e, program, [d])
    IntcodeAgent.set_initial(amp_e, amp_a, program, [e])

    spawn(fn -> IntcodeAgent.run(amp_a) end)
    spawn(fn -> IntcodeAgent.run(amp_b) end)
    spawn(fn -> IntcodeAgent.run(amp_c) end)
    spawn(fn -> IntcodeAgent.run(amp_d) end)
    spawn(fn -> IntcodeAgent.run(amp_e) end)
  end

  defp structured_data do
    AOC.Parser.parse
  end

  def calculate_run(program, inputs) do
    inputs
    |> Enum.reduce(0, fn(phase, acc) ->
      Input.set([phase, acc])

      program
      |> Intcode.execute
      |> Map.fetch!("output")
      |> List.first
    end)
  end
end
