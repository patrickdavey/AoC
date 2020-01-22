# lib/aoc/available_keys.ex
defmodule AOC.FindPath do
  alias AOC.{Board}
  def between(start, finish, board) do
    bfs([{start, MapSet.new, 0}], board, %{}, finish)
  end

  defp bfs([], _board, _visited, _target) do
    raise("should not get here")
  end

  defp bfs(foo = [{pos, doors, distance}|t], board, visited, target) do
    cond do
      pos == target -> {distance, doors}
      Map.has_key?(visited, pos) -> bfs(t, board, visited, target)
      true ->
        visited = Map.put(visited, pos, true)
        t ++ next_available(board, pos, doors, distance, visited)
        |> bfs(board, visited, target)
    end
  end

  defp next_available(board, {x, y}, doors, distance, visited) do
    [{1, 0}, {0, -1}, { -1, 0}, {0, 1}]
      |> Enum.map(fn({x_off, y_off}) ->
        {{x + x_off, y + y_off }, Map.get(board, {x + x_off, y + y_off}, :wall)}
      end)
      |> Enum.reject(&(elem(&1, 1) == :wall))
      |> Enum.reject(&(Map.has_key?(visited, elem(&1, 0))))
      |> add_doors(doors, board)
      |> add_distances(distance)
  end

  defp add_doors(points, doors, board) do
    points
    |> Enum.map(fn({point, item}) ->
      cond do
        !is_atom(item) && String.match?(item, ~r/[A-Z]/) ->
          { point, MapSet.put(doors, String.downcase(item)) }
        true ->
          {point, doors}
      end
    end)
  end

  defp add_distances(points, distance) do
    points
    |> Enum.map(fn({point, doors}) ->
      { point, doors, distance + 1}
    end)
  end

  defp doors(list) do
    list
    |> Enum.filter(fn({a, b}) -> a == :door end)
    |> Enum.map(&(elem(&1, 1)))
  end
end
