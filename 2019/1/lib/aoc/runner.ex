defmodule AOC.Runner do
  def part_1 do
    structured_data
    |> Enum.map(&AOC.Calculator.calculate/1)
    |> Enum.sum
  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOC.Parser.parse
  end
end
