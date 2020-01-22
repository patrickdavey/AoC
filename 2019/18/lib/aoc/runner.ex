defmodule AOC.Runner do
  alias AOC.{Board, PathCalculator, AvailableGenerator}
  def part_1({start, board} \\ structured_data) do
    max = board |> num_to_collect
    paths = PathCalculator.find_all(start, board)

    bfs([{{start, MapSet.new}, 0}], board, %{}, max, paths)
  end

  def bfs([{{position, found}, distance}|t], board, visited, num_to_find, paths) do
    cond do
      distance > 136 -> bfs(t, board, visited, num_to_find, paths)
      found |> MapSet.size == num_to_find -> distance
      Map.has_key?(visited, {position, found}) -> bfs(t, board, visited, num_to_find, paths)
      true ->
        visited = Map.put(visited, {position, found}, true)
        t ++ AvailableGenerator.from(board, position, found, distance, visited, paths)
        |> bfs(board, visited, num_to_find, paths)
    end
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp num_to_collect(board) do
    board
    |> Map.values
    |> Enum.reject(&is_atom/1)
    |> Enum.filter(&(String.match?(&1, ~r/[a-z]/)))
    |> length
  end

  defp sort_by_distance(paths) do
    paths
    |> Enum.sort(fn({{a, k1}, dist}, {{c, k2}, dist_b}) ->
       dist < dist_b
    end)
  end
end
