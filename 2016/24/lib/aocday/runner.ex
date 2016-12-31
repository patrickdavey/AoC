defmodule AOCDay.Runner do
  alias AOCDay.Parser
  alias AOCDay.PathFinder

  def part_1 do
    structured_data
    |> PathFinder.paths_between_points
  end

  def part_1(input) do
    Parser.parse(input)
    |> PathFinder.paths_between_points
  end

  def part_2 do
    # really should cache the results, but I'm lazy
    Application.put_env(:aoc, :back_again, true)
    structured_data
    |> PathFinder.paths_between_points
  end

  defp structured_data do
    Parser.parse
  end
end
