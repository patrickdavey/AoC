defmodule AOC.Runner do
  def part_1 do
    structured_data(25, 6)
    |> Enum.min_by(&count_zeros/1)
    |> result_part_1
  end

  def part_2 do
    "part 2"
  end

  defp structured_data(width, height) do
    AOC.Parser.parse(width, height)
  end

  defp count_zeros(list) do
    Enum.count(list, &(&1 == 0))
  end

  defp result_part_1(list) do
    Enum.count(list, &(&1 == 1)) * Enum.count(list, &(&1 == 2))
  end
end
