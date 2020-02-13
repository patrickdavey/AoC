defmodule AOC.Runner do
  alias AOC.{IntcodeAgent, Board, CameraParser, Scaffold}

  def part_1(program \\ structured_data()) do
    supervisor_pid = self()
    intcode = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    Process.register(intcode, :intcode)
    send(intcode, {:set_initial, self(), program})
    send(intcode, :run)

    wait_loop([], intcode)
    |> CameraParser.parse
    |> Scaffold.sum_crossings
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp wait_loop(acc, intcode) do
    receive do
      {:terminating, ^intcode} ->
        acc
      {:input, value, ^intcode} ->
        wait_loop(acc ++ [value], intcode)
    end
  end
end
