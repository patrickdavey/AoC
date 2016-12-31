defmodule AOCDay.Runner do
  alias AOCDay.Parser
  alias AOCDay.PathFinder

  def part_1 do
    "part 1"
  end

  def part_1(input) do
    Parser.parse(input)
    |> PathFinder.paths_between_points
  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    Parser.parse
  end
end
