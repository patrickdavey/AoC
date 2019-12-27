defmodule AOC.Runner do
  def part_1 do
    structured_data
    |> Enum.map(&AOC.Calculator.calculate/1)
    |> Enum.sum
  end

  def part_2 do
    structured_data
    |> Enum.map(&AOC.Calculator.full_calculate/1)
    |> Enum.sum
  end

  defp structured_data do
    AOC.Parser.parse
  end
end
