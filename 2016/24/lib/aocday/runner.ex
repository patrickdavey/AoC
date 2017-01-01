defmodule AOCDay.Runner do
  alias AOCDay.Parser
  alias AOCDay.PathFinder

  def distances do
    distances = PathFinder.all_distances(structured_data)

    PathFinder.paths_between_points(structured_data, distances)
    |> (fn(dist) -> IO.puts("part1: #{dist}") end).()

    Application.put_env(:aoc, :back_again, true)

    PathFinder.paths_between_points(structured_data, distances)
    |> (fn(dist) -> IO.puts("part2: #{dist}") end).()
  end

  def part_1(input) do
    points = Parser.parse(input)
    distances = PathFinder.all_distances(points)
    PathFinder.paths_between_points(points, distances)
  end

  defp structured_data do
    Parser.parse
  end
end
