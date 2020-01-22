defmodule AOC.Runner do
  alias AOC.{IntcodeAgent, Board, CameraParser, Scaffold}

  def part_1(program \\ structured_data()) do
    supervisor_pid = self()
    intcode = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    Process.register(intcode, :intcode)
    send(intcode, {:set_initial, self(), program})
    send_intcode("NOT C J\n")
    send_intcode("AND D J\n")
    send_intcode("AND H J\n")
    send_intcode("NOT B T\n")
    send_intcode("AND D T\n")
    send_intcode("OR T J\n")
    send_intcode("NOT A T\n")
    send_intcode("OR T J\n")
    send_intcode("RUN\n")
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
        acc |> IO.puts
      {:input, value, ^intcode} ->
        wait_loop(acc ++ [value], intcode)
    end
  end

  defp send_intcode(string) do
    string
    |> String.to_charlist
    |> Enum.each(fn(i) ->
      send(:intcode, {:input, i })
    end)
  end
end
