defmodule AOCDay.PathFinder do
  alias AOCDay.Board

  def paths_between_points(points) do
    initial_board_state = Board.current_state
    IO.puts Board.as_string
    all_permutations(points)
  end

  defp all_permutations(points) do
    points
    |> Map.keys
    |> Enum.reject(&(&1 == "0"))
    |> CombinePermute.permute
    |> Enum.map(&(["0"] ++ &1))
  end

end

defmodule CombinePermute do
  def comb(0, _), do: [[]]
  def comb(_, []), do: []
  def comb(m, [h|t]) do
    (for l <- comb(m-1, t), do: [h|l]) ++ comb(m, t)
  end

  def permute([]), do: [[]]
  def permute(list) do
    for x <- list, y <- permute(list -- [x]), do: [x|y]
  end
end
