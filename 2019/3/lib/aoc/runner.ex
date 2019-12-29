defmodule AOC.Runner do
  alias AOC.Plotter
  alias AOC.Board

  def part_1(paths \\ structured_data()) do
    Plotter.plot(paths)
    |> Enum.filter(&crossing/1)
    |> Enum.map(&(elem(&1, 0)))
    |> Enum.map(fn({a, b}) -> abs(a) + abs(b) end)
    |> Enum.min
  end

  defp crossing({position, traces}) when length(traces) > 1 do
    traces |> Enum.uniq |> length == 2
  end

  defp crossing(_), do: false

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOC.Parser.parse
  end
end
