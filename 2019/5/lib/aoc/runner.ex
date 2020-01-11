defmodule AOC.Runner do
  alias AOC.Intcode

  def part_1 do
    structured_data
    |> Intcode.execute
    |> Map.fetch!("output")
    |> Enum.at(0)
  end

  defp structured_data do
    AOC.Parser.parse
  end
end
