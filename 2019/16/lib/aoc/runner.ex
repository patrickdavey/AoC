defmodule AOC.Runner do
  def part_1(data \\ structured_data(), iterations) do
    require IEx
    IEx.pry
  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOC.Parser.parse
  end
end
