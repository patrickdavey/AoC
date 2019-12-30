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

  def part_2(paths \\ structured_data()) do
    Plotter.plot(paths)
    |> Enum.filter(&crossing/1)
    |> Enum.filter(&distance/1)
    |> Enum.map(&distance_travelled/1)
    |> Enum.min
  end


  defp crossing({position, traces}) do
    traces |> Enum.map(&(elem(&1, 0))) |> Enum.uniq |> length == 2
  end

  defp distance({position, traces}) do
    traces |> Enum.reduce(%{}, fn({id, count}, acc) ->
      Map.update(acc, id, count, &(if &1 < count, do: &1, else: count))
    end)
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp distance_travelled({point, [{id1, steps1}, {id2, steps2}]}) do
    steps1 + steps2
  end
end
