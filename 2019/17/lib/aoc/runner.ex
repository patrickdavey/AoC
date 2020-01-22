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

  def part_2(program \\ structured_data()) do
    program = Map.put(program, 0, 2)
    supervisor_pid = self()
    intcode = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    Process.register(intcode, :intcode)
    send(intcode, {:set_initial, self(), program})
    send_intcode("A,B,A,C,B,C,A,C,B,C\n")
    send_intcode("L,8,R,10,L,10\n")
    send_intcode("R,10,L,8,L,8,L,10\n")
    send_intcode("L,4,L,6,L,8,L,8\n")
    send_intcode("n\n")
    send(intcode, :run)

    wait_loop([], intcode)
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp wait_loop(acc, intcode) do
    receive do
      {:terminating, ^intcode} ->
        acc |> List.last
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
