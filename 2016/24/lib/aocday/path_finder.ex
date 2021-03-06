defmodule AOCDay.PathFinder do
  alias AOCDay.BFS

  def all_distances(points) do
    find_all_distances(points)
  end

  def paths_between_points(points, distances) do
    distances
    |> overall_shortest_path(points)
  end

  defp find_all_distances(points) do
    initial_board = AOCDay.Board.current_state

    a = points
    |> Map.keys
    |> CombinePermute.comb(2)
    |> Enum.map(&(Task.async(fn -> find_shortest(&1, %{}, points, initial_board) end)))
    |> Enum.map(&(Task.await(&1, 100000000)))
    |> Enum.reduce(%{}, fn(x, acc) -> Map.merge(acc, x) end)
  end

  defp find_shortest([a, b], acc, points, current_state) do
    answer = BFS.shortest_path(Map.fetch!(points, a), Map.fetch!(points, b), current_state)
    acc
    |> Map.put({a, b}, answer)
    |> Map.put({b, a}, answer)
  end

  defp overall_shortest_path(distances_between_points, points) do
    t = route_possibilities(points)
    |> Enum.map(&(path_distance(&1, distances_between_points)))
    |> Enum.min
  end

  defp route_possibilities(points) do
    points
    |> Map.keys
    |> Enum.reject(&(&1 == "0"))
    |> CombinePermute.permute
    |> Enum.map(fn(points) ->
      points = points
      |> List.insert_at(0, "0")

      if (Application.get_env(:aoc, :back_again) == true) do
        points = points
        |> List.insert_at(-1, "0")
      end
      points
    end)
    |> Enum.map(&(Enum.chunk(&1, 2, 1)))
  end

  defp path_distance(path, distances_between_points) do
    path
    |> Enum.reduce(0, fn([a, b], acc) ->
      acc + Map.get(distances_between_points, {a, b})
    end)
  end
end

defmodule CombinePermute do
  def comb(_, 0), do: [[]]
  def comb([], _), do: []
  def comb([h|t], m) do
    (for l <- comb(t, m - 1), do: [h|l]) ++ comb(t, m)
  end

  def permute([]), do: [[]]
  def permute(list) do
    for x <- list, y <- permute(list -- [x]), do: [x|y]
  end
end
