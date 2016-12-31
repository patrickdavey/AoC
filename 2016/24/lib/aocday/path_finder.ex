defmodule AOCDay.PathFinder do
  alias AOCDay.Board
  alias AOCDay.BFS

  def paths_between_points(points) do
    initial_board_state = Board.current_state
    find_all_distances(points, initial_board_state)
  end

  defp find_all_distances(points, initial_board_state) do
    t = points
    |> Map.keys
    |> CombinePermute.comb(2)
    |> Enum.reduce(%{}, &(find_shortest(&1, &2, points, initial_board_state)))

    require IEx
    IEx.pry
  end

  defp find_shortest([a, b], acc, points, initial_board_state) do
    Board.set_state(initial_board_state) #reset the board
    answer = BFS.shortest_path(Map.fetch!(points, a), Map.fetch!(points, b))
    acc
    |> Map.put({a, b}, answer)
    |> Map.put({b, a}, answer)
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
