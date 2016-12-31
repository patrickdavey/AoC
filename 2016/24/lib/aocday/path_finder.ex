defmodule AOCDay.PathFinder do
  alias AOCDay.Board
  alias AOCDay.BFS

  def paths_between_points(points) do
    initial_board_state = Board.current_state
    find_all_distances(points, initial_board_state)
    |> overall_shortest_path(points)
  end

  defp find_all_distances(points, initial_board_state) do
    points
    |> Map.keys
    |> CombinePermute.comb(2)
    |> Enum.reduce(%{}, &(find_shortest(&1, &2, points, initial_board_state)))
  end

  defp find_shortest([a, b], acc, points, initial_board_state) do
    Board.set_state(initial_board_state) #reset the board
    answer = BFS.shortest_path(Map.fetch!(points, a), Map.fetch!(points, b))
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
    |> Enum.map(&(List.insert_at(&1, 0, "0")))
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