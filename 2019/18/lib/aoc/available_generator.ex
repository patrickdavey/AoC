defmodule AOC.AvailableGenerator do
  def from(board, point, keys_in_posession, distance, visited, paths) do
    points_available = point
                       |> legal_moves(keys_in_posession, paths, board)
                       |> add_info(board, keys_in_posession, distance)
                       |> remove_visited(visited)
  end

  defp legal_moves(point, keys_in_posession, paths, board) do
    paths
    |> Enum.filter(fn({{start, finish}, value}) ->
      start == point
    end)
    |> Enum.reject(fn({{_start, finish}, value}) ->
      MapSet.member?(keys_in_posession, Map.fetch!(board, finish))
    end)
    |> Enum.filter(fn({_key, { _distance, keys_required }}) ->
      MapSet.subset?(keys_required, keys_in_posession)
    end)
  end

  defp add_info(points, board, keys_in_posession, current_distance) do
    points
    |> Enum.map(fn({{_s, f}, {distance, _keys_required}}) ->
      cond do
        Map.get(board, f) != :empty ->{{f, MapSet.put(keys_in_posession, Map.get(board, f))}, distance + current_distance }
        true -> {{f, keys_in_posession}, distance + current_distance }
      end
    end)
  end

  defp remove_visited(points, visited) do
    points
    |> Enum.reject(fn({k, _v}) -> Map.has_key?(visited, k) end)
  end
end
