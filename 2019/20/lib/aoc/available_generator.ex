defmodule AOC.AvailableGenerator do
  def from(board, {x, y, level}, portals, distance, visited) do
    point = {x, y}

    points_available = point
                       |> nsew_points
                       |> only_empty(board)
                       |> travel(portals, level, distance)
                       |> reject_visited(visited)
                       |> transform
  end

  defp nsew_points({x, y}) do
    [{1, 0}, {0, -1}, { -1, 0}, {0, 1}]
    |> Enum.map(fn({x_off, y_off}) ->
      { x + x_off, y + y_off }
    end)
  end

  defp only_empty(points, board) do
    points |> Enum.filter(&(Map.get(board, &1) == "."))
  end

  defp travel(points, portals, level, distance) do
    points
    |> Enum.map(fn({x, y}) ->
      cond do
        Map.has_key?(portals, {x, y}) ->
          travel_portal(Map.get(portals, {x, y}), {x, y}, portals, level, distance)
        true ->
          { x, y, level, distance + 1 }
      end
    end)
    |> Enum.filter(&(&1))
  end

  defp reject_visited(points, visited) do
    points |> Enum.reject(fn({x, y, z, dist}) ->
      Map.has_key?(visited, {x, y, z})
    end)
  end

  defp travel_portal({"ZZ", :outer}, {x, y}, _portals, 0, distance), do: { x, y, 0, distance}
  defp travel_portal({"ZZ", :outer}, {x, y}, _portals, _, _distance), do: nil
  defp travel_portal({"AA", :outer}, {x, y}, _portals, _, _), do: nil
  defp travel_portal({portal_id, :outer}, _point, _portals, 0, _), do: nil
  defp travel_portal({portal_id, :outer}, point, portals, level, distance) do
    {{ox, oy}, other_dir} = Enum.find(portals, fn({other_end, info}) -> elem(info, 0) == portal_id && other_end != point end)
    {ox, oy, level + 1, distance + 2} # step and jump
  end
  defp travel_portal({portal_id, :inner}, _point, _portals, level, _) when level - 1 < -100, do: nil
  defp travel_portal({portal_id, :inner}, point, portals, level, distance) do
    {{ox, oy}, other_dir} = Enum.find(portals, fn({other_end, info}) -> elem(info, 0) == portal_id && other_end != point end)
    {ox, oy, level - 1, distance + 2} # step and jump
  end

  defp transform(points) do
    points |>
    Enum.map(fn({x, y, z, dist}) ->
      {{x, y, z}, dist}
    end)
  end
end
