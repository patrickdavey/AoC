defmodule AOC.Runner do
  alias AOC.{IntcodeAgent, Board}

  def part_1(program \\ structured_data()) do
    supervisor_pid = self()
    intcode = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    Process.register(intcode, :intcode)
    send(intcode, {:set_initial, self(), program})
    send(intcode, :run)

    wait_loop([], intcode)
    |> List.to_string
    |> into_coordinates
    |> Board.print
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

  defp into_coordinates(string) do
    foo = string
    |> String.trim
    |> String.split("\n")
    |> Enum.with_index
    |> Enum.map(&formatted/1)
    |> List.flatten
    |> Enum.into(%{})
  end

  def formatted({line, y}) do
    line
    |> String.graphemes
    |> Enum.with_index
    |> Enum.map(&(to_tuple(&1, y)))
  end

  defp to_tuple({".", x}, y), do: {{x, y}, :empty}
  defp to_tuple({"#", x}, y), do: {{x, y}, :scaffold}
  defp to_tuple({"^", x}, y), do: {{x, y}, :robot_up}
  defp to_tuple({">", x}, y), do: {{x, y}, :robot_right}
  defp to_tuple({"v", x}, y), do: {{x, y}, :robot_down}
  defp to_tuple({"<", x}, y), do: {{x, y}, :robot_left}
  defp to_tuple({"X", x}, y), do: {{x, y}, :robot_dead}
end
